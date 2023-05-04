using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using hikaya_Ajloun.Models;

namespace hikaya_Ajloun.Controllers
{
    public class ProductsRequestsController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();

        // GET: ProductsRequests
        public ActionResult Index()
        {
            return View(db.ProductsRequests.ToList());
        }

        // GET: ProductsRequests/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductsRequest productsRequest = db.ProductsRequests.Find(id);
            if (productsRequest == null)
            {
                return HttpNotFound();
            }
            return View(productsRequest);
        }

        // GET: ProductsRequests/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ProductsRequests/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Name,Email,PhoneNumber,ProductName,Adress1,Adress2,Message,image1,image2,image3,image4")] ProductsRequest productsRequest)
        {
            if (ModelState.IsValid)
            {
                // إنشاء مجلد "ProductsRequests" إذا لم يكن موجوداً
                string folderPath = Server.MapPath("~/images/ProductsRequests/");
                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(folderPath);
                }

                // حفظ الصور المرفوعة
                for (int i = 1; i <= 4; i++)
                {
                    HttpPostedFileBase file = Request.Files["image" + i.ToString()];
                    if (file != null && file.ContentLength > 0)
                    {
                        string fileName = Path.GetFileName(file.FileName);
                        string filePath = Path.Combine(folderPath, fileName);
                        file.SaveAs(filePath);
                        switch (i)
                        {
                            case 1:
                                productsRequest.image1 = fileName;
                                break;
                            case 2:
                                productsRequest.image2 = fileName;
                                break;
                            case 3:
                                productsRequest.image3 = fileName;
                                break;
                            case 4:
                                productsRequest.image4 = fileName;
                                break;
                        }
                    }
                }

                db.ProductsRequests.Add(productsRequest);
                db.SaveChanges();
                return RedirectToAction("Home","Home");
            }

            return View(productsRequest);
        }


        // GET: ProductsRequests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductsRequest productsRequest = db.ProductsRequests.Find(id);
            if (productsRequest == null)
            {
                return HttpNotFound();
            }
            return View(productsRequest);
        }

        // POST: ProductsRequests/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Name,Email,PhoneNumber,ProductName,Adress1,Adress2,Message,image1,image2,image3,image4")] ProductsRequest productsRequest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(productsRequest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(productsRequest);
        }

        // GET: ProductsRequests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ProductsRequest productsRequest = db.ProductsRequests.Find(id);
            if (productsRequest == null)
            {
                return HttpNotFound();
            }
            return View(productsRequest);
        }

        // POST: ProductsRequests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ProductsRequest productsRequest = db.ProductsRequests.Find(id);
            db.ProductsRequests.Remove(productsRequest);
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
