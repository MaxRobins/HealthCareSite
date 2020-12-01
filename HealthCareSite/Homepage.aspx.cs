using System;
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

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                string strSQL = "SELECT Title, Authors, BasePrice " +
                             "FROM Books";

                //perform the sql query and get the dataset
                myDS = objDB.GetDataSet(strSQL);
                //place result into the Gridview
                gvRecords.DataSource = myDS;
                gvRecords.DataBind();
                gvRecords.HeaderRow.TableSection = TableRowSection.TableHeader;


                imgProfile.ImageUrl = "Images/defaultImage.png";
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
    }
}