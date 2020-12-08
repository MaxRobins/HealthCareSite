using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Utilities;
using System.Data;
using System.IO;
using System.Text;
using System.Data.SqlClient;

namespace HealthCareSite
{
    public partial class ViewAppointment : System.Web.UI.Page
    {

        DBConnect objDB = new DBConnect();
        DataSet myDS;
        SqlCommand objCommand = new SqlCommand();
        int appointmentID;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            appointmentID = (int)Session["appointmentID"];
            createTable();

        }

        public void createTable()
        {
            
            //
            string strHTML = "";

            

            //use those values to determine which tables to show
            string strSQL = "SELECT * " +
                         "FROM TP_Records " +
                         "WHERE Id = '" + appointmentID + "'";

            //perform the sql query and get the dataset
            myDS = objDB.GetDataSet(strSQL);

            DataTable dataTable = myDS.Tables[0];

            if (dataTable.Rows.Count != 0)
            {
                //create the html table
                strHTML = strHTML + "<table>" +
                            "<tr>" + 
                             "<td>First Name</td>" +
                             "<td>Last Name</td>" +
                             "<td>Address</td>" +
                             "<td>Symptons</td>" +
                             "<td>Phone Number</td>" +
                             "<td>Email Address</td>" +
                             "<td>Description</td>" +
                             "<td>ImagePath</td>" +
                             "</tr>";

                //
                DataRow datarow;
                

                for (int row = 0; row < dataTable.Rows.Count; row++)
                {
                    datarow = dataTable.Rows[row];
                    
                    strHTML = strHTML  +
                           "<tr>" +
                            "<td>" + datarow["FirstName"] + "</td>" +
                            "<td>" + datarow["LastName"] + "</td>" +
                            "<td>" + datarow["Address"] + "</td>" +
                            "<td>" + datarow["Symptons"] + "</td>" +
                            "<td>" + datarow["PhoneNumber"] + "</td>" +
                            "<td>" + datarow["EmailAddress"] + "</td>" +
                            "<td>" + datarow["Description"] + "</td>" +
                            "<td>" + datarow["ImagePath"] + "</td>" +
                            "</tr>";

                }
                strHTML += "</table>";

            }

            divDisplay.InnerHtml = strHTML;
        }



    }
}