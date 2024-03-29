//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace InsuranceAgent.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Customer
    {
        public Customer()
        {
            this.CustomerMedias = new HashSet<CustomerMedia>();
            this.CustomerPolicies = new HashSet<CustomerPolicy>();
        }
    
        public int CustomerID { get; set; }
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        public string LastName { get; set; }
        public Nullable<int> FamilyID { get; set; }
        public string Gender { get; set; }
        public Nullable<System.DateTime> DOB { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string City { get; set; }
        public string HomePhone { get; set; }
        public string PrimaryMobile { get; set; }
        public string SecondaryMobile { get; set; }
        public string Email { get; set; }
        public string Profession { get; set; }
        public string Occupation { get; set; }
        public string Height { get; set; }
        public string Weight { get; set; }
        public string SkinColor { get; set; }
        public string VisibleMark { get; set; }
        public string BloodGroup { get; set; }
        public string Details { get; set; }
        public string Relation { get; set; }
        public Nullable<int> RelationCustomerID { get; set; }
        public string UDK1 { get; set; }
        public string UDK2 { get; set; }
        public string UDK3 { get; set; }
        public string UDK4 { get; set; }
        public string UDK5 { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public int UpdatedByID { get; set; }
    
        public virtual ICollection<CustomerMedia> CustomerMedias { get; set; }
        public virtual ICollection<CustomerPolicy> CustomerPolicies { get; set; }
        public virtual Family Family { get; set; }
    }
}
