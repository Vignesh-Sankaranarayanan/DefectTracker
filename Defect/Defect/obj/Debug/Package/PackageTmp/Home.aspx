<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Defect.WebForm1" %>
<%@ MasterType VirtualPath="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .columnscss
{
width:150px;
font-weight:bold;
font-family:Verdana;
}

        .style6
        {
            width: 292px;
        }
        .style30
    {
        width: 100%;
    }
    .style31
    {
        width: 169px;
    }
    .style32
    {
        width: 133px;
    }
    .style33
    {
        width: 172px;
    }
    .style34
    {
        width: 172px;
        height: 30px;
    }
    .style35
    {
        width: 169px;
        height: 30px;
    }
    .style36
    {
        height: 30px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style30" 
        style="background-color: #808080; color: #000000; font-size: medium; font-weight: bold; font-family: Calibri;">
    <tr>
        <td class="style33">
            &nbsp;</td>
        <td class="style31">
            <asp:Label ID="LbMessage" runat="server" Font-Bold="True" Font-Italic="True" 
            ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        </td>
        <td align="right" dir="rtl">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="right" class="style34" dir="rtl">
            <asp:Label ID="lbNewdefect" runat="server" Text="Add New Defect"></asp:Label>
        </td>
        <td class="style35">
            <asp:Button ID="BtnNewDefect" runat="server" onclick="BtnNewDefect_Click" 
            Text="New Defect" />
        </td>
        <td align="right" class="style36" dir="rtl">
            <asp:Label ID="lbdefectsearch" runat="server" Text="Search for a Defect"></asp:Label>
        </td>
        <td class="style36">
            <asp:TextBox ID="TxtDefectSearch" runat="server" BorderColor="#000066"></asp:TextBox>
            <asp:Button ID="BtnDefectSearch" runat="server" Text="Search" 
                        Width="124px" onclick="BtnDefectSearch_Click1" />
        </td>
    </tr>
    <tr>
        <td class="style33">
            &nbsp;</td>
        <td class="style31">
            &nbsp;</td>
        <td align="right" dir="rtl">
            <asp:Label ID="searchhistory" runat="server" Text="Search for a defect history"></asp:Label>
        </td>
        <td>
            <asp:Button 
            ID="BtnDefectHistory" runat="server" Text="Defect History" 
            onclick="BtnDefectHistory_Click" />
        </td>
    </tr>
    <tr>
        <td class="style33">
            &nbsp;</td>
        <td class="style31">
            &nbsp;</td>
        <td align="right" dir="rtl">
            <asp:Label ID="LbAdvancedsearch" runat="server" Text="Advanced Defect Search"></asp:Label>
        </td>
        <td>
            <asp:Button ID="BtnAdvancedSearch" runat="server" Text="Advanced Search" 
            onclick="BtnAdvancedSearch_Click" />
        </td>
    </tr>
    <tr>
        <td class="style33">
            &nbsp;</td>
        <td class="style31">
            &nbsp;</td>
        <td align="right" dir="rtl">
            <asp:Label ID="LbExport" runat="server" Text="Export the Defect details"></asp:Label>
        </td>
        <td>
            <asp:Button ID="BtnExport" runat="server" onclick="BtnExport_Click" 
                        Text="Export to Excel" />
        </td>
    </tr>
    <tr>
        <td align="left" class="style32" colspan="4" dir="ltr">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
            AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="Defectid" 
            DataSourceID="teradata" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                        style="margin-right: 0px" Width="109px" BackColor="White" 
                        BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                        Height="16px" HorizontalAlign="Left">
                <AlternatingRowStyle Height="5px" HorizontalAlign="Left" VerticalAlign="Bottom" 
                            Width="5px" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Defectid" HeaderText="Defectid" ReadOnly="True" 
                    SortExpression="Defectid" ></asp:BoundField>
                    <asp:BoundField DataField="DefectName" HeaderText="DefectName" 
                    SortExpression="DefectName" ></asp:BoundField>
                    <asp:BoundField DataField="SDate" HeaderText="SDate" SortExpression="SDate" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Status" HeaderText="Status" 
                    SortExpression="Status" ></asp:BoundField>
                    <asp:BoundField DataField="SCycle" HeaderText="SCycle" 
                    SortExpression="SCycle" ></asp:BoundField>
                    <asp:BoundField DataField="Project" HeaderText="Project" 
                    SortExpression="Project" ></asp:BoundField>
                    <asp:BoundField DataField="Tester" HeaderText="Tester" 
                    SortExpression="Tester" ></asp:BoundField>
                    <asp:BoundField DataField="TestcasesAssociated" 
                    HeaderText="TCAssociated" SortExpression="TestcasesAssociated" >
                    </asp:BoundField>
                    <asp:BoundField DataField="Module" HeaderText="Module" 
                    SortExpression="Module" ></asp:BoundField>
                    <asp:BoundField DataField="AssignedTo" HeaderText="AssignedTo" 
                    SortExpression="AssignedTo" ></asp:BoundField>
                    <asp:BoundField DataField="Closedate" HeaderText="Closedate" 
                    SortExpression="Closedate" ></asp:BoundField>
                </Columns>
                <EditRowStyle Font-Size="Small" HorizontalAlign="Left" VerticalAlign="Bottom" 
                            Width="5px" />
                <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" 
                            Height="3px" HorizontalAlign="Left" VerticalAlign="Bottom" Width="5px" />
                <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
                <RowStyle BackColor="White" ForeColor="#330099" HorizontalAlign="Left" 
                            VerticalAlign="Bottom" Width="5px" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
                <SortedAscendingCellStyle BackColor="#FEFCEB" />
                <SortedAscendingHeaderStyle BackColor="#AF0101" />
                <SortedDescendingCellStyle BackColor="#F6F0C0" />
                <SortedDescendingHeaderStyle BackColor="#7E0000" />
            </asp:GridView>
            <asp:SqlDataSource ID="teradata" runat="server" 
            ConnectionString="<%$ ConnectionStrings:teradata %>" 
            ProviderName="<%$ ConnectionStrings:teradata.ProviderName %>" 
            
            SelectCommand="select Defectid,Defectname,Sdate,Status,Scycle,Project,Tester,Testcasesassociated,Module,Assignedto,Closedate from coebatch.tbl_defect order by defectid asc ">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>

</asp:Content>
