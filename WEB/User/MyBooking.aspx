<%@ Page Title="" Language="C#" MasterPageFile="~/User/_index.master" AutoEventWireup="true" CodeFile="MyBooking.aspx.cs" Inherits="User_MyBooking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="context">
		<div>
			<h2>我的预约</h2>
		</div>
	</div>
	<hr/>
	<div class="context">
        <div>
			<asp:Repeater ID="Repeater1" runat="server">
                <HeaderTemplate>
                    <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th>车辆编号</th>
                        <th>开始时间</th>
                        <th>结束时间</th> 
                        <th>描述</th>
                        <th>创建时间</th>
                    </tr>
                </thead>
                <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("id") %></td>
                        <td><%#Eval("cid") %></td>
                        <td><%#Eval("start_time") %></td>
                        <td><%#Eval("end_time") %></th> 
                        <td><%#Eval("description_") %></td>
                        <td><%#Eval("create_time") %></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                </tbody>
                    <tfoot>
                    <tr>
                        <th>#</th>
                        <th>车辆编号</th>
                        <th>开始时间</th>
                        <th>结束时间</th> 
                        <th>描述</th>
                        <th>创建时间</th>
                    </tr>
                </tfoot>
            </table>
                </FooterTemplate>
            </asp:Repeater>
		</div>
	</div>

</asp:Content>

