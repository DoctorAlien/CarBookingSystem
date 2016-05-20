<%@ Page Title="" Language="C#" MasterPageFile="~/User/_index.master" AutoEventWireup="true" CodeFile="CarBooking.aspx.cs" Inherits="User_Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div class="context">
		<div>
			<h2>车辆预订</h2>
		</div>
</div>
<hr/>
<div class="context">
    <div class="form-edit" style="float:left">
        <div>
            <div class="form-group">
                <label for="ddlBrand">车辆品牌</label>
                <asp:DropDownList ID="ddlBrand" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlBrand_SelectedIndexChanged">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlType">车辆型号</label>
                <asp:DropDownList ID="ddlType" runat="server">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtStartTime">开始时间</label>
                <asp:TextBox ID="txtStartTime" runat="server" ></asp:TextBox>
                <asp:DropDownList ID="ddlStartTimeHour" runat="server" >
                </asp:DropDownList>
                <asp:DropDownList ID="ddlStartTimeMinute" runat="server">
                </asp:DropDownList>
         &nbsp;<asp:Calendar ID="calStartTime" runat="server" 
                    onselectionchanged="calStartTime_SelectionChanged" 
                    ondayrender="calStartTime_DayRender" ></asp:Calendar>
            </div>
            <div class="form-group">
                <label for="txtEndTime">结束时间</label>
                <asp:TextBox ID="txtEndTime" runat="server"></asp:TextBox>
                <asp:DropDownList ID="ddlEndTimeHour" runat="server">
                </asp:DropDownList>
                <asp:DropDownList ID="ddlEndTimeMinute" runat="server">
                </asp:DropDownList>
          &nbsp;<asp:Calendar ID="calEndTime" runat="server" 
                    onselectionchanged="calEndTime_SelectionChanged" 
                    ondayrender="calEndTime_DayRender"></asp:Calendar>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnBooking" runat="server" Text="可用车辆" 
                    CssClass="btn btn-block btn-primary" onclick="btnBooking_Click" />
                <asp:Button ID="btnReset" runat="server" Text="重置" CssClass="btn btn-block btn-primary" />
            </div>
        </div>
    </div>
    <div style="float:left;width:300px;margin-left:15px;">
        <asp:Panel ID="Panel1" runat="server" Visible="False">
            <h3>可用车辆</h3>
            <div style="margin-top:15px;">
                <asp:Repeater ID="Repeater1" runat="server">
                    <HeaderTemplate>
                    <table style="width:350px">
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
                            <asp:Button ID="btnBookingCar" runat="server" Text="预订该车" CommandArgument='<%#Eval("cid") %>' OnClick="btnBookingCar_Click"/>
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
            </div>
        
        </asp:Panel>
    </div>
</div>
</asp:Content>

