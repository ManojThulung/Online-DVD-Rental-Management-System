<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature7.aspx.cs" Inherits="RopeyDVD.NonLoanDvd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all" />
    <script src="https://kit.fontawesome.com/1b72455679.js" crossorigin="anonymous"></script>
    <title>Feature 7</title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
            width: 179px;
        }
        .auto-style2 {
            height: 23px;
            width: 267px;
        }
        .auto-style3 {
            height: 23px;
            width: 104px;
        }
        .auto-style4 {
            width: 104px;
        }
        .auto-style5 {
            width: 179px;
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
                <li><a class="nav-link" href="Feature1n2.aspx">Q.1&2 DVD Titles</a></li>
                <li><a class="nav-link" href="Feature3.aspx">Q.3 Loaned Members</a></li>
                <li><a class="nav-link" href="Feature4.aspx">Q.4 DVD Details</a></li>
                <li><a class="nav-link" href="Feature5.aspx">Q.5 Latest Loan</a></li>
                <li><a class="nav-link" href="Feature6.aspx">Q.6 Issue DVD</a></li>
                <li class="active-link"><a class="nav-link" href="Feature7.aspx">Q.7 Return DVD</a></li>   
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
                        User:
                        <asp:Label ID="lblUserName" runat="server" Font-Strikeout="False" ForeColor="DarkBlue"></asp:Label>
                    &nbsp;  </div>
                        <asp:Button CssClass="btn-logout" ID="btnLogout" runat="server" Text="Log out" OnClick="btnLogout_Click" CausesValidation="False"/>
                </div>
                <div class="form-container">
                    <div class="form-heading-sec">
                        Issued DVD Copy Details
                    </div>
                    <div>
                        <asp:GridView ID="GridView1" Width="90%" runat="server" OnRowCommand="GV1_RowCommand" AutoGenerateColumns="False" CellPadding="4" GridLines="None" ForeColor="#333333">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Loan Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("LoanNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Loan Type Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("LoanTypeNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Copy Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%#Eval("CopyNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Member Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%#Eval("MemberNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Out">
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%#Eval("DateOut") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Due">
                                    <ItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%#Eval("DateDue") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Date Return">
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%#Eval("DateReturned") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                         <asp:LinkButton CssClass="btn-table" ID="View" runat="server" CommandName="view" CommandArgument='<%#Bind("LoanNumber")%>'>Select</asp:LinkButton>
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
                        Return DVD Copy
                    </div>
                    <div>
                    <div class="sec">
                        <div class="table-sec">
                        <table>
                            <tr>
                                <td class="auto-style3">Loan Number:&nbsp;&nbsp;&nbsp; </td>
                                <td class="auto-style2">
                                    <asp:TextBox CssClass="form-input" ID="txtLoanNum" runat="server" Enabled="False" Height="30px" Width="90%"></asp:TextBox> <br />
                                    <asp:Label ID="lblLoanNum" runat="server" ForeColor="Red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Date Due: </td>
                                <td class="auto-style2">
                                    <asp:TextBox CssClass="form-input" ID="txtDateDue" runat="server" Enabled="False" Height="30px" Width="90%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style4">Date Return: </td>                     
                                <td class="auto-style2">
                                    <asp:Label ID="lblDateReturn" runat="server"></asp:Label>
                                </td>                          
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td class="auto-style1">Date Duration: </td>                     
                                <td class="auto-style2">
                                
                                    <asp:Label ID="lblDurationDate" runat="server" Font-Bold="True"></asp:Label>
                                    &nbsp;Days</td>                          
                            </tr>
                            <tr>
                                <td class="auto-style5">Penalty Charge: </td>                     
                                <td class="auto-style2">
                                
                                    Rs.
                                    <asp:Label ID="lblPenaltyCharge" runat="server" Font-Bold="True"></asp:Label>
                                
                                </td>                          
                            </tr>
                            <tr>
                                <td class="auto-style5">Total Penalty Charge: </td>                     
                                <td class="auto-style2">
                                
                                    Rs.
                                    <asp:Label ID="lblTotalCharge" runat="server" Font-Bold="True"></asp:Label>
                                
                                </td>                          
                            </tr>
                        </table>
                        </div>                    
                        <div>
                            <asp:Button CssClass="btn" ID="Button2" runat="server" Text="Update Loan" OnClick="Button2_Click" />
                            &nbsp;&nbsp;&nbsp;
                            <asp:Label ID="lblErrorMsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                    </div> 
                </div>
            </form>
        </div>
    </div>
</body>
</html>
