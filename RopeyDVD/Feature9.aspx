<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feature9.aspx.cs" Inherits="RopeyDVD.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all" />
    <script src="https://kit.fontawesome.com/1b72455679.js" crossorigin="anonymous"></script>
    <title>Feature 9</title>
    <style type="text/css">
        .auto-style1 {
            width: 173px;
        }
        .auto-style3 {
            width: 350px;
        }
        .auto-style4 {
            width: 362px;
        }
        .auto-style5 {
            width: 342px;
        }
        .auto-style6 {
            width: 407px;
        }
        .auto-style7 {
            width: 173px;
            height: 34px;
        }
        .auto-style8 {
            width: 407px;
            height: 34px;
        }
        .auto-style9 {
            width: 342px;
            height: 34px;
        }
        .auto-style10 {
            width: 401px;
        }
        .auto-style11 {
            width: 173px;
            height: 30px;
        }
        .auto-style12 {
            width: 401px;
            height: 30px;
        }
        .auto-style13 {
            width: 342px;
            height: 30px;
        }
        .auto-style14 {
            width: 173px;
            height: 23px;
        }
        .auto-style15 {
            width: 407px;
            height: 23px;
        }
        .auto-style16 {
            width: 159px;
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
                <li class="active-link"><a class="nav-link" href="Feature9.aspx">Q.9 Add DVD</a></li>
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
                <div class="from-sec">
                    <div>
                        <div class="sec sec-spc">
                        <div>
                            <div class="form-heading-sec">
                                Category Details
                            </div>
                            <div class="table-sec">
                            <table>
                                <tr>
                                    <td class="auto-style1">Category Number:</td>
                                    <td class="auto-style10">
                                        <asp:TextBox CssClass="form-input" ID="txtCategoryNum" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11">Category Description:</td>
                                    <td class="auto-style12">
                                        <asp:TextBox CssClass="form-input" ID="txtCategoryDes" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Age Restricted:</td>
                                    <td class="auto-style10">
                                        <asp:RadioButton ID="radiobtnTrue" Checked="true" runat="server" GroupName="AgeRestricted" Text="True" />
        &nbsp;&nbsp;&nbsp;
                                        <asp:RadioButton ID="radiobtnFalse" runat="server" GroupName="AgeRestricted" Text="False" />
                                    </td>
                                </tr>
                            </table>
                            </div>
                            <asp:Button CssClass="btn" ID="btnAddCat" runat="server" Text="Add Category" OnClick="btnAddCat_Click" />
                            &nbsp;
                            <asp:Label ID="lblErrorMsgCategory" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                        <div>
                            <asp:GridView ID="GridViewCategory" CssClass="gv" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Category Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("CategoryNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Category Description">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("CategoryDescription") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Age Resctricted">
                                        <ItemTemplate>
                                            <asp:Label ID="Label3" runat="server" Text='<%#Eval("AgeRestricted") %>'></asp:Label>
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
                    <div>
                        <%--------- FOR ACTOR TABLE --------------%>
                        <div class="sec sec-spc">                            
                            <div class="form-heading-sec">
                                Actor Details
                            </div>
                            <div class="table-sec">
                            <table>
                                <tr>
                                    <td class="auto-style7">Actor Number:</td>
                                    <td class="auto-style9">
                                        <asp:TextBox CssClass="form-input" ID="txtActNumber" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">First Name:</td>
                                    <td class="auto-style5">
                                        <asp:TextBox CssClass="form-input" ID="txtFirstName" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style11">Last Name:</td>
                                    <td class="auto-style13">
                                        <asp:TextBox CssClass="form-input" ID="txtLastName" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                            </div>
                            <asp:Button CssClass="btn" ID="btnAddActor" runat="server" Text="Add Actor" OnClick="btnAddActor_Click" />
                            &nbsp;&nbsp;
                            <asp:Label ID="lblErrorMsgActor" runat="server" ForeColor="Red"></asp:Label>
                            <div>
                            <asp:GridView ID="GridViewActor" CssClass="gv" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Actor Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("ActorNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="First Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("FirstName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Last Name">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("LastName") %>'></asp:Label>
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
                   <%--------- FOR PRDUCER TABLE --------------%> 
                <div class="from-sec">
                    <div class="sec sec-spc">
                        <div class="form-heading-sec">
                                Producer Details
                        </div>
                        <div class="table-sec">
                            <table>
                                <tr>
                                    <td class="auto-style1">Producer Number:</td>
                                    <td class="auto-style4">
                                        <asp:TextBox CssClass="form-input" ID="txtProducerNum" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Producer Name</td>
                                    <td class="auto-style4">
                                        <asp:TextBox CssClass="form-input" ID="txtProducerName" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>                            
                        </div>
                        <asp:Button CssClass="btn" ID="btnAddProducer" runat="server" Text="Add Producer" OnClick="btnAddProducer_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblErrorMsgProducer" runat="server" ForeColor="Red"></asp:Label>
                        <div>
                            <asp:GridView ID="GridViewProducer" CssClass="gv" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="Loan Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("ProducerNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Loan Type Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("ProducerName") %>'></asp:Label>
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
                    <div>
                    <%--------FOR STUDIO TABLE--------------%>
                    <div class="sec sec-spc">
                        <div class="form-heading-sec">
                                Studio Details
                        </div>
                        <div class="table-sec">
                            <table>
                                <tr>
                                    <td class="auto-style1">Studio Number:</td>
                                    <td class="auto-style3">
                                        <asp:TextBox CssClass="form-input" ID="txtStudioNumber" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style1">Studio Name</td>
                                    <td class="auto-style3">
                                        <asp:TextBox CssClass="form-input" ID="txtStudioName" runat="server" Height="30px" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>                            
                        </div>
                        <asp:Button CssClass="btn" ID="btnAddStudio" runat="server" Text="Add Studio" OnClick="btnAddStudio_Click" />
                        &nbsp;&nbsp;&nbsp;
                        <asp:Label ID="lblErrorMsgStudio" runat="server" ForeColor="Red"></asp:Label>
                        <div>
                        <asp:GridView ID="GridViewStudio" CssClass="gv" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="Studio Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("StudioNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Studio Name">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("StudioName") %>'></asp:Label>
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
                     <%--------- FOR CASTMEMBER TABLE --------------%>
                    <div class="sec sec-spc">
                        <div class="form-heading-sec">
                                Cast Members
                        </div>
                        <div class="table-sec">
                            <table>
                                <tr>
                                    <td class="auto-style16">DVD Number: </td>
                                    <td>
                                        <asp:DropDownList CssClass="form-input" ID="DropDownDvdNum" runat="server" Height="30px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16">Actor Number: </td>
                                    <td>
                                        <asp:DropDownList CssClass="form-input" ID="DropDownActNum" runat="server" Height="30px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <asp:Button ID="btnAddCastMem" CssClass="btn" runat="server" Text="Add Cast Member" OnClick="btnAddCastMem_Click" />
                        &nbsp;
                        <asp:Label ID="lblErrorMessageCastMem" runat="server" ForeColor="Red"></asp:Label>
                        <div>
                            <asp:GridView Width="100%" CssClass="gv" ID="GridViewCastmember" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" />
                                <Columns>
                                    <asp:TemplateField HeaderText="DVD Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("DvdNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Actor Number">
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%#Eval("ActorNumber") %>'></asp:Label>
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

                <%--------- FOR DVDTITLE TABLE --------------%>
                <div class="sec sec-spc">
                    <div class="form-heading-sec">
                                DVD Title Details
                    </div>
                    <div class="table-sec">
                    <table>
                        <tr>
                            <td class="auto-style1">DVD Number: </td>
                            <td class="auto-style6">
                                <asp:TextBox ID="txtDvdNumber" runat="server" CssClass="form-input" Height="30px" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Studio Number: </td>
                            <td class="auto-style6">
                                <asp:DropDownList ID="DropDownStNum" runat="server" CssClass="form-input" Height="30px" Width="90%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14">Producer Number: </td>
                            <td class="auto-style15">
                                <asp:DropDownList ID="DropDownProNum" runat="server" CssClass="form-input" Height="30px" Width="90%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">DVD Title: </td>
                            <td class="auto-style6">
                                <asp:TextBox ID="txtDvdTitle" runat="server" CssClass="form-input" Height="30px" Width="90%"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td class="auto-style7">Date Released: </td>
                            <td class="auto-style8">
                                Day:<asp:TextBox ID="txtDateReleasedDay" onkeypress="return validate(event)" runat="server" CssClass="form-input" Height="30px" Width="35px"></asp:TextBox>
                            &nbsp;Month:<asp:DropDownList ID="DropDownReleaseMonth" runat="server" CssClass="form-input" Height="30px">
                                    <asp:ListItem>Jan</asp:ListItem>
                                    <asp:ListItem>Feb</asp:ListItem>
                                    <asp:ListItem>Mar</asp:ListItem>
                                    <asp:ListItem>Apr</asp:ListItem>
                                    <asp:ListItem>May</asp:ListItem>
                                    <asp:ListItem>Jun</asp:ListItem>
                                    <asp:ListItem>Jul</asp:ListItem>
                                    <asp:ListItem>Aug</asp:ListItem>
                                    <asp:ListItem>Sep</asp:ListItem>
                                    <asp:ListItem>Oct</asp:ListItem>
                                    <asp:ListItem>Nov</asp:ListItem>
                                    <asp:ListItem>Dec</asp:ListItem>
                                </asp:DropDownList> 
&nbsp;Year:<asp:DropDownList ID="DropDownReleaseYear" runat="server" CssClass="form-input" Height="30px">
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2022</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Standard Charge: </td>
                            <td class="auto-style6">
                                <asp:TextBox ID="txtStandardCharge" onkeypress="return validate(event)" runat="server" CssClass="form-input" Height="30px" Width="50%"></asp:TextBox>
                                &nbsp;Per Day&nbsp;
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Penalty Charge: </td>
                            <td class="auto-style6">
                                <asp:TextBox ID="txtPenaltyCharge" onkeypress="return validate(event)" runat="server" CssClass="form-input" Height="30px" Width="50%"></asp:TextBox>
                            &nbsp;Per Day&nbsp;
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Category Number: </td>
                            <td class="auto-style6">
                                <asp:DropDownList ID="DropDownCatNum" runat="server" CssClass="form-input" Height="30px" Width="50%">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                    </div>
                    <asp:Button ID="btnSubmitDvdTitle" CssClass="btn" runat="server" Text="Add DVD" OnClick="btnSubmitDvdTitle_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="lblErrorMsgDvdTitle" runat="server" ForeColor="Red"></asp:Label>

                    <div>
                        <asp:GridView ID="GridViewDvd" CssClass="gv" Width="100%" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:TemplateField HeaderText="DVD Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("DvdNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Studion Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("StudioNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Producer Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("ProducerNumber") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="DVD Title">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("DvdTitle") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date Released">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("DateReleased") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Standard Charge Per Day">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("StandardCharge") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Penalty Charge Per Day">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("PenaltyChargePerDay") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category Number">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%#Eval("categoryNumber") %>'></asp:Label>
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
            </form>
        </div>
    </div>
</body>
</html>
