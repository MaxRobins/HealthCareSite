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
        String firstName = "";
        String lastName = "";
        int appId;
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.Master as Master).SetNavBar();
            userName = (string)Session["userName"];
            userType = (string)Session["userType"];
            firstName = (string)Session["firstName"];
            lastName = (string)Session["lastName"];
            appId = (int)Session["appId"];
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string SaveLocation = "";

            if (txtFirstName.Text == "" || txtLastName.Text == "" || txtPhoneNumber.Text == "")
            {
                return;
            }
            else
            {
                if ((imgFile.PostedFile != null) && (imgFile.PostedFile.ContentLength > 0))
                {
                    string fn = System.IO.Path.GetFileName(imgFile.PostedFile.FileName);
                    SaveLocation = Server.MapPath("Images") + "\\" + fn;
                    
                        imgFile.PostedFile.SaveAs(SaveLocation);
                        
                }
                
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "TP_CreateRecord";

                objCommand.Parameters.AddWithValue("@firstName", txtFirstName.Text);
                objCommand.Parameters.AddWithValue("@lastName", txtLastName.Text);
                objCommand.Parameters.AddWithValue("@phoneNumber", txtPhoneNumber.Text);
                objCommand.Parameters.AddWithValue("@description", txtDescription.Text);
                objCommand.Parameters.AddWithValue("@address", txtAddress.Text);
                objCommand.Parameters.AddWithValue("@city", txtCity.Text);
                objCommand.Parameters.AddWithValue("@zipCode", txtZipCode.Text);
                objCommand.Parameters.AddWithValue("@emailAddress", txtEmail.Text);
                objCommand.Parameters.AddWithValue("@levelOfPain", ddlPain.SelectedIndex);
                objCommand.Parameters.AddWithValue("@gender", rblGender.SelectedValue);
                objCommand.Parameters.AddWithValue("@dateOfBirth", txtDate.Text);
                objCommand.Parameters.AddWithValue("@imagePath", SaveLocation);

                List<String> values = new List<String>();
                foreach (ListItem item in cblSymptoms.Items)
                {
                    if (item.Selected)
                        values.Add(item.Value);
                }


                objCommand.Parameters.AddWithValue("@symptoms", String.Join("," , values));
                objCommand.Parameters.AddWithValue("@id", appId);
                

                int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);


                objCommand = new SqlCommand();
                objCommand.CommandType = System.Data.CommandType.StoredProcedure;
                objCommand.CommandText = "TP_updateAppointment";

                objCommand.Parameters.AddWithValue("@firstName", firstName);
                objCommand.Parameters.AddWithValue("@lastName", lastName);
                objCommand.Parameters.AddWithValue("@id", appId);

                int returnVal = objDB.DoUpdateUsingCmdObj(objCommand);


                if (returnValue > 0)
                {
                    Response.Redirect("ConfirmationPage.aspx");
                }
                else
                {
                    lblDisplay.Text = "was not added" + returnValue;
                }
            }
            
        }
    }
}