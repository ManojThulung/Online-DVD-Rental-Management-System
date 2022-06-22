<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature14.aspx.cs" Inherits="RopeyDVD.Feature14" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all" />

    <title>Feature 14</title>
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style3 {
            width: 273px;
        }
        .auto-style5 {
            width: 205px;
            height: 50px;
        }
        .auto-style6 {
            height: 23px;
            width: 205px;
        }
        .auto-style7 {
            width: 1038px;
            height: 50px;
        }
        .auto-style8 {
            width: 114px;
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
                <li><a class="nav-link" href="Feature7.aspx">Q.7 Return DVD</a></li>   
                <li><a class="nav-link" href="Feature8.aspx">Q.8 Members Details</a></li>
                <li><a class="nav-link" href="Feature9.aspx">Q.9 Add DVD</a></li>
                <li><a class="nav-link" href="Feature10.aspx">Q.10 Stock DVD</a></li>
                <li><a class="nav-link" href="Feature11.aspx">Q.11 Loan DVD</a></li>
                <li><a class="nav-link" href="Feature12.aspx">Q.12 Not Loan Members</a></li>
                <li><a class="nav-link" href="Feature13.aspx">Q.13 Unsold DVD</a></li>
                <li class="active-link"><a class="nav-link" href="Feature14.aspx">Q.14 Profile</a></li>
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
                    <div class="change-pw-sec">
                        <div class="form-heading-sec">
                            Change Password
                        </div>
                        <div class="sec">
                        <div class="table-sec">
                            <table>
                            <tr>
                                <td class="auto-style3">Old Password: </td>
                                <td>
                                    <asp:TextBox CssClass="form-input" Width="50%" Height="30px" ID="txtOldPsword" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">New Password: </td>
                                <td>
                                    <asp:TextBox CssClass="form-input" Width="50%" Height="30px" ID="txtNewPsword" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style3">Confirm Password: </td>
                                <td>
                                    <asp:TextBox CssClass="form-input" Width="50%" Height="30px" ID="txtConfirmPsword" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            </table>
                        </div>                        
                        <div>
                            <asp:Button ID="btnChangePsword" CssClass="btn" runat="server" Text="Change Password" OnClick="btnChangePsword_Click1" />
                            <asp:Label ID="lblChangePwMsg" runat="server" Font-Size="105%" ForeColor="Red"></asp:Label>
                        </div>
                        </div>
                    </div>

                    <div class="user-info-sec">
                    <div class="form-heading-sec">
                        User Details
                    </div>
                    <div class="sec">
                    <div class="table-sec">
                        <table>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label  ID="Label6" runat="server" Text="User Number: "></asp:Label>
                                </td>
                                <td class="auto-style9">
                                    <asp:TextBox CssClass="form-input" Width="80%" Height="30px" ID="TextBox1" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style8">
                                    <asp:Label  ID="Label21" runat="server" Text="Username: "></asp:Label>
                                </td>
                                <td class="auto-style9">
                                    <asp:TextBox CssClass="form-input" Width="80%" Height="30px" ID="TextBox2" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td class="auto-style6">
                                    <asp:Label ID="Label3" runat="server" Text="User Type: "></asp:Label>
                                &nbsp;</td>
                                <td class="auto-style1">
                                    <asp:TextBox CssClass="form-input" Width="80%" Height="30px" ID="TextBox3" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="auto-style5">
                                    <asp:Label ID="Label4" runat="server" Text="User Password"></asp:Label>
                                    :</td>
                                <td class="auto-style7">
                                    <asp:TextBox CssClass="form-input" Width="80%" Height="30px" ID="TextBox4" runat="server" ></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
               
                    <div>
                        <asp:Button ID="Button1" CssClass="btn" runat="server" Text="Add" OnClick="Button1_Click" />
                        <asp:Button ID="Button2" CssClass="btn2" runat="server" Text="Update" OnClick="Button2_Click" />
                        <asp:Button ID="Button3" CssClass="btn" runat="server" Text="Delete" OnClick="Button3_Click" />
                        &nbsp;          
                        <asp:Label ID="Label5" runat="server" ForeColor="Red"></asp:Label>
                    </div>
                        <br />
                    <div>
                     <asp:GridView ID="GridView1" runat="server" OnRowCommand="GV1_RowCommand" CellPadding="4" AutoGenerateColumns="False" ForeColor="#333333" GridLines="None" Width="80%">
                         <AlternatingRowStyle BackColor="White" />
                         <Columns>
                            <asp:TemplateField HeaderText="UserNumber">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("UserNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UserName">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UserType">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("UserType") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UserPassword">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("UserPassword") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                        <asp:LinkButton ID="View" CssClass="btn-table" runat="server" CommandName="view" CommandArgument='<%#Bind("UserNumber")%>'>Select</asp:LinkButton>
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
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
<script>
    const usertype = localStorage.getItem("usertype");

    if (usertype === "Assistant") {
        document.querySelector(".user-info-sec").style.display = "none"; // hide user info sec.
    }
    else {
        document.querySelector(".user-info-sec").style.display = "block"; // display user info sec.
    }
</script>
</html>
