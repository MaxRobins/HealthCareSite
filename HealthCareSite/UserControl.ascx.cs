using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthCareSite
{
    public partial class UserControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void setFirstName(string name)
        {
            lblFirstName.Text = name;
        }

        public void setLastName(string name)
        {
            lblLastName.Text = name;
        }

        public void setEmail(string email)
        {
            lblEmail.Text = email;
        }

        public void setPhone(string phone)
        {
            lblPhone.Text = phone;
        }
        //
        public void setDoctorInfoVisibility(bool visibility)
        {
            pnlDoctorInfo.Visible = visibility;
        }

        public void setLocation(string location)
        {
            lblLocation.Text = location;
        }

        public void setType(string type)
        {
            lblType.Text = type;
        }

        public void setImage(string image)
        {
            imgProfile.ImageUrl = image;
        }
    }
}