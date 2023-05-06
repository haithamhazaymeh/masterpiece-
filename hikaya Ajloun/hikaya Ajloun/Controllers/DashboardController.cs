using hikaya_Ajloun.Models;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;



namespace hikaya_Ajloun.Controllers
{

    public class DashboardController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();

        // GET: Dashboard
        public static Dictionary<string, int> UniqueVisitors = new Dictionary<string, int>();
        public static int TotalVisitors = 0;
        public static int BounceVisitors = 0;

        [Authorize(Roles = "Admin")]
        public ActionResult Dashboard()
        {
            var orderCount = db.Orders.Count();
            var orderd = db.Order_Details.ToList();
            var user = db.AspNetUsers.Count();
            var comment = db.Comments.Count();
           



            TotalVisitors++;

            var visitorId = "";
            if (Request.Cookies["VisitorId"] == null || Request.Cookies["VisitorDate"] == null)
            {
                visitorId = Guid.NewGuid().ToString();
                Response.Cookies.Add(new HttpCookie("VisitorId", visitorId));
                Response.Cookies.Add(new HttpCookie("VisitorDate", DateTime.Now.ToShortDateString()));

                if (UniqueVisitors.ContainsKey(DateTime.Now.ToShortDateString()))
                {
                    UniqueVisitors[DateTime.Now.ToShortDateString()]++;
                }
                else
                {
                    UniqueVisitors.Add(DateTime.Now.ToShortDateString(), 1);
                }
            }
            else if (Request.Cookies["VisitorDate"].Value != DateTime.Now.ToShortDateString())
            {
                visitorId = Guid.NewGuid().ToString();
                Response.Cookies.Set(new HttpCookie("VisitorId", visitorId));
                Response.Cookies.Set(new HttpCookie("VisitorDate", DateTime.Now.ToShortDateString()));

                if (UniqueVisitors.ContainsKey(DateTime.Now.ToShortDateString()))
                {
                    UniqueVisitors[DateTime.Now.ToShortDateString()]++;
                }
                else
                {
                    UniqueVisitors.Add(DateTime.Now.ToShortDateString(), 1);
                }

                BounceVisitors++;
            }
            else
            {
                visitorId = Request.Cookies["VisitorId"].Value;

                if (!UniqueVisitors.ContainsKey(DateTime.Now.ToShortDateString()))
                {
                    UniqueVisitors.Add(DateTime.Now.ToShortDateString(), 1);
                }
                else if (!Request.Cookies.AllKeys.Contains("VisitorId"))
                {
                    UniqueVisitors[DateTime.Now.ToShortDateString()]++;
                }
            }

            ViewBag.Counter = TotalVisitors;
            ViewBag.UniqueVisitors = UniqueVisitors[DateTime.Now.ToShortDateString()];
            ViewBag.BounceRate = (float)BounceVisitors / TotalVisitors * 100;

            return View(Tuple.Create(orderCount, orderd, user , comment ));
        }




        public ActionResult Calendar()
        {
            return View();
        }
    }
}