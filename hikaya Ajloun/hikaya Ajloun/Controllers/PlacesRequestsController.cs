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
    public class PlacesRequestsController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();

        // GET: PlacesRequests
        public ActionResult Index()
        {
            return View(db.PlacesRequests.ToList());
        }

        // GET: PlacesRequests/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlacesRequest placesRequest = db.PlacesRequests.Find(id);
            if (placesRequest == null)
            {
                return HttpNotFound();
            }
            return View(placesRequest);
        }

        // GET: PlacesRequests/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: PlacesRequests/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Name,Email,PhoneNumber,PlacesName,Adress1,Adress2,Message,image1,image2,image3,image4")] PlacesRequest PlacesRequest)
        {
            if (ModelState.IsValid)
            {
                // إنشاء مجلد "ProductsRequests" إذا لم يكن موجوداً
                string folderPath = Server.MapPath("~/images/PlacesRequest/");
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
                                PlacesRequest.image1 = fileName;
                                break;
                            case 2:
                                PlacesRequest.image2 = fileName;
                                break;
                            case 3:
                                PlacesRequest.image3 = fileName;
                                break;
                            case 4:
                                PlacesRequest.image4 = fileName;
                                break;
                        }
                    }
                }

                db.PlacesRequests.Add(PlacesRequest);
                db.SaveChanges();
                return RedirectToAction("Home", "Home");
            }

            return View(PlacesRequest);
        }

        // GET: PlacesRequests/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlacesRequest placesRequest = db.PlacesRequests.Find(id);
            if (placesRequest == null)
            {
                return HttpNotFound();
            }
            return View(placesRequest);
        }

        // POST: PlacesRequests/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Name,Email,PhoneNumber,PlacesName,Adress1,Adress2,Message,image1,image2,image3,image4")] PlacesRequest placesRequest)
        {
            if (ModelState.IsValid)
            {
                db.Entry(placesRequest).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(placesRequest);
        }

        // GET: PlacesRequests/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            PlacesRequest placesRequest = db.PlacesRequests.Find(id);
            if (placesRequest == null)
            {
                return HttpNotFound();
            }
            return View(placesRequest);
        }

        // POST: PlacesRequests/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            PlacesRequest placesRequest = db.PlacesRequests.Find(id);
            db.PlacesRequests.Remove(placesRequest);
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
