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
    public class PolicyTypeController : Controller
    {
        private InsuranceAgentEntities db = new InsuranceAgentEntities();

        //
        // GET: /PolicyType/

        public ActionResult Index()
        {
            return View(db.PolicyTypes.ToList());
        }

        //
        // GET: /PolicyType/Details/5

        public ActionResult Details(int id = 0)
        {
            PolicyType policytype = db.PolicyTypes.Find(id);
            if (policytype == null)
            {
                return HttpNotFound();
            }
            return View(policytype);
        }

        //
        // GET: /PolicyType/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /PolicyType/Create

        [HttpPost]
        public ActionResult Create(PolicyType policytype)
        {
            policytype.CreatedDate = Common.GetCurrentDate();
            policytype.UpdatedDate = policytype.CreatedDate;
            policytype.UpdatedByID = WebMatrix.WebData.WebSecurity.GetUserId(User.Identity.Name);
            if (ModelState.IsValid)
            {
                db.PolicyTypes.Add(policytype);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(policytype);
        }

        //
        // GET: /PolicyType/Edit/5

        public ActionResult Edit(int id = 0)
        {
            PolicyType policytype = db.PolicyTypes.Find(id);
            if (policytype == null)
            {
                return HttpNotFound();
            }
            return View(policytype);
        }

        //
        // POST: /PolicyType/Edit/5

        [HttpPost]
        public ActionResult Edit(PolicyType policytype)
        {
            policytype.UpdatedDate = Common.GetCurrentDate();
            policytype.UpdatedByID = WebMatrix.WebData.WebSecurity.GetUserId(User.Identity.Name);
            if (ModelState.IsValid)
            {
                db.Entry(policytype).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(policytype);
        }

        //
        // GET: /PolicyType/Delete/5

        public ActionResult Delete(int id = 0)
        {
            PolicyType policytype = db.PolicyTypes.Find(id);
            if (policytype == null)
            {
                return HttpNotFound();
            }
            return View(policytype);
        }

        //
        // POST: /PolicyType/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            PolicyType policytype = db.PolicyTypes.Find(id);
            db.PolicyTypes.Remove(policytype);
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