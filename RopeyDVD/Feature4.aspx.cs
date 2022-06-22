using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class LoanDvd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie ck = Request.Cookies["ACK"]; // Getting data from cookies
            if (ck == null)
            {
                Response.Redirect("Login.aspx"); //loads Login.aspx page
            }

            if (Session["username"] != null)
            {
                lblUserName.Text = Session["username"].ToString(); //Getting username from session.
            }

            if (!Page.IsPostBack)
            {
                try
                {
                    feature4table_method();
                }
                catch(Exception ex)
                {
                    Console.WriteLine(" Error info: "+ ex.Message);
                }
               
            }
        }
        public void feature4table_method()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
            string feature4details = "Select pd.ProducerName, sd.StudioName, ac.FirstName, ac.LastName, dtd.DateReleased, dtd.DvdTitle from Producer pd join DvdTitle dtd on pd.ProducerNumber = dtd.ProducerNumber join Studio sd on dtd.StudioNumber = sd.StudioNumber join CastMember csm on dtd.DvdNumber = csm.DvdNumber join Actor ac on csm.ActorNumber = ac.ActorNumber  order by dtd.DateReleased,ac.LastName DESC";

            SqlDataAdapter dtd = new SqlDataAdapter(feature4details, gc.cn);
            DataTable dcdt = new DataTable();

            dtd.Fill(dcdt);
            Displayfeature4_details.DataSource = dcdt;
            Displayfeature4_details.DataBind();
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            feature4table_method();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            HttpCookie lo = Request.Cookies["ACK"];
            lo.Expires = DateTime.Now.AddMilliseconds(-10);
            Response.Cookies.Add(lo);
            Response.Redirect("Login.aspx");
        }
    }
}