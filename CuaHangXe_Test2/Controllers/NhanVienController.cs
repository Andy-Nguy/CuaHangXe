using CuaHangXe_Test2.Filters;
using CuaHangXe_Test2.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangXe_Test2.Controllers
{
    
    public class NhanVienController : Controller
    {
        // GET: NhanVien
        [AuthFilter]
        public ActionResult Index()
        {
            return View();
        }
    }
}