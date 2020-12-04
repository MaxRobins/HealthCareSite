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
            
            Session["userName"] = myDS.Tables[0].Rows[0]["userName"].ToString();
            Session["userType"] = myDS.Tables[0].Rows[0]["userType"].ToString();
            Response.Redirect("Homepage.aspx");
        }
        

        protected void Regsiter_Click(object sender, EventArgs e)
            {
                Response.Redirect("Register.aspx");
            }
        }
    }