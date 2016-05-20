<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_index.master" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="Admin_EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="context">
		<div>
			<h2>用户编辑</h2>
		</div>
</div>
<hr/>
<div class="context">
    <div class="form-edit">
        <div>
            <div class="form-group">
                <label for="txtCid">&nbsp;&nbsp;&nbsp;#</label>
                <asp:TextBox ID="txtUid" runat="server" Enabled="False"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtCode">昵称</label>
                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtBrand">密码</label>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtType">名字</label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtDescription">邮箱</label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtDescription">手机</label>
                <asp:TextBox ID="txtMobile" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtDescription">注册时间</label>
                <asp:TextBox ID="txtRegTime" runat="server" Enabled="False"></asp:TextBox></div>
            <div class="form-group">
                <asp:Button ID="btnEdit" runat="server" Text="确认修改" 
                    CssClass="btn btn-primary btn-block" onclick="btnEdit_Click" /></div>
        </div>
    </div>
</div>
</asp:Content>

