using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace RopeyDVD
{
    public class GlobalConnection
    {
        public SqlConnection cn;

        public GlobalConnection() //constructor
        {
            string sqlcon = System.Configuration.ConfigurationManager.AppSettings.Get("MyConnection").ToString();
            cn = new SqlConnection(sqlcon);
            cn.Open();
        }
    }
}