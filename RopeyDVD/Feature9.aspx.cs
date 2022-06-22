using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace RopeyDVD
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;

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
                displayDVDTitleDropBoxData(); // Method called to display dropbox data for DVD title form.
                displayCastMemberDropDownData(); // Method called to display dropbox data for Cast Member form.
            }
        }

        // to display dropbox data for DVD title form.
        protected void displayDVDTitleDropBoxData()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();

            string catNum = "Select * From DvdCategory";
            string stuNum = "Select * from Studio";
            string proNum = "Select * from Producer";

            SqlDataAdapter cn = new SqlDataAdapter(catNum, gc.cn);
            SqlDataAdapter sn = new SqlDataAdapter(stuNum, gc.cn);
            SqlDataAdapter pn = new SqlDataAdapter(proNum, gc.cn);

            DataTable cns = new DataTable();
            DataTable sns = new DataTable();
            DataTable pns = new DataTable();

            cn.Fill(cns);
            sn.Fill(sns);
            pn.Fill(pns);

            foreach (DataRow dr in cns.Rows)
            {
                DropDownCatNum.Items.Add(dr["CategoryNumber"].ToString());
            }
            foreach (DataRow dr in sns.Rows)
            {
                DropDownStNum.Items.Add(dr["StudioNumber"].ToString());
            }
            foreach (DataRow dr in pns.Rows)
            {
                DropDownProNum.Items.Add(dr["ProducerNumber"].ToString());
            }
        }

        // to display dropbox data for CastMember form.
        protected void displayCastMemberDropDownData()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();

            string actNum = "Select * From Actor";
            string dvdNum = "Select * from DvdTitle";

            SqlDataAdapter an = new SqlDataAdapter(actNum, gc.cn);
            SqlDataAdapter dn = new SqlDataAdapter(dvdNum, gc.cn);

            DataTable ans = new DataTable();
            DataTable dns = new DataTable();

            an.Fill(ans);
            dn.Fill(dns);

            foreach (DataRow dr in ans.Rows)
            {
                DropDownActNum.Items.Add(dr["ActorNumber"].ToString());
            }
            foreach (DataRow dr in dns.Rows)
            {
                DropDownDvdNum.Items.Add(dr["DvdNumber"].ToString());
            }
        }

        // methods binds all data of Category, Producer, Studio, Actor, Cast member and Dvd Title in grid views.
        protected void ListView()
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridViewCategory.DataSource = p.SeletDvdCategory();
                GridViewProducer.DataSource = p.SelectProducer();
                GridViewStudio.DataSource = p.SelectStudio();
                GridViewActor.DataSource = p.SelectActor();
                GridViewCastmember.DataSource = p.SelectCastMember();
                GridViewDvd.DataSource = p.SelectDVD();

                GridViewCategory.DataBind();
                GridViewProducer.DataBind();
                GridViewStudio.DataBind();
                GridViewActor.DataBind();
                GridViewCastmember.DataBind();
                GridViewDvd.DataBind();

                p = null;
            }
            catch (Exception ex)
            {
                lblErrorMessageCastMem.Text = ex.Message;
            }
        }

        // Function to add Category
        protected void btnAddCat_Click(object sender, EventArgs e)
        {
            try
            {
                RopeyCode p = new RopeyCode();
                string restriction = "";

                if (txtCategoryNum.Text.Trim() != "" && txtCategoryNum.Text.Trim() != "")
                {
                    if (radiobtnTrue.Checked)
                    {
                        restriction = radiobtnTrue.Text;
                    }
                    else
                    {
                        restriction = radiobtnFalse.Text;
                    }

                    p.AddDvdCategory(txtCategoryNum.Text, txtCategoryDes.Text, restriction);

                    lblErrorMsgCategory.Text = "Added Successfully";
                    ListView(); // Method called to display data in the table.

                    txtCategoryNum.Text = "";
                    txtCategoryDes.Text = "";
                    radiobtnTrue.Checked = true;

                }else
                {
                    lblErrorMsgCategory.Text = "Please fill all the Text field";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsgCategory.Text = ex.Message;
            }
        }

        // Method to add Studio to the database.
        protected void btnAddStudio_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtStudioNumber.Text.Trim() != "" && txtStudioName.Text.Trim() != "")
                {
                    RopeyCode p = new RopeyCode();
                    p.AddStudio(txtStudioNumber.Text, txtStudioName.Text); // Function call to add Studio
                    ListView(); // Method called to display data in the table.

                    lblErrorMsgStudio.Text = "Added Successfully";
                    txtStudioName.Text = "";
                    txtStudioNumber.Text = "";
                }
                else
                {
                    lblErrorMsgStudio.Text = "Please fill all the Text field";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsgStudio.Text = ex.Message;
            }
        }

        // Method to add Producer to the database.
        protected void btnAddProducer_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtProducerNum.Text.Trim() != "" && txtProducerName.Text.Trim() != "")
                {
                    RopeyCode p = new RopeyCode();
                    p.AddProducer(txtProducerNum.Text, txtProducerName.Text); // Function call to add Producer
                    ListView(); // Method called to display data in the table.

                    lblErrorMsgProducer.Text = "Added Successfully";
                    txtProducerNum.Text = "";
                    txtProducerName.Text = "";
                }
                else
                {
                    lblErrorMsgProducer.Text = "Please fill all the Text field";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsgProducer.Text = ex.Message;
            }
        }

        //Method to add Actor to the database.
        protected void btnAddActor_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtActNumber.Text.Trim() != "" && txtFirstName.Text.Trim() != "" && txtLastName.Text.Trim() != "")
                {
                    RopeyCode p = new RopeyCode();
                    p.AddActor(txtActNumber.Text, txtFirstName.Text, txtLastName.Text); // Function call to add Actor
                    ListView(); // Method called to display data in the table.

                    lblErrorMsgActor.Text = "Added Successfully";
                    txtActNumber.Text = "";
                    txtFirstName.Text = "";
                    txtLastName.Text = "";
                }
                else
                {
                    lblErrorMsgActor.Text = "Please fill all the Text field";
                }

            }
            catch (Exception ex)
            {
                lblErrorMsgActor.Text = ex.Message;
            }
        }

        // This method add Cast member to the database.
        protected void btnAddCastMem_Click(object sender, EventArgs e)
        {
            try
            {
                RopeyCode p = new RopeyCode();
                p.AddCastMember(DropDownDvdNum.SelectedValue, DropDownActNum.SelectedValue); // Function call to add Cast Member
                ListView(); // Method called to display data in the table.

                lblErrorMessageCastMem.Text = "Added Successfully";
                DropDownDvdNum.SelectedIndex = 0;
                DropDownActNum.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                lblErrorMessageCastMem.Text = ex.Message;
            }
        }

        // Method to add the DVD title data
        protected void btnSubmitDvdTitle_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtDateReleasedDay.Text.Trim() != "" && txtDvdNumber.Text.Trim() != "" && txtDvdTitle.Text.Trim() != "" && txtStandardCharge.Text.Trim() != "" && txtPenaltyCharge.Text.Trim() != "")
                {
                    if (Int32.Parse(txtDateReleasedDay.Text.Trim()) >= 1 && Int32.Parse(txtDateReleasedDay.Text.Trim()) <= 32)
                    {
                        string dateReleased = txtDateReleasedDay.Text + "-" + DropDownReleaseMonth.SelectedValue + "-" + DropDownReleaseYear.SelectedValue;
                        RopeyCode p = new RopeyCode();
                        p.AddDvdTitle(txtDvdNumber.Text.Trim(), DropDownStNum.SelectedValue, DropDownProNum.SelectedValue, txtDvdTitle.Text.Trim(), dateReleased, txtStandardCharge.Text.Trim(), txtPenaltyCharge.Text.Trim(), DropDownCatNum.SelectedValue); // Function call to add Actor
                        ListView(); // Method called to display data in the table.

                        lblErrorMsgDvdTitle.Text = "Added Successfully";
                        DropDownStNum.SelectedIndex = 0;
                        DropDownProNum.SelectedIndex = 0;
                        txtDvdTitle.Text = "";
                        txtDateReleasedDay.Text = "";
                        txtStandardCharge.Text = "";
                        txtPenaltyCharge.Text = "";
                        DropDownCatNum.SelectedIndex = 0;
                    }
                    else
                    {
                        lblErrorMsgDvdTitle.Text = "Released Day must be between 1 to 32";
                    }
                } else
                {
                    lblErrorMsgDvdTitle.Text = "Please fill all the Text field";
                }
            }
            catch (Exception ex)
            {
                lblErrorMsgActor.Text = ex.Message;
            }
        }

        // Method to log out from the system.
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