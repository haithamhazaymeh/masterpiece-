using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using hikaya_Ajloun.Models;
using Microsoft.AspNet.Identity;

namespace hikaya_Ajloun.Controllers
{
    public class CartsController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();


        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> CheckOut(string Email, string customerPhone, string address, int postalCode, string city)
        {



            Order order = new Order();
            Order_Details order_Details= new Order_Details();
            Product product = new Product();

            var id = User.Identity.GetUserId();
            var user = db.AspNetUsers.Where(x => x.Id == id).FirstOrDefault();
            var cart = db.Carts.Where(x => x.userId == id).ToList();


            decimal totalAmount = 0;

            foreach (var item in cart)
            {
                totalAmount += Convert.ToDecimal(item.amount);

            }


            var orderDetailOrder = db.Orders.Where(x => x.User_id == id).OrderByDescending(x => x.orderId).FirstOrDefault();
            foreach (var item in cart)
            {

                order_Details.Order_id = orderDetailOrder.orderId;
                order_Details.Product_id = item.productId;
                order_Details.Quantity= item.quantity;
                order_Details.Quantity = item.Product.price * item.quantity;
                db.Order_Details.Add(order_Details);




                await db.SaveChangesAsync();

                

                db.SaveChanges();
                db.Carts.Remove(item);
            }
            await db.SaveChangesAsync();

            return RedirectToAction("Home", "Home");

        }


        public ActionResult Cart()
        {

        

            var id = User.Identity.GetUserId();
            //ViewBag.userId = id;
            var carts = db.Carts.Where(x => x.AspNetUser.Id == id).Include(c => c.Product);
            return View(carts.ToList());

        }

        public ActionResult Buy(int? productId, int? quantity)
        {
            if (User.Identity.GetUserId() == null)
                return RedirectToAction("Login", "Account", "");

            string email = User.Identity.GetUserName();
            AspNetUser customer = (AspNetUser)db.AspNetUsers.SingleOrDefault(c => c.Email == email);
            Product product = db.Products.Find(productId);
            int? price = Convert.ToInt32(product.price);
            quantity = quantity ?? 1; // تعيين القيمة الافتراضية لـ quantity إلى 1
            var Cart = new Cart()
            {
                userId = customer.Id,
                is_chekout = false,
                productId = productId,
                quantity = quantity,
                amount = price
            };
            db.Carts.Add(Cart);
            db.SaveChanges();

            return RedirectToAction("Cart");
        }


        // GET: Carts
        public ActionResult Index()
        {

            var carts = db.Carts.Include(c => c.AspNetUser).Include(c => c.Product);
            return View(carts.ToList());
        }

        // GET: Carts/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cart cart = db.Carts.Find(id);
            if (cart == null)
            {
                return HttpNotFound();
            }
            return View(cart);
        }

        // GET: Carts/Create
        public ActionResult Create()
        {
            ViewBag.userId = new SelectList(db.AspNetUsers, "Id", "Email");
            ViewBag.productId = new SelectList(db.Products, "productId", "productName");
            return View();
        }

        // POST: Carts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "cartId,productId,userId,amount,quantity,is_chekout")] Cart cart)
        {
            if (ModelState.IsValid)
            {
                db.Carts.Add(cart);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.userId = new SelectList(db.AspNetUsers, "Id", "Email", cart.userId);
            ViewBag.productId = new SelectList(db.Products, "productId", "productName", cart.productId);
            return View(cart);
        }

        // GET: Carts/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cart cart = db.Carts.Find(id);
            if (cart == null)
            {
                return HttpNotFound();
            }
            ViewBag.userId = new SelectList(db.AspNetUsers, "Id", "Email", cart.userId);
            ViewBag.productId = new SelectList(db.Products, "productId", "productName", cart.productId);
            return View(cart);
        }

        // POST: Carts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "cartId,productId,userId,amount,quantity,is_chekout")] Cart cart)
        {
            if (ModelState.IsValid)
            {
                db.Entry(cart).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.userId = new SelectList(db.AspNetUsers, "Id", "Email", cart.userId);
            ViewBag.productId = new SelectList(db.Products, "productId", "productName", cart.productId);
            return View(cart);
        }

        // GET: Carts/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Cart cart = db.Carts.Find(id);
            if (cart == null)
            {
                return HttpNotFound();
            }
            return View(cart);
        }

        // POST: Carts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Cart cart = db.Carts.Find(id);
            db.Carts.Remove(cart);
            db.SaveChanges();
            return RedirectToAction("cart");
        }

       
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
