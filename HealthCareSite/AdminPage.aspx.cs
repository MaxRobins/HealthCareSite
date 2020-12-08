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
using HealthCareSite.Models;

namespace HealthCareSite
{
    public partial class AdminPage : System.Web.UI.Page
    {
        String userType = "";
        string webApiUrl = "https://localhost:44342/api/User/";

        protected void Page_Load(object sender, EventArgs e)
        {

            userType = (string)Session["userType"];
            //check to make sure the viewer is an admin
            //if not send them off this page
            if (userType != "Admin")
            {
                Response.Redirect("Login.aspx");
            }

            setupPage();

        }

        public void setupPage()
        {

            //get the dataset for 
            try
            {
                WebRequest request = WebRequest.Create(webApiUrl + "GetAllUsers/");
                WebResponse response = request.GetResponse();


                

                Stream theDataStream = response.GetResponseStream();
                StreamReader reader = new StreamReader(theDataStream);
                String data = reader.ReadToEnd();
                reader.Close();
                response.Close();

                JavaScriptSerializer js = new JavaScriptSerializer();
                List<Account> accounts = js.Deserialize<List<Account>>(data);

                gvAllUsers.DataSource = accounts;
                gvAllUsers.DataBind();
                gvAllUsers.HeaderRow.TableSection = TableRowSection.TableHeader;

            }

            catch (Exception ex)
            {
               // lblDisplay.Text = "Error : " + ex.Message;
            }




            //

        }



    }
}