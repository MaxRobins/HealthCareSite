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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            /*if (txtFirstName.Text == "")
            {
                lblDisplay.Text = "empty name";
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

                int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);
                if(returnValue > 0)
                {
                    lblDisplay.Text = "record was created";
                }
                else
                {
                    btnSubmit.Visible = false;
                    lblDisplay.Text = "record was not created";
                }
            }
            //Response.Redirect("ScheduleAppointment.aspx");*/
            lblDisplay.Text = "sdlsdm";
            Response.Write("dskpksmdksm");
        }
    }
}