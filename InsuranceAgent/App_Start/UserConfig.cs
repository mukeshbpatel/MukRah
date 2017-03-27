using System;
using System.Web;
using System.Xml;
using System.Xml.Serialization;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Microsoft.Web.WebPages.OAuth;
using InsuranceAgent.Models;
using System.Web.Security;
using WebMatrix.WebData;

namespace InsuranceAgent
{    
    public static class UserConfig
    {
        public static void CreateRoles()
        {
            if (!Roles.RoleExists("Administrator"))
            {
                Roles.CreateRole("Administrator");
            }
            if (!Roles.RoleExists("SuperUser"))
            {
                Roles.CreateRole("SuperUser");
            }
            if (!Roles.RoleExists("DataEntry"))
            {
                Roles.CreateRole("DataEntry");
            }
            if (!Roles.RoleExists("Customer"))
            {
                Roles.CreateRole("Customer");
            }            
        }

        public static void CreateUsers()
        {

            if (!WebSecurity.UserExists("admin"))
            {
                WebSecurity.CreateUserAndAccount("admin", "admin@123$", new { FirstName = "admin", MiddleName = "", LastName = "", Gender = "Male", DOB = DateTime.Now, Email = "admin@insuranceagents.com", Mobile = "9860002040"});
            }
            if (!Roles.IsUserInRole("admin", "Administrator"))
            {
                Roles.AddUserToRole("admin", "Administrator");
            }
        }        
    }
}
