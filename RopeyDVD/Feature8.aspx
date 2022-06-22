<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature8.aspx.cs" Inherits="RopeyDVD.NonLoanMember" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all" />
    <script src="https://kit.fontawesome.com/1b72455679.js" crossorigin="anonymous"></script>
    <title>Feature 8</title>
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
                <li class="active-link"><a class="nav-link" href="Feature8.aspx">Q.8 Members Details</a></li>
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
                        User:
                        <asp:Label ID="lblUserName" runat="server" Font-Strikeout="False" ForeColor="DarkBlue"></asp:Label>
                    &nbsp;  </div>
                        <asp:Button CssClass="btn-logout" ID="btnLogout" runat="server" Text="Log out" OnClick="btnLogout_Click" CausesValidation="False"/>
                </div>
                <div class="form-container">
                    <div class="form-heading-sec">
                        Members with current Loan Details
                    </div>
                    <div>
                        <asp:Label ID="lblErrorMsg1" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                    <div>
                        <asp:GridView ID="GridView1" Width="90%" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Member Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("MemberNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                                
                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Birth">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("DOB") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Member Category Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("MemCatNum") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Allowed Loan">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("TotalLoan") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Number of Loan">
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%#Eval("NumberOfLoan") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
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
                    </div>
                    <div class="form-heading-sec">
                        Members with no current Loan Deatils
                    </div>
                    <div>
                        <asp:Label ID="lblErrorMsg2" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                    <div>
                        <asp:GridView Width="90%" ID="GridView2" AutoGenerateColumns="False" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Member Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("MemberNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>                               
                                <asp:TemplateField HeaderText="First Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Last Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Address">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date of Birth">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("DOB") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Member Category Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("MemCatNum") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Allowed Loan">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("TotalLoan") %>'></asp:Label>
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
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
