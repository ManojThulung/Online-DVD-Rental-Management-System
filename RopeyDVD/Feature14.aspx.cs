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
    public partial class Feature14 : System.Web.UI.Page
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
            else
            {
                Response.Write("<script>alert('User Not Logged In');</script>");
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                ListView(); // Method called to display data in the table.
            }
        }

        protected void ListView()
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView1.DataSource = p.SelectUser();
                GridView1.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
        }


        protected void GV1_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();

            string index = Convert.ToString(e.CommandArgument);
            string strData = "SELECT * FROM Users WHERE UserNumber='" + index + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "prodcut_details1");
            DataTable dt = ds.Tables[0];
            TextBox1.Text = dt.Rows[0]["UserNumber"].ToString();
            TextBox2.Text = dt.Rows[0]["UserName"].ToString();
            TextBox3.Text = dt.Rows[0]["UserType"].ToString();
            TextBox4.Text = dt.Rows[0]["UserPassword"].ToString();
        }

        // method to add users
        protected void Button1_Click(object sender, EventArgs e)
        {
            
            try
            {
                if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "" && TextBox3.Text.Trim() != "" && TextBox4.Text.Trim() != "")
                {
                    RopeyCode p = new RopeyCode();

                    p.AddUser(TextBox2.Text, TextBox3.Text, TextBox4.Text);
                    ListView(); // Method called to display data in the table.

                    Label5.Text = "Successfully Added";
                }
                else
                {
                    Label5.Text = "Please fill all the text fileds.";
                }
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
        }

        // method to update users details
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "" && TextBox3.Text.Trim() != "" && TextBox4.Text.Trim() != "")
                {
                    RopeyCode p = new RopeyCode();
                    //Method called to update the user data
                    p.UpdateUser(TextBox1.Text, TextBox2.Text, TextBox3.Text, TextBox4.Text);
                    Label5.Text = "User Updated";
                    ListView();
                    TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox4.Text = "";
                 }
                else
                {
                    Label5.Text = "Please fill all the text fileds.";
                }
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
        }

        // method to delete users 
        protected void Button3_Click(object sender, EventArgs e)
        {
            try
            {
                if (TextBox1.Text.Trim() != "" && TextBox2.Text.Trim() != "" && TextBox3.Text.Trim() != "" && TextBox4.Text.Trim() != "")
                {
                    RopeyCode p = new RopeyCode();
                    p.DeleteUser(TextBox1.Text);
                    Label5.Text = "user Deleted";
                    TextBox1.Text = TextBox2.Text = "";
                    ListView();
                }
                else
                {
                    Label5.Text = "Please Select the Data";
                }
            }
            catch (Exception ex)
            {
                Label5.Text = ex.Message;
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {

        }

        //method to logout.
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            HttpCookie lo = Request.Cookies["ACK"];
            lo.Expires = DateTime.Now.AddMilliseconds(-10);
            Response.Cookies.Add(lo);
            Response.Redirect("Login.aspx");
        }

        // function to change the password
        protected void btnChangePsword_Click1(object sender, EventArgs e)
        {
            if (txtNewPsword.Text.Trim() != "" && txtOldPsword.Text.Trim() != "" && txtConfirmPsword.Text.Trim() != "")
            {
                if (txtNewPsword.Text == txtConfirmPsword.Text)
                {
                    try
                    {
                        RopeyCode rc = new RopeyCode();
                        rc.ChangePassword(Session["username"].ToString(), txtNewPsword.Text);
                        lblChangePwMsg.Text = "Password Successfully Changed";
                    }
                    catch (Exception ex)
                    {
                        lblChangePwMsg.Text = ex.Message;
                    }
                }
                else
                {
                    lblChangePwMsg.Text = "Password Do not Matched.";
                }
            }
            else
            {
                lblChangePwMsg.Text = "Please fill all the text fields.";
            }
        }
    }
}