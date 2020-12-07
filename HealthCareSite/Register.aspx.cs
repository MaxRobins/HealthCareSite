using HealthCareSite.Models;
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
using System.Web.Script.Serialization;
using System.IO;
using System.Net;

namespace HealthCareSite
{
    public partial class Register : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();
        string strSQL;
        string webApiUrl = "https://localhost:44342/api/User/";

        
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            
            
            if (txtName.Text == "" || userType.SelectedIndex == -1 || txtPassword.Text == "")
            {
                lblDisplay.Text = "Need to Enter a User Name, Pasword, and user type";
                return;
            }


            if (userType.SelectedValue != "Doctor" && txtDoctorType.Text != "")
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


            //create an object of the accounts class
            Account account = new Account();

            //set the properties of the account with the values entered in the register page
            account.Username = txtName.Text;
            account.FirstName = txtFirstName.Text;
            account.LastName = txtLastName.Text;
            account.UserType = userType.Text;
            account.Email = txtEmail.Text;
            account.Password = txtPassword.Text;
            account.DocorType = txtDoctorType.Text;
            account.OfficeLocation = txtOffice.Text;
            account.PhoneNumber = txtPhoneNumber.Text;

            //
            JavaScriptSerializer js = new JavaScriptSerializer();
            String jsonAccount = js.Serialize(account);

            try
            {
                WebRequest request = WebRequest.Create(webApiUrl + "CreateUser/");
                request.Method = "POST";
                request.ContentLength = jsonAccount.Length;
                request.ContentType = "application/json";

                StreamWriter writer = new StreamWriter(request.GetRequestStream());
                writer.Write(jsonAccount);
                writer.Flush();
                writer.Close();

                WebResponse response = request.GetResponse();
                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();
                reader.Close();
                response.Close();


                if (data == "true")
                {
                    //lblDisplay.Text = "User was added";
                    Response.Redirect("login.aspx");
                }
                else
                {
                    lblDisplay.Text = "The user was not added";
                }

            }

            catch (Exception ex)
            {
                lblDisplay.Text = "Error : " + ex.Message;
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
    }
}