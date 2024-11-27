using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CuaHangXe_Test2.Models
{
    public class HopDongViewModel
    {
        public string MaHopDong { get; set; }
        public string MaKhachHang { get; set; }
        public string MaXe { get; set; }
        public string NgayLapHopDong { get; set; }
        public string DieuKhoanHopDong { get; set; }
        public decimal? TongGiaTriHopDong { get; set; }
        public string MaNhanVienPheDuyet { get; set; }
        public string TrangThaiHopDong { get; set; }


        public string TenXe { get; set; }
        public string MauSac { get; set; }
        public decimal GiaBan { get; set; }
    }
}