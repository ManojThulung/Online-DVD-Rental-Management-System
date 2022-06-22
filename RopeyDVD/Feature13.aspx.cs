using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class Feature13 : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                DisplayData(); // Method called to display data in the table.
            }
        }

        protected void DisplayData()
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView1.DataSource = p.DisplayNoLoanDvd();
                GridView1.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                Label1.Text = ex.Message;
            }
        }

        // Method to display data in the table when the button is clicked.
        protected void Button1_Click(object sender, EventArgs e)
        {
            DisplayData();
        }

        // Method to logout from the system.
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