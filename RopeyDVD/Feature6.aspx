<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature6.aspx.cs" Inherits="RopeyDVD.MemberInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all"/>

    <script src="https://kit.fontawesome.com/1b72455679.js" crossorigin="anonymous"></script>
    <title>Feature 6</title>
    <style type="text/css">
        .auto-style1 {
            height: 27px;
        }
        .auto-style2 {
            height: 21px;
        }
        .auto-style4 {
            height: 21px;
            width: 294px;
        }
        .auto-style6 {
            height: 27px;
            width: 294px;
        }
        .auto-style7 {
            width: 294px;
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
                <li class="active-link"><a class="nav-link" href="Feature6.aspx">Q.6 Issue DVD</a></li>
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
                        User:
                        <asp:Label ID="lblUserName" runat="server" Font-Strikeout="False" ForeColor="DarkBlue"></asp:Label>
                    &nbsp;  </div>
                        <asp:Button CssClass="btn-logout" ID="btnLogout" runat="server" Text="Log out" OnClick="btnLogout_Click" CausesValidation="False"/>
                </div>
                <div class="form-container">
                    <div>
                        <div class="form-heading-sec">
                            Issue DVD Copy
                        </div>
                        <div class="sec">
                            <div class="table-sec">
                                <table>
                                    <tr>
                                        <td>Loan Number: </td>
                                        <td>
                                            <asp:TextBox CssClass="form-input" ID="txtLoanNumber" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                            <br />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtLoanNumber" Display="Dynamic" ErrorMessage="Loan Number is Empty" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Loan Number Type: </td>
                                        <td>
                                            <asp:DropDownList CssClass="form-input" ID="dropDownLoanNumType" AutoPostBack="true" runat="server" Height="30px" Width="90%" OnSelectedIndexChanged="dropDownLoanNumType_SelectedIndexChanged"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Copy Number: </td>
                                        <td>
                                            <asp:DropDownList CssClass="form-input" ID="dropDownCopyNumber" AutoPostBack="true" runat="server" Height="30px" Width="90%" OnSelectedIndexChanged="dropDownCopyNumber_SelectedIndexChanged"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Member Number: </td>
                                        <td>
                                            <asp:DropDownList CssClass="form-input" ID="DropDownMemNum" AutoPostBack="true" runat="server" Height="30px" Width="90%" OnSelectedIndexChanged="DropDownMemNum_SelectedIndexChanged"></asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Member Age: </td>
                                        <td>
                                            <asp:Label ID="lblMemberAge" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <table>
                                    <tr>
                                        <td class="auto-style6">Date Out: </td>
                                        <td class="auto-style1">
                                            <asp:Label ID="lblDateOut" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style6">Date Due: </td>
                                        <td class="auto-style1">
                                            <asp:Label ID="lblDateDue" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style4">Loan Duration: </td>
                                        <td class="auto-style2">
                                            <asp:Label ID="lblLoanDuration" runat="server" Font-Bold="True"></asp:Label>
                                        &nbsp;Days</td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style7">
                                            Charge  Rs.
                                            <asp:Label ID="lblChargePerDay" runat="server" Font-Bold="True"></asp:Label>
                                            &nbsp;Per day.&nbsp;&nbsp;&nbsp;&nbsp;
                                        </td>
                                        <td>
                                            Total Charge:
                                            Rs. <asp:Label ID="lblTotalCharge" runat="server" Font-Bold="True"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="auto-style7">Age Restriction: </td>
                                        <td>
                                            <asp:Label ID="lblAgeRestriction" runat="server"></asp:Label>
                                        </td>
                                    </tr>                            
                                </table>
                            </div>
                            <asp:Button CssClass="btn btn-success" ID="btnIssueDvd" runat="server" OnClick="btnIssueDvd_Click" Text="Submit" />
                            &nbsp;&nbsp;
                            <asp:Label ID="errorMessage" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
                        </div>                    
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </div>

                    <div class="form-heading-sec">
                        Issued DVD Copy Details
                    </div>
                    <div>
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Width="90%" OnSelectedIndexChanged="GV_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Loan Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("LoanNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Loan Type Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("LoanTypeNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Copy Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("CopyNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Member Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("MemberNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Out">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("DateOut") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Due">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("DateDue") %>'></asp:Label>
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
                        <br />
                        </div>
                </div>
            </form>
        </div>
    </div>
</body>
<script type="text/javascript">
    const dateOutDay = document.querySelector("#txtDateOutDay");
    const dateDueDay = document.querySelector("#txtDateDueDay");
</script>
</html>
