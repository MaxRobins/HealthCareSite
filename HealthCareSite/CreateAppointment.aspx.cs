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
        //string strSQL;
        String doctor = "";
        int doctorId;
        int appId;
        protected void Page_Load(object sender, EventArgs e)
        {
            (this.Master as Master).SetNavBar();
            doctor = (string)Session["Doctor"];
            doctorId = (int)Session["DoctorId"];
            appId = (int)Session["AppId"];
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

            objCommand.Parameters.AddWithValue("@id", appId);
            objCommand.Parameters.AddWithValue("@time", txtTime.Text);
            objCommand.Parameters.AddWithValue("@doctor", doctor);
            objCommand.Parameters.AddWithValue("@day", txtDay.Text);
            objCommand.Parameters.AddWithValue("@doctorId", doctorId);

            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);

            Session["id"] = myDS.Tables[0].Rows[0]["Id"].ToString();
            Session["doctor"] = myDS.Tables[0].Rows[0]["Doctor"].ToString();
            Session["doctorId"] = myDS.Tables[0].Rows[0]["DoctorId"].ToString();


            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);

            //Response.Redirect("Homepage.aspx");

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