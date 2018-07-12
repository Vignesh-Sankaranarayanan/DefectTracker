<%@ Page Title="Advanced Defect Search" Language="C#" MasterPageFile="~/New.Master" AutoEventWireup="true" CodeBehind="AdvancedDefectSearchPage.aspx.cs" Inherits="Defect.AdvancedDefectSearchPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
        <tr>
            <td colspan="4">
                <asp:Label ID="LbMessage" runat="server" Font-Bold="True" Font-Italic="True" 
                    ForeColor="#FF3300" 
                    Text="Please enter FROM DATE as lesser value than TO DATE/ Valid Date Range" 
                    Visible="False"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 491px">
                <asp:Label ID="lbfordefectrange" runat="server" 
                    Text="Please select the required search items"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 491px">
                <asp:Label ID="LbFromDate0" runat="server" Text="From Date"></asp:Label>
                <asp:TextBox ID="txtfromdate" runat="server" CausesValidation="True" 
                    Enabled="False" ontextchanged="txtfromdate_TextChanged" ReadOnly="true"></asp:TextBox>
                <asp:Button ID="Btnfromdate" runat="server" onclick="Btnfromdate_Click" 
                    Text="Select" />
            </td>
            <td>
                &nbsp;</td>
            <td nowrap="nowrap">
                <asp:Label ID="LbToDate0" runat="server" Text="To Date"></asp:Label>
                <asp:TextBox ID="txtTodate" runat="server" CausesValidation="True" 
                    Enabled="False" ontextchanged="txtTodate_TextChanged"></asp:TextBox>
                <asp:Button ID="Btntodate" runat="server" onclick="Btntodate_Click" 
                    Text="Select" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 491px">
                <asp:Calendar ID="Calendarfrom" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    onselectionchanged="Calendar_SelectionChanged" ShowGridLines="True" 
                    style="margin-left: 32px" Visible="False" Width="220px">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Calendar ID="CalendartoDate" runat="server" BackColor="#FFFFCC" 
                    BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" 
                    Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
                    onselectionchanged="Calendar_SelectionChanged" ShowGridLines="True" 
                    style="margin-left: 40px" Visible="False" Width="220px">
                    <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                    <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                    <OtherMonthDayStyle ForeColor="#CC9966" />
                    <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                    <SelectorStyle BackColor="#FFCC66" />
                    <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                        ForeColor="#FFFFCC" />
                    <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                </asp:Calendar>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 491px">
                <asp:Label ID="lbDefectname" runat="server" Text="Defect Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtDefectname" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lbAssignedto" runat="server" Text="AssignedTo"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLAssignedto" runat="server">
                    <asp:ListItem>Selva</asp:ListItem>
                    <asp:ListItem>Karthik</asp:ListItem>
                    <asp:ListItem>Senthil</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 491px">
                <asp:Label ID="LbTester" runat="server" Text="Tester"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLTester" runat="server">
                    <asp:ListItem>Vignesh</asp:ListItem>
                    <asp:ListItem>Srini</asp:ListItem>
                    <asp:ListItem>Vijay</asp:ListItem>
                    <asp:ListItem>Siva</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lbStatus" runat="server" Text="Status"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDlStatus" runat="server">
                    <asp:ListItem>Open</asp:ListItem>
                    <asp:ListItem>Close</asp:ListItem>
                    <asp:ListItem>Fixed</asp:ListItem>
                    <asp:ListItem>Onhold</asp:ListItem>
                    <asp:ListItem>ReOpen</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 491px">
                <asp:Label ID="LbProject" runat="server" Text="Project"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLProjectname" runat="server">
                    <asp:ListItem>ProjectA</asp:ListItem>
                    <asp:ListItem>ProjectB</asp:ListItem>
                    <asp:ListItem>ProjectC</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="LbEnvironment" runat="server" Text="Environment"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLEnvironment" runat="server">
                    <asp:ListItem>SIT1</asp:ListItem>
                    <asp:ListItem>SIT2</asp:ListItem>
                    <asp:ListItem>DEV1</asp:ListItem>
                    <asp:ListItem>DEV2</asp:ListItem>
                    <asp:ListItem>Production</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 491px">
                <asp:Label ID="lbModule" runat="server" Text="Module/Component"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLModule" runat="server">
                    <asp:ListItem>CEEUI</asp:ListItem>
                    <asp:ListItem>CMT</asp:ListItem>
                    <asp:ListItem></asp:ListItem>
                    <asp:ListItem>Adapter</asp:ListItem>
                    <asp:ListItem>Creation</asp:ListItem>
                    <asp:ListItem>Delivery</asp:ListItem>
                    <asp:ListItem>Disposition</asp:ListItem>
                    <asp:ListItem>Billing</asp:ListItem>
                    <asp:ListItem>EDW2Push</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lbRelease" runat="server" Text="Release"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLProject" runat="server">
                    <asp:ListItem>R15</asp:ListItem>
                    <asp:ListItem>R14</asp:ListItem>
                    <asp:ListItem>R16</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 491px">
                <asp:Label ID="LBCycle" runat="server" Text="Test Cycle"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLCycle" runat="server">
                    <asp:ListItem>System Testing</asp:ListItem>
                    <asp:ListItem>Regression</asp:ListItem>
                    <asp:ListItem>P2P</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 491px">
                &nbsp;</td>
            <td>
                <asp:Button ID="BtnSearch" runat="server" onclick="BtnSearch_Click" 
                    Text="Search" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="4">
                <asp:GridView ID="GridAdvancedSearch" runat="server" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" DataKeyNames="Defectid" EmptyDataText="No Items to show" 
                    ForeColor="Black" GridLines="None" ShowHeaderWhenEmpty="True" Width="100%">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <FooterStyle BackColor="Tan" />
                    <HeaderStyle BackColor="Tan" Font-Bold="True" />
                    <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" 
                        HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                    <SortedAscendingCellStyle BackColor="#FAFAE7" />
                    <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                    <SortedDescendingCellStyle BackColor="#E1DB9C" />
                    <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 491px" align="right" dir="rtl">
                <asp:Button ID="BtnExport" runat="server" onclick="BtnExport_Click" 
                    Text="Export to Excel" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 491px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
