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
        SieuXeDbEntities1 db = new SieuXeDbEntities1();
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
    }
}