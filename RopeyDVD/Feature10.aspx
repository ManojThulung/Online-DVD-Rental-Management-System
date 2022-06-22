<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature10.aspx.cs" Inherits="RopeyDVD.StockDvd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all" />
    <script src="https://kit.fontawesome.com/1b72455679.js" crossorigin="anonymous"></script>
    <title>Feature 10</title>
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
                <li class="active-link"><a class="nav-link" href="Feature10.aspx">Q.10 Stock DVD</a></li>
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
                        User:
                        <asp:Label ID="lblUserName" runat="server" Font-Strikeout="False" ForeColor="DarkBlue"></asp:Label>
                    &nbsp;  </div>
                        <asp:Button CssClass="btn-logout" ID="btnLogout" runat="server" Text="Log out" OnClick="btnLogout_Click" CausesValidation="False"/>
                </div>
                <div class="form-container">
                    <div class="sec">
                        <div class="form-heading-sec">
                                        DVD Copies in stock for more than a Year
                        </div>
                        <div>
                            <asp:GridView ID="GridView1" Width="90%" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" Gridline="Horizontal" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Copy Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("CopyNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DVD Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("DvdNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Purchased Date">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("DatePurchased") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
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
                            <div>
                                <asp:Button ID="btnRemove" CssClass="btn btn2" runat="server" OnClick="btnRemove_Click" Text="Remove Stock DVD " />
                                &nbsp;&nbsp;&nbsp;
                                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
