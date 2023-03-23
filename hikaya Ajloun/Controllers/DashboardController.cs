using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;



namespace hikaya_Ajloun.Controllers
{

    public class DashboardController : Controller
    {
        // GET: Dashboard
        [Authorize(Roles = "Admin")]
        public ActionResult Dashboard()
        {
            return View();
        }

        public ActionResult NewArtical()
        {
            return View();
        }

        public ActionResult Calendar()
        {
            return View();
        }
    }
}