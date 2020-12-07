using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Users_API.Models
{

    public class Account
    {
        private int id;
        private string username;
        private string password;
        private string firstName;
        private string lastName;
        private string userType;
        private string email;
        private string doctorType = "";
        private string officeLocation = "";
        private string phoneNumber;

        //default constructor
        public Account()
        {

        }

        public int ID
        {
            get { return id; }
            set { id = value; }
        }

        public string FirstName
        {
            get { return firstName; }
            set { firstName = value; }
        }

        public string LastName
        {
            get { return lastName; }
            set { lastName = value; }
        }
        public string UserType
        {
            get { return userType; }
            set { userType = value; }
        }

        public string Username
        {
            get { return username; }
            set { username = value; }
        }


        public string Password
        {
            get { return password; }
            set { password = value; }
        }

        public string Email
        {
            get { return email; }
            set { email = value; }
        }
        public string DocorType
        {
            get { return doctorType; }
            set { doctorType = value; }
        }
        public string OfficeLocation
        {
            get { return officeLocation; }
            set { officeLocation = value; }
        }

        public string PhoneNumber
        {
            get { return phoneNumber; }
            set { phoneNumber = value; }
        }
    }

}
