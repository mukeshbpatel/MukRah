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
    public class CustomerController : Controller
    {
        private InsuranceAgentEntities db = new InsuranceAgentEntities();

        //
        // GET: /Customer/

        public ActionResult Index()
        {
            var customers = db.Customers.Include(c => c.Family);
            return View(customers.ToList());
        }

        //
        // GET: /Customer/Details/5

        public ActionResult Details(int id = 0)
        {
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        //
        // GET: /Customer/Create

        public ActionResult Create()
        {
            ViewBag.FamilyID = new SelectList(db.Families, "FamilyID", "FamilyName");
            ViewBag.RelationCustomerID = new SelectList(db.Customers, "CustomerID", "FullName");
            ViewBag.Gender = new SelectList(Common.GetGenders());
            ViewBag.Relation = new SelectList(Common.GetRelations());
            ViewBag.BloodGroup = new SelectList(Common.GetBloodGroups());
            return View();
        }

        //
        // POST: /Customer/Create

        [HttpPost]
        public ActionResult Create(Customer customer)
        {            
            customer.CreatedDate = Common.GetCurrentDate();
            customer.UpdatedDate = customer.CreatedDate;
            customer.UpdatedByID = WebMatrix.WebData.WebSecurity.GetUserId(User.Identity.Name);
            if (ModelState.IsValid)
            {
                db.Customers.Add(customer);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.FamilyID = new SelectList(db.Families, "FamilyID", "FamilyName", customer.FamilyID);
            ViewBag.RelationCustomerID = new SelectList(db.Customers, "CustomerID", "FullName");
            ViewBag.Gender = new SelectList(Common.GetGenders(),customer.Gender);
            ViewBag.Relation = new SelectList(Common.GetRelations(), customer.Relation);
            ViewBag.BloodGroup = new SelectList(Common.GetBloodGroups(), customer.BloodGroup);
            return View(customer);
        }

        //
        // GET: /Customer/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            ViewBag.Gender = new SelectList(Common.GetGenders(),customer.Gender);
            ViewBag.Relation = new SelectList(Common.GetRelations(), customer.Relation);
            ViewBag.BloodGroup = new SelectList(Common.GetBloodGroups(), customer.BloodGroup);
            ViewBag.FamilyID = new SelectList(db.Families, "FamilyID", "FamilyName", customer.FamilyID);
            ViewBag.RelationCustomerID = new SelectList(db.Customers, "CustomerID", "FullName");
            return View(customer);
        }

        //
        // POST: /Customer/Edit/5

        [HttpPost]
        public ActionResult Edit(Customer customer)
        {
            customer.UpdatedDate = Common.GetCurrentDate();
            customer.UpdatedByID = WebMatrix.WebData.WebSecurity.GetUserId(User.Identity.Name);
            if (ModelState.IsValid)
            {
                db.Entry(customer).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.FamilyID = new SelectList(db.Families, "FamilyID", "FamilyName", customer.FamilyID);
            ViewBag.RelationCustomerID = new SelectList(db.Customers, "CustomerID", "FullName");
            ViewBag.Gender = new SelectList(Common.GetGenders(),customer.Gender);
            ViewBag.Relation = new SelectList(Common.GetRelations(), customer.Relation);
            ViewBag.BloodGroup = new SelectList(Common.GetBloodGroups(), customer.BloodGroup);
            return View(customer);
        }

        //
        // GET: /Customer/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Customer customer = db.Customers.Find(id);
            if (customer == null)
            {
                return HttpNotFound();
            }
            return View(customer);
        }

        //
        // POST: /Customer/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            Customer customer = db.Customers.Find(id);
            db.Customers.Remove(customer);
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