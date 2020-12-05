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
    public partial class ScheduleAppointment : System.Web.UI.Page
    {
        ArrayList arrOrder = new ArrayList();
        DBConnect objDB = new DBConnect();
        SqlCommand objCommand = new SqlCommand();
        string strSQL;
        String userName = "";
        String userType = "";
        int doctorId;
        int appId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                (this.Master as Master).SetNavBar();
                userName = (string)Session["userName"];
                userType = (string)Session["userType"];
                doctorId = (int)Session["doctorId"];

                ShowAppointments();
            }
        }
        private void ShowAppointments()
        {
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_GetAppointments";
            objCommand.Parameters.AddWithValue("@doctorId", doctorId);
            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);
            gvAppointments.DataSource = myDS;

            String[] names = new string[1];
            names[0] = "Id";
            gvAppointments.DataKeyNames = names;


            gvAppointments.DataBind();
        }

        

        protected void gvAppointments_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void gvAppointments_RowEditing(Object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)

        {
            /*
            Response.Write("roweditingfired");
            gvAppointments.EditIndex = e.NewEditIndex;
            ShowAppointments();*/
        }
        protected void gvAppointments_RowUpdating(Object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            /*int rowIndex = e.RowIndex;
            
            string day = gvAppointments.Rows[e.RowIndex].Cells[0].Text;
            string time = gvAppointments.Rows[e.RowIndex].Cells[1].Text;
            string firstName = ((TextBox)(gvAppointments.Rows[e.RowIndex].Cells[2].Controls[0])).Text;
            string lastName = ((TextBox)(gvAppointments.Rows[e.RowIndex].Cells[3].Controls[0])).Text;
            string doctor = gvAppointments.Rows[e.RowIndex].Cells[4].Text;
            //string id = gvAppointments.Rows[e.RowIndex].Cells[5].Text;
            int id = Convert.ToInt32(gvAppointments.DataKeys[e.RowIndex]["Id"]);

            if (firstName == "" || lastName == "")
            {
                gvAppointments.EditIndex = -1;
            }
            else
            {
                SqlCommand objUpdate = new SqlCommand();
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "updateAppointment";

                objCommand.Parameters.AddWithValue("@day", day);
                objCommand.Parameters.AddWithValue("@time", time);
                objCommand.Parameters.AddWithValue("@firstName", firstName);
                objCommand.Parameters.AddWithValue("@lastName", lastName);
                objCommand.Parameters.AddWithValue("@doctor", doctor);
                objCommand.Parameters.AddWithValue("@id", id);

                DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);
                
                gvAppointments.EditIndex = -1;
                ShowAppointments();
            }*/

        }
        protected void gvAppointments_RowCancelingEdit(Object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)

        {
           /* gvAppointments.EditIndex = -1;
            ShowAppointments();*/
        }

        protected void gvAppointments_SelectedIndexChanged1(object sender, EventArgs e)
        {
                
        }

        protected void gvAppointments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int rowIndex = Convert.ToInt32(e.CommandArgument.ToString());

            if (e.CommandName == "CreateRecord")
            {
                //Save the DoctorID to Session
                int appId = int.Parse(gvAppointments.DataKeys[rowIndex].Value.ToString());
                Session.Add("appId", appId);

                //Go to the Schedule Appointments page
                Response.Redirect("CreateRecord.aspx");
            }
        }
    }
}