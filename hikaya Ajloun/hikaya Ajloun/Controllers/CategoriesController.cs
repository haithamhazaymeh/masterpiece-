using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Validation;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace hikaya_Ajloun.Models
{
    public class CategoriesController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();

        // GET: Categories
        public ActionResult Index()
        {
            return View(db.Categories.ToList());
        }

        // GET: Categories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // GET: Categories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Categories/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "categoryId,categoryName,categoryDescription,categoryImage,type")] Category category, HttpPostedFileBase categoryImage)
        {
            if (ModelState.IsValid)
            {
                if (categoryImage != null && categoryImage.ContentLength > 0)
                {
                    const int MAX_FILE_SIZE_IN_BYTES = 1097152; // 1 MB in bytes
                    const int MAX_FILE_SIZE_IN_MB = MAX_FILE_SIZE_IN_BYTES / 1024 / 1024; // Convert bytes to MB

                    if (categoryImage.ContentLength > MAX_FILE_SIZE_IN_BYTES)
                    {
                        ModelState.AddModelError("", "The file size should not exceed " + MAX_FILE_SIZE_IN_MB + "MB");
                        return View(category);
                    }

                    if (!categoryImage.ContentType.StartsWith("image"))
                    {
                        ModelState.AddModelError("", "Please upload an image file.");
                        return View(category);
                    }

                    var fileName = Path.GetFileName(categoryImage.FileName);
                    var directory = Server.MapPath("~/Images/category");
                    var path = Path.Combine(directory, fileName);

                    try
                    {
                        categoryImage.SaveAs(path);
                        category.categoryImage = fileName;
                        db.Categories.Add(category);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("", "An error occurred while uploading the file: " + ex.Message);
                    }
                }
                else
                {
                    ModelState.AddModelError("", "Please select a file to upload");
                }
            }

            return View(category);
        }




        // GET: Categories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }

            Category category = db.Categories.Find(id);
            Session["image"]= category.categoryImage;
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Categories/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "categoryId,categoryName,categoryDescription,categoryImage,type")] Category category, HttpPostedFileBase categoryImage)
        {
            if (ModelState.IsValid)
            {
                if (categoryImage != null && categoryImage.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(categoryImage.FileName);
                    var directory = Server.MapPath("~/Images/category");
                    var path = Path.Combine(directory, fileName);

                    try
                    {
                        categoryImage.SaveAs(path);
                        category.categoryImage = fileName;
                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("", "An error occurred while uploading the file: " + ex.Message);
                        return View(category);
                    }
                }
                else
                {
                    category.categoryImage = Session["image"].ToString();
                }

                try
                {
                    db.Entry(category).State = EntityState.Modified;
                    db.SaveChanges(); // حفظ التغييرات في قاعدة البيانات
                    return RedirectToAction("Index");
                }
                catch (DbEntityValidationException ex)
                {
                    // عرض أي خطأ يحدث في تحقق صحة الكيان
                    foreach (var error in ex.EntityValidationErrors)
                    {
                        foreach (var validationError in error.ValidationErrors)
                        {
                            ModelState.AddModelError("", $"Error: {validationError.ErrorMessage}");
                        }
                    }
                }
            }
            return View(category); // إضافة الجملة الجديدة هنا في نهاية الدالة
        }

        // GET: Categories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Category category = db.Categories.Find(id);
            if (category == null)
            {
                return HttpNotFound();
            }
            return View(category);
        }

        // POST: Categories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Category category = db.Categories.Find(id);
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
