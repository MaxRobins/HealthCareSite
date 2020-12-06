using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Utilities;
using System.Data;
using System.Data.SqlClient;

namespace HealthCareSite
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        String strSQL = "";
        SqlCommand objCommand = new SqlCommand();
        int appId;
        protected void Page_Load(object sender, EventArgs e)
        {
            appId = (int)Session["appId"];
            ShowAppointment();
        }
        public void ShowAppointment()
        {
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_Confirmation";
            objCommand.Parameters.AddWithValue("@id", appId);
            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);

            rptConfirmation.DataSource = myDS;
            rptConfirmation.DataBind();
        }
    }
}