<%@ Page Title="" Language="C#" MasterPageFile="~/New.Master" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="Defect.RegistrationPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table  style="width: 100%" align="center" >
        <tr>
            <td align="right" dir="l">
                &nbsp;</td>
            <td align="left" dir="l">
                <asp:Label ID="LbRegister" runat="server" Text="Register New User"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" dir="rtl">
                <asp:Label ID="lbUsername" runat="server" Text="Username"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" Height="30px" Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="right" style="height: 22px">
                <asp:Label ID="lbPassword" runat="server" Text="Password"></asp:Label>
            </td>
            <td style="height: 22px">
                <asp:TextBox ID="txtPassword" runat="server" Height="30px" TextMode="Password" 
                    Width="200px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Register" runat="server" onclick="Register_Click" 
                    Text="Register" />
            </td>
        </tr>
        <tr>
            <td style="height: 23px">
                </td>
            <td style="height: 23px">
                <asp:Label ID="LbMessage" runat="server" Font-Bold="True" ForeColor="Red" 
                    Text="Label" Visible="False"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>
