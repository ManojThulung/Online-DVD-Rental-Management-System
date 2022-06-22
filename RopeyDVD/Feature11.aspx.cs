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
    public partial class Feature11 : System.Web.UI.Page
    {
        public SqlConnection cn;
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

        // Method to display data in the table.
        protected void Button1_Click(object sender, EventArgs e)
        {
            DisplayData();
        }

        // Method to binds data in the GridView1.
        protected void DisplayData()
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView1.DataSource = p.DisplayLoanDvd();
                lblTotal.Text = "Total Loans: " + (GridView1.DataSource as DataTable).Rows.Count;
                GridView1.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                lblTotal.Text = ex.Message;
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        // Method to sort data by title in the table.
        protected void sortByTitle_Click(object sender, EventArgs e)
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView1.DataSource = p.sortTitle();
                lblTotal.Text = "Total Loans: " + (GridView1.DataSource as DataTable).Rows.Count;
                GridView1.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                lblTotal.Text = ex.Message;
            }

        }

        // Method to sort data by Dateout in the table.
        protected void SortByDateOut_Click(object sender, EventArgs e)
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView1.DataSource = p.sortDate();
                lblTotal.Text = "Total Loans: " + (GridView1.DataSource as DataTable).Rows.Count;
                GridView1.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                lblTotal.Text = ex.Message;
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