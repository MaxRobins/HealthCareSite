using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace HealthCareSite
{
    public partial class Login : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();
        string strSQL;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["userName"] = "";
            Session["userType"] = "";
            Session["firstName"] = "";
            Session["lastName"] = "";
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            if(txtUserName.Text == "" || txtPassword.Text == "")
            {
                Response.Write("UserName and Password needed");
                return;
            }
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_GetUser";
            objCommand.Parameters.AddWithValue("@userName", txtUserName.Text);
            objCommand.Parameters.AddWithValue("@password", txtPassword.Text);
            
            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);
            if (myDS.Tables[0].Rows.Count == 0)
            {
                Response.Redirect("register.aspx");
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
        

        protected void Regsiter_Click(object sender, EventArgs e)
            {
                Response.Redirect("Register.aspx");
            }
        }
    }