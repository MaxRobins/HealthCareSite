﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Utilities;


namespace HealthCareSite
{
    public partial class Homepage : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        DataSet myDS;
        SqlCommand objCommand = new SqlCommand();
        String userName = "";
        String userType = "";


        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                (this.Master as Master).SetNavBar();

                //get the User Name and User Type from the session storage
                userName = (string)Session["userName"];
                userType = (string)Session["userType"];

                 //set up the page
                SetupPage();
                    

                imgProfile.ImageUrl = "Images/defaultImage.png";
            }

            if (IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Call", "pageLoad()", true);
                 //gvRecords.HeaderRow.TableSection = TableRowSection.TableHeader;
                 //gvAllDoctors.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
          

        }

        protected void gvRecords_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void btnAppointment_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateRecord.aspx");
        }

        //method for setting up the page layout based on the user type
        public void SetupPage()
        {
            
            if (userType == "Doctor")
            {
                //hide the table used for patients
                pnlPatientTable.Visible = false;
                pnlCard.Visible = false;
                pnlDetails.Visible = true;

                //use those values to determine which tables to show
                string strSQL = "SELECT ID,FirstName, LastName, Doctor " +
                             "FROM TP_Appointments";

                //perform the sql query and get the dataset
                myDS = objDB.GetDataSet(strSQL);
                //place result into the Gridview
                gvRecords.DataSource = myDS;
                gvRecords.DataBind();

                gvRecords.HeaderRow.TableSection = TableRowSection.TableHeader;

            }

            if (userType == "Patient")
            {
                //if the user is a patient then hide the doctor information
                pnlDoctorInfo.Visible = false;
                pnlDoctorTable.Visible = false;

                //use those values to determine which tables to show
                string strSQL = "SELECT FirstName, LastName, DoctorType, OfficeLocation, Email, PhoneNumber, Id " +
                             "FROM TP_Users " + 
                             "WHERE UserType = 'Doctor'";

                //perform the sql query and get the dataset
                myDS = objDB.GetDataSet(strSQL);
                //place result into the Gridview
                gvAllDoctors.DataSource = myDS;

                //store the Doctor's ID in the data keys collection
                String[] names = new string[1];
                names[0] = "Id";
                gvAllDoctors.DataKeyNames = names;

                gvAllDoctors.DataBind();

                

                gvAllDoctors.HeaderRow.TableSection = TableRowSection.TableHeader;

            }
         
        }

        protected void gvAllDoctors_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "Schedule")
            {
                //Save the DoctorID to Session
                int doctorId = int.Parse(gvAllDoctors.DataKeys[rowIndex].Value.ToString());
                Session.Add("doctorId", doctorId);

                //Go to the Schedule Appointments page
                Response.Redirect("ScheduleAppointment.aspx");
            }
        }

        protected void gvAllDoctors_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //check if the row is the header row
            if (e.Row.RowType == DataControlRowType.Header)
            {
                //add the thead and tbody section programatically
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }
    }
}