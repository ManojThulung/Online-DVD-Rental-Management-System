using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace RopeyDVD
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // To login to the system.
        protected void Button1_Click(object sender, EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string password = txtPassword.Text.Trim();
            string userEmptyMsg = "The username is empty!!";
            string pwEmptyMsg = "The password is empty!!";

            if (username.Trim() == "" && password.Trim() == "")
            {
                lblUsername.Text = userEmptyMsg;
                lblPassword.Text = pwEmptyMsg;
            }
            else if (username == "" || password == "")
            {
                if (username == "")
                if (username == "")
                {
                    lblUsername.Text = userEmptyMsg;
                    lblPassword.Text = "";
                }
                else
                {
                    lblUsername.Text = "";
                    lblPassword.Text = pwEmptyMsg;
                }
            }
            else
            {
                lblUsername.Text = "";
                lblPassword.Text = "";

                if (DropDownUserType.SelectedIndex == 0) // If the users is Assistant
                {
                    try
                    {
                        RopeyCode uc = new RopeyCode();
                        //method called to check users username and password in the database.
                        DataTable datatable = uc.CheckAssistant(username, password);
                        if (datatable.Rows.Count > 0)
                        {
                            string username2 = datatable.Rows[0]["UserName"].ToString();
                            string password2 = datatable.Rows[0]["UserPassword"].ToString();

                            if (username2.Equals(txtUserName.Text) && password2.Equals(txtPassword.Text))
                            {
                                if (cbRememberMe.Checked)
                                {
                                    HttpCookie ack = new HttpCookie("ACK"); //Cookies used to store data.
                                    ack["username"] = txtUserName.Text;
                                    ack["password"] = txtPassword.Text;
                                    ack["usertype"] = "Assistant";
                                    ack.Expires = DateTime.Now.AddSeconds(600);
                                    Response.Cookies.Add(ack);
                                }

                                // data stored in session
                                Session["username"] = username2;
                                Session["usertype"] = DropDownUserType.SelectedValue;

                                Response.Redirect("Feature3.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Username and Password do not match');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Username and Password do not match');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblErrorMsg.Text = ex.Message;
                    }
                }
                else // If the user is manager.
                {
                    try
                    {
                        lblErrorMsg.Text = password;

                        RopeyCode mg = new RopeyCode();
                        DataTable dt = mg.CheckManager(username, password);
                        if (dt.Rows.Count > 0)
                        {
                            string username2 = dt.Rows[0]["UserName"].ToString();
                            string password2 = dt.Rows[0]["UserPassword"].ToString();

                            if (username2.Equals(txtUserName.Text) && password2.Equals(txtPassword.Text))
                            {
                                if (cbRememberMe.Checked)
                                {
                                    // data stored in the Cookie.
                                    HttpCookie ack = new HttpCookie("ACK");
                                    ack["username"] = txtUserName.Text;
                                    ack["password"] = txtPassword.Text;
                                    ack.Expires = DateTime.Now.AddSeconds(600);
                                    Response.Cookies.Add(ack);
                                }

                                // data stored in the Session.
                                Session["username"] = username2;
                                Session["usertype"] = DropDownUserType.SelectedValue;
                                Response.Redirect("Feature3.aspx");
                            }
                            else
                            {
                                Response.Write("<script>alert('Username');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Username and Password do not match');</script>");
                        }
                    }
                    catch (Exception ex)
                    {
                        lblErrorMsg.Text = ex.Message;
                    }
                }
            }
        }
        protected void txtUserName_TextChanged(object sender, EventArgs e)
        {
            lblUsername.Text = "";
        }
        protected void txtPassword_TextChanged(object sender, EventArgs e)
        {
            lblPassword.Text = "";
        }
    }
}