﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using CuaHangXe_Test2.Models;
namespace CuaHangXe_Test2.Controllers
{
    public class UserController : Controller
    {
        // GET: User
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(NhanVien nv)
        {
            if (nv != null)
            {
                SieuXeDbEntities7 db = new SieuXeDbEntities7();
                NhanVien nvCheck = db.NhanViens.Where(nvien => nvien.TenDangNhap == nv.TenDangNhap).FirstOrDefault();
                if (nvCheck != null)
                {
                    if (nvCheck.MatKhau == nv.MatKhau)
                    {
                        HttpCookie maNVCookie = new HttpCookie("maNV", nvCheck.MaNhanVien);
                        HttpCookie authCookie = new HttpCookie("auth", nvCheck.TenDangNhap);
                        HttpCookie nameCookie = new HttpCookie("name", HttpUtility.UrlEncode(nvCheck.TenNhanVien, System.Text.Encoding.UTF8));
                        HttpCookie roleCookie = new HttpCookie("role", nvCheck.VaiTro);
                        Response.Cookies.Add(maNVCookie);
                        Response.Cookies.Add(authCookie);
                        Response.Cookies.Add(nameCookie);
                        Response.Cookies.Add(roleCookie);
                        if (nvCheck.VaiTro == "admin")
                        {
                            return RedirectToAction("QuanLyNhanVien", "NhanVien");
                        }
                        if (nvCheck.VaiTro == "userDonHang")
                        {
                            return RedirectToAction("QuanLyDonHang", "NhanVien");
                        }
                        return RedirectToAction("Index", "NhanVien");
                    }
                }
            }
            ModelState.AddModelError("MatKhau", "Đăng nhập không thành công !");
            return View();
        }
        public ActionResult Logout()
        {
            HttpCookie maNVCookie = new HttpCookie("maNV");
            HttpCookie authCookie = new HttpCookie("auth");
            HttpCookie nameCookie = new HttpCookie("name");
            HttpCookie roleCookie = new HttpCookie("role");

            authCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(maNVCookie);

            nameCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(authCookie);

            roleCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(nameCookie);

            roleCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(roleCookie);

            return Redirect("/");
        }
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Register(NhanVien nv)
        {
            if (nv != null)
            {
                SieuXeDbEntities7 db = new SieuXeDbEntities7();
                NhanVien nvCheck = db.NhanViens.Where(nvien => nvien.TenDangNhap == nv.TenDangNhap).FirstOrDefault();
                if (nvCheck == null)
                {
                    nv.MaNhanVien = TaoMaNV();
                    db.NhanViens.Add(nv);
                    db.SaveChanges();
                    return RedirectToAction("Login", "User");
                }
            }
            return View();
        }
        public string TaoMaNV()
        {
            SieuXeDbEntities7 db = new SieuXeDbEntities7();
            int soNVHienTai = db.NhanViens.ToList().Count;
            soNVHienTai++;
            return "NV" + soNVHienTai.ToString("D3");
        }
    }
}