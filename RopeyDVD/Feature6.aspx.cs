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
    public partial class MemberInfo : System.Web.UI.Page
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

            if (!Page.IsPostBack)
            {
                ListView(); // Function call to display data in the grid view.
                displayDropBoxData(); // Function call to display data inside dropbox.
                displayAgeRestriction(); // Function call to display age restriction.
                displayMemberAge(); // Function to display Member Age.
                displayLoanDuration(); // Function call to display Loan Type Duration.
                lblDateDue.Text = DateTime.Now.AddDays(Int32.Parse(lblLoanDuration.Text)).ToLongDateString(); // Set Date Due.
                lblTotalCharge.Text = (Int32.Parse(lblChargePerDay.Text) * Int32.Parse(lblLoanDuration.Text)).ToString(); // set total Charge
            }
        }

        // Function to add data in the Data grid view.
        protected void ListView()
        {
            try
            {
                RopeyCode p = new RopeyCode();
                GridView1.DataSource = p.SelectRecords();
                GridView1.DataBind();
                p = null;
            }
            catch (Exception ex)
            {
                errorMessage.Text = ex.Message;
            }
        }

        //function to display data in the drop box of the form.
        protected void displayDropBoxData()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
            string copyNumber = "Select * From DvdCopy";
            string loanTypeNumber = "Select * from LoanType";
            string memberNumber = "Select * from Member";

            SqlDataAdapter cdtd = new SqlDataAdapter(copyNumber, gc.cn);
            SqlDataAdapter ldtd = new SqlDataAdapter(loanTypeNumber, gc.cn);
            SqlDataAdapter mdtd = new SqlDataAdapter(memberNumber, gc.cn);

            DataTable cds = new DataTable();
            DataTable mds = new DataTable();
            DataTable lds = new DataTable();

            cdtd.Fill(cds);
            ldtd.Fill(lds);
            mdtd.Fill(mds);

            foreach (DataRow dr in lds.Rows)
            {
                dropDownLoanNumType.Items.Add(dr["LoanTypeNumber"].ToString());
            }
            foreach (DataRow dr in cds.Rows)
            {
                dropDownCopyNumber.Items.Add(dr["CopyNumber"].ToString());
            }
            foreach (DataRow dr in mds.Rows)
            {
                DropDownMemNum.Items.Add(dr["MemberNumber"].ToString());
            }

            displayStandardCharge();

            //Display Current System date
            lblDateOut.Text = DateTime.Now.ToLongDateString();
            //lblDateDue.Text = DateTime.UtcNow.AddDays(Int32.Parse(lblLoanDuration.Text)).ToLongDateString();
        }

        // Function to display Standard Charge
        protected void displayStandardCharge()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
            string copyCharge = "SELECT DvdCopy.CopyNumber, DvdCopy.DvdNumber, DvdTitle.StandardCharge FROM DvdCopy INNER JOIN DvdTitle ON DvdCopy.DvdNumber = DvdTitle.DvdNumber  WHERE DvdCopy.CopyNumber='" + dropDownCopyNumber.SelectedValue + "'";


            SqlDataAdapter cc = new SqlDataAdapter(copyCharge, gc.cn);
            DataTable csc = new DataTable();

            cc.Fill(csc);
            foreach (DataRow dr in csc.Rows)
            {
                lblChargePerDay.Text = dr[2].ToString();
            }
        }

        // Function to set Due Date 
        protected void displayDueDate(int day)
        {
            lblDateDue.Text = DateTime.Now.AddDays(day).ToLongDateString();
        }

        // Function to display Age Restriction
        protected void displayAgeRestriction()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();

            string ageRestrict = "SELECT DvdCategory.AgeRestricted FROM DvdCopy JOIN DvdTitle ON DvdCopy.DvdNumber = DvdTitle.DvdNumber JOIN DvdCategory ON DvdTitle.CategoryNumber = DvdCategory.categoryNumber WHERE DvdCopy.CopyNumber='" + dropDownCopyNumber.SelectedValue + "'";

            //string ageRestrict = "Select * from DvdCategory";
            SqlDataAdapter ar = new SqlDataAdapter(ageRestrict, gc.cn);
            DataTable car = new DataTable();

            ar.Fill(car);
            foreach (DataRow dr in car.Rows)
            {
                lblAgeRestriction.Text = dr[0].ToString();
            }
        }

        // Function to display Member Age
        protected void displayMemberAge()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
            string memberAge = "SELECT datediff(YY, DOB, getdate()) as age from Member WHERE MemberNumber = '" + DropDownMemNum.SelectedValue + "'";

            SqlDataAdapter ma = new SqlDataAdapter(memberAge, gc.cn);
            DataTable car = new DataTable();

            ma.Fill(car);
            foreach (DataRow dr in car.Rows)
            {
                lblMemberAge.Text = dr[0].ToString();
            }
        }

        // Function to display LoanType Duration
        protected void displayLoanDuration()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
            string loanDuration = "SELECT LoanDuration FROM LoanType WHERE LoanTypeNumber = '" + dropDownLoanNumType.SelectedValue + "'";

            SqlDataAdapter ld = new SqlDataAdapter(loanDuration, gc.cn);
            DataTable dld = new DataTable();

            ld.Fill(dld);
            foreach (DataRow dr in dld.Rows)
            {
                lblLoanDuration.Text = dr[0].ToString();
            }
        }

        protected void btnIssueDvd_Click(object sender, EventArgs e)
        {
            try
            {
                //RopeyCode class object
                RopeyCode rc = new RopeyCode();

                string loanNumber = txtLoanNumber.Text.Trim();
                string loanNumberType = dropDownLoanNumType.SelectedValue;
                string copyNumber = dropDownCopyNumber.SelectedValue;
                string memberNumber = DropDownMemNum.SelectedValue;
                string dateOut = DateTime.UtcNow.ToShortDateString();
                string dateDue = DateTime.UtcNow.AddDays(Int32.Parse(lblLoanDuration.Text)).ToShortDateString();

                if (loanNumber != "")
                {
                    if (Int32.Parse(lblMemberAge.Text) < 18 && lblAgeRestriction.Text == "True")
                    {
                        errorMessage.Text = "Age is Resctricted.";
                    }
                    else
                    {
                        Label2.Text = dateOut;
                        rc.IssueDVDCopy(loanNumber, loanNumberType, copyNumber, memberNumber, dateOut, dateDue);
                        ListView(); // function call to display data in the grid view
                        errorMessage.Text = "Dvd Issued Successfully";
                        txtLoanNumber.Text = "";
                        dropDownLoanNumType.SelectedIndex = 0;
                        dropDownCopyNumber.SelectedIndex = 0;
                        DropDownMemNum.SelectedIndex = 0;
                    }                  
                }
            }
            catch (Exception ex)
            {
                errorMessage.Text = ex.Message;
            }
        }

        protected void GV1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
        }

        protected void GV_SelectedIndexChanged(object sender, EventArgs e)
        {
        }

        protected void dropDownCopyNumber_SelectedIndexChanged(object sender, EventArgs e)
        {
            displayStandardCharge(); // function called to display standard charge
            displayAgeRestriction(); // function called to display age restriction details
            lblTotalCharge.Text = (Int32.Parse(lblChargePerDay.Text) * Int32.Parse(lblLoanDuration.Text)).ToString(); // set total Charge
        }

        protected void DropDownMemNum_SelectedIndexChanged(object sender, EventArgs e)
        {
            displayMemberAge();
        }

        protected void dropDownLoanNumType_SelectedIndexChanged(object sender, EventArgs e)
        {
            displayLoanDuration(); // Function call to display Loan Type Duration.
            lblDateDue.Text = DateTime.UtcNow.AddDays(Int32.Parse(lblLoanDuration.Text)).ToLongDateString(); // Set Date Due.
            lblTotalCharge.Text = (Int32.Parse(lblChargePerDay.Text) * Int32.Parse(lblLoanDuration.Text)).ToString(); // set total Charge
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