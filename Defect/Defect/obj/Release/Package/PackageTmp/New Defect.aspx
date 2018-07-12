<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="New Defect.aspx.cs" Inherits="Defect.WebForm2" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<%@ Register assembly="FreeTextBox" namespace="FreeTextBoxControls" tagprefix="FTB" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        #TextArea1
        {
            height: 117px;
            width: 293px;
        }
        .style1
        {
            width: 100%;
            margin-right: 0px;
        }
        .style3
        {
            width: 407px;
        }
        .style2
        {
            width: 460px;
        }
        .style4
    {
        width: 118px;
        height: 25px;
    }
    .style6
    {
        width: 460px;
        height: 29px;
    }
    .style7
    {
        width: 407px;
        height: 29px;
    }
    .style5
    {
        width: 407px;
        height: 25px;
    }
    .style11
    {
        width: 375px;
        height: 28px;
    }
    .style13
    {
        width: 75px;
        height: 29px;
    }
    .style14
    {
        width: 118px;
        height: 28px;
    }
    .style15
    {
        width: 75px;
        height: 28px;
    }
    .style16
    {
        height: 28px;
    }
    .style17
    {
        width: 40px;
        height: 25px;
    }
    .style18
    {
        width: 40px;
        height: 28px;
    }
    </style>
    <script language="javascript" type="text/javascript">
// <![CDATA[

        function TextArea1_onclick() {

        }

// ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1" 
            
    
        style="background-color: #808080; color: #000000; margin-top: 0px; font-size: medium; font-weight: bold; font-family: Calibri;">
    <tr>
        <td class="style18" align="right" dir="rtl">
            <asp:Label ID="lbMessage" runat="server" ForeColor="Red" Text="Label" 
                Visible="False"></asp:Label>
        </td>
        <td class="style14" align="left">
            &nbsp;</td>
        <td class="style15" align="right" dir="rtl">
            &nbsp;</td>
        <td class="style11" align="left">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl">
