using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

using Utilities;

using Users_API.Models;
using System.Data;
using System.Data.SqlClient;

namespace Users_API.Controllers
{
    [Route("api/[controller]")]
    public class UserController : Controller
    {
        [HttpGet]
        [HttpGet("GetAllUsers")]//route: api/Users/GetAllUsers
        public List<Account> GetAllUsers()
        {
            List<Account> userList = new List<Account>();

            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            string strSQL = "SELECT * " +
                "FROM TP_Users ";

            DataSet myDS = objDB.GetDataSet(strSQL);

            int count = myDS.Tables[0].Rows.Count;

            for (int i = 0; i < count; i++)
            {
                Account user = new Account();
                user.FirstName = objDB.GetField("FirstName", i).ToString();
                user.LastName = objDB.GetField("LastName", i).ToString();
                user.ID = int.Parse(objDB.GetField("Id", i).ToString());
                user.UserType = objDB.GetField("UserType", i).ToString();
                user.Email = objDB.GetField("Email", i).ToString();
                user.DocorType = objDB.GetField("DoctorType", i).ToString();
                user.OfficeLocation = objDB.GetField("OfficeLocation", i).ToString();
                user.PhoneNumber = objDB.GetField("PhoneNumber", i).ToString();

                userList.Add(user);
            }



            return userList;
        }

        [HttpGet("GetAllDoctors")]//route: api/Users/GetAllDoctors
        public List<Account> GetAllDoctors()
        {
            List<Account> userList = new List<Account>();

            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            string strSQL = "SELECT * " +
                "FROM TP_Users WHERE UserType = 'Doctor'";

            DataSet myDS = objDB.GetDataSet(strSQL);

            int count = myDS.Tables[0].Rows.Count;

            for (int i = 0; i < count; i++)
            {
                Account user = new Account();
                user.FirstName = objDB.GetField("FirstName", i).ToString();
                user.LastName = objDB.GetField("LastName", i).ToString();
                user.ID = int.Parse(objDB.GetField("Id", i).ToString());
                user.UserType = objDB.GetField("UserType", i).ToString();
                user.Email = objDB.GetField("Email", i).ToString();
                user.DocorType = objDB.GetField("DoctorType", i).ToString();
                user.OfficeLocation = objDB.GetField("OfficeLocation", i).ToString();
                user.PhoneNumber = objDB.GetField("PhoneNumber", i).ToString();

                userList.Add(user);
            }

            return userList;
        }


    }
}