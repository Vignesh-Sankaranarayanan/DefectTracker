<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Defect History.aspx.cs" Inherits="Defect.WebForm4" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
    }
    .style3
    {
        width: 465px;
    }
    .style5
    {
        height: 222px;
    }
    .style6
    {
        width: 465px;
        height: 91px;
    }
    .style7
    {
        width: 143%;
    }
    .style8
    {
    }
    .style9
    {
        height: 67px;
    }
        .style10
        {
            width: 97px;
        }
        .style11
        {
            height: 67px;
            width: 97px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style7" 
    
        style="background-color: #808080; color: #000000; height: 527px; font-size: medium; font-weight: bold; font-family: Calibri;">
    <tr>
        <td class="style8" colspan="2">
            <asp:Label ID="lbmessage" runat="server" 
                Text="Please enter a valid DefectID and Search" Visible="False"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" class="style11" dir="rtl">
            <br />
            <asp:Label ID="LbHistory" runat="server" Text="Search the Defect History"></asp:Label>
        </td>
        <td class="style9">
            <asp:TextBox ID="TxtHistorySearch0" runat="server"></asp:TextBox>
            <asp:Button ID="BtnHistorySearch" runat="server" Text="History Search" 
                    onclick="BtnHistorySearch0_Click" />
            </td>
        <td class="style9">
        </td>
    </tr>
    <tr>
        <td class="style8" colspan="2" rowspan="2" valign="top">
            <asp:GridView ID="GridHistory" runat="server" BackColor="White" 
                BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
