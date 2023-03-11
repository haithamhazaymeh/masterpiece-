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
using hikaya_Ajloun.Models;

namespace hikaya_Ajloun.Controllers
{
    public class ArticlesController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();

        // GET: Articles
        public ActionResult Index()
        {
            var articles = db.Articles.Include(a => a.author).Include(a => a.Category);
            return View(articles.ToList());
        }

        // GET: Articles/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Article article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            return View(article);
        }

        // GET: Articles/Create
        public ActionResult Create()
        {
            ViewBag.authorid = new SelectList(db.authors, "authorid", "authorname");
            ViewBag.categoryId = new SelectList(db.Categories, "categoryId", "categoryName");
            return View();
        }

        // POST: Articles/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "articleId,articleName,articleImage,categoryId,articleFile,articleDate,authorid")] Article article , HttpPostedFileBase articleImage , HttpPostedFileBase articleFile )
        {
            if (ModelState.IsValid)
            {
                if (articleImage != null && articleImage.ContentLength > 0)
                {
                    const int MAX_FILE_SIZE_IN_BYTES = 1097152; // 1 MB in bytes
                    const int MAX_FILE_SIZE_IN_MB = MAX_FILE_SIZE_IN_BYTES / 1024 / 1024; // Convert bytes to MB

                    if (articleImage.ContentLength > MAX_FILE_SIZE_IN_BYTES)
                    {
                        ModelState.AddModelError("", "The file size should not exceed " + MAX_FILE_SIZE_IN_MB + "MB");
                        return View(article);
                    }

                    if (!articleImage.ContentType.StartsWith("image"))
                    {
                        ModelState.AddModelError("", "Please upload an image file.");
                        return View(article);;
                    }

                    var fileName = Path.GetFileName(articleImage.FileName);
                    var directory = Server.MapPath("~/Images/article");
                    var path = Path.Combine(directory, fileName);

                    try
                    {
                        articleImage.SaveAs(path);
                        article.articleImage = fileName;
                        db.Articles.Add(article);
                        ///////////
                        string fileName2 = "ArticleFile/" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + ".txt";

                        string fullpath = "~/File/" + fileName2;
                        // حفظ النص داخل ملف باستخدام StreamWriter
                        using (StreamWriter writer = new StreamWriter(Server.MapPath(fullpath)))
                        {
                            writer.Write(article.articleFile);
                        }


                        //////////

                        article.articleFile = fullpath;
                        article.articleDate = DateTime.Now;
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

            return View(article);
        }



        // GET: Articles/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Article article = db.Articles.Find(id);
            Session["image"] = article.articleImage;

            if (article == null)
            {
                return HttpNotFound();
            }

            string filePath = Server.MapPath(article.articleFile); // تحديد المسار الصحيح للملف

            if (System.IO.File.Exists(filePath)) // التحقق من وجود الملف
            {
                string fileContent = System.IO.File.ReadAllText(filePath); // قراءة محتوى الملف
                article.articleFile = fileContent; // تعيين محتوى الملف لخاصية articleFile في النموذج
            }

            ViewBag.authorid = new SelectList(db.authors, "authorid", "authorname", article.authorid);
            ViewBag.categoryId = new SelectList(db.Categories, "categoryId", "categoryName", article.categoryId);
            return View(article);
        }



        // POST: Articles/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "articleId,articleName,articleImage,categoryId,articleFile,articleDate,authorid")] Article article , HttpPostedFileBase articleImage , HttpPostedFileBase articleFile)
        {
            if (ModelState.IsValid)
            {
                if (articleImage != null && articleImage.ContentLength > 0)
                {
                    var fileName = Path.GetFileName(articleImage.FileName);
                    var directory = Server.MapPath("~/Images/article");
                    var path = Path.Combine(directory, fileName);

                    try
                    {
                        articleImage.SaveAs(path);
                        article.articleImage = fileName;
                    }
                    catch (Exception ex)
                    {
                        ModelState.AddModelError("", "An error occurred while uploading the file: " + ex.Message);
                        return View(article);
                    }
                }
                else
                {
                    article.articleImage = Session["image"].ToString();
                }

                try
                {
                    db.Entry(article).State = EntityState.Modified;
                    string fileName2 = "ArticleFile/" + DateTime.Now.ToString("yyyyMMdd_HHmmss") + ".txt";

                    string fullpath = "~/File/" + fileName2;
                    // حفظ النص داخل ملف باستخدام StreamWriter
                    using (StreamWriter writer = new StreamWriter(Server.MapPath(fullpath)))
                    {
                        writer.Write(article.articleFile);
                    }


                    //////////

                    article.articleFile = fullpath;
                    article.articleDate = DateTime.Now;
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
            return View(article); // إضافة الجملة الجديدة هنا في نهاية الدالة

        }

        // GET: Articles/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Article article = db.Articles.Find(id);
            if (article == null)
            {
                return HttpNotFound();
            }
            return View(article);
        }

        // POST: Articles/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Article article = db.Articles.Find(id);
            db.Articles.Remove(article);
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
