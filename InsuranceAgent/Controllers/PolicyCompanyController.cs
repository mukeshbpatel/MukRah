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
    public class PolicyCompanyController : Controller
    {
        private InsuranceAgentEntities db = new InsuranceAgentEntities();

        //
        // GET: /PolicyCompany/

        public ActionResult Index()
        {
            return View(db.PolicyCompanies.ToList());
        }

        //
        // GET: /PolicyCompany/Details/5

        public ActionResult Details(int id = 0)
        {
            PolicyCompany policycompany = db.PolicyCompanies.Find(id);
            if (policycompany == null)
            {
                return HttpNotFound();
            }
            return View(policycompany);
        }

        //
        // GET: /PolicyCompany/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /PolicyCompany/Create

        [HttpPost]
        public ActionResult Create(PolicyCompany policycompany)
        {
            policycompany.CreatedDate = Common.GetCurrentDate();
            policycompany.UpdatedDate = policycompany.CreatedDate;
            policycompany.UpdatedByID = WebMatrix.WebData.WebSecurity.GetUserId(User.Identity.Name);

            if (ModelState.IsValid)
            {
                db.PolicyCompanies.Add(policycompany);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(policycompany);
        }

        //
        // GET: /PolicyCompany/Edit/5

        public ActionResult Edit(int id = 0)
        {
            PolicyCompany policycompany = db.PolicyCompanies.Find(id);
            if (policycompany == null)
            {
                return HttpNotFound();
            }
            return View(policycompany);
        }

        //
        // POST: /PolicyCompany/Edit/5

        [HttpPost]
        public ActionResult Edit(PolicyCompany policycompany)
        {
            policycompany.UpdatedDate = Common.GetCurrentDate();
            policycompany.UpdatedByID = WebMatrix.WebData.WebSecurity.GetUserId(User.Identity.Name);

            if (ModelState.IsValid)
            {
                db.Entry(policycompany).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(policycompany);
        }

        //
        // GET: /PolicyCompany/Delete/5

        public ActionResult Delete(int id = 0)
        {
            PolicyCompany policycompany = db.PolicyCompanies.Find(id);
            if (policycompany == null)
            {
                return HttpNotFound();
            }
            return View(policycompany);
        }

        //
        // POST: /PolicyCompany/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            PolicyCompany policycompany = db.PolicyCompanies.Find(id);
            db.PolicyCompanies.Remove(policycompany);
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