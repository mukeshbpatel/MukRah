using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data;
using System.Data.Entity;
using System.Globalization;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Xml.Serialization;
using System.Linq;

namespace InsuranceAgent.Models
{
    public class InsuranceAgentContext : DbContext
    {
        public InsuranceAgentContext()
            : base("DefaultConnection")
        {
        }

        public DbSet<UserProfile> UserProfiles { get; set; }
    }

    [Serializable]
    [XmlRoot("EmailSettings"), XmlType("EmailSetting")]
    public class EmailSetting
    {
        public string SMTP { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public int Port { get; set; }
        public Boolean EnableSsl { get; set; }
        public string FromEmail { get; set; }
        public string FromEmailName { get; set; }
        public string BCCEmail { get; set; }
        public string BccEmailName { get; set; }
    }

    public class XMLReader
    {
        /// <summary>   
        /// Return list of products from XML.   
        /// </summary>   
        /// <returns>List of products</returns>   
        public List<EmailSetting> GetListOfMembers()
        {
            string xmlData = HttpContext.Current.Server.MapPath("~/App_Data/EmailSettings.xml");//Path of the xml script   
            DataSet ds = new DataSet();//Using dataset to read xml file   
            ds.ReadXml(xmlData);
            var members = new List<EmailSetting>();
            members = (from rows in ds.Tables[0].AsEnumerable()
                       select new EmailSetting
                       {
                           SMTP = rows[0].ToString(), //Convert row to int   
                           UserName = rows[1].ToString(),
                           Password = rows[2].ToString(),
                           Port = int.Parse(rows[3].ToString()),
                           EnableSsl = Boolean.Parse(rows[4].ToString()),
                           FromEmail = rows[5].ToString(),
                           FromEmailName = rows[6].ToString(),
                           BCCEmail = rows[7].ToString(),
                           BccEmailName = rows[8].ToString()
                       }).ToList();
            return members;
        }
    }

    public static class Common
    {
        public static DateTime GetCurrentDate()
        {
            return DateTime.Now;
        }

        public static string FormatAmount(object Amount)
        {
            if (Amount == null)
                return string.Empty;
            else
                return string.Format(CultureInfo.CreateSpecificCulture("hi-IN"), "{0:#,#}", Amount);
        }

        public static List<string> GetGenders()
        {
            List<string> lst = new List<string>();
            lst.Add("Male");
            lst.Add("Female");
            return lst;
        }

        public static List<string> GetRelations()
        {
            List<string> lst = new List<string>();
            lst.Add("");
            lst.Add("Father");
            lst.Add("Hasband");
            return lst;
        }

        public static List<string> GetBloodGroups()
        {
            List<string> lst = new List<string>();
            lst.Add("");
            lst.Add("A+");
            lst.Add("A-");
            lst.Add("B+");
            lst.Add("B-");
            lst.Add("AB+");
            lst.Add("AB-");
            lst.Add("O+");
            lst.Add("O-");
            return lst;
        }

        public static Boolean SendMail(MailMessage msg)
        {
            Boolean result = false;
            try
            {
                EmailSetting settings = null;
                if (HttpContext.Current.Application["EmailSetting"] == null)
                {
                    settings = (EmailSetting)HttpContext.Current.Application["EmailSetting"];
                }
                else
                {
                    return false;
                }
                SmtpClient client = new SmtpClient();
                client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.EnableSsl = settings.EnableSsl;
                client.Host = settings.SMTP;
                client.Port = settings.Port;
                // setup Smtp authentication
                System.Net.NetworkCredential credentials = new System.Net.NetworkCredential(settings.UserName, settings.Password);
                client.UseDefaultCredentials = false;
                client.Credentials = credentials;

                msg.From = new MailAddress(settings.FromEmail, settings.FromEmailName);
                msg.Bcc.Add(new MailAddress(settings.BCCEmail, settings.BccEmailName));
                msg.IsBodyHtml = true;
                client.Send(msg);
                result = true;
                msg = null;
                client = null;
            }
            catch (Exception ex)
            {
                result = false;
            }
            return result;
        }


    }

}