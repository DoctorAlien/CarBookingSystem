<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Css/style.css" type="text/css" rel="Stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div class="form-login">
        <img src="Image/logo.jpg"/>
            <div class="form-login-body">
                <div class="form-group">
                <label for="txtUserName">用户名</label>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </div>

            <span class="">
                    <asp:RequiredFieldValidator ID="requireUserName" runat="server" 
                        ControlToValidate="txtUserName" ErrorMessage="用户名不能为空" CssClass="text-red"></asp:RequiredFieldValidator>
            </span>

            <div class="form-group">
                <label for="txtPassword">密码</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                
            </div>

            <span class="">
                    <asp:RequiredFieldValidator ID="requirePassword" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="密码不能为空" ClientIDMode="Inherit" CssClass="text-red"></asp:RequiredFieldValidator>
            </span>

            <div class="form-group">
                <label for="txtValidate">验证码</label>
                <asp:TextBox ID="txtValidate" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                
                <asp:LinkButton ID="lbtValidate" runat="server" CssClass="pull-right validate-code" 
                    onclick="lbtValidate_Click" CausesValidation="False"></asp:LinkButton>
            </div>
            <span class="">
                <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="验证码不匹配" 
                    ControlToValidate="txtValidate" CssClass="text-red" 
                    onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </span>
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Sign In" 
                    CssClass="btn btn-primary btn-block" onclick="btnLogin_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" 
                    CssClass="btn btn-primary btn-block" onclick="btnReset_Click" 
                    CausesValidation="False" />
            </div>
            <div class="form-group">
                <span><a href="Register.aspx">注册</a></span>
            </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
