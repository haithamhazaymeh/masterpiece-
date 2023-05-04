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
    public class CommentsController : Controller
    {
        private hikaya_AjlounEntities3 db = new hikaya_AjlounEntities3();

        // GET: Comments
        public ActionResult Index()
        {
            var comments = db.Comments.Include(c => c.Article);
            return View(comments.ToList());
        }

        public ActionResult acceptcomment()
        {
            var comment = db.Comments.Where(a => a.status == true);
            return View(comment.ToList());

        }

        // GET: Comments/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // GET: Comments/Create
        public ActionResult Create()
        {

            ViewBag.articalid = new SelectList(db.Articles, "articleId", "articleName");
            return View();
        }

        // POST: Comments/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,Name,Email,Comment1,status,articalid")] Comment comment)
        {

            if (ModelState.IsValid)
            {

                db.Comments.Add(comment);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.articalid = new SelectList(db.Articles, "articleId", "articleName", comment.articalid);
            return View(comment);
        }

        public ActionResult accept(int? id)
        {
            Comment coom = db.Comments.Find(id);
            coom.status = true;
            db.SaveChanges();
            return RedirectToAction("acceptcomment", "comments");
        }

        public ActionResult reject(int? id)
        {
            Comment coom2 = db.Comments.Find(id);
            coom2.status = false;
            db.SaveChanges();
            return RedirectToAction("index", "comments");

        }

        // GET: Comments/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            ViewBag.articalid = new SelectList(db.Articles, "articleId", "articleName", comment.articalid);
            return View(comment);
        }

        // POST: Comments1/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,Name,Email,Comment1,status,articalid")] Comment comment)
        {
            if (ModelState.IsValid)
            {
                db.Entry(comment).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.articalid = new SelectList(db.Articles, "articleId", "articleName", comment.articalid);
            return View(comment);
        }

        // GET: Comments1/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Comment comment = db.Comments.Find(id);
            if (comment == null)
            {
                return HttpNotFound();
            }
            return View(comment);
        }

        // POST: Comments1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Comment comment = db.Comments.Find(id);
            db.Comments.Remove(comment);
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



       
