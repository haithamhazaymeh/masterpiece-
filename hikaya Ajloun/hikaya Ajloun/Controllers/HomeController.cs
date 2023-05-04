using hikaya_Ajloun.Models;
using Microsoft.AspNet.Identity;
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
            var articl = db.Articles.ToList();
            var product = db.Products.ToList();
            var category = db.Categories.ToList();
            var place = db.places.ToList();

            return View(Tuple.Create(articl, product , category ,place));


        }

        public ActionResult aboutus()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Products()
        {
            var product = db.Products.ToList();
            var category = db.Categories.Where(x => x.type == "Products").ToList();
            return View(Tuple.Create( product, category));
        }

        public ActionResult Blog()
        {

            ViewBag.Message = "Your application description page.";

            var data = db.Articles.ToList();

            return View(data);
        }


        public ActionResult TermOfUse()
        {

            ViewBag.Message = "Your application description page.";

            var data = db.Articles.ToList();

            return View(data);
        }

        public ActionResult PrivacyPolicy()
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
            var place = db.places.ToList();
            var category = db.Categories.Where(x => x.type == "Places").ToList();
            return View(Tuple.Create(place, category));
        }

        public ActionResult contact()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        //public ActionResult Cart()
        //{
        //    ViewBag.Message = "Your application description page.";

        //    return View();
        //}



        public ActionResult Chekout()
        {
            var user = User.Identity.GetUserId();
            ViewBag.Message = "Your application description page.";
            var userCart = db.Carts.Where(x => x.userId == user).ToList();
            int totalAmount = 0;
            foreach (var item in userCart)
            {
                totalAmount += Convert.ToInt32(item.amount) * Convert.ToInt32(item.quantity);
            }
            ViewBag.totalAmount = totalAmount;
            Session["totalAmount"] = totalAmount;
            return View();
        }
        [HttpPost]
        public ActionResult Checkout(string FirstName,string LastName,int totalAmount,string address_1,string address_2,string email,string phoneNumber,string payment,string city)
        {
            Order order = new Order();
            string User_id = User.Identity.GetUserId();
            order.email = email;
            order.FirstName = FirstName;
            order.LastName = LastName;
            order.totalAmount = totalAmount;
            order.address_1 = address_1;
            order.address_2 = address_2;
            order.phoneNumber = Convert.ToInt32(phoneNumber);
            order.Payment_Mthod = payment;
            order.city = city;
            order.User_id = User_id;
            order.orderDate = DateTime.Now;
            db.Orders.Add(order);
            db.SaveChanges();
            int orderId = order.orderId;

            var cart = db.Carts.Where(x => x.userId == User_id).ToList();

            foreach (var item in cart)
            {
                Order_Details orderd = new Order_Details();
                orderd.Order_id = orderId;
                orderd.Product_id = item.productId;
                orderd.Quantity= item.quantity;
                db.Order_Details.Add(orderd);
                db.Carts.Remove(item);
            }

            db.SaveChanges();

            


            return RedirectToAction("Products", "Home");
        }

        public ActionResult Error()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }


        public ActionResult SingleProduct(int id)
        {

            var product = db.Products.Find(id);
            ViewBag.Message = "Your application description page.";

            return View(product);
        }

        public ActionResult SingleBlog(int id)
        {
            var singleblog = db.Articles.Find(id);
          
            ViewBag.Message = "Your application description page.";
            return View(singleblog);
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


        public ActionResult Profile(int? id)

        {
            var order = db.Orders.ToList();
            var order_details = db.Order_Details.ToList();
            var user = db.AspNetUsers.ToList();
            var profile = db.Profiles.ToList();
            string userId = id.ToString();
            var userEmail = db.AspNetUsers.Where(u => u.Id == userId).FirstOrDefault();
            ViewBag.UserEmail = userEmail;
            ViewBag.UserId = userId;


            return View(Tuple.Create(order, order_details, user, profile));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,First_Name,Last_Name,Adress1,Adress2,ZIP_Code,City,Phone_Number,userid")] Profile profile)
        {
            if (ModelState.IsValid)
            {
                db.Profiles.Add(profile);
                db.SaveChanges();
                return RedirectToAction("/Home/Profile");
            }

            ViewBag.userid = new SelectList(db.AspNetUsers, "Id", "Email", profile.userid);
            return View(profile);
        }



    }
}