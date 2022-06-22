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
    public partial class NonLoanDvd : System.Web.UI.Page
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
                lblDateReturn.Text = DateTime.Now.ToLongDateString(); // Set current date.
            }
        }

        protected void ListView()
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView1.DataSource = p.selectOnlyLoan();
                GridView1.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                lblErrorMsg.Text = ex.Message;
            }
        }

        //Function to get Penalty charge
        protected void displayPenaltyCharge()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
            string penaltyCharge = "SELECT DvdTitle.PenaltyChargePerDay FROM Loan JOIN DvdCopy ON Loan.CopyNumber = DvdCopy.CopyNumber " 
                + "JOIN DvdTitle ON DvdCopy.DvdNumber = DvdTitle.DvdNumber where Loan.LoanNumber='" + txtLoanNum.Text + "'";

            SqlDataAdapter pc = new SqlDataAdapter(penaltyCharge, gc.cn);
            DataTable csc = new DataTable();

            pc.Fill(csc);
            foreach (DataRow dr in csc.Rows)
            {
                lblPenaltyCharge.Text = dr[0].ToString();
            }
        }

        // Method to display selected grid view data to the form.
        protected void GV1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();

            string index = Convert.ToString(e.CommandArgument);
            string strData = "SELECT * FROM Loan WHERE LoanNumber='" + index + "'";
            SqlDataAdapter da = new SqlDataAdapter(strData, gc.cn);
            DataSet ds = new DataSet();
            da.Fill(ds, "prodcut_details1");
            DataTable dt = ds.Tables[0];

            txtLoanNum.Text = dt.Rows[0]["LoanNumber"].ToString();
            txtDateDue.Text = dt.Rows[0]["DateDue"].ToString();

            displayPenaltyCharge(); // Function called to display Penalty charge.

            var dueDate = DateTime.Parse(dt.Rows[0]["DateDue"].ToString());
            var returnDate = DateTime.Now;
            var diffDate = returnDate - dueDate;

            if (Int32.Parse(diffDate.Days.ToString()) > 0)
            {
                lblDurationDate.Text = (diffDate.Days).ToString(); // display date duration.
                lblTotalCharge.Text = (Int32.Parse(lblPenaltyCharge.Text) * Int32.Parse(lblDurationDate.Text)).ToString(); // set total charge
            }
            else
            {
                lblPenaltyCharge.Text = "0";
                lblTotalCharge.Text = "0";
                lblDurationDate.Text = "0";
            }
        }

        // Method to submit the form.
        protected void Button2_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtLoanNum.Text == "")
                {
                    lblLoanNum.Text = "Loan Number is not Selected";
                }
                else
                {                 
                    RopeyCode p = new RopeyCode();

                    //Method called to add date return in the loan table.
                    p.UpdateLoanReturnedDate(txtLoanNum.Text, DateTime.Now.ToShortDateString()); 
                    lblErrorMsg.Text = "loan Updated";
                    ListView();

                    lblPenaltyCharge.Text = "0";
                    lblTotalCharge.Text = "0";
                    lblDurationDate.Text = "0";
                    txtDateDue.Text = "";
                    txtLoanNum.Text = "";
                }
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