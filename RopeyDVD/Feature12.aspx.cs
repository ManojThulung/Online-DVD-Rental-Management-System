using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RopeyDVD
{
	public partial class Feature12 : System.Web.UI.Page
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

		//Method to binds all the members data 
		protected void ListView()
		{
			try
			{
				RopeyCode p = new RopeyCode(); // Object created.
				GridViewM.DataSource = p.SelectMemberNotBorrow();
				GridViewM.DataBind();
				p = null;
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