<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DefectSearch.aspx.cs" Inherits="Defect.WebForm3" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style4
    {
        width: 507px;
    }
    .style12
    {
        width: 232px;
    }
    .style6
    {
        width: 220px;
    }
    .style8
    {
        width: 232px;
        height: 25px;
    }
    .style9
    {
        width: 220px;
        height: 25px;
    }
    .style10
    {
        width: 125px;
        height: 25px;
    }
    .style11
    {
        height: 25px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1" 
            
        style="background-color: #808080; color: #000000; font-size: medium; font-weight: bold; font-family: Calibri;">
    <tr>
        <td class="style12">
                    &nbsp;</td>
        <td class="style6">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Label 
            ID="lbMessage" runat="server" Visible="False" Font-Bold="True" Font-Italic="True" 
                        ForeColor="Red"></asp:Label>
                    &nbsp;</td>
        <td class="style7">
                    &nbsp;</td>
        <td>
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style12">
            <asp:Label ID="LBDefectID" runat="server" Text="Defect ID"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtDefectID" runat="server" Enabled="False"></asp:TextBox>
        </td>
        <td class="style7">
            <asp:Label ID="lbProject" runat="server" Text="Project"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DdlProject" runat="server" Enabled="False">
                <asp:ListItem>R15</asp:ListItem>
                <asp:ListItem>R14</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style12">
            <asp:Label ID="LBDefectName" runat="server" Text="Defect Name"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="TxtDefectName" runat="server" Enabled="False"></asp:TextBox>
        </td>
        <td class="style7">
            <asp:Label ID="LBTester" runat="server" Text="Tester"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DDlTester" runat="server" Enabled="False">
                <asp:ListItem>Vignesh</asp:ListItem>
                <asp:ListItem>Srini</asp:ListItem>
                <asp:ListItem>Siva</asp:ListItem>
                <asp:ListItem>Vijay</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style12">
            <asp:Label ID="LBStatus" runat="server" Text="Status"></asp:Label>
        </td>
        <td class="style6">
            <asp:DropDownList ID="DDLStatus1" runat="server" Enabled="False">
                <asp:ListItem>Open</asp:ListItem>
                <asp:ListItem>Close</asp:ListItem>
                <asp:ListItem>Onhold</asp:ListItem>
                <asp:ListItem>Fixed</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style7">
            <asp:Label ID="LBTCAssociated" runat="server" Text="Testcases Associated"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="TxtTcAssociated" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style12">
            <asp:Label ID="LBDate" runat="server" Text="Date"></asp:Label>
        </td>
        <td class="style6">
            <asp:TextBox ID="txtDate" runat="server" Enabled="False"></asp:TextBox>
        </td>
        <td class="style7">
            <asp:Label ID="LbModule" runat="server" Text="Module"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DDlModule" runat="server" Enabled="False">
                <asp:ListItem>Outbox</asp:ListItem>
                <asp:ListItem>WWHP</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style8">
            <asp:Label ID="LBCycle" runat="server" Text="Cycle"></asp:Label>
        </td>
        <td class="style9">
            <asp:DropDownList ID="DDlCycle" runat="server" Enabled="False">
                <asp:ListItem>System Testing</asp:ListItem>
                <asp:ListItem>Regression</asp:ListItem>
                <asp:ListItem>P2P</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style10">
            <asp:Label ID="lbupdatedate" runat="server" Text="Last updated"></asp:Label>
        </td>
        <td class="style11">
            <asp:TextBox ID="TxtLastupdated" runat="server" Enabled="False"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style12">
                    &nbsp;</td>
        <td class="style6">
                    &nbsp;</td>
        <td class="style7">
            <asp:Label ID="lbAssignedto" runat="server" Text="Assigned To"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DDlAssignedto" runat="server" Enabled="False">
                <asp:ListItem>Selva</asp:ListItem>
                <asp:ListItem>Karthik</asp:ListItem>
                <asp:ListItem>Senthil</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style12">
                    &nbsp;</td>
        <td class="style6">
                    &nbsp;</td>
        <td class="style7">
            <asp:Label ID="LBComments" runat="server" Text="Comments"></asp:Label>
        </td>
        <td>
            <asp:TextBox ID="txtComments" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style12">
            <asp:Label ID="lbSteps" 
            runat="server" Text="Steps to Reproduce"></asp:Label>
        </td>
        <td class="style6">
                    &nbsp;</td>
        <td class="style7">
            <asp:Label ID="LBAttachments" runat="server" Text="Attachments"></asp:Label>
        </td>
        <td>
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style12">
                    &nbsp;</td>
        <td class="style6">
                    &nbsp;</td>
        <td class="style7" colspan="2">
            <asp:FileUpload ID="FileUpload" runat="server" />
            <asp:Button ID="BtnUpload" runat="server" onclick="BtnUpload_Click" 
                        Text="Upload" />
        </td>
    </tr>
    <tr>
        <td class="style5" colspan="4">
            <FTB:FreeTextBox ID="txtDescription" runat="server" Height="150px" 
                        Width="225px" ButtonWidth="50">
            </FTB:FreeTextBox>
        </td>
    </tr>
    <tr>
        <td class="style12">
            <asp:GridView ID="GridDefectSearch" runat="server" 
                        EnablePersistedSelection="True" BackColor="White" BorderColor="#CC9966" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4">
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
        <td class="style6">
                    &nbsp;</td>
        <td class="style7">
            <asp:GridView ID="GridViewAttachments" runat="server" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        onrowcommand="GridViewAttachments_RowCommand" 
                        style="margin-left: 0px; margin-bottom: 0px" Width="52px">
                <Columns>
                    <asp:TemplateField HeaderText="File">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton" runat="server" 
                                        CommandArgument='<%# Eval("File") %>' CommandName="Download" 
                                        Text='<%# Eval("File") %>'></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
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
        <td class="style12">
            <asp:Button ID="BtnEditDefect" 
            runat="server" onclick="BtnEditDefect_Click" Text="Edit the Defect Details" />
        </td>
        <td class="style6">
                    &nbsp;</td>
        <td class="style7">
            <asp:Button 
            ID="BtnBacktoHomepage" runat="server" onclick="BtnBacktoHomepage_Click" 
            Text="Back to Home Page" />
        </td>
        <td>
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style12">
            <asp:Button ID="BtnSaveEditted" runat="server" Enabled="False" 
            Text="Save Editted" Width="209px" onclick="BtnSaveEditted_Click" />
        </td>
        <td class="style6">
                    &nbsp;</td>
        <td class="style7">
                    &nbsp;</td>
        <td>
                    &nbsp;</td>
    </tr>
</table>
</asp:Content>
