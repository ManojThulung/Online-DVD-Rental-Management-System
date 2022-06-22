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
    public partial class LoanMember : System.Web.UI.Page
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
                GlobalConnection gc = new GlobalConnection();
                SqlCommand cmd = new SqlCommand();

                string copynumber = "Select * from DvdCopy";

                SqlDataAdapter dtd = new SqlDataAdapter(copynumber, gc.cn);
                DataTable dcdt = new DataTable();
                dtd.Fill(dcdt);
                foreach (DataRow dr in dcdt.Rows)
                {
                    CopyNumber_dropdownlist.Items.Add(dr["CopyNumber"].ToString());
                }
                DisplayDetails5();
            }
        }
        public void DisplayDetails5()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
            string copynumberdata = "Select mb.FirstName, mb.LastName,ln.DateOut, ln.DateDue, ln.DateReturned, dtd.DvdTitle from Member mb join Loan ln on mb.MemberNumber = ln.MemberNumber join DvdCopy dc on ln.CopyNumber = dc.CopyNumber join DvdTitle dtd on dc.DvdNumber = dtd.DvdNumber AND dc.CopyNumber='"+CopyNumber_dropdownlist.SelectedItem.Text+"'";
            SqlDataAdapter dtd = new SqlDataAdapter(copynumberdata, gc.cn);
            DataTable dcdt = new DataTable();

            dtd.Fill(dcdt);
            feature5_details.DataSource = dcdt;
            feature5_details.DataBind();
        }

        protected void CopyNumber_dropdownlist_SelectedIndexChanged(object sender, EventArgs e)
        {
            DisplayDetails5();
        }

        protected void feature5_details_SelectedIndexChanged(object sender, EventArgs e)
        {

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