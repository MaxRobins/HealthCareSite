using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;
using System.Net;
using Utilities;
using System.Data.SqlClient;

namespace HealthCareSite
{
    public partial class LoginControl : System.Web.UI.UserControl
    {
        DBConnect objDB = new DBConnect();
        DataSet myDS;
        SqlCommand objCommand = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public void Login(string userName, string password)
        {
            if (txtUsername.Text == "" || txtPassword.Text == "")
            {
                Response.Write("UserName and Password needed");
                return;
            }
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_GetUser";
            objCommand.Parameters.AddWithValue("@userName", txtUsername.Text);
            objCommand.Parameters.AddWithValue("@password", txtPassword.Text);

            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);
            if (myDS.Tables[0].Rows.Count == 0)
            {
                lblError.Text = "Incorrect Username/Password. Try again";
                lblError.Visible = true;
                return;
            }

            Session["userName"] = myDS.Tables[0].Rows[0]["Username"].ToString();
            Session["userType"] = myDS.Tables[0].Rows[0]["UserType"].ToString();
            Session["firstName"] = myDS.Tables[0].Rows[0]["FirstName"].ToString();
            Session["lastName"] = myDS.Tables[0].Rows[0]["LastName"].ToString();
            Session["DoctorType"] = myDS.Tables[0].Rows[0]["DoctorType"].ToString();
            Session["OfficeLocation"] = myDS.Tables[0].Rows[0]["OfficeLocation"].ToString();
            Session["Email"] = myDS.Tables[0].Rows[0]["Email"].ToString();
            Session["PhoneNumber"] = myDS.Tables[0].Rows[0]["PhoneNumber"].ToString();
            Session["Id"] = int.Parse(myDS.Tables[0].Rows[0]["Id"].ToString());
            Response.Redirect("Homepage.aspx");
        }

        public void Register()
        {
            Response.Redirect("Register.aspx");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Register();


        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Login(txtUsername.Text, txtPassword.Text);


        }
    }
}