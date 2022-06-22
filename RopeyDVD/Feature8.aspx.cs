using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
    public partial class NonLoanMember : System.Web.UI.Page
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
                ListView1(); // Method called to display data in the table.
                ListView2();
            }
        }

        //Method to get members who has loan DVD.
        protected void ListView1()
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView1.DataSource = p.SelectMemberWithLoan();
                GridView1.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                lblErrorMsg1.Text = ex.Message;
            }
        }

        //Method to get members who does not have loan.
        protected void ListView2()
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView2.DataSource = p.SelectMemberWithNoLoan();
                GridView2.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                lblErrorMsg2.Text = ex.Message;
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