<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdvancedSearch.aspx.cs" Inherits="Defect.AdvancedSearch" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            height: 496px;
        }
        .style2
        {
        }
        .style3
        {
            width: 411px;
        }
        .style4
        {
            width: 313px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1" 
        style="background-color: #808080; color: #000000; font-size: medium; font-family: Calibri; font-weight: bold;">
        <tr>
            <td class="style3" style="background-color: #808080; color: #000000">
                <asp:Label ID="LbMessage" runat="server" Font-Bold="True" Font-Italic="True" 
                    ForeColor="#FF3300" 
                    Text="Please enter FROM DATE as lesser value than TO DATE/ Valid Date Range" 
                    Visible="False"></asp:Label>
            </td>
            <td class="style4" style="background-color: #808080; color: #000000">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #808080; color: #000000">
                
                <asp:Label ID="lbfordefectrange" runat="server" 
                    Text="Search for the defects raised between the date range"></asp:Label>
                
            </td>
            <td class="style4" style="background-color: #808080; color: #000000">
        
            </td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #808080; color: #000000"> <asp:Label ID="LbFromDate0" runat="server" Text="From Date"></asp:Label> &nbsp;
       <asp:TextBox ID="txtfromdate" runat="server" ReadOnly = "true" CausesValidation="True" 
                    ontextchanged="txtfromdate_TextChanged"></asp:TextBox>
                <asp:Button ID="Btnfromdate" runat="server" onclick="Btnfromdate_Click" 
                    Text="Select" />
            </td>
            <td class="style4" style="background-color: #808080; color: #000000">
               <asp:Label ID="LbToDate0" runat="server" Text="To Date"></asp:Label> &nbsp; <asp:TextBox 
            ID="txtTodate" runat="server" CausesValidation="True" 
                    ontextchanged="txtTodate_TextChanged"></asp:TextBox>
                <asp:Button ID="Btntodate" runat="server" onclick="Btntodate_Click" 
                    Text="Select" />
            </td>
        </tr>
        <tr>
            <td class="style3" style="background-color: #808080; color: #000000">
                <asp:Calendar ID="Calendarfrom" runat="server" BackColor="#FFFFCC" 
            BorderColor="#FFCC66" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
            Width="220px" BorderWidth="1px" 
            onselectionchanged="Calendar_SelectionChanged" SelectedDate="2014-03-21" 
            ShowGridLines="True" style="margin-left: 32px" Visible="False">
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
            <td class="style4" style="background-color: #808080; color: #000000">
                <asp:Calendar ID="CalendartoDate" runat="server" BackColor="#FFFFCC" 
            BorderColor="#FFCC66" DayNameFormat="Shortest" 
            Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" 
            Width="220px" BorderWidth="1px" 
            onselectionchanged="Calendar_SelectionChanged" SelectedDate="2014-03-21" 
            ShowGridLines="True" style="margin-left: 40px" Visible="False">
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
        </tr>
        <tr align="right">
            <td class="style2" 
                style="background-color: #808080; color: #000000" align="right" dir="rtl">
                <asp:Button ID="BtnSearch" runat="server" onclick="BtnSearch_Click" 
                    Text="Search"  />
            </td>
            <td class="style2" 
                style="background-color: #808080; color: #000000" align="right">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" colspan="2" 
                style="background-color: #808080; color: #000000">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:GridView ID="GridAdvancedSearch" runat="server" Width="933px" 
                    AllowPaging="True" BackColor="White" BorderColor="#CC9966" BorderStyle="None" 
                    BorderWidth="1px" CellPadding="4" AllowSorting="True" 
                    AutoGenerateColumns="False" DataKeyNames="Defectid" 
                    DataSourceID="SqlDataSource1">
                    <Columns>
                        <asp:BoundField DataField="Defectid" HeaderText="Defectid" ReadOnly="True" 
                            SortExpression="Defectid" />
                        <asp:BoundField DataField="DefectName" HeaderText="DefectName" 
                            SortExpression="DefectName" />
                        <asp:BoundField DataField="Status" HeaderText="Status" 
                            SortExpression="Status" />
                        <asp:BoundField DataField="SDate" HeaderText="SDate" SortExpression="SDate" />
                        <asp:BoundField DataField="SCycle" HeaderText="SCycle" 
                            SortExpression="SCycle" />
                        <asp:BoundField DataField="Description" HeaderText="Description" 
                            SortExpression="Description" />
                        <asp:BoundField DataField="Project" HeaderText="Project" 
                            SortExpression="Project" />
                        <asp:BoundField DataField="Tester" HeaderText="Tester" 
                            SortExpression="Tester" />
                        <asp:BoundField DataField="Module" HeaderText="Module" 
                            SortExpression="Module" />
                        <asp:BoundField DataField="AssignedTo" HeaderText="AssignedTo" 
                            SortExpression="AssignedTo" />
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
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:teradata %>" 
                    ProviderName="<%$ ConnectionStrings:teradata.ProviderName %>" 
                    SelectCommand="Select DefectID,DefectName,Status,sDate,sCycle,Description,Project,Tester,Module,AssignedTo from  coebatch.tbl_Defect order by defectid asc">
                </asp:SqlDataSource>
                <br />
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="BtnExport" runat="server" onclick="BtnExport_Click" 
                    Text="Export to Excel" />
            </td>
        </tr>
    </table>
    
</asp:Content>
