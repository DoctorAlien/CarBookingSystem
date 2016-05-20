<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_index.master" AutoEventWireup="true" CodeFile="AddCar.aspx.cs" Inherits="Admin_AddUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="context">
		<div>
			<h2>车辆添加</h2>
		</div>
</div>
<hr/>
<div class="context">
    <div class="form-edit">
        <div>
            
            <div class="form-group">
                <label for="txtCode">编号</label>
                <asp:TextBox ID="txtCode" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtBrand">品牌</label>
                <asp:TextBox ID="txtBrand" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtType">型号</label>
                <asp:TextBox ID="txtType" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <label for="txtDescription">描述</label>
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox></div>
            <div class="form-group">
                <asp:Button ID="btnInsert" runat="server" Text="确认添加" 
                    CssClass="btn btn-primary btn-block" onclick="btnInsert_Click" /></div>
        </div>
    </div>
</div>

</asp:Content>

