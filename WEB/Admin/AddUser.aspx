<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_index.master" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="Admin_AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="context">
		<div>
			<h2>用户添加</h2>
		</div>
</div>
<hr/>
<div class="context">
    <div class="form-edit">
        <div>
            
            <div class="form-group">
                <label for="txtUserName">昵称</label>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtPassword">密码</label>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtName">姓名</label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtEmail">邮箱</label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtMobile">手机</label>
                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <asp:Button ID="btnInsert" runat="server" Text="确认添加" 
                    CssClass="btn btn-primary btn-block" onclick="btnInsert_Click"/></div>
        </div>
    </div>
</div>

</asp:Content>

