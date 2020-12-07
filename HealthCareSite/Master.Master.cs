using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthCareSite
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        public void SetNavBar()
        {
            string userName = (string)Session["userName"];
            string userType = (string)Session["userType"];

            lblUserType.Text = userType;
            lblUserName.Text = userName;

            if (userType == "Patient")
            {
                btnSetApp.Visible = false;
            }

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void btnSetApp_Click(object sender, EventArgs e)
        {
            Response.Redirect("CreateAppointment.aspx");
        }
    }
}