using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class StockDvd : System.Web.UI.Page
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
                ListView(); // Method called to display data in the table.
            }
        }

        // Binds all the the stock dvd data to the GridView1
        protected void ListView()
        {
            try
            {
                RopeyCode rc = new RopeyCode();
                GridView1.DataSource = rc.SelectStockDvd();
                GridView1.DataBind();
                rc = null;
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }

        //Remove the stock DVD data from the database.
        protected void btnRemove_Click(object sender, EventArgs e)
        {
            try
            {
                RopeyCode rc = new RopeyCode();
                rc.DeleteStockDvd(); //Method called to Delete Stock DVD

                lblErrorMsg.Text = "Stock DVDs Deleted";
                ListView();
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
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