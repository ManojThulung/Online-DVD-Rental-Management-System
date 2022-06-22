using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


namespace RopeyDVD
{
    public partial class DvdInfo : System.Web.UI.Page
    {
       

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {      
                GlobalConnection gc = new GlobalConnection();
                SqlCommand cmd = new SqlCommand();

                string actorSurname = "Select * from Actor";

                SqlDataAdapter dtd = new SqlDataAdapter(actorSurname, gc.cn);
                DataTable dcdt = new DataTable();
                dtd.Fill(dcdt);
                foreach (DataRow dr in dcdt.Rows)
                {
                    actor_surname_list.Items.Add(dr["LastName"].ToString());
                    actor_surname_list2.Items.Add(dr["LastName"].ToString());
                }
                DisplayDvdTitles();
                DisplayDvdTitles2();
            }
        }

        public void DisplayDvdTitles()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
            string actorData = "Select DvdTitle.DvdTitle from DvdTitle join CastMember on DvdTitle.DvdNumber = CastMember.DvdNumber join Actor on Actor.ActorNumber = CastMember.ActorNumber Where Actor.LastName ='" + actor_surname_list.SelectedItem.Text + "'";
                
            SqlDataAdapter dtd = new SqlDataAdapter(actorData, gc.cn);
            DataTable dcdt = new DataTable();

            dtd.Fill(dcdt);
            Dvd_title_actor.DataSource = dcdt;
            Dvd_title_actor.DataBind();
        }

        public void DisplayDvdTitles2()
        {
            GlobalConnection gc = new GlobalConnection();
            SqlCommand cmd = new SqlCommand();
             string actorData = "Select at.LastName, dt.DvDTitle, dc.CopyNumber, lt.DateReturned From Actor at JOIN CastMember ct ON at.ActorNumber = ct.ActorNumber JOIN DvDTitle dt ON ct.DvDNumber = dt.DvDNumber JOIN DvDCopy dc ON dt.DvDNumber = dc.DvDNumber RIGHT JOIN Loan lt ON dc.CopyNumber = lt.CopyNumber Where lt.DateReturned is not Null AND at.LastName ='" + actor_surname_list2.SelectedItem.Text + "'";
           
            SqlDataAdapter dtd = new SqlDataAdapter(actorData, gc.cn);
            DataTable dcdt = new DataTable();

            dtd.Fill(dcdt);

            actor_movie_notloaned.DataSource = dcdt;
            actor_movie_notloaned.DataBind();
        }

        protected void actor_surname_list_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Using this method, the surname for the first feature will be displayed.
            DisplayDvdTitles();             
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            // the surname of actors for the second feature will be displayed
            DisplayDvdTitles2();

        }

        protected void Dvd_title_actor_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void actor_movie_notloaned_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            HttpCookie lo = Request.Cookies["ACK"];
            lo.Expires = DateTime.Now.AddMilliseconds(-10);
            Response.Cookies.Add(lo);
        }
    }
}