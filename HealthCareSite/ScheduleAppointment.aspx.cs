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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //ShowAppointments();
            }
        }
        private void ShowAppointments()
        {
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAppointments";
            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);
            gvAppointments.DataSource = myDS;
            gvAppointments.DataBind();
        }

        protected void ddlDoctor_SelectedIndexChanged(object sender, EventArgs e)
        {
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "GetAppointments";
            objCommand.Parameters.AddWithValue("@doctor", ddlDoctor.SelectedItem.Text);
            
            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);
            gvAppointments.DataSource = myDS;
            gvAppointments.DataBind();
                
        }

        protected void gvAppointments_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void gvAppointments_RowEditing(Object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)

        {
            gvAppointments.EditIndex = e.NewEditIndex;
        }
        protected void gvAppointments_RowUpdating(Object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int rowIndex = e.RowIndex;

            TextBox day = (TextBox)gvAppointments.Rows[e.RowIndex].Cells[0].FindControl("Day");
            TextBox time = (TextBox)gvAppointments.Rows[e.RowIndex].Cells[1].FindControl("Time");
            TextBox firstName = (TextBox)gvAppointments.Rows[e.RowIndex].Cells[2].FindControl("FirstName");
            TextBox lastName = (TextBox)gvAppointments.Rows[e.RowIndex].Cells[3].FindControl("LastName");
            TextBox doctor = (TextBox)gvAppointments.Rows[e.RowIndex].Cells[4].FindControl("Doctor");

            if (firstName.Text != "" || lastName.Text != "")
            {
                gvAppointments.EditIndex = -1;
            }
            else
            {
                SqlCommand objUpdate = new SqlCommand();
                objCommand.CommandType = CommandType.StoredProcedure;
                objCommand.CommandText = "InsertAppointment";

                objCommand.Parameters.AddWithValue("@day", day.Text);
                objCommand.Parameters.AddWithValue("@time", time.Text);
                objCommand.Parameters.AddWithValue("@fName", firstName.Text);
                objCommand.Parameters.AddWithValue("@lName", lastName.Text);
                objCommand.Parameters.AddWithValue("@doctor", doctor.Text);

                DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);
                gvAppointments.DataSource = myDS;
                gvAppointments.DataBind();

                gvAppointments.EditIndex = -1;

            }

        }
        protected void gvAppointments_RowCancelingEdit(Object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)

        {
            gvAppointments.EditIndex = -1;
        }
    }
}