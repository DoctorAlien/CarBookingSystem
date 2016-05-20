<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="register" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Css/Style.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div class="form-login">
        <img src="Image/logo.jpg"/>
            <div class="form-login-body">
            <div class="form-group">
                <label for="txtUserName">昵称</label>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            </div>
            <span class="">
                <asp:CustomValidator ID="cvUserName" runat="server" 
                    ControlToValidate="txtUserName" onservervalidate="cvUserName_ServerValidate" 
                    ValidateEmptyText="True" CssClass="text-red"></asp:CustomValidator>
            </span>
            <div class="form-group">
                <label for="txtPassword">密码</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <span class="">
                <asp:CustomValidator ID="cvPassword" runat="server" 
                    ControlToValidate="txtPassword" onservervalidate="cvPassword_ServerValidate" 
                    ValidateEmptyText="True" CssClass="text-red"></asp:CustomValidator>
            </span>
            <div class="form-group">
                <label for="txtUserName">姓名</label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </div>
            <span class="">
                <asp:CustomValidator ID="cvName" runat="server" 
                    onservervalidate="cvName_ServerValidate" CssClass="text-red"></asp:CustomValidator>
            </span>
            <div class="form-group">
                <label for="txtPassword">邮箱</label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </div>
                <span class="">
                <asp:CustomValidator ID="cvEmail" runat="server" ControlToValidate="txtEmail" 
                    onservervalidate="cvEmail_ServerValidate" ValidateEmptyText="True" 
                    CssClass="text-red"></asp:CustomValidator>
            </span>
            <div class="form-group">
                <label for="txtPassword">手机</label>
                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox>
            </div>
                <span class="">
                <asp:CustomValidator ID="cvMobile" runat="server" ControlToValidate="txtMobile" 
                    onservervalidate="cvMobile_ServerValidate" ValidateEmptyText="True" 
                    CssClass="text-red"></asp:CustomValidator>
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
                <asp:CustomValidator ID="cvValidate" runat="server" 
                    ControlToValidate="txtValidate" CssClass="text-red" 
                    onservervalidate="cvValidate_ServerValidate" ValidateEmptyText="True"></asp:CustomValidator>
            </span>
            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" Text="Register" 
                    CssClass="btn btn-block btn-primary" onclick="btnRegister_Click" />
                <asp:Button ID="btnReset" runat="server" Text="Reset" 
                    CssClass="btn btn-block btn-primary" onclick="btnReset_Click"/>
            </div>
            <div class="form-group">
                <span><a href="Login.aspx">登录</a></span>
            </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
