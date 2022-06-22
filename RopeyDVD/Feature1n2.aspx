<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature1n2.aspx.cs" Inherits="RopeyDVD.DvdInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all" />

    <script src="https://kit.fontawesome.com/1b72455679.js" crossorigin="anonymous"></script>
    <title>Feature 1 & 2</title>
        <style type="text/css">
            .auto-style1 {
                width: 172px;
            }
            .auto-style2 {
                width: 59%;
                height: 15px;
            }
            .auto-style3 {
                width: 167px;
            }
        </style>
</head>
<body>
    <div class="main-container">
        <div class="side-bar">
            <div class="main-nav">
                <asp:image id="img" runat="server" imageurl="img/dvd.png" />
                <div class="main-nav-text">Ropey DVD's</div>
            </div>
            <ul class="nav-bars">
                <li class="active-link"><a class="nav-link" href="Feature1n2.aspx">Q.1&2 DVD Titles</a></li>
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
                <li><a class="nav-link" href="Feature13.aspx">Q.13 Unsold DVD</a></li>
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
                        User: <asp:Label ID="lblUserName" runat="server" Font-Strikeout="False" ForeColor="DarkBlue"></asp:Label>
                    &nbsp; 
                    </div>
                    <asp:Button CssClass="btn-logout" ID="btnLogout" runat="server" Text="Log out" OnClick="btnLogout_Click" CausesValidation="False"/>
                </div>
                <div class="form-container">
                    <div class="sec">
                        <div class="form-heading-sec">
                                    Select the Actors' Lastname and see the titles of all DVDs Stocked by the Shop for which the Actor is a CastMember.
                        </div>
                        <div class="table-sec">
                        <table class="auto-style2">
                            <tr>
                                <td class="auto-style1">Actor's Last Name: &nbsp; </td>
                                <td>
                                    <asp:DropDownList CssClass="form-input" ID="actor_surname_list" runat="server" Height="30px" OnSelectedIndexChanged="actor_surname_list_SelectedIndexChanged" Width="150px" AutoPostBack="True" style="margin-left: 0">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table> 
                        </div>
                        <asp:GridView ID="Dvd_title_actor" CssClass="gv" runat="server" Font-Names="Century Gothic" Height="99px" Width="150px"  OnSelectedIndexChanged="Dvd_title_actor_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
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

                    <div class="sec">
                        <div class="form-heading-sec">
                                    Select Actors' last name and find their related movie title which are not on loan.
                        </div>
                        <div class="table-sec">
                        <table>
                            <tr>
                                <td class="auto-style3">Actor's Last Name:&nbsp;&nbsp;&nbsp; </td>
                                <td>
                                    <asp:DropDownList CssClass="form-input" Height="32px" Width="22%" ID="actor_surname_list2" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="True" style="margin-left: 0">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                        </table>
                        </div>
                        <asp:GridView ID="actor_movie_notloaned" CssClass="gv" runat="server" Font-Names="Century Gothic" Font-Size="Large" OnSelectedIndexChanged="actor_movie_notloaned_SelectedIndexChanged" Width="80%" CellPadding="4" ForeColor="#333333" GridLines="None">
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
            </form>
        </div>
    </div>
</body>
</html>
