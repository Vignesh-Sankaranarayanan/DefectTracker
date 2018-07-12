<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Defect.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .style3
    {
        width: 100%;
    }
    .style3
    {
        width: 777px;
    }
    .style4
    {
        width: 541px;
    }
    .style5
    {
            text-decoration: underline;
        }
    .style6
    {
        width: 541px;
        text-decoration: underline;
    }
        .style7
        {
            width: 541px;
            text-decoration: underline;
            height: 26px;
        }
        .style8
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <span class="main" dir="ltr" style="background-color: #0000FF; color: #0000FF">&nbsp;
</span>
<br class="style5" />
<br class="style5" />
<br class="style5" />
<table class="style3" bgcolor="#99CCFF" frame="box" style="color: #000000">
    <tr>
        <td class="style5" colspan="2" 
            
            style="background-color: #000080; color: #FFFFFF; text-decoration: blink; text-transform: uppercase;">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            Login Here&nbsp;</td>
    </tr>
    <tr>
        <td class="style6" style="background-color: #0000FF; color: #FFFFFF">
            &nbsp;</td>
        <td class="style5" style="background-color: #0000FF; color: #FFFFFF">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7" style="background-color: #0000FF; color: #FFFFFF">
           
            <span class="style5" style="background-color: #0000FF; color: #0000FF">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;</span><asp:Label 
                ID="LblUsername" runat="server" Font-Underline="False" 
                Text="User Name" CssClass="main" style=""></asp:Label>
            </td>
        <td class="style8" style="background-color: #0000FF; color: #FFFFFF">
            <asp:TextBox ID="TxtUsername" runat="server" 
                ontextchanged="TextBox1_TextChanged" CssClass="style5"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style4" style="background-color: #0000FF; color: #FFFFFF">
            <span class="style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </span>
            <asp:Label ID="LblPassword" runat="server" Font-Underline="False" 
                Text="Password" CssClass="main" style=""></asp:Label>
            <span class="style5">&nbsp; &nbsp;</span></td>
        <td style="background-color: #0000FF; color: #FFFFFF">
            <asp:TextBox ID="TxtPasword" runat="server" CssClass="style5" 
                EnableViewState="False" TextMode="Password">
</asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style6" style="background-color: #0000FF; color: #FFFFFF">
            &nbsp;</td>
        <td style="background-color: #0000FF; color: #FFFFFF">
            <asp:Button ID="BtnLogin" runat="server" Text="Login" CssClass="style5" 
                onclick="BtnLogin_Click" />
        </td>
    </tr>
    <tr>
        <td class="style6" style="background-color: #0000FF; color: #FFFFFF">
            &nbsp;</td>
        <td style="background-color: #0000FF; color: #FFFFFF">
            <asp:HyperLink ID="HyperRegister" runat="server" CssClass="style5" 
                NavigateUrl="~/Registration.aspx">New User Register here!</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td class="style6" style="background-color: #0000FF; color: #FFFFFF">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="LbError" runat="server" Font-Bold="True" ForeColor="Red" 
                Visible="False"></asp:Label>
            &nbsp;</td>
        <td style="background-color: #0000FF; color: #FFFFFF">
            <asp:HyperLink ID="HyperPasswordchange" runat="server" CssClass="style5">Change Password!</asp:HyperLink>
            <br />
        </td>
    </tr>
</table>
<br class="style5" />
<br class="style5" />
<br class="style5" />
<span class="style5">&nbsp;</span><br class="style5" />
<br class="style5" />
<br class="style5" />
<br class="style5" />
<span class="style5">&nbsp;</span><br class="style5" />
<br class="style5" />
<br class="style5" />
<br class="style5" />
</asp:Content>
