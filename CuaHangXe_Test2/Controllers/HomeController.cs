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
        //Hi
        SieuXeDbmdfEntities2 db =new SieuXeDbmdfEntities2();
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
        public ActionResult SanPham()
        {
            // Lấy toàn bộ sản phẩm từ cơ sở dữ liệu
            List<Xe> allProducts = db.Xes.ToList();
            ViewBag.AllProducts = allProducts;

            return View();
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


    }
}