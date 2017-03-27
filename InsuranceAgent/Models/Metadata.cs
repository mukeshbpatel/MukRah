using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.Xml.Serialization;
using System.Data;

namespace InsuranceAgent.Models
{
    public partial class PolicyTypeMetadata
    {
        [Display(Name = "Policy Type")]
        [StringLength(100)]
        [Required]
        public string PolicyTypeName { get; set; }        
    }
    [MetadataType(typeof(PolicyTypeMetadata))]
    public partial class PolicyType
    {
    }


    public partial class PolicyCompanyMetadata
    {
        [Display(Name = "Insurance Company")]
        [StringLength(100)]
        [Required]
        public string Company { get; set; }
    }
    [MetadataType(typeof(PolicyCompanyMetadata))]
    public partial class PolicyCompany
    {
    }


    public partial class FamilyMetadata
    {
        [Display(Name = "Family Name")]
        [StringLength(100)]
        [Required]
        public string FamilyName { get; set; }
    }
    [MetadataType(typeof(FamilyMetadata))]
    public partial class Family
    {
    }

    public partial class CustomerMeta
    {     
        public int CustomerID { get; set; }
        [StringLength(100)]
        [Required]
        public string FirstName { get; set; }
        public string MiddleName { get; set; }
        [StringLength(100)]
        [Required]        
        public string LastName { get; set; }
        [Display(Name = "Family")]
        public Nullable<int> FamilyID { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}", ApplyFormatInEditMode = true)]
        public System.DateTime DOB { get; set; }
        [EmailAddress(ErrorMessage = "Invalid Email Address")]
        [MaxLength(200)]
        public string Email { get; set; }        
        public string Relation { get; set; }
        [Display(Name = "Relation")]
        public string RelationCustomerID { get; set; }      
    }

    [MetadataType(typeof(CustomerMeta))]
    public partial class Customer
    {
    }

}