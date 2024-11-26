using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CuaHangXe_Test2.Filters
{
    public class NVKhoFilterAttribute: ActionFilterAttribute
    {
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            var authCookie = HttpContext.Current.Request.Cookies["role"];
            if (authCookie == null || authCookie.Value != "userKho")
            {
                filterContext.Result = new RedirectResult("/User/Login");
            }

            base.OnActionExecuting(filterContext);
        }
    }
}