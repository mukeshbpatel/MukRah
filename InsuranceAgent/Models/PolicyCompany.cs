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
    
    public partial class PolicyCompany
    {
        public PolicyCompany()
        {
            this.PolicyMasters = new HashSet<PolicyMaster>();
        }
    
        public int CompanyID { get; set; }
        public string Company { get; set; }
        public string Description { get; set; }
        public string UDK1 { get; set; }
        public string UDK2 { get; set; }
        public string UDK3 { get; set; }
        public System.DateTime CreatedDate { get; set; }
        public System.DateTime UpdatedDate { get; set; }
        public int UpdatedByID { get; set; }
    
        public virtual ICollection<PolicyMaster> PolicyMasters { get; set; }
    }
}
