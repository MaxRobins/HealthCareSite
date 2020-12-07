using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.Serialization.Formatters.Binary;

using System.Web.Script.Serialization;
using System.IO;
using System.Net;
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
        String firstName = "";
        String lastName = "";
        String doctorType = "";
        String officeLocation = "";
        String email = "";
        String phoneNumber = "";
        int userID = 0;
        String strSQL = "";

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                (this.Master as Master).SetNavBar();

                //get the User Name and User Type from the session storage
                userName = (string)Session["userName"];
                userType = (string)Session["userType"];
                firstName = (string)Session["firstName"];
                lastName = (string)Session["lastName"];
                doctorType = (string)Session["DoctorType"];
                officeLocation = (string)Session["OfficeLocation"];
                email = (string)Session["Email"];
                phoneNumber = (string)Session["PhoneNumber"];
                userID = (int)Session["Id"];

                //set the values for the profile
                userControl.setFirstName(firstName);
                userControl.setLastName(lastName);
                userControl.setLocation(officeLocation);
                userControl.setPhone(phoneNumber);
                userControl.setType(doctorType);
                userControl.setEmail(email); 


                //set up the page
                SetupPage();

                userControl.setPhone( "User Id: " + userID.ToString());
             
            }

            if (IsPostBack)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "Call", "pageLoad()", true);
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
                userControl.setFirstName("Doctor Man");

                //use those values to determine which tables to show
                string strSQL = "SELECT ID,FirstName, LastName, Doctor, Day, Time " +
                             "FROM TP_Appointments " +
                            "WHERE Doctor = '" + lastName + "'";
                             

                //perform the sql query and get the dataset
                myDS = objDB.GetDataSet(strSQL);
                //place result into the Gridview
                gvRecords.DataSource = myDS;

                //Save the ID to the datakeys
                //store the Doctor's ID in the data keys collection
                String[] names = new string[1];
                names[0] = "ID";
                gvRecords.DataKeyNames = names;

                gvRecords.DataBind();

                //gvRecords.HeaderRow.TableSection = TableRowSection.TableHeader;

            }

            if (userType == "Patient")
            {

                //if the user is a patient then hide the doctor information
                userControl.setDoctorInfoVisibility(false);
                pnlDoctorTable.Visible = false;
                btnCreateApp.Visible = false;

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

        protected void btnCreateApp_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAppointment.aspx");
        }

        protected void gvRecords_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "Details")
            {
                //Get the values from the selected row and show them in the reord details 
                //Save the appointmentID to Session
                int appointmentID = int.Parse(gvRecords.DataKeys[rowIndex].Value.ToString());
                Session.Add("appointmentID", appointmentID);

                Response.Redirect("ViewAppointment.aspx");
            
            }
        }
        
        /*public void GenerateDetailsTable(int AppId)
        {
            DataSet dsAppList;
            DataTable dtAppointment;
            DataRow drAppRecord;

            String strHTML = "";

            strSQL = "SELECT * FROM TP_Records";
            dsAppList = objDB.GetDataSet(strSQL);


            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_GetAppRecord";
            //objCommand.Parameters.AddWithValue("@id", appId);
            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);

            strHTML = strHTML + "<table>" +
                        "<tr>" +
                        "<td> FirstName </td>" +
                        "<td> LastName <td>" +
                        "<td> DateOfBirth </td>" +
                        "<td> Gender <td>" +
                        "<td> EmailAddress </td>" +
                        "<td> PhoneNumber <td>" +
                        "<td> Symptons </td>" +
                        "<td> LevelOfPain <td>" +
                        "</tr>";
           for(int row = 0; row < dtAppointment.Rows.Count; row++)
            {
                drAppRecord = dtAppointment.Rows[row];

                strHTML = strHTML + "<tr>" + 
                                    "<td>" + drAppRecord["FirstName"] + "</td>" +
            }                       "<td>" + drAppRecord["LastName"] + "</td>" +
                                    "<td>" + drAppRecord["DateOfBirth"] + "</td>" +
                                    "<td>" + drAppRecord["Gender"] + "</td>" +
                                    "<td>" + drAppRecord["EmailAddress"] + "</td>" +
                                    "<td>" + drAppRecord["PhoneNumber"] + "</td>" +
                                    "<td>" + drAppRecord["Symptons"] + "</td>" +
                                    "<td>" + drAppRecord["LevelOfPain"] + "</td>" +
                                    "</td>" + "</tr>";
        }*/
        
    }
}