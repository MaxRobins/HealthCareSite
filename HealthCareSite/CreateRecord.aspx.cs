using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;

namespace HealthCareSite
{
    public partial class CreateRecord : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();
        string strSQL;
        String userName = "";
        String userType = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.Master as Master).SetNavBar();
            userName = (string)Session["userName"];
            userType = (string)Session["userType"];
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtFirstName.Text == "" || txtLastName.Text == "" || txtPhoneNumber.Text == "")
            {
                return;
            }
            else
            {
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "CreateRecord";

                objCommand.Parameters.AddWithValue("@firstName", txtFirstName.Text);
                objCommand.Parameters.AddWithValue("@lastName", txtLastName.Text);
                objCommand.Parameters.AddWithValue("@phoneNumber", txtPhoneNumber.Text);
                objCommand.Parameters.AddWithValue("@description", txtDescription.Text);
                objCommand.Parameters.AddWithValue("@address", txtAddress.Text);
                objCommand.Parameters.AddWithValue("@city", txtCity.Text);
                objCommand.Parameters.AddWithValue("@zipCode", txtZipCode.Text);
                objCommand.Parameters.AddWithValue("@emailAddress", txtEmail.Text);
                objCommand.Parameters.AddWithValue("@levelOfPain", ddlPain.SelectedIndex); //= ddlPain.SelectedValue;
                objCommand.Parameters.AddWithValue("@gender", rblGender.SelectedValue);
                objCommand.Parameters.AddWithValue("@dateOfBirth", txtDate.Text);
                objCommand.Parameters.AddWithValue("@symptoms", cblSymptoms.SelectedValue);

                int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
                
                if (returnValue > 0)
                {
                    Response.Redirect("ScheduleAppointment.aspx");
                }
                else
                {
                    lblDisplay.Text = "was not added" + returnValue;
                }
            }

            

        }
    }
}