using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Users_API.Models;
using Utilities;

using System.Data;
using System.Data.SqlClient;


namespace Users_API.Controllers
{
    [Route("api/[controller]")]
    public class UserController : ControllerBase
    {

        [HttpGet]
        [HttpGet("GetAllUsers")]//route: api/User/GetAllUsers
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

        [HttpGet("GetAllDoctors")]//route: api/User/GetAllDoctors
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

        [HttpPost]
        [HttpPost("CreateUser")]//route: api/User/CreateUser
        public bool CreateUser([FromBody]Account account)
        {
            DBConnect objDB = new DBConnect();
            SqlCommand objCommand = new SqlCommand();

            objCommand.CommandType = CommandType.StoredProcedure;
            objCommand.CommandText = "TP_InsertUser";//stored procedure

            objCommand.Parameters.AddWithValue("@userName", account.Username);
            objCommand.Parameters.AddWithValue("@firstName", account.FirstName);
            objCommand.Parameters.AddWithValue("@lastName", account.LastName);
            objCommand.Parameters.AddWithValue("@userType", account.UserType);
            objCommand.Parameters.AddWithValue("@email", account.Email);
            objCommand.Parameters.AddWithValue("@userPassword", account.Password);
            objCommand.Parameters.AddWithValue("@doctorType", account.DocorType);
            objCommand.Parameters.AddWithValue("@officeLocation", account.OfficeLocation);
            objCommand.Parameters.AddWithValue("@phoneNumber", account.PhoneNumber);

            int returnValue = objDB.DoUpdateUsingCmdObj(objCommand);

            if (returnValue > 0)
            {
                return true;
            }

            else
            {
                return false;
            }

        }

    }
}