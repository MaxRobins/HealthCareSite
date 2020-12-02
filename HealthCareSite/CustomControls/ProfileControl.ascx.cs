using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HealthCareSite.CustomControls
{
    public partial class ProfileControl : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //
        public void setNameVisibility(bool visiblity)
        {
            pnlName.Visible = visiblity;
        }

        public void setFirstName(string name)
        {
            lblFirstName.Text = name;
        }

        public void setLastName(string name)
        {
            lblLastName.Text = name;
        }
        //
        public void setContactVisibility(bool visibility)
        {
            pnlContact.Visible = visibility;
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
        //
        public void setImageVisibility(bool visibility)
        {
            pnlPicture.Visible = visibility;
        }

        public void setImage(string image)
        {
            imgProfile.ImageUrl = image;
        }


    }
}