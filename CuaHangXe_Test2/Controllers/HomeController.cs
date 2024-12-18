﻿using System;
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
        public ActionResult Blog()
        {
            return View();
        }
        public ActionResult LienHe()
        { 
            return View(); 
        }
        public ActionResult ThongTinDichVu()
        {
            List<ThongTinDichVu> allThongTinDichVus = db.ThongTinDichVus.ToList();
            return View(allThongTinDichVus);

        }

        //[HttpPost]
        public ActionResult XacNhanHopDong(string TenKhachHang, string EmailKhachHang, string SoDienThoaiKhachHang,
                                            string MaHopDong,string DiaChiKhachHang, string MaKhachHang, string MaXe, string DieuKhoanHopDong,decimal? TongGiaTriHopDong)
        {
            using (var transaction = db.Database.BeginTransaction())
            {
                try
                {
                    // Check if the customer already exists
                    var existingCustomer = db.KhachHangs.FirstOrDefault(k => k.MaKhachHang == MaKhachHang);

                    if (existingCustomer == null)
                    {
                        // Create a new customer
                        var newCustomer = new KhachHang
                        {
                            MaKhachHang = MaKhachHang,
                            HoTenKhachHang = TenKhachHang,
                            EmailKhachHang = EmailKhachHang,
                            SoDienThoaiKhachHang = SoDienThoaiKhachHang,
                            DiaChiKhachHang=DiaChiKhachHang
                        };

                        db.KhachHangs.Add(newCustomer);
                    }

                    // Create a new contract
                    var newContract = new HopDongMuaBan
                    {
                        MaHopDong = MaHopDong,
                        MaKhachHang = MaKhachHang,
                        MaXe = MaXe,
                        NgayLapHopDong = DateTime.Now,
                        //DieuKhoanHopDong = DieuKhoanHopDong,
                       TongGiaTriHopDong = TongGiaTriHopDong,
                        TrangThaiHopDong = "Chưa duyệt"
                    };

                    db.HopDongMuaBans.Add(newContract);

                    // Save changes
                    db.SaveChanges();

                    // Commit transaction
                    transaction.Commit();

                    TempData["SuccessMessage"] = "Hợp đồng mua bán đã được xác nhận thành công!";
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    // Rollback transaction in case of an error
                    transaction.Rollback();
                    TempData["ErrorMessage"] = "Có lỗi xảy ra: " + ex.Message;
                    return RedirectToAction("NhapThongTinHopDong", new { maXe = MaXe });
                }
            }
        }





    }
}