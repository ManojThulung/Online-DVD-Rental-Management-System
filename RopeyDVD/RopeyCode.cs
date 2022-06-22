using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace RopeyDVD
{
    public class RopeyCode
    {
        // object of GlobalConnection
        GlobalConnection gc = new GlobalConnection();

        // Check Assistant Username and password 
        public DataTable CheckAssistant(string username, string password)
        {
            string sqlQuery = "SELECT * FROM Users WHERE UserType='Assistant' AND UserName = '" + username + "' AND UserPassword = '" + password + "'";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlQuery, gc.cn);
            DataSet dataSet = new DataSet();
            sqlDataAdapter.Fill(dataSet);
            return dataSet.Tables[0];
        }

        // Check Manager Username and password
        public DataTable CheckManager(string username, string password)
        {
            string sqlQuery = "SELECT * FROM Users WHERE UserType='Manager' AND UserName = '" + username + "' and UserPassword = '" + password + "'";
            SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlQuery, gc.cn);
            DataSet dataSet = new DataSet();
            sqlDataAdapter.Fill(dataSet);
            return dataSet.Tables[0];
        }

        // Add Loan in the Loan Table
        public void IssueDVDCopy(string loanNumber, string loanNumberType, string copyNumber, string memberNumber, string dateOut, string dateDue)
        {
            SqlCommand cmd = new SqlCommand("Insert into Loan(LoanNumber,LoanTypeNumber,CopyNumber,MemberNumber,DateOut,DateDue)values (@loanNum,@loanNumType,@copyNum,@memNum,@dateOut,@dateDue)", gc.cn);
            cmd.Parameters.AddWithValue("@loanNum", loanNumber);
            cmd.Parameters.AddWithValue("@loanNumType", loanNumberType);
            cmd.Parameters.AddWithValue("@copyNum", copyNumber);
            cmd.Parameters.AddWithValue("@memNum", memberNumber);
            cmd.Parameters.AddWithValue("@dateOut", dateOut);
            cmd.Parameters.AddWithValue("@dateDue", dateDue);

            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Add DVD Title
        public void AddDvdTitle(string dvdNum, string studioNum, string prodNum, string dvdTitle, string dateReleased, string standardCharge, string penaltyCharge, string categoryNum)
        {
            SqlCommand cmd = new SqlCommand("Insert into DvdTitle(DvdNumber,StudioNumber,ProducerNumber,DvdTitle,DateReleased,StandardCharge,PenaltyChargePerDay,categoryNumber)values "+
                "(@dvdNum,@studioNum,@prodNum,@dvdTitle,@dateReleased,@standardCharge,@penaltyCharge,@categoryNum)", gc.cn);
            cmd.Parameters.AddWithValue("@dvdNum", dvdNum);
            cmd.Parameters.AddWithValue("@studioNum", studioNum);
            cmd.Parameters.AddWithValue("@prodNum", prodNum);
            cmd.Parameters.AddWithValue("@dvdTitle", dvdTitle);
            cmd.Parameters.AddWithValue("@dateReleased", dateReleased);
            cmd.Parameters.AddWithValue("@standardCharge", standardCharge);
            cmd.Parameters.AddWithValue("@penaltyCharge", penaltyCharge);
            cmd.Parameters.AddWithValue("@categoryNum", categoryNum);

            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Add DVD Category
        public void AddDvdCategory(string catNum, string catDesc, string ageRes)
        {
            SqlCommand cmd = new SqlCommand("Insert into DvdCategory(CategoryNumber,CategoryDescription,AgeRestricted) values (@catNum,@catDesc,@ageRes)", gc.cn);
            cmd.Parameters.AddWithValue("@catNum", catNum);
            cmd.Parameters.AddWithValue("@catDesc", catDesc);
            cmd.Parameters.AddWithValue("@ageRes", ageRes);

            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Add Studio
        public void AddStudio(string stuNum, string stuName)
        {
            SqlCommand cmd = new SqlCommand("Insert into Studio(StudioNumber,StudioName) values (@stuNum,@stuName)", gc.cn);
            cmd.Parameters.AddWithValue("@stuNum", stuNum);
            cmd.Parameters.AddWithValue("@stuName", stuName);

            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Add producer
        public void AddProducer(string proNum, string proName)
        {
            SqlCommand cmd = new SqlCommand("Insert into Producer(ProducerNumber,ProducerName) values (@proNum,@proName)", gc.cn);
            cmd.Parameters.AddWithValue("@proNum", proNum);
            cmd.Parameters.AddWithValue("@proName", proName);

            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Add Actor
        public void AddActor(string actNum, string firstname, string lastName)
        {
            SqlCommand cmd = new SqlCommand("Insert into Actor(ActorNumber,FirstName,LastName) values (@actNum,@firstname,@lastName)", gc.cn);
            cmd.Parameters.AddWithValue("@actNum", actNum);
            cmd.Parameters.AddWithValue("@firstname", firstname);
            cmd.Parameters.AddWithValue("@lastName", lastName);

            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Add CastMember
        public void AddCastMember(string dvdNum, string actNum)
        {
            SqlCommand cmd = new SqlCommand("Insert into CastMember(DvdNumber,ActorNumber) values (@dvdNum,@actNum)", gc.cn);
            cmd.Parameters.AddWithValue("@dvdNum", dvdNum);
            cmd.Parameters.AddWithValue("@actNum", actNum);

            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Get Loan Table Data
        public DataTable SelectRecords()
        {
            string sql = "SELECT * FROM Loan";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "Loan");
            return ds.Tables[0];
        }

        // Get data from DVD 
        public DataTable SelectDVD()
        {
            string sql = "SELECT * FROM DvdTitle";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // Get data from DVD category
        public DataTable SeletDvdCategory()
        {
            string sql = "SELECT * FROM DvdCategory";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // Get data from Actor 
        public DataTable SelectActor()
        {
            string sql = "SELECT * FROM Actor";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // Get data from Cast Member 
        public DataTable SelectCastMember()
        {
            string sql = "SELECT * FROM CastMember";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // Get data from Cast Member 
        public DataTable SelectStudio()
        {
            string sql = "SELECT * FROM Studio";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // Get data from Cast Member 
        public DataTable SelectProducer()
        {
            string sql = "SELECT * FROM Producer";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // Get Members who have loan
        public DataTable SelectMemberWithLoan()
        {
            string sql = "SELECT Member.MemberNumber, Member.LastName, Member.FirstName, Member.Address, Member.DOB, Member.MemCatNum, MembershipCategory.TotalLoan, COUNT(Member.MemberNumber) as NumberOfLoan, "
                + "CASE WHEN MembershipCategory.TotalLoan < COUNT(Member.MemberNumber) THEN ' --Too many DVDs-- ' ELSE ' --Not Exceed-- ' END as 'Status' "
                + "FROM Member LEFT JOIN Loan ON Member.MemberNumber = Loan.MemberNumber JOIN MembershipCategory ON Member.MemCatNum = MembershipCategory.MemCatNum WHERE Loan.MemberNumber IS NOT NULL "
                + "GROUP BY Member.MemberNumber, Member.MemCatNum, Member.LastName, Member.FirstName, Member.Address, Member.DOB, MembershipCategory.TotalLoan";
            SqlDataAdapter smwl = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            smwl.Fill(ds);
            return ds.Tables[0];
        }

        // Get Members who do not have loan
        public DataTable SelectMemberWithNoLoan()
        {
            string sql = "SELECT Member.MemberNumber, Member.LastName, Member.FirstName, Member.Address, Member.DOB, Member.MemCatNum, MembershipCategory.TotalLoan " + 
                "FROM Member LEFT JOIN Loan ON Member.MemberNumber = Loan.MemberNumber JOIN MembershipCategory ON Member.MemCatNum = MembershipCategory.MemCatNum WHERE Loan.MemberNumber IS NULL";
            SqlDataAdapter smwnl = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            smwnl.Fill(ds, "Loan");
            return ds.Tables[0];
        }

        // Get only Loan Data
        public DataTable selectOnlyLoan()
        {
            string sql = "SELECT * FROM Loan WHERE DateReturned IS NULL";
            SqlDataAdapter sol = new SqlDataAdapter(sql, gc.cn);
            DataSet dol = new DataSet();
            sol.Fill(dol, "LoanReturn");
            return dol.Tables[0];
        }

        // Get Stock Dvd.
        public DataTable SelectStockDvd()
        {
            string sql = "Select dc.CopyNumber, dc.DvdNumber, dc.DatePurchased from DvdCopy dc Where dc.DatePurchased < CURRENT_TIMESTAMP - 365 AND dc.CopyNumber NOT IN "
                + "(Select lt.CopyNumber From Loan lt Where lt.DateReturned IS NULL) ";
            SqlDataAdapter ssd = new SqlDataAdapter(sql, gc.cn);
            DataSet dol = new DataSet();
            ssd.Fill(dol, "LoanReturn");
            return dol.Tables[0];
        }

        // Get  Members who have not borrowed any DVD in the last 31 days
        public DataTable SelectMemberNotBorrow()
        {
            string sql = "Select mt.MemberNumber, mt.FirstName, mt.LastName, mt.Address, lt.DateOut, dt.DvdTitle, "
                + "DATEDIFF(day, lt.DateOut, CURRENT_TIMESTAMP) AS 'NumberDays' From Member mt "
                + "JOIN Loan lt ON mt.MemberNumber = lt.MemberNumber "
                + "JOIN DvdCopy dc ON lt.CopyNumber = dc.CopyNumber "
                + "JOIN DvdTitle dt ON dc.DvdNumber = dt.DvdNumber WHERE mt.MemberNumber NOT IN "
                + "(Select lt.MemberNumber from Loan mt JOIN Member lt ON lt.MemberNumber = mt.MemberNumber Where mt.DateOut > CURRENT_TIMESTAMP - 31)";
            SqlDataAdapter smnb = new SqlDataAdapter(sql, gc.cn);
            DataSet smdt = new DataSet();
            smnb.Fill(smdt, "LoanReturn");
            return smdt.Tables[0];
        }

        // Update Return Date in Loan Table
        public void UpdateLoanReturnedDate(string loanNumber, string dateReturn)
        {
            SqlCommand cmd = new SqlCommand("Update Loan set " +
                "DateReturned=@dateReturn where LoanNumber=@loanNumber", gc.cn);
            cmd.Parameters.AddWithValue("@loanNumber", loanNumber);
            cmd.Parameters.AddWithValue("@dateReturn", dateReturn);
            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Delete Stock DVD
        public void DeleteStockDvd()
        {
            //Query to delete refecence of DVDcopy from Loan
            string deleteFromLoan = "DELETE from Loan WHERE CopyNumber IN (Select CopyNumber from DvdCopy Where DatePurchased < CURRENT_TIMESTAMP - 365 AND CopyNumber NOT IN "
                + "(Select CopyNumber From Loan Where DateReturned IS NULL)); ";
            SqlCommand dfl = new SqlCommand(deleteFromLoan, gc.cn);
            dfl.ExecuteNonQuery();

            //Query to delete refecence of DvdTitle from DvdCopy
            string deleteFromDvdCopy = "DELETE FROM DvdCopy WHERE DatePurchased < CURRENT_TIMESTAMP - 365 AND CopyNumber NOT IN "
                + "(SELECT CopyNumber FROM Loan WHERE DateReturned IS NULL)"; ;
            SqlCommand dfdc = new SqlCommand(deleteFromDvdCopy, gc.cn);
            dfdc.ExecuteNonQuery();

            gc.cn.Close();
        }

        // Get Members details currently on loan
        public DataTable DisplayLoanDvd()
        {
            string sql = "SELECT Loan.CopyNumber, Member.FirstName, Member.LastName, DvdTitle.DvdTitle, Loan.DateOut FROM Loan "
                       + "INNER JOIN Member on Loan.MemberNumber = Member.MemberNumber "
                       + "INNER JOIN DvdCopy on Loan.CopyNumber = DvdCopy.CopyNumber "
                       + "INNER JOIN DvdTitle on DvdCopy.DvdNumber = DvdTitle.DvdNumber AND DateReturned Is Null;";

            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet dol = new DataSet();
            sda.Fill(dol, "LoanReturn");
            return dol.Tables[0];
        }

        // Get Members details currently on loan sort by dateOut
        public DataTable sortDate()
        {
            string sql = "SELECT Loan.CopyNumber, Member.FirstName, Member.LastName, DvdTitle.DvdTitle, Loan.DateOut FROM Loan "
                   + "INNER JOIN Member on Loan.MemberNumber = Member.MemberNumber "
                   + "INNER JOIN DvdCopy on Loan.CopyNumber = DvdCopy.CopyNumber "
                   + "INNER JOIN DvdTitle on DvdCopy.DvdNumber = DvdTitle.DvdNumber AND DateReturned Is Null Order by DateOut;";

            SqlDataAdapter sdn = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sdn.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // Get Members details currently on loan sort by Dvd Title
        public DataTable sortTitle()
        {
            string sql = "SELECT Loan.CopyNumber, Member.FirstName, Member.LastName, DvdTitle.DvdTitle, Loan.DateOut FROM Loan "
                   + "INNER JOIN Member on Loan.MemberNumber = Member.MemberNumber "
                   + "INNER JOIN DvdCopy on Loan.CopyNumber = DvdCopy.CopyNumber "
                   + "INNER JOIN DvdTitle on DvdCopy.DvdNumber = DvdTitle.DvdNumber AND DateReturned Is Null Order by DvdTitle;";

            SqlDataAdapter sdd = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sdd.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // Get DVD where no copy of the title has been loaned in the last 31 days
        public DataTable DisplayNoLoanDvd()
        {
            string sql = "Select DvdTitle.DvdTitle, Loan.DateOut " +
                         "FROM DvdTitle Join DvdCopy on DvdTitle.DvdNumber = DvdCopy.DvdNumber "
                         + "JOIN LOAN ON DvdCopy.CopyNumber = Loan.CopyNumber "
                         + "WHERE Loan.DateOut <= CURRENT_TIMESTAMP - 31";
            SqlDataAdapter sdd = new SqlDataAdapter(sql, gc.cn);
            DataSet dol = new DataSet();
            sdd.Fill(dol, "LoanReturn");
            return dol.Tables[0];
        }

        public void AddUser(string UserName, string UserType, string UserPassword)
        {
            SqlCommand cmd = new SqlCommand("Insert into Users(UserName,UserType,UserPassword) values (@UserName,@UserType,@UserPassword)", gc.cn);
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@UserType", UserType);
            cmd.Parameters.AddWithValue("@UserPassword", UserPassword);
            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Get data from user
        public DataTable SelectUser()
        {
            string sql = "SELECT * FROM Users";
            SqlDataAdapter sda = new SqlDataAdapter(sql, gc.cn);
            DataSet ds = new DataSet();
            sda.Fill(ds, "tbl_product");
            return ds.Tables[0];
        }

        // updateUser
        public void UpdateUser(string UserNumber, string UserName, string UserType, string UserPassword)
        {
            SqlCommand cmd = new SqlCommand("Update Users set " +
              "UserName=@UserName, UserType = @UserType, UserPassword = @UserPassword where UserNumber=@UserNumber", gc.cn);
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@UserType", UserType);
            cmd.Parameters.AddWithValue("@UserPassword", UserPassword);
            //  cmd.Parameters.AddWithValue("@Status", Status);
            cmd.Parameters.AddWithValue("@UserNumber", UserNumber);

            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }

        public void DeleteUser(string UserNumber)
        {
            string deleteFromUser = "DELETE FROM Users WHERE UserNumber=@UserNumber";
            SqlCommand dfu = new SqlCommand(deleteFromUser, gc.cn);
            dfu.Parameters.AddWithValue("@UserNumber", UserNumber);
            dfu.ExecuteNonQuery();
            gc.cn.Close();
        }

        // Change password
        public void ChangePassword(string username, string userpsword)
        {
            SqlCommand cmd = new SqlCommand("UPDATE Users SET UserPassword = @Password WHERE UserName = @Username", gc.cn);
            cmd.Parameters.AddWithValue("@Username", username);
            cmd.Parameters.AddWithValue("@Password", userpsword);
            cmd.ExecuteNonQuery();
            gc.cn.Close();
        }
    }
}