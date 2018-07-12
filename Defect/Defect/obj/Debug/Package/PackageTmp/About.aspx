<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="About.aspx.cs" Inherits="Defect.About" %>
    <%@ MasterType VirtualPath="~/Site.Master" %>

<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">

    .style9
    {
        height: 28px;
    }
    .style14
    {
        width: 161px;
        height: 28px;
    }
    .style12
    {
        width: 173px;
        height: 28px;
    }
    .style11
    {
        width: 375px;
        height: 28px;
    }
    .style13
    {
        width: 173px;
        height: 29px;
    }
    .style7
    {
        width: 407px;
        height: 29px;
    }
    .style10
    {
        width: 251px;
        height: 25px;
    }
        .style4
    {
        width: 161px;
        height: 25px;
    }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About
        Defect Tracker</h2>
    <p>
        This application tracks all the defect related details of a project.
            <asp:Label ID="lbmessage" runat="server" Text="Label"></asp:Label>
            <asp:GridView ID="GridHistory" runat="server" EnablePersistedSelection="True" 
                    AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" 
                    BorderWidth="1px" CellPadding="4">
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
    </p>
</asp:Content>
