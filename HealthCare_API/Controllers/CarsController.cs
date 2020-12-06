using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Utilities;
using HealthCare_API.Models;
using System.Data;
using System.Data.SqlClient;

namespace HealthCare_API.Controllers
{

    [Route("api/[controller]")]
    public class CarsController : Controller
    {
        [HttpGet] //route: api/Cars/
        [HttpGet("FindCarByID/{carID}/{dealerID}")]//route: api/Cars/FindCarByID/{carID}/{dealerID}
        public string Get(int carID, int dealerID)
        {

            return "WebAPI Get with carID: " + carID + " Dealer ID: " + dealerID;
        }

        [HttpGet("GetCars")]// route: api/Cars/GetCars
        public string[] GetCars()
        {
            return new string[] { "car1", "car2", "car3" };
        }

        [HttpGet("GetName")]//route: api/Cars/GetName
        public List<User> GetName()
        {
            List<User> userList = new List<User>();

            DBConnect objDB = new DBConnect();           
            SqlCommand objCommand = new SqlCommand();

            string strSQL = "SELECT * " +
                "FROM TP_Users ";

            DataSet myDS = objDB.GetDataSet(strSQL);

            int count = myDS.Tables[0].Rows.Count;

            for (int i = 0; i < count; i++)
            {
                User user = new User();
                user.FirstName = objDB.GetField("FirstName" , i).ToString();

                userList.Add(user);                
            }



            return userList;
        }
            


        [HttpPost]//route: api/Cars
        [HttpPost("PostCar")]//route: api/Cars/PostCar
        public String Post(String make, String model,int year)
        {
            
            return "Post Successful Make: " + make + " Model: " + model + " Year: " + year;
        }

        [HttpPost("RecordCar")]//route: api/Cars/RecordCar
        public Car PostCar([FromBody]Car myCar)
        {
            return myCar;
        }



    }
}