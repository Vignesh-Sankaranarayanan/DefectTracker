<%@ Page Title="Login" Language="C#" MasterPageFile="~/New.Master" AutoEventWireup="true" CodeBehind="Login2.aspx.cs" Inherits="Defect.Login2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table align="center" frame="box"  width="100%"     title="Login" >
        <tr>
            <td align="center">
                <asp:Label ID="LblLogin" runat="server" Font-Bold="True" ForeColor="#000066" 
                    Text="Enter Your Login Credentials"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="LblUsername" runat="server" ForeColor="Black" Text="Username"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="TxtUsername" runat="server" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="LblPassword" runat="server" ForeColor="Black" Text="Password"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:TextBox ID="TxtPasword" runat="server" style="margin-left: 0px" 
                    TextMode="Password" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Button ID="BtnLogin" runat="server" onclick="Button1_Click" Text="Submit" 
                    Width="200px" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:HyperLink ID="HyperRegister" runat="server" ForeColor="#000066" 
                    NavigateUrl="~/RegistrationPage.aspx">Register as New user!</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:HyperLink ID="HyperPasswordchange" runat="server" ForeColor="#000066">Change Password!</asp:HyperLink>
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:Label ID="LbError" runat="server" ForeColor="Red" Text="Error Message"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
