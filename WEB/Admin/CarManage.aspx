<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/_index.master" AutoEventWireup="true" CodeFile="CarManage.aspx.cs" Inherits="Admin_UserManage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="context">
		<div>
			<h2>汽车管理</h2>
		</div>
	</div>
	<hr/>
    <div class="context">
        <a href="AddCar.aspx" class="btn btn-primary">添加新车型</a>
        <div style="float:right;">
            
            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
            <asp:DropDownList ID="ddlClass" runat="server">
                <asp:ListItem Value="brand_">品牌</asp:ListItem>
                <asp:ListItem Value="type_">型号</asp:ListItem>
            </asp:DropDownList>
            <asp:Button ID="btnSearch" runat="server" onclick="btnSearch_Click" 
                Text="Search" />
            
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
                        <th>编号</th>
                        <th>品牌</th>
                        <th>型号</th>
                        <th>描述</th> 
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("cid") %></td>
                        <td><%#Eval("code_") %></td>
                        <td><%#Eval("brand_") %></td>
                        <td><%#Eval("type_") %></td>
                        <td><%#Eval("description_") %></td>
                        <td>
                            <a href="EditCar.aspx?cid=<%#Eval("cid") %>">编辑</a>
                            <a href="DelCar.aspx?cid=<%#Eval("cid") %>" onclick="return confirm('是否删除?')">删除</a>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                </tbody>
                    <tfoot>
                    <tr>
                        <th>#</th>
                        <th>编号</th>
                        <th>品牌</th>
                        <th>型号</th>
                        <th>描述</th> 
                        <th>操作</th>
                    </tr>
                </tfoot>
            </table>
                </FooterTemplate>
            </asp:Repeater>
            
			<!--<table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>编号</th>
                        <th>品牌</th>
                        <th>型号</th>
                        <th>描述</th> 
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>1000</td>
                        <td>奔驰</td>
                        <td>小</td>
                        <td>无描述</td>
                        <td>编辑 删除</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1000</td>
                        <td>奔驰</td>
                        <td>小</td>
                        <td>无描述</td>
                        <td>编辑 删除</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1000</td>
                        <td>奔驰</td>
                        <td>小</td>
                        <td>无描述</td>
                        <td>编辑 删除</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1000</td>
                        <td>奔驰</td>
                        <td>小</td>
                        <td>无描述</td>
                        <td>编辑 删除</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1000</td>
                        <td>奔驰</td>
                        <td>小</td>
                        <td>无描述</td>
                        <td>编辑 删除</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td>1000</td>
                        <td>奔驰</td>
                        <td>小</td>
                        <td>无描述</td>
                        <td>编辑 删除</td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr>
                        <th>#</th>
                        <th>编号</th>
                        <th>品牌</th>
                        <th>型号</th>
                        <th>描述</th> 
                        <th>操作</th>
                    </tr>
                </tfoot>
            </table>-->
		</div>
	</div>
</asp:Content>

