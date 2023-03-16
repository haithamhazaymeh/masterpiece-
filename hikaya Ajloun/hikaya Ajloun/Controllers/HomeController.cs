using hikaya_Ajloun.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace hikaya_Ajloun.Controllers
{
    public class HomeController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();
        public ActionResult Home()
        {
            var data = db.Articles.ToList();

            return View(data);
        }

        public ActionResult aboutus()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Products()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Blog()
        {

            ViewBag.Message = "Your application description page.";
           
            var data = db.Articles.ToList();

            return View(data);
        }

        public ActionResult services()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Places()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult contact()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Cart()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Chekout()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Error()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }


        public ActionResult SingleProduct()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult SingleBlog(int id)
        {
            var singlebloge = db.Articles.Find(id);
            ViewBag.Message = "Your application description page.";

            return View(singlebloge);
        }

        public ActionResult FormProduct()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }


        public ActionResult FormPlace()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }


    }
}