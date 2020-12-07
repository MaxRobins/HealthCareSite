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
    public partial class AppDetails : System.Web.UI.Page
    {
        DBConnect objDB = new DBConnect();
        String strSQL = "";
        SqlCommand objCommand = new SqlCommand();
        int appId;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void ShowAppointment()
        {
            objCommand = new SqlCommand();
            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_GetAppRecord";
            objCommand.Parameters.AddWithValue("@id", appId);
            DataSet myDS = objDB.GetDataSetUsingCmdObj(objCommand);

            //rptConfirmation.DataSource = myDS;
            //rptConfirmation.DataBind();
        }
    }
}