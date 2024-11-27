using CuaHangXe_Test2.Filters;
using CuaHangXe_Test2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.Mvc;

namespace CuaHangXe_Test2.Controllers
{

    public class NhanVienController : Controller
    {
        SieuXeDbEntities7 db = new SieuXeDbEntities7();
        // GET: NhanVien
        [AuthFilter]
        public ActionResult Index()
        {
            var role = Request.Cookies["role"].Value;
            if (role == null)
            {
                return View();
            }
            if (role =="admin")
            {
                return RedirectToAction("QuanLyNhanVien");
            }
            if (role == "userDonHang")
            {
                return RedirectToAction("QuanLyDonHang");
            }
            return View();
        }
        public ActionResult QuanLyDonHang()
        {
            // Lấy danh sách hợp đồng mua bán
            var hopDongList = db.HopDongMuaBans.ToList();

            var khachHangList = db.KhachHangs.ToList();

            // Gán dữ liệu vào ViewBag
            ViewBag.HopDongList = hopDongList;
            ViewBag.KhachHangList = khachHangList;

            return View(hopDongList); // Trả về view hiển thị danh sách hợp đồng
        }
        //thay đổi phê duyệt hợp đồng
        [HttpPost]
        public ActionResult ChangeStatus(string maHopDong, string newStatus)
        {
            // Tìm hợp đồng theo mã hợp đồng
            var hopDong = db.HopDongMuaBans.SingleOrDefault(h => h.MaHopDong == maHopDong);

            if (hopDong != null)
            {
                // Cập nhật trạng thái hợp đồng
                hopDong.TrangThaiHopDong = newStatus;

                // Lưu thay đổi vào cơ sở dữ liệu
                db.SaveChanges();

                return Json(new { success = true });
            }

            return Json(new { success = false });
        }

        public ActionResult QuanLyNhanVien()
        {
            List<NhanVien> dsNV = db.NhanViens.ToList();
            return View(dsNV);
        }
    }
}