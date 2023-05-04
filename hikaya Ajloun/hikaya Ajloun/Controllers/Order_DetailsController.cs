using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using hikaya_Ajloun.Models;

namespace hikaya_Ajloun.Controllers
{
    public class Order_DetailsController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();

        // GET: Order_Details
        public ActionResult Index()
        {
            var order_Details = db.Order_Details.Include(o => o.Order).Include(o => o.Product);
            return View(order_Details.ToList());
        }

        // GET: Order_Details/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order_Details order_Details = db.Order_Details.Find(id);
            if (order_Details == null)
            {
                return HttpNotFound();
            }
            return View(order_Details);
        }

        // GET: Order_Details/Create
        public ActionResult Create()
        {
            ViewBag.Order_id = new SelectList(db.Orders, "orderId", "address_2");
            ViewBag.Product_id = new SelectList(db.Products, "productId", "productName");
            return View();
        }

        // POST: Order_Details/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OrderDetails_id,Order_id,Product_id,Quantity")] Order_Details order_Details)
        {
            if (ModelState.IsValid)
            {
                db.Order_Details.Add(order_Details);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Order_id = new SelectList(db.Orders, "orderId", "address_2", order_Details.Order_id);
            ViewBag.Product_id = new SelectList(db.Products, "productId", "productName", order_Details.Product_id);
            return View(order_Details);
        }

        // GET: Order_Details/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order_Details order_Details = db.Order_Details.Find(id);
            if (order_Details == null)
            {
                return HttpNotFound();
            }
            ViewBag.Order_id = new SelectList(db.Orders, "orderId", "address_2", order_Details.Order_id);
            ViewBag.Product_id = new SelectList(db.Products, "productId", "productName", order_Details.Product_id);
            return View(order_Details);
        }

        // POST: Order_Details/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrderDetails_id,Order_id,Product_id,Quantity")] Order_Details order_Details)
        {
            if (ModelState.IsValid)
            {
                db.Entry(order_Details).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Order_id = new SelectList(db.Orders, "orderId", "address_2", order_Details.Order_id);
            ViewBag.Product_id = new SelectList(db.Products, "productId", "productName", order_Details.Product_id);
            return View(order_Details);
        }

        // GET: Order_Details/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Order_Details order_Details = db.Order_Details.Find(id);
            if (order_Details == null)
            {
                return HttpNotFound();
            }
            return View(order_Details);
        }

        // POST: Order_Details/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Order_Details order_Details = db.Order_Details.Find(id);
            db.Order_Details.Remove(order_Details);
            db.SaveChanges();
            return RedirectToAction("Index");
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
