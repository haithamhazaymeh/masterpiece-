﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace hikaya_Ajloun.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Home()
        {
            return View();
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

            return View();
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

        public ActionResult SingleBlog()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

    }
}