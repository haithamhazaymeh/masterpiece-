using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Web;
using System.Web.Mvc;
using hikaya_Ajloun.Models;

namespace hikaya_Ajloun.Controllers
{



    [Authorize(Roles = "Admin")]

    public class ProductsController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();

        // GET: Products
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category);
            return View(products.ToList());
        }

        // GET: Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }



        // GET: Products/Create
        public ActionResult Create()
        {
            ViewBag.categoryId = new SelectList(db.Categories.Where(x => x.type == "Products"), "categoryId", "categoryName");

            return View();
        }

        // POST: Products/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "productId,productName,productImage_1,productImage_2,productImage_3,productImage_4,productImage_5,price,productDescription,categoryId,availability,shipping_return")] Product product, HttpPostedFileBase productImage_1, HttpPostedFileBase productImage_2, HttpPostedFileBase productImage_3, HttpPostedFileBase productImage_4, HttpPostedFileBase productImage_5)
        {
            if (ModelState.IsValid)
            {
                // Upload images
                string folderPath = Server.MapPath("~/images/products");
                List<string> uploadedFiles = new List<string>();
                HttpPostedFileBase[] files = { productImage_1, productImage_2, productImage_3, productImage_4, productImage_5 };

                for (int i = 0; i < files.Length; i++)
                {
                    HttpPostedFileBase file = files[i];

                    if (file != null && file.ContentLength > 0)
                    {
                        string fileName = Path.GetFileName(file.FileName);
                        string filePath = Path.Combine(folderPath, fileName);
                        file.SaveAs(filePath);
                        uploadedFiles.Add(fileName);

                        // Update the corresponding productImage column in the database
                        PropertyInfo imageProp = product.GetType().GetProperty($"productImage_{i + 1}");
                        if (imageProp != null)
                        {
                            imageProp.SetValue(product, fileName);
                        }
                    }
                }

                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.categoryId = new SelectList(db.Categories.Where(x => x.type == "Products"), "categoryId", "categoryName");
            return View(product);
        }


        // GET: Products/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);

            Session["image1"] = product.productImage_1;
            Session["image2"] = product.productImage_2;
            Session["image3"] = product.productImage_3;
            Session["image4"] = product.productImage_4;
            Session["image5"] = product.productImage_5;





            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryId = new SelectList(db.Categories.Where(x => x.type == "Products"), "categoryId", "categoryName");
            return View(product);
        }

        // POST: Products/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "productId,productName,productImage_1,productImage_2,productImage_3,productImage_4,productImage_5,price,productDescription,categoryId,availability,shipping_return")] Product product, HttpPostedFileBase productImage_1, HttpPostedFileBase productImage_2, HttpPostedFileBase productImage_3, HttpPostedFileBase productImage_4, HttpPostedFileBase productImage_5)
        {
            if (ModelState.IsValid)
            {
                // Update product properties
                product.productImage_1 = (string)Session["image1"];
                product.productImage_2 = (string)Session["image2"];
                product.productImage_3 = (string)Session["image3"];
                product.productImage_4 = (string)Session["image4"];
                product.productImage_5 = (string)Session["image5"];

                // Upload images and update product image properties
                string folderPath = Server.MapPath("~/images/products");
                List<string> uploadedFiles = new List<string>();
                HttpPostedFileBase[] files = { productImage_1, productImage_2, productImage_3, productImage_4, productImage_5 };

                for (int i = 0; i < files.Length; i++)
                {
                    HttpPostedFileBase file = files[i];

                    if (file != null && file.ContentLength > 0)
                    {
                        string fileName = Path.GetFileName(file.FileName);
                        string filePath = Path.Combine(folderPath, fileName);
                        file.SaveAs(filePath);
                        uploadedFiles.Add(fileName);

                        // Update the corresponding productImage column in the database
                        PropertyInfo imageProp = product.GetType().GetProperty($"productImage_{i + 1}");
                        if (imageProp != null)
                        {
                            imageProp.SetValue(product, fileName);
                        }
                    }
                }

                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categoryId = new SelectList(db.Categories, "categoryId", "categoryName", product.categoryId);
            return View(product);
        }


        // GET: Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // POST: Products/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);

            // Check if there are any products, places, or articles in this category
            var anyProductsInCategory = db.Products.Any(p => p.categoryId == id);
            var anyPlacesInCategory = db.places.Any(p => p.categoryId == id);
            var anyArticlesInCategory = db.Articles.Any(a => a.categoryId == id);

            if (anyProductsInCategory || anyPlacesInCategory || anyArticlesInCategory)
            {
                ViewBag.ErrorMessage = "Cannot delete category. It has products, places, or articles associated with it.";
                return View(category);
            }

            db.Categories.Remove(category);
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
