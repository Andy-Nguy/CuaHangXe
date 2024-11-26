using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangXe_Test2.Filters
{
    public class AdminFilterAttribute:ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var roleCookie = HttpContext.Current.Request.Cookies["role"];
            if (roleCookie == null || roleCookie.Value != "admin")
            {
                filterContext.Result = new RedirectResult("/User/Login");
            }
            base.OnActionExecuting(filterContext);
        }
    }
}