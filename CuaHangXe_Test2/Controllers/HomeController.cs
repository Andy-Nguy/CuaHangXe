using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CuaHangXe_Test2.Models;

namespace CuaHangXe_Test2.Controllers
{
    public class HomeController : Controller
    {
        SieuXeDbEntities7 db =new SieuXeDbEntities7();
        // GET: Home
        public ActionResult Index(string HangXe = "Lamborghini", string DongXe = "Hypercar")
        {  /* / Lọc theo hãng xe*/
            List<Xe> dsXeTheoHang = db.Xes.Where(x => x.HangXe == HangXe).Take(4).ToList();
            ViewBag.dsXeTheoHang = dsXeTheoHang;
            // Lọc theo dòng xe
            List<Xe> dsXeTheoDong = db.Xes.Where(x => x.DongXe == DongXe).Take(4).ToList();
            ViewBag.dsXeTheoDong = dsXeTheoDong;
            return View();
        }

        public ActionResult SanPham(string dongXe = null, List<string> mauXe = null)
        {
            // Lấy toàn bộ sản phẩm từ cơ sở dữ liệu
            List<Xe> allProducts = db.Xes.ToList();

            // Lấy danh sách các màu sắc xe và các dòng xe
            List<string> colors = db.Xes.Select(x => x.MauSac).Distinct().ToList();
            ViewBag.ColorsOfProduct = colors ?? new List<string>();

            List<string> dongXes = db.Xes.Select(x => x.DongXe).Distinct().ToList();
            ViewBag.CacDongXe = dongXes ?? new List<string>();

            // Lọc theo dòng xe nếu có
            if (!string.IsNullOrEmpty(dongXe))
            {
                allProducts = allProducts.Where(row => row.DongXe == dongXe).ToList();
            }

            // Lọc theo màu sắc nếu có
            if (mauXe != null && mauXe.Any())
            {
                allProducts = allProducts.Where(row => mauXe.Contains(row.MauSac)).ToList();
            }

            return View(allProducts);
        }



        public ActionResult ChiTietSanPham(string id)
        {
            //string id = "XE001";
            id = id.Trim();
            var xeChiTiet = db.Xes.FirstOrDefault(x => x.MaXe == id);
            if (xeChiTiet == null)
            {
                return HttpNotFound(); // Trả về lỗi 404 nếu không tìm thấy sản phẩm
            }

            return View(xeChiTiet);
        }
        
        public ActionResult NhapThongTinHopDong(string maXe)
        {
            // Lấy thông tin xe từ cơ sở dữ liệu nếu cần
            var xe = db.Xes.FirstOrDefault(x => x.MaXe == maXe);

            // Tạo MaKhachHang và MaHopDong tự động
            string maKhachHang = GenerateMaKhachHang(); // Hàm tạo mã khách hàng
            string maHopDong = GenerateMaHopDong(); // Hàm tạo mã hợp đồng

            //
            decimal giaBanXe = xe?.GiaBanXe ?? 0;

            // Tính thuế VAT (10% giá trị bán của xe)
            decimal thueVAT = giaBanXe * 0.1m;

            // Tính thuế nhập khẩu (70% giá trị bán của xe)
            decimal thueNhapKhau = giaBanXe * 0.7m;

            // Tính thuế TTĐB (60% giá trị bán của xe)
            decimal thueTTDB = giaBanXe * 0.6m;

            // Tính phí trước bạ (10% giá trị xe)
            decimal phiTruocBa = giaBanXe * 0.1m;

            // Tính tổng giá trị hợp đồng
            decimal tongGiaTriHopDong = giaBanXe + thueVAT + thueNhapKhau + thueTTDB + phiTruocBa;


            // Khởi tạo đối tượng hợp đồng
            var hopDong = new HopDongMuaBan
            {
                MaKhachHang = maKhachHang,
                MaXe = maXe,
                MaHopDong = maHopDong,
                NgayLapHopDong = DateTime.Now,
                TongGiaTriHopDong =tongGiaTriHopDong
            };
            ViewBag.TenXe = xe?.TenXe;
            ViewBag.MauSac = xe?.MauSac;
            ViewBag.SoKhung = xe?.SoKhungXe;
            ViewBag.GiaBan=xe?.GiaBanXe;

            return View(hopDong);
        }

        // Hàm tạo mã khách hàng
        private string GenerateMaKhachHang()
        {
            // Tạo số ngẫu nhiên từ 10000 đến 99999 (5 chữ số)
            Random random = new Random();
            int randomNumber = random.Next(10000, 100000); // Số ngẫu nhiên từ 10000 đến 99999
            return "KH" + randomNumber.ToString(); // KH + số ngẫu nhiên
        }

        // Hàm tạo mã hợp đồng (Sử dụng số ngẫu nhiên 5 chữ số)
        private string GenerateMaHopDong()
        {
            // Tạo số ngẫu nhiên từ 10000 đến 99999 (5 chữ số)
            Random random = new Random();
            int randomNumber = random.Next(10000, 100000); // Số ngẫu nhiên từ 10000 đến 99999
            return "HD" + randomNumber.ToString(); // HD + số ngẫu nhiên
        }

        public ActionResult NhaCungCap()
        {
            List<NhaCungCap> allNhaCungCaps = db.NhaCungCaps.ToList();
            return View(allNhaCungCaps);

        }
        public ActionResult ChiTietNhaCungCap(string id)
        {
            //id = id.Trim();
            var nhaCungCapChiTiet = db.NhaCungCaps.FirstOrDefault(x => x.MaNhaCungCap == id);
            if (nhaCungCapChiTiet == null)
            {
                return HttpNotFound();
            }
            return View(nhaCungCapChiTiet);
        }
        public class TinTucModel
        {
            public string TieuDe { get; set; }
            public List<NoiDungModel> NoiDung { get; set; }
        }

        public class NoiDungModel
        {
            public string HinhAnh { get; set; }
            public string MoTa { get; set; }
        }

        public ActionResult TinTuc()
        {
            var tinTucs = new List<TinTucModel>
            {
                new TinTucModel
                {
                    TieuDe = "Siêu xe Donkervoort F22 có thêm phiên bản giới hạn",
                    NoiDung = new List<NoiDungModel>
                    {
                        new NoiDungModel  { HinhAnh = "1tin1.jpg", MoTa = "Nhà sản xuất xe thể thao Hà Lan Donkervoort vừa ra mắt phiên bản mới nhất của mẫu xe thể thao siêu nhẹ F22, được gọi là Final Five." },
                        new NoiDungModel { HinhAnh = "2tin1.jpg", MoTa = "Phiên bản này tôn vinh động cơ tăng áp 2.5 lít mà thương hiệu này đã sử dụng trong 25 năm qua và đúng như tên gọi, mẫu xe sẽ chỉ được sản xuất giới hạn 5 chiếc." },
                        new NoiDungModel { HinhAnh = "3tin1.jpg", MoTa = "Chiếc xe thể thao có tổng khối lượng chỉ 716kg (khi chưa đổ nhiên liệu), sở hữu mức công suất 492 mã lực và momen xoắn 640 Nm." },
                        new NoiDungModel { HinhAnh = "4tin1.jpg", MoTa = "F22 Final Five là mẫu xe thể thao sử dụng hệ dẫn động RWD và sẽ được điều khiển bởi hộp số sàn 5 cấp có tích hợp công nghệ rev-matching." },
                        new NoiDungModel { HinhAnh = "5tin1.jpg", MoTa = "Mẫu xe của Donkervoort chỉ cần 2,5 s để tăng tốc từ 0 - 100km/h và sở hữu tốc độ tối đa lên đến 290km/h" },
                        new NoiDungModel { HinhAnh = "6tin1.jpg", MoTa = "Tốc độ ấn tượng của xe không chỉ đến từ việc sở hữu một khối động cơ ấn tượng mà còn phải kể đến khối lượng chỉ 716kg của xe." },
                        new NoiDungModel { HinhAnh = "7tin1.jpg", MoTa = "Xe còn có các tùy chọn gồm: Hệ thống nâng, hệ thống điều hòa không khí nâng cấp, ghế sưởi, nội thất tùy chỉnh, camera trước và sau, báo động và ghế Recaro bằng sợi carbon. Cả 5 chiếc xe đều đã được bán, với giá khởi điểm là 315.000 Euro (8,3 tỷ đồng). Mức giá này gần như tương đương với giá của một chiếc Ferrari 296 GTB." }
                    }
                },
                new TinTucModel
                {
                    TieuDe = "Siêu phẩm Lamborghini Revuelto Opera Unica màu đỏ độc nhất thế giới",
                    NoiDung = new List<NoiDungModel>
                    {
                        new NoiDungModel{ HinhAnh = "1tin2.jpg", MoTa = "Mới đây, tại trung tâm triển lãm West Bund ở Thượng Hải (Trung Quốc), Lamborghini đã chính thức giới thiệu siêu phẩm Revuelto Opera Unica màu đỏ độc nhất thế giới." },
                        new NoiDungModel { HinhAnh = "2tin2.jpg", MoTa = "Siêu xe độc bản này được tạo ra bởi Lamborghini Centro Stile và bộ phận cá nhân hóa Ad Personam, với hàng loạt tùy chọn độc quyền được thiết kế riêng cho thị trường Trung Quốc." },
                        new NoiDungModel { HinhAnh = "3tin2.jpg", MoTa = "Nổi bật nhất là lớp ngoại thất độc đáo lấy cảm hứng từ ngôi sao sáng nhất trong chòm sao Kim Ngưu, thể hiện chiến lược Direzione Cor Tauri của Lamborghini hướng tới điện hóa thương hiệu." },
                        new NoiDungModel { HinhAnh = "4tin2.jpg", MoTa = "Lớp sơn này kết hợp các tông màu đỏ Rosso Mars, cam Arancio Dac và cam Arancio Apodis đi kèm hiệu ứng chuyển màu độc đáo giữa sắc đỏ Rosso Efesto và màu sơn đen Nero Pegaso." },
                        new NoiDungModel { HinhAnh = "5tin2.jpg", MoTa = "Theo Lamborghini, riêng tùy chọn sơn ngoại thất phức tạp của Revuelto Opera Unica cần tới 480 giờ chế tác thủ công chuyên biệt." },
                        new NoiDungModel { HinhAnh = "6tin2.jpg", MoTa = "Ngoài ra, siêu xe này còn có bộ khuếch tán phía sau được sơn màu Rosso Efesto giúp tăng cường tính khí động học do diện mạo tổng thể của xe." },
                        new NoiDungModel { HinhAnh = "7tin2.jpg", MoTa = "Khoang nội thất của xe được bọc da Nero Ade tinh tế, sở hữu phối màu đen Nero Ade kết hợp với các điểm nhấn Rosso Efesto." },
                        new NoiDungModel{ HinhAnh = "8tin2.jpg", MoTa = "Ghế thể thao được bọc da cao cấp cùng chất liệu Corsatex của thương hiệu Dinamica. Mỗi họa tiết được thêu tỉ mỉ tốn hơn 53 giờ để hoàn thiện." },
                        new NoiDungModel{ HinhAnh = "9tin2.jpg", MoTa = "Giống như bản tiêu chuẩn, Lamborghini Revuelto Opera Unica vẫn được trang bị động cơ hút khí tự nhiên V12 dung tích 6.5L, công suất tối đa 825 mã lực và mô-men xoắn cực đại 725 Nm." },
                        new NoiDungModel { HinhAnh = "10tin2.jpg", MoTa = "Sức mạnh truyền đến 4 bánh thông qua hộp số ly hợp kép 8 cấp thế hệ mới. Lamborghini Revuelto có khả năng tăng tốc 0-100 km/h chỉ trong 2,5 giây, trước khi đạt tốc độ tối đa hơn 350 km/h." },
                        new NoiDungModel { HinhAnh = "11tin2.jpg", MoTa = "Mức giá của phiên bản Lamborghini Revuelto Opera Unica dành cho thị trường Trung Quốc không được công bố. Tại Việt Nam, siêu xe hybrid này được phân phối chính hãng với mức giá từ 44 tỷ đồng." }
                    }
                },
                new TinTucModel
                {
                    TieuDe = "Chiếc Bugatti Bolide đầu tiên trên thế giới được bàn giao",
                    NoiDung = new List<NoiDungModel>
                    {
                        new NoiDungModel{ HinhAnh = "1tin3.jpg", MoTa = "Sau hơn 3 năm kể từ ngày ra mắt ở triển lãm The Quail 2021, phiên bản thương mại của mẫu xe đua Bugatti Bolide đã bắt đầu được bàn giao cho các khách hàng." },
                        new NoiDungModel{ HinhAnh = "2tin3.jpg", MoTa = "Chiếc Bugatti Bolide đầu tiên vừa được bắt gặp tại một showroom siêu xe nổi tiếng ở Mỹ. Ngoại thất xe có màu xanh Bleu Agile và các chi tiết sợi carbon đen Jet Black." },
                        new NoiDungModel{ HinhAnh = "3tin3.jpg", MoTa = "Lần đầu nội thất của Bugatti Bolide được xuất hiện công khai, thay vì một số hình ảnh kỹ thuật số được chủ xe chia sẻ. Phong cách tối giản là điểm nổi bật của không gian này, bao gồm việc cần số truyền thống đã bị lược bỏ." },
                        new NoiDungModel{ HinhAnh = "4tin3.jpg", MoTa = "Bảng taplo chỉ có những nút bấm tiêu chuẩn, đi kèm ống điều hòa cỡ lớn. Bảng đồng hồ taplo được chia làm 3 khoang, kết hợp cùng ghế đua bằng sợi carbon có bổ sung thêm nhiều điểm tựa nón bảo hiểm và thân người lái." },
                        new NoiDungModel{ HinhAnh = "5tin3.jpg", MoTa = "Bugatti Bolide vẫn sở hữu động cơ W16 dung tích 8.0L từ Chiron, công suất 1.600 mã lực và mô-men xoắn 1.600 Nm. Xe có khả năng tăng tốc 0-100 km/h trong 2,2 giây với tốc độ tối đa hơn 501 km/h." },
                        new NoiDungModel{ HinhAnh = "6tin3.jpg", MoTa = "Sở hữu gói ngoại thất khí động học được chế tác đặc biệt, mẫu hypercar này có thể vào cua với gia tốc lên đến 2,5 G và lực ép xuống mặt đường gần 3 tấn." },
                        new NoiDungModel{ HinhAnh = "7tin3.jpg", MoTa = "Bugatti chỉ sản suất 40 chiếc Bolide với mức giá khởi điểm 4,7 triệu USD. Bên cạnh W16 Mistral, đây là 2 mẫu xe cuối cùng mang khối động cơ W16 trước khi chuyển sang cơ cấu động cơ V16 hút khí tự nhiên với công nghệ hybrid của chiếc Bugatti Tourbillon." }
                    }
                },
                new TinTucModel
                {
                    TieuDe = "Bugatti quay lại cuộc đua tốc độ, muốn phá kỷ lục 500 km/h",
                    NoiDung = new List<NoiDungModel>
                    {
                        new NoiDungModel { HinhAnh = "1tin4.jpg", MoTa = "Vào tháng 11 này, Bugatti chứng minh cho cả thế giới thấy họ vẫn còn \"phong độ\" khi phá kỷ lục tốc độ với xe mui trần. Siêu xe W16 Mistral dùng nền tảng Bugatti Chiron là cái tên mới nhất giúp hãng lập kỷ lục, tuy nhiên Bugatti chưa muốn dừng lại ở đó.Theo CEO Bugatti Rimac Mate Rimac chia sẻ với tờ Top Gear, ông và hãng đang nhắm tới những mục tiêu tham vọng hơn. Cụ thể, cột mốc 500 km/h huyền thoại được khẳng định sẽ bị Bugatti xô đổ. Vị lãnh đạo người Croatia rất tự tin khi khẳng định yếu tố quan trọng không phải là có thể hay không mà là khi nào." },
                        new NoiDungModel { HinhAnh = "2tin4.jpg", MoTa = "Theo phía vị lãnh đạo, ông cùng phía Michelin đang thảo luận về những giới hạn mà lốp Bugatti có thể vượt qua nếu được chế tạo chuyên dụng. Đây là một yếu tố rất đáng chú ý bởi lốp là một trong những nhân tố cực kỳ quan trọng với một mẫu xe muốn phả kỷ lục tốc độ.Thông thường, xe muốn phá kỷ lục tốc độ sẽ yêu cầu lốp đặc biệt có khả năng vận hành nặng tương ứng. Nếu sử dụng lốp thiếu khả năng, tốc độ xe sẽ bị ảnh hưởng hay nghiêm trọng hơn là độ an toàn giảm xuống." },
                        new NoiDungModel { HinhAnh = "3tin4.jpg", MoTa = "Siêu xe kế tiếp của họ là Bugatti Tourbillon có tốc độ tối đa giới hạn điện tử ở 445 km/h. Nếu được nâng cấp độc bản (như siêu xe W16 Mistral vừa phá kỷ lục tốc độ xe mui trần), Tourbillon hoàn toàn có thể đặt mục tiêu tham vọng hơn là mức 500 km/h." },
                        new NoiDungModel { HinhAnh = "4tin4.jpg", MoTa = "Phiên bản nói trên chắc chắn cũng sẽ không gây thiệt hại về kinh tế cho Bugatti vì không thiếu người mua. Ở thời điểm hiện tại, mỗi xe Bugatti trung bình có chi phí tùy biến bởi người dùng lên tới 500.000 euro (13,4 tỷ đồng). Các bản độc bản của Chiron trước đây dù có giá có thể lên tới gấp 3 hay 5 lần nguyên mẫu (như W16 Mistral có giá 14 triệu USD - xấp xỉ 356 tỷ đồng) vẫn lập tức có người mua.Việc ông Mate Rimac trở thành CEO Bugatti Rimac có thể là nguyên nhân khiến Bugatti mặn mà trở lại với kỷ lục tốc độ. Bản thân ông từng phá 5 kỷ lục thế giới với chiếc BMW E30 độ điện hóa của mình. Thương hiệu riêng của ông trước đây là Rimac cũng phá 27 kỷ lục thế giới vào năm 2023 với siêu xe Nevera." }
                    }
                },
                new TinTucModel
                {
                    TieuDe = "Độc bản Pagani Huayra Codalunga Hermes lần đầu xuống phố",
                    NoiDung = new List<NoiDungModel>
                    {
                        new NoiDungModel { HinhAnh = "1tin5.jpg", MoTa = "Lần đầu tiên ra mắt vào năm 2022, Codalunga là phiên bản Pagani Huayra đặc biệt được sản xuất với số lượng giới hạn chỉ 5 chiếc và được bán cho những khách hàng bí ẩn với mức giá khởi điểm lên tới 7 triệu euro (hơn 191 tỷ đồng).Mỗi chiếc Huayra Codalunga đều được hoàn thiện với một thông số kỹ thuật độc đáo. Tuy nhiên, chiếc trong bài gây ấn tượng bởi nó sở hữu lớp sơn ngoại thất màu xanh ngọc lam độc nhất để tôn lên những đường nét đẹp nhất của xe." },
                        new NoiDungModel { HinhAnh = "2tin5.jpg", MoTa = "Đây cũng là lần đầu tiên chiếc Codalunga này xuất hiện trước công chúng tại Paris. Lớp sơn xanh ngọc nổi bật được tô điểm bởi các vòng tròn lớn màu trắng trên cửa và những điểm nhấn trắng ngay phía sau bánh trước." },
                        new NoiDungModel { HinhAnh = "3tin5.jpg", MoTa = "Điều làm nên sự đặc biệt của chiếc Codalunga này là thiết kế hợp tác với Hermes . Đây là chiếc siêu xe thứ hai Pagani kết hợp với hãng thời trang Pháp, sau chiếc Huayra màu nâu được thiết kế riêng cho nhà sưu tập người Mỹ Manny Khoshbin." },
                        new NoiDungModel { HinhAnh = "4tin5.jpg", MoTa = "Nội thất của xe được trang trí bằng những vật liệu cao cấp nhất từ Hermes. Nổi bật với ghế da màu xanh lá cây đậm, kết hợp cùng vải trắng sang trọng được sắp đặt tinh tế trên vách ngăn phía sau và bảng điều khiển trung tâm." },
                        new NoiDungModel { HinhAnh = "5tin5.jpg", MoTa = "Codalunga trong tiếng Italia có nghĩa là “đuôi dài”, vậy nên xe dài hơn 360 mm so với Huayra tiêu chuẩn. Thiết kế lấy cảm hứng từ những xe đua Le Mans từ những năm 1960.Mặc dù dài hơn, nhưng Pagani Huayra Codalunga vẫn được trang bị động cơ V12 tăng áp kép 6.0L cung cấp bởi Mercedes-AMG cho công suất 838 mã lực như chiếc Huayra R 2022. Tuy nhiên lượng mô-men xoắn tạo ra lớn hơn nhiều, lên tới 1099 Nm so với con số 722 Nm của Huayra R. Nhờ đó, Pagani Huayra Codalunga có khả năng tăng tốc từ 0-96km/h trong vòng chưa đầy 3 giây." }
                    }
                },
                new TinTucModel
                {
                    TieuDe = "Ferrari sắp ra hypercar kế nhiệm LaFerrari huyền thoại: Động cơ V6 hybrid mạnh 1.200 mã lực, có chi tiết như McLaren Senna",
                    NoiDung = new List<NoiDungModel>
                    {
                        new NoiDungModel { HinhAnh = "1tin6.jpg", MoTa = "Ferrari đang rục rịch chuẩn bị cho ra mắt siêu phẩm F250 kế nhiệm mẫu xe LaFerrari huyền thoại. Sở hữu thiết kế khí động học đỉnh cao cùng khối động cơ V6 hybrid đầy uy lực, F250 hứa hẹn sẽ là đối thủ đáng gờm trong cuộc chiến siêu xe thế hệ mới.Ferrari sắp ra hypercar kế nhiệm LaFerrari huyền thoại: Động cơ V6 hybrid mạnh 1.200 mã lực, có chi tiết như McLaren Senna- Ảnh 1.Cuộc đua giành ngôi vương trong làng siêu xe đang ngày càng trở nên nóng hơn bao giờ hết. Sau màn ra mắt ấn tượng của McLaren W1 với động cơ V8 hybrid và Bugatti Tourbillon với động cơ V16 đồ sộ, Ferrari cũng không hề kém cạnh khi hé lộ thông tin về siêu phẩm kế nhiệm LaFerrari - F250.Mang trong mình sứ mệnh kế thừa di sản của dòng siêu xe trứ danh, F250 được kỳ vọng sẽ tạo nên cú hích mới, khẳng định vị thế dẫn đầu của Ferrari trong phân khúc này." },
                        new NoiDungModel { HinhAnh = "2tin6.jpg", MoTa = "Những hình ảnh rò rỉ mới nhất từ trụ sở Maranello (Ý) đã phần nào hé lộ diện mạo của F250. Với thiết kế góc cạnh, đậm chất thể thao cùng hệ truyền động V6 điện khí hóa tiên tiến, F250 hứa hẹn sẽ là một trong những siêu xe thương mại mạnh mẽ và tiên tiến bậc nhất từ trước đến nay.Về mặt thiết kế, F250 mang hơi hướng đường đua mạnh mẽ hơn hẳn \"người tiền nhiệm\" LaFerrari. Gầm xe hạ thấp cùng hàng loạt chi tiết khí động học như cánh chia gió, hốc hút gió và cánh gió sau được tinh chỉnh. Tất cả đều nhằm tối ưu hiệu suất khí động học cho xe.Nhìn kỹ hơn, có thể nhận thấy một chút \"hơi thở\" của McLaren Senna ở phần chắn bùn trước và một chút Rimac Nevera ở thiết kế kính xe. Các hốc hút gió lớn phía dưới giúp dẫn luồng không khí đi qua nắp ca-pô và kính chắn gió, trong khi cụm đèn pha LED sắc sảo được lấy cảm hứng từ trường phái thiết kế 12Cilindri.Hệ thống tản nhiệt không chỉ đơn thuần là yếu tố kỹ thuật mà còn được nâng tầm thành một chi tiết nghệ thuật. Cửa xe kiểu cánh bướm có khe hút gió phụ phía sau, giúp dẫn luồng khí làm mát động cơ. Nổi bật ở phía sau là bộ khuếch tán cỡ lớn, hệ thống ống xả liền khối, dải đèn LED thanh mảnh trải dài theo chiều ngang và cánh gió ôm sát phần đuôi xe." },

                        new NoiDungModel { HinhAnh = "3tin6.jpg", MoTa = "Theo một số nguồn tin, Ferrari F250 có thể tăng tốc từ 0-100 km/h trong vòng chưa đầy 2 giây và đạt vận tốc 200 km/h chỉ trong vòng chưa đầy 5 giây. Với trọng lượng được tối ưu hóa, F250 được kỳ vọng sẽ phá vỡ kỷ lục thời gian hoàn thành một vòng đua tại trường đua Fiorano của Ferrari.Sự xuất hiện của F250, cùng với Bugatti Tourbillon và McLaren W1, đã tạo nên bộ ba siêu xe đỉnh cao thế hệ mới, đánh dấu sự kết hợp hoàn hảo giữa sức mạnh động cơ đốt trong và tiềm năng của công nghệ hybrid. Cả ba đều là những siêu phẩm cuối cùng sử dụng động cơ đốt trong trước khi ngành công nghiệp ô tô chuyển dịch hoàn toàn sang xe điện.Dự kiến, Ferrari F250 sẽ chính thức lộ diện trong vài tháng tới. Trước đó, một số khách hàng thân thiết đã được hãng xe Ý bí mật giới thiệu về mẫu siêu xe mới. Do đó, không loại trừ khả năng siêu phẩm này đã được đặt mua hết từ trước khi ra mắt chính thức." }
                    }
                },
                new TinTucModel
                {
                    TieuDe = "Siêu xe Ferrari 812 GTS đầu tiên cập bến Việt Nam",
                    NoiDung = new List<NoiDungModel>
                    {
                        new NoiDungModel { HinhAnh = "1tin7.jpg", MoTa = "Mới đây, một đơn vị nhập khẩu tư nhân chia sẻ hình ảnh chiếc Ferrari 812 GTS đỗ trong showroom tại TP.HCM. Đáng chú ý, đây là lần đầu tiên biến thể mui trần của dòng Ferrari 812 Superfast lộ diện ở Việt Nam.Chiếc Ferrari 812 GTS mới được đưa về có nước màu sơn đỏ Rosso 70th Anniversary độc đáo. So với 2 chiếc Ferrari 812 Superfast đã có mặt tại Việt Nam, biến thể 812 GTS sở hữu phần mui xe có thể đóng/mở chỉ trong 14 giây." },
                        new NoiDungModel { HinhAnh = "2tin7.jpg", MoTa = "Chi tiết này giúp Ferrari 812 GTS có thể biến hóa vừa là một chiếc coupe, vừa là xe mui trần. Ngay cả khi xe lăn bánh, thao tác đóng và mở mui vẫn có thể thực hiện được nhưng phải đảm bảo chiếc xe đang hoạt động ở vận tốc dưới 45 km/h." },

                        new NoiDungModel { HinhAnh = "3tin7.jpg", MoTa = "Ferrari 812 GTS được trang bị động cơ V12 hút khí tự nhiên, dung tích 6.5L, công suất tối đa 789 mã lực và mô-men xoắn cực đại 718 Nm. Đi kèm là hộp số ly hợp kép 7 cấp Magna và hệ dẫn động cầu sau\r\n\r\nHệ thống này giúp siêu xe 812 GTS có khả năng tăng tốc từ 0-100 km/h trong 2,9 giây và đạt 200 km/h sau 8,3 giây. Tốc độ tối đa của xe theo nhà sản xuất công bố là 340 km/h.\r\n\r\nHiện chưa rõ mức giá Ferrari 812 GTS khi về Việt Nam. Được biết, các đại gia Thái Lan đã phải chi khoảng 34,7 triệu Baht (tương đương khoảng 26 tỷ đồng) để sở hữu mẫu siêu xe mui trần này theo diện chính hãng.\r\n\r\nVào thời điểm ra mắt, Ferrari 812 GTS có giá bán khoảng 450.000 USD (khoảng hơn 11 tỷ đồng). Tuy nhiên do mẫu xe này đã ngừng sản xuất, giá sang nhượng theo đó cũng tăng lên tùy theo tình trạng xe và trang bị đi kèm." }
                    }
                },
                new TinTucModel
                {
                    TieuDe = "Lamborghini Invencible độc nhất thế giới lần đầu xuất hiện\r\n",
                    NoiDung = new List<NoiDungModel>
                    {
                        new NoiDungModel { HinhAnh = "1tin8.jpg", MoTa = "Được giới thiệu lần đầu vào tháng 2/2023 cùng với mẫu Autentica, siêu xe Lamborghini Invencible là một trong hai sản phẩm cuối cùng của hãng được trang bị động cơ V12 hút khí tự nhiên. Đáng chú ý, cả hai đều là độc bản được sản xuất dựa trên nền tảng của chiếc Aventador Ultimae .\r\n\r\n" },
                        new NoiDungModel { HinhAnh = "2tin8.jpg", MoTa = "Trước đó, siêu xe Lamborghini Autentica đã từng xuất hiện tại Monaco vào cuối năm 2023. Tuy nhiên phải đến tận tháng 8/2024, Lamborghini Invencible mới lần đầu lộ diện công chúng tại thành phố Milan, Ý.\r\n\r\n" },

                        new NoiDungModel { HinhAnh = "3tin8.jpg", MoTa = "Chiếc siêu xe được phát hiện đậu bên cạnh mẫu hypercar Bugatti Chiron Zero-400-Zero Edition. Invencible nổi bật với sơn ngoại thất màu đỏ Rosso Efesto cùng nhiều chi tiết bằng sợi carbon bao gồm mâm thể thao kích thước 20 inch ở cầu trước và 21 inch ở cầu sau.\r\n\r\n" },
                        new NoiDungModel { HinhAnh = "4tin8.jpg", MoTa = "Thiết kế của Lamborghini Invencible được cho là sự kết hợp từ nhiều siêu xe đình đám của thương hiệu bò tót như Sesto Elemento, Reventon, Veneno hay Essenza SCV12. Khác với người anh em Autentica có thiết kế mui trần Roadster, Lamborghini Invencible mang dáng coupe.\r\n\r\n " },
                        new NoiDungModel { HinhAnh = "5tin8.jpg", MoTa = "Giống như mẫu Aventador Ultimae, động cơ V12 hút khí tự nhiên đặt giữa trên Lamborghini Invencible cho công suất 780 mã lực và mô-men xoắn 720 Nm. Kết hợp với đó là hệ dẫn động 4 bánh cùng hộp số ISR bảy cấp, cho khả năng tăng tốc 0-100 km/h trong 2,8 giây và vận tốc tối đa 355 km/h.\r\n\r\nMức giá của Lamborghini Invencible chưa từng được hãng tiết lộ. Tuy nhiên với việc bản gốc Aventador Ultimae đã có giá 500.000 USD, số tiền để sở hữu độc bản Invencible được cho là sẽ vượt ngưỡng 1 triệu USD.\r\n\r\n" }
                    }
                }
            };
            return View(tinTucs);
        }
    }
}