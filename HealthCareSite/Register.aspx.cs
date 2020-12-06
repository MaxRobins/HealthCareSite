using System;
using System.Collections;
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
    public partial class Register : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();
        string strSQL;

        //ArrayList namelist = new ArrayList();
        protected void Page_Load(object sender, EventArgs e)
        {
            /*namelist.Add("terriblewhereas");
            namelist.Add("filtsodalis");
            namelist.Add("pleasurrelamp");
            namelist.Add("munchchamb");
            namelist.Add("anchoredciky");
            namelist.Add("ungold");
            namelist.Add("plairyhummuli");
            namelist.Add("nornirds");
            namelist.Add("elephantmule");
            namelist.Add("knotgymnastics");
            namelist.Add("mayorsordid");
            namelist.Add("comedyEquivalent");
            Random rand = new Random();
            int num = rand.Next(0, 12);

            Response.Write(namelist[num].ToString());*/
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (txtName.Text == "" || userType.SelectedIndex == -1 || txtPassword.Text == "")
            {
                lblDisplay.Text = "Need to Enter a User Name, Pasword, and user type";
                return;
            }
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_InsertUser";//stored procedure

            objCommand.Parameters.AddWithValue("@userName", txtName.Text);
            objCommand.Parameters.AddWithValue("@firstName", txtFirstName.Text);
            objCommand.Parameters.AddWithValue("@lastName", txtLastName.Text);
            objCommand.Parameters.AddWithValue("@userType", userType.Text);
            objCommand.Parameters.AddWithValue("@email", txtEmail.Text);
            objCommand.Parameters.AddWithValue("@userPassword", txtPassword.Text);
            objCommand.Parameters.AddWithValue("@doctorType", txtDoctorType.Text);
            objCommand.Parameters.AddWithValue("@officeLocation", txtOffice.Text);
            objCommand.Parameters.AddWithValue("@phoneNumber", txtPhoneNumber.Text);

            
            if(userType.SelectedValue != "Doctor" && txtDoctorType.Text != "")
            {
                lblDisplay.Text = "Must be a Doctor to have a doctor type";
                return;
            }
            if (userType.SelectedValue != "Doctor" && txtOffice.Text != "")
            {
                lblDisplay.Text = "Must be a Doctor to have a doctor office";
                return;
            }
            if (userType.SelectedValue == "Doctor" && txtDoctorType.Text == "")
            {
                lblDisplay.Text = "Must have a type if you are a doctor";
                return;
            }
            if (userType.SelectedValue == "Doctor" && txtOffice.Text == "")
            {
                lblDisplay.Text = "Must have an office if you are a doctor";
                return;
            }


            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);

            if (returnValue > 0)
            {
                //lblDisplay.Text = "User was added";
                Response.Redirect("login.aspx");
            }
            else
            {
                lblDisplay.Text = "The user was not added";
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}