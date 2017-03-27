using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using InsuranceAgent.Models;

namespace InsuranceAgent.Controllers
{
    [Authorize]
    public class FamilyController : Controller
    {
        private InsuranceAgentEntities db = new InsuranceAgentEntities();

        //
        // GET: /Family/

        public ActionResult Index()
        {
            return View(db.Families.Include(b => b.Customers).ToList());
        }

        //
        // GET: /Family/Details/5

        public ActionResult Details(int id = 0)
        {
            Family family = db.Families.Find(id);
            if (family == null)
            {
                return HttpNotFound();
            }
            return View(family);
        }

        //
        // GET: /Family/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Family/Create

        [HttpPost]
        public ActionResult Create(Family family)
        {
            family.CreatedDate = Common.GetCurrentDate();
            family.UpdatedDate = family.CreatedDate;
            family.UpdatedByID = WebMatrix.WebData.WebSecurity.GetUserId(User.Identity.Name);

            if (ModelState.IsValid)
            {
                db.Families.Add(family);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(family);
        }

        //
        // GET: /Family/Edit/5

        public ActionResult Edit(int id = 0)
        {

            Family family = db.Families.Find(id);
            if (family == null)
            {
                return HttpNotFound();
            }
            return View(family);
        }

        //
        // POST: /Family/Edit/5

        [HttpPost]
        public ActionResult Edit(Family family)
        {            
            family.UpdatedDate = Common.GetCurrentDate();
            family.UpdatedByID = WebMatrix.WebData.WebSecurity.GetUserId(User.Identity.Name);

            if (ModelState.IsValid)
            {
                db.Entry(family).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(family);
        }

        //
        // GET: /Family/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Family family = db.Families.Find(id);
            if (family == null)
            {
                return HttpNotFound();
            }
            return View(family);
        }

        //
        // POST: /Family/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Family family = db.Families.Find(id);
            db.Families.Remove(family);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}