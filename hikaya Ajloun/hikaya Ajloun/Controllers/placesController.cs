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
    

    public class placesController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();
        public ActionResult Places(int id)
        {
            var place = db.places.Find(id);
            ViewBag.Message = "Your application description page.";

            return View(place);

           
        }

        // GET: places
        public ActionResult Index()
        {
            var places = db.places.Include(p => p.Category).Include(p => p.Review);
            return View(places.ToList());
        }

        // GET: places/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            place place = db.places.Find(id);
            if (place == null)
            {
                return HttpNotFound();
            }
            return View(place);
        }

        // GET: places/Create
        public ActionResult Create()
        {
            ViewBag.categoryId = new SelectList(db.Categories.Where(x => x.type == "Places"), "categoryId", "categoryName");
            ViewBag.reviewid = new SelectList(db.Reviews.Where(x=>x.type == "Places"), "reviewId", "comment");
            return View();
        }

        // POST: places/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "placeId,placeName,placeImage1,placeImage2,placeImage3,placeImage4,placeImage5,categoryId,description,price_per_day,owner,phonenumber,reviewid")] place place, HttpPostedFileBase placeImage1, HttpPostedFileBase placeImage2, HttpPostedFileBase placeImage3, HttpPostedFileBase placeImage4, HttpPostedFileBase placeImage5)
        {
            if (ModelState.IsValid)
            {
                // Upload images
                string folderPath = Server.MapPath("~/images/Places");
                List<string> uploadedFiles = new List<string>();
                HttpPostedFileBase[] files = { placeImage1, placeImage2, placeImage3, placeImage4, placeImage5 };

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
                        PropertyInfo imageProp = place.GetType().GetProperty($"placeImage{i + 1}");
                        if (imageProp != null)
                        {
                            imageProp.SetValue(place, fileName);
                        }

                    }
                }
                db.places.Add(place);
                db.SaveChanges();
                return RedirectToAction("Index");
            }


            ViewBag.categoryId = new SelectList(db.Categories.Where(x => x.type == "Places"), "categoryId", "categoryName");


            return View(place);
        }

        // GET: places/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            place place = db.places.Find(id);

            Session["image1"] = place.placeImage1;
            Session["image2"] = place.placeImage2;
            Session["image3"] = place.placeImage3;
            Session["image4"] = place.placeImage4;
            Session["image5"] = place.placeImage5;

            if (place == null)
            {
                return HttpNotFound();
            }
            ViewBag.categoryId = new SelectList(db.Categories.Where(x => x.type == "Places"), "categoryId", "categoryName");
            return View(place);
        }

        // POST: places/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "placeId,placeName,placeImage1,placeImage2,placeImage3,placeImage4,placeImage5,categoryId,description,price_per_day,owner,phonenumber,reviewid")] place place , HttpPostedFileBase placeImage1, HttpPostedFileBase placeImage2, HttpPostedFileBase placeImage3, HttpPostedFileBase placeImage4, HttpPostedFileBase placeImage5)
        {
            if (ModelState.IsValid)
            {
                // Update product properties
                place.placeImage1 = (string)Session["image1"];
                place.placeImage2 = (string)Session["image2"];
                place.placeImage3 = (string)Session["image3"];
                place.placeImage4 = (string)Session["image4"];
                place.placeImage5 = (string)Session["image5"];

                // Upload images and update product image properties
                string folderPath = Server.MapPath("~/images/places");
                List<string> uploadedFiles = new List<string>();
                HttpPostedFileBase[] files = { placeImage1, placeImage2, placeImage3, placeImage4, placeImage5 };

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
                        PropertyInfo imageProp = place.GetType().GetProperty($"placeImage{i + 1}");
                        if (imageProp != null)
                        {
                            imageProp.SetValue(place, fileName);
                        }
                    }
                }

                db.Entry(place).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.categoryId = new SelectList(db.Categories, "categoryId", "categoryName", place.categoryId);
            return View(place);
        }

        // GET: places/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            place place = db.places.Find(id);
            if (place == null)
            {
                return HttpNotFound();
            }
            return View(place);
        }

        // POST: places/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            place place = db.places.Find(id);
            db.places.Remove(place);
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
