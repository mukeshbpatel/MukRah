CREATE TABLE [dbo].[UserDefineKeys] (
    [UDKID]              INT            IDENTITY (1, 1) NOT NULL,
    [TableName]          NVARCHAR (50)  NOT NULL,
    [DisplayName]        NVARCHAR (50)  NOT NULL,
    [ControlType]        NVARCHAR (50)  NOT NULL,
    [DateType]           NVARCHAR (50)  NOT NULL,
    [IsVisible]          BIT            NOT NULL,
    [IsEnable]           BIT            NOT NULL,
    [IsRequired]         BIT            NOT NULL,
    [ValidationFunction] NVARCHAR (100) NULL,
    PRIMARY KEY CLUSTERED ([UDKID] ASC)
);

GO

CREATE TABLE [dbo].[Patients] (
    [PatientID]   NUMERIC (18)  IDENTITY (1, 1) NOT NULL,
    [PatientName] NVARCHAR (50) NULL,
    [Age]         INT           NULL,
    [Address]     NVARCHAR (50) NULL,
    [City]        NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([PatientID] ASC)
);

GO

CREATE TABLE [dbo].[PatientsUDV] (
    [UDVID]      NUMERIC (18)   IDENTITY (1, 1) NOT NULL,
    [PatientID]  NUMERIC (18)   NOT NULL,
    [UDKID]      INT            NOT NULL,
    [FieldValue] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([UDVID] ASC),
    CONSTRAINT [FK_PatientsUDV_ToTable] FOREIGN KEY ([PatientID]) REFERENCES [dbo].[Patients] ([PatientID]),
    CONSTRAINT [FK_PatientsUDV_ToTable_1] FOREIGN KEY ([UDKID]) REFERENCES [dbo].[UserDefineKeys] ([UDKID])
);

GO

CREATE TABLE [dbo].[Doctors] (
    [DoctorID] INT           IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (50) NOT NULL,
    [Degree]   NVARCHAR (50) NULL,
    [DOB]      DATE          NULL,
    PRIMARY KEY CLUSTERED ([DoctorID] ASC)
);

GO

CREATE TABLE [dbo].[DoctorsUDV] (
    [UDVID]      NUMERIC (18)   IDENTITY (1, 1) NOT NULL,
    [DoctorID]   INT            NOT NULL,
    [UDKID]      INT            NOT NULL,
    [FieldValue] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([UDVID] ASC),
    CONSTRAINT [FK_DoctorsUDV_ToTable] FOREIGN KEY ([DoctorID]) REFERENCES [dbo].[Doctors] ([DoctorID]),
    CONSTRAINT [FK_DoctorsUDV_ToTable_1] FOREIGN KEY ([UDKID]) REFERENCES [dbo].[UserDefineKeys] ([UDKID])
);

GO

CREATE PROCEDURE [dbo].[sp_GetTableData]
	@TableName NVARCHAR(50)	
AS
	DECLARE @cols AS NVARCHAR(MAX), @cols1 AS NVARCHAR(MAX), @query  AS NVARCHAR(MAX), @PrimaryKey as nvarchar(100)
	
	
	SELECT @PrimaryKey = COLUMN_NAME
	FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE
	WHERE OBJECTPROPERTY(OBJECT_ID(CONSTRAINT_SCHEMA + '.' + QUOTENAME(CONSTRAINT_NAME)), 'IsPrimaryKey') = 1
	AND TABLE_NAME = @TableName AND TABLE_SCHEMA = 'dbo'

	select @cols = STUFF((SELECT ',' + QUOTENAME(DisplayName) 
                    from UserDefineKeys
                    Where TableName = @TableName
					ORDER BY UDKID                   
            FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'),1,1,'')

	select @cols1 = STUFF((SELECT ', ' + 'Convert('+ [DateType] + ',P.' + QUOTENAME(DisplayName) + ') AS ' + QUOTENAME(DisplayName)
                    from UserDefineKeys
                    Where TableName = @TableName
					ORDER BY UDKID                   
            FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'),1,1,'')

	IF @cols IS NULL OR @cols1 IS NULL
	SET @query = 'SELECT * FROM ' + @TableName 
	ELSE
	SET @query = 'SELECT T.*, ' + @cols1 + ' FROM ' + @TableName + ' AS T
		LEFT OUTER JOIN (
		SELECT Tbl.' + @PrimaryKey + ' AS ID,UDK.TableName,UDK.DisplayName,Tbl.FieldValue
			FROM ' + @TableName + 'UDV as Tbl INNER JOIN UserDefineKeys AS UDK ON Tbl.UDKID = UDK.UDKID AND UDK.TableName = ''' + @TableName + ''' ) AS S
		PIVOT
		(MAX(FieldValue)
		FOR DisplayName IN (' + @cols +')
		) AS P ON T.' + @PrimaryKey + ' = P.ID'

--select @cols1

--select @query

execute(@query)

GO



using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using RadiologyReport;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for UserConfig
/// </summary>
public static class UserConfig
{
    public static void CreateRolesAndUser()
    {
        ApplicationDbContext context = new ApplicationDbContext();
        var roleManager = new RoleManager<IdentityRole>(new RoleStore<IdentityRole>(context));
        var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context));

        if (!roleManager.RoleExists("Administrator"))
        {

            // first we create Admin rool   
            var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
            role.Name = "Administrator";
            roleManager.Create(role);

            //Here we create a Admin super user who will maintain the website                          
            var user = new ApplicationUser();
            user.UserName = "admin";
            user.Email = "admin@radioreport.com";

            string userPWD = "Admin@1234";

            var chkUser = userManager.Create(user, userPWD);

            //Add default User to Role Admin   
            if (chkUser.Succeeded)
            {
                var result1 = userManager.AddToRole(user.Id, "Administrator");
            }
        }

        if (!roleManager.RoleExists("SuperUser"))
        {
            var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
            role.Name = "SuperUser";
            roleManager.Create(role);
        }

        if (!roleManager.RoleExists("Doctor"))
        {
            var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
            role.Name = "Doctor";
            roleManager.Create(role);
        }

        if (!roleManager.RoleExists("Reception"))
        {
            var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
            role.Name = "Reception";
            roleManager.Create(role);
        }

        if (!roleManager.RoleExists("Technician"))
        {
            var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
            role.Name = "Technician";
            roleManager.Create(role);
        }

        if (!roleManager.RoleExists("Accountant"))
        {
            var role = new Microsoft.AspNet.Identity.EntityFramework.IdentityRole();
            role.Name = "Accountant";
            roleManager.Create(role);
        }
    }
}