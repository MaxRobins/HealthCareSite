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
    public partial class DoctorSchedule : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();
        string strSQL;
        String lastName = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_CreateAppointment";

            objCommand.Parameters.AddWithValue("@time", txtTime.Text);
            objCommand.Parameters.AddWithValue("@day", txtDay.Text);
            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);

            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);

            Response.Redirect("Homepage.aspx");

            if (returnValue > 0)
            {
                lblDisplay.Text = "Appointment Was Added";
                //Response.Redirect("restaurant.aspx");
            }
            else
            {
                lblDisplay.Text = "Appointment was not added" + returnValue;
            }
        }
    }
}