&nbsp;<asp:Label ID="LBDefectID" runat="server" Text="Defect ID"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        <td class="style14" align="left">
            <asp:TextBox ID="TxtDefectID" runat="server" style="margin-left: 0px"></asp:TextBox>
        </td>
        <td class="style15" align="right" dir="rtl">
            <asp:Label ID="lbProject" runat="server" Text="Project"></asp:Label>
        </td>
        <td class="style11" align="left">
            &nbsp;<asp:DropDownList ID="DdlProject" runat="server">
                <asp:ListItem Selected="True">R15</asp:ListItem>
                <asp:ListItem>R14</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl" valign="bottom">
                    &nbsp;<asp:Label ID="LBDefectName" runat="server" Text="Defect Name"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;</td>
        <td class="style14" align="left" valign="bottom">
            <asp:TextBox ID="TxtDefectName" runat="server"></asp:TextBox>
        </td>
        <td class="style15" align="right" dir="rtl">
            <asp:Label ID="LBTester" runat="server" Text="Tester"></asp:Label>
        </td>
        <td class="style3" align="left">
                    &nbsp;<asp:DropDownList ID="DDlTester" runat="server">
                <asp:ListItem>Vignesh</asp:ListItem>
                <asp:ListItem>Srini</asp:ListItem>
                <asp:ListItem>Siva</asp:ListItem>
                <asp:ListItem>Vijay</asp:ListItem>
            </asp:DropDownList>
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl">
            <asp:Label ID="LBStatus" runat="server" Text="Status"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        <td class="style14" align="left">
            <asp:DropDownList 
                        ID="DDLStatus" runat="server" Enabled="False">
                <asp:ListItem Selected="True">Open</asp:ListItem>
                <asp:ListItem>Close</asp:ListItem>
                <asp:ListItem>Fixed</asp:ListItem>
                <asp:ListItem>Onhold</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style15" align="right" dir="rtl">
            <asp:Label ID="LBTCAssociated" runat="server" Text="Testcases Associated"></asp:Label>
        </td>
        <td class="style3" align="left">
                    &nbsp;<asp:TextBox ID="TxtTcAssociated" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;
            </td>
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl">
            <asp:Label ID="LBDate" runat="server" Text="Date"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        <td class="style14" align="left">
            <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
        </td>
        <td class="style15" align="right" dir="rtl">
            <asp:Label ID="LbModule" runat="server" Text="Module"></asp:Label>
        </td>
        <td class="style3" align="left">
            <asp:DropDownList ID="DDlModule" runat="server">
                <asp:ListItem>Outbox</asp:ListItem>
                <asp:ListItem>WWHP</asp:ListItem>
                <asp:ListItem>CMT</asp:ListItem>
            </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl">
            <asp:Label ID="LBCycle" runat="server" Text="Cycle"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        <td class="style14" align="left">
            <asp:DropDownList ID="DDlCycle" runat="server">
                <asp:ListItem>System Testing</asp:ListItem>
                <asp:ListItem>Regression</asp:ListItem>
                <asp:ListItem>P2P</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style15" align="right" dir="rtl">
            <asp:Label ID="lbupdatedate" runat="server" Text="Last updated"></asp:Label>
        </td>
        <td class="style3" align="left">
                    &nbsp;<asp:TextBox ID="TxtLastupdated" runat="server"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl">
            &nbsp;</td>
        <td class="style14" align="left">
            &nbsp;</td>
        <td class="style15" align="right" dir="rtl">
            <asp:Label ID="lbAssignedto" runat="server" Text="Assigned To"></asp:Label>
        </td>
        <td class="style3" align="left">
                    &nbsp;<asp:DropDownList ID="DDlAssignedto" runat="server">
                <asp:ListItem>Selva</asp:ListItem>
                <asp:ListItem>Karthik</asp:ListItem>
                <asp:ListItem>Senthil</asp:ListItem>
            </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl">
        </td>
        <td class="style14" align="left">
            &nbsp;</td>
        <td class="style13" align="right" dir="rtl">
            &nbsp;</td>
        <td class="style7" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style17" align="right" dir="rtl">
            &nbsp;</td>
        <td class="style4" align="left">
            &nbsp;</td>
        <td class="style15" align="right" dir="rtl">
            &nbsp;</td>
        <td class="style5" align="left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
            <asp:Label ID="LBAttachments" runat="server" Text="Attachments"></asp:Label>
                    &nbsp;</td>
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl">
            <asp:Label ID="LBSteps" 
            runat="server" Text="Steps To Reproduce"></asp:Label>
        </td>
        <td class="style14" align="left">
            &nbsp;</td>
        <td class="style15" align="right" dir="rtl">
        </td>
        <td class="style11" align="left">
                    &nbsp;&nbsp;<asp:FileUpload ID="FileUpload" runat="server" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                    &nbsp;<br />
            <asp:Button ID="BtnAdd" runat="server" onclick="BtnAdd_Click" Text="Add" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="BtnCancel" runat="server" onclick="BtnCancel_Click" 
                        Text="Cancel" />
        </td>
    </tr>
    <tr>
        <td class="style16" align="left" dir="ltr" colspan="3">
            <FTB:FreeTextBox ID="TxtSteps" runat="server">
            </FTB:FreeTextBox>
        </td>
        <td class="style11" align="left" valign="top">
            <asp:GridView ID="GridViewAttachments" runat="server" 
                        AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" 
                        BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        onrowcommand="GridViewAttachments_RowCommand" 
                        style="margin-left: 0px; margin-bottom: 0px" Width="211px" 
                        AllowPaging="True">
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
    </tr>
    <tr>
        <td class="style18" align="right" dir="rtl">
            &nbsp;</td>
        <td class="style14" align="left">
            <asp:Button ID="BtnBack" runat="server" Text="Back" onclick="BtnBack_Click" />
                    </td>
        <td class="style15" align="right" dir="rtl">
            <asp:Button ID="BtnEnter" runat="server" Text="Enter" 
            onclick="BtnEnter_Click" />
                    </td>
        <td class="style11" align="left">
            &nbsp;</td>
    </tr>
</table>
    </asp:Content>
