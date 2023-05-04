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


       


        public ActionResult Cart()
        {

        

            var id = User.Identity.GetUserId();
            //ViewBag.userId = id;
            var carts = db.Carts.Where(x => x.AspNetUser.Id == id).Include(c => c.Product);
            int numOfItems = carts.Count();
            Session["NumOfItems"] = numOfItems;
            ViewBag.NumOfItems = numOfItems;
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
            var cartdata = db.Carts.Where(x => x.userId == customer.Id).ToList();
            bool there = false;

            foreach (var item in cartdata)
            {
                if (item.productId == productId)
                {
                    there = true;
                }
            }

            if (there == false)
            {
                var Cart = new Cart()

                {
                    userId = customer.Id,
                    is_chekout = false,
                    productId = productId,
                    quantity = quantity,
                    amount = price

                };
                db.Carts.Add(Cart);
            }
            else
            {
                    var changepro = db.Carts.FirstOrDefault(x=> x.userId == customer.Id && x.productId == productId);
                     changepro.quantity += quantity;
            }

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
        // GET: Carts/Clear
        public ActionResult Clear()
        {
            // ابحث عن جميع المنتجات في السلة واحذفها جميعاً
            var products = db.Carts.ToList();
            db.Carts.RemoveRange(products);
            db.SaveChanges();
            return RedirectToAction("cart");
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
