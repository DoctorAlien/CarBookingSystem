<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_index.master" AutoEventWireup="true" CodeFile="UserManage.aspx.cs" Inherits="Admin_UserManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="context">
		<div>
			<h2>用户管理</h2>
		</div>
	</div>
	<hr/>
    <div class="context">
        <a href="AddUser.aspx" class="btn btn-primary">添加新用户</a>
        <div style="float:right;">
            
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:DropDownList ID="ddlClass" runat="server">
                <asp:ListItem Value="username_">用户名</asp:ListItem>
                <asp:ListItem Value="name_">真实姓名</asp:ListItem>
                <asp:ListItem Value="email_">邮箱地址</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnSearch" runat="server" Text="Search" 
                onclick="btnSearch_Click" />
            
        </div>
    </div>
	<div class="context">
        <div>
			<asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>邮箱</th> 
                        <th>手机号</th>
                        <th>注册时间</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("uid") %></td>
                        <td><%#Eval("username_") %></td>
                        <td><%#Eval("name_") %></td>
                        <td><%#Eval("email_") %></td>
                        <td><%#Eval("mobile_") %></td>
                        <td><%#Eval("reg_time") %></td>
                        <td>
                            <a href="EditUser.aspx?uid=<%#Eval("uid") %>">编辑</a>
                            <a href="DelUser.aspx?uid=<%#Eval("uid") %>" onclick="return confirm('是否删除?')">删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                </tbody>
                    <tfoot>
                    <tr>
                        <th>#</th>
                        <th>用户名</th>
                        <th>真实姓名</th>
                        <th>邮箱</th> 
                        <th>手机号</th>
                        <th>注册时间</th>
                        <th>操作</th>
                    </tr>
                </tfoot>
            </table>
                </FooterTemplate>
            </asp:Repeater>
		</div>
	</div>

</asp:Content>

