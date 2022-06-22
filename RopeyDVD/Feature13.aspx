<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature13.aspx.cs" Inherits="RopeyDVD.Feature13" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all" />

    <title>Feature 13</title>
</head>
<body>
    <div class="main-container">
        <div class="side-bar">
            <div class="main-nav">
                <asp:image id="img" runat="server" imageurl="img/dvd.png" />
                <div class="main-nav-text">Ropey DVD's</div>
            </div>
            <ul class="nav-bars">
                <li><a class="nav-link" href="Feature1n2.aspx">Q.1&2 DVD Titles</a></li>
                <li><a class="nav-link" href="Feature3.aspx">Q.3 Loaned Members</a></li>
                <li><a class="nav-link" href="Feature4.aspx">Q.4 DVD Details</a></li>
                <li><a class="nav-link" href="Feature5.aspx">Q.5 Latest Loan</a></li>
                <li><a class="nav-link" href="Feature6.aspx">Q.6 Issue DVD</a></li>
                <li><a class="nav-link" href="Feature7.aspx">Q.7 Return DVD</a></li>   
                <li><a class="nav-link" href="Feature8.aspx">Q.8 Members Details</a></li>
                <li><a class="nav-link" href="Feature9.aspx">Q.9 Add DVD</a></li>
                <li><a class="nav-link" href="Feature10.aspx">Q.10 Stock DVD</a></li>
                <li><a class="nav-link" href="Feature11.aspx">Q.11 Loan DVD</a></li>
                <li><a class="nav-link" href="Feature12.aspx">Q.12 Not Loan Members</a></li>
                <li class="active-link"><a class="nav-link" href="Feature13.aspx">Q.13 Unsold DVD</a></li>
                <li><a class="nav-link" href="Feature14.aspx">Q.14 Profile</a></li>
            </ul>
            <div class="nav-bar-footer" style="right: 1030px">
                <p>2022 AD Group CourseWork</p>
            </div>
        </div>
        <div class="side-bar-back"></div>
        <div class="data-container"> 
            <form id="form1" runat="server">           
                <div class="top-header-sec">
                    <div>
                        User:
                        <asp:Label ID="lblUserName" runat="server" Font-Strikeout="False" ForeColor="DarkBlue"></asp:Label>
                    &nbsp;  </div>
                        <asp:Button CssClass="btn-logout" ID="btnLogout" runat="server" Text="Log out" OnClick="btnLogout_Click" CausesValidation="False"/>
                </div>
                <div class="form-container">
                <div class="form-heading-sec">
                    Unsold DVD Titles in Last 31 Days
                </div>
                <div class="sec">
                <div>
                    <asp:Button ID="Button1" CssClass="btn" runat="server" OnClick="Button1_Click" Text="Display No loan last 31 days dvds " />
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
                <div>
                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="70%">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle Height="35px" BackColor="#795548" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <SortedAscendingCellStyle BackColor="#FDF5AC" />
                        <SortedAscendingHeaderStyle BackColor="#4D0000" />
                        <SortedDescendingCellStyle BackColor="#FCF6C0" />
                        <SortedDescendingHeaderStyle BackColor="#820000" />
                    </asp:GridView>
                </div>
                </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
