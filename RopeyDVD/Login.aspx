<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RopeyDVD.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="~/css/style.css" type="text/css" media="all" />
    <title>Login</title>
</head>
<body>
    <form class="login-container" id="form1" runat="server">
        <div class="cover-sec">
            <asp:image id="img" runat="server" imageurl="img/dvd.png" />
            <div class="main-nav-text">Ropey DVD's</div>
        </div>
        <div class="input-sec">
            <p class="login-header">Login to the System</p>

            <p class="lbl">Username: </p>
            <asp:TextBox CssClass="txtField" ID="txtUserName" runat="server" OnTextChanged="txtUserName_TextChanged"></asp:TextBox>
            <br />
            <div class="err-msg username-error">
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
            </div>

            <p class="lbl">Password: </p>
            <asp:TextBox CssClass="txtField" TextMode="Password" ID="txtPassword" runat="server" EnableTheming="True" OnTextChanged="txtPassword_TextChanged"></asp:TextBox>
            <br />
            <div class="err-msg pw-error">
                <asp:Label ID="lblPassword" runat="server"></asp:Label>
            </div>

            <p class="lbl">Usertype: </p>        
            <asp:DropDownList CssClass="txtField" ID="DropDownUserType" runat="server">
                <asp:ListItem>Assistant</asp:ListItem>
                <asp:ListItem>Manager</asp:ListItem>
            </asp:DropDownList>            
            <div>
                <asp:CheckBox ID="cbRememberMe" Checked="true" runat="server" Text="Remember Me?" />
            </div>
            <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>
            <asp:Button CssClass="btn-login" ID="Button1" runat="server" Text="Log In" OnClick="Button1_Click" />
        </div>
    </form>
</body>
<script type="text/javascript">
    document.querySelector(".btn-login").addEventListener("click", () => {
        const uservalue = document.getElementById('DropDownUserType').selectedOptions[0].value;
        localStorage.setItem("usertype", uservalue); // save usertype in the loca storage.
    });
</script>
</html>
