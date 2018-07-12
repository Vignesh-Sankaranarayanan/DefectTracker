<%@ Page Title="Home" Language="C#" MasterPageFile="~/New.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Defect.HomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width: 100%">
        <tr>
            <td style="width: 616px">
                <asp:Label ID="LbMessage" runat="server" Font-Bold="True" Font-Italic="True" 
                    ForeColor="Red" Text="Label" Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="Gray" align="right" colspan="2" dir="rtl">
                <asp:Panel ID="Toolpanel" runat="server" Direction="LeftToRight" 
                    HorizontalAlign="Left" style="margin-right: 0px" Width="300px">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageAdd" runat="server" BackColor="White" 
                        BorderColor="White" BorderStyle="Ridge" Height="21px" 
                        ImageUrl="~/Images/add.png" onclick="ImageAdd_Click" style="margin-left: 0px" 
                        ToolTip="Add a new defect" Width="21px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageEdit" runat="server" BackColor="White" 
                        BorderColor="White" BorderStyle="Ridge" Height="21px" 
                        ImageUrl="~/Images/edit-icon.png" onclick="ImageEdit_Click" 
                        onclientclick="false" ToolTip="Edit a defect" Width="21px" />
                    &nbsp; &nbsp;&nbsp;
                    <asp:ImageButton ID="ImageHistory" runat="server" BackColor="White" 
                        BorderColor="White" BorderStyle="Ridge" Height="21px" 
                        ImageUrl="~/Images/history.png" onclick="ImageHistory_Click" 
                        onclientclick="false" ToolTip="Defect History" Width="21px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageDetails" runat="server" BackColor="White" 
                        BorderColor="White" BorderStyle="Ridge" Height="21px" 
                        ImageUrl="~/Images/Preview.png" onclick="ImageDetails_Click" 
                        onclientclick="false" ToolTip="View details" Width="21px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ImageButton ID="ImageExport" runat="server" BackColor="White" 
                        BorderColor="White" BorderStyle="Ridge" Height="21px" 
                        ImageUrl="~/Images/Excel-icon.png" onclick="ImageExport_Click" 
                        ToolTip="Export to Excel" Width="21px" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td bgcolor="Gray" style="width: 616px">
                <asp:Panel ID="PanelGridview" runat="server" Direction="LeftToRight" 
                    HorizontalAlign="Left" Width="351px">
                    &nbsp;<asp:Label ID="lbFilter" runat="server" Font-Names="Arial" Font-Size="Small" 
                        Text="Filter based on DefectID"></asp:Label>
                    <asp:TextBox ID="TxtDefectSearch" runat="server" BorderColor="#000066" 
                        CausesValidation="True"></asp:TextBox>
                </asp:Panel>
            </td>
            <td align="right" dir="rtl" bgcolor="Gray">
                <asp:Panel ID="PanelImage" runat="server" Direction="RightToLeft" 
                    HorizontalAlign="Center" style="margin-left: 0px" Width="200px">
                    <asp:ImageButton ID="Imagefilter" runat="server" BorderColor="White" 
                        BorderStyle="Ridge" Height="21px" ImageUrl="~/Images/filter.png" 
                        onclick="Imagefilter_Click" ToolTip="Filter" Width="30px" />
                </asp:Panel>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:GridView ID="GridView1"  runat="server" AllowSorting="true" width=100%
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="1" EmptyDataText="No items to show" EnableModelValidation="False" 
                    Font-Names="Arial" Font-Size="Small" ForeColor="Black" HorizontalAlign="Left" 
                    OnRowDataBound="Gridview1_RowDataBound" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    
                    OnSorting="GridView1_Sorting" PageSize="30" RowHeaderColumn="Fixed" 
                    ShowHeaderWhenEmpty="True" style="margin-right: 0px" CellSpacing="1">
                    <AlternatingRowStyle BackColor="White" Height="5px" HorizontalAlign="Left" 
                        VerticalAlign="Bottom" Width="5px" />
                    <EditRowStyle BackColor="#CCCCCC" Font-Size="Small" Height="1px" 
                        HorizontalAlign="Left" VerticalAlign="Bottom" Width="5px" />
                    <EmptyDataRowStyle BackColor="White" Height="1px" HorizontalAlign="Justify" 
                        VerticalAlign="Top" Width="10px" Wrap="False" />
                    <EmptyDataTemplate>
                        <table align="center">
                            No items to Show</table>
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#CCCC99" Height="1px" HorizontalAlign="Left" 
                        VerticalAlign="Top" Width="5px" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" 
                        Height="1px" HorizontalAlign="Left" VerticalAlign="Bottom" Width="5px" 
                        Wrap="True" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#FFFFCC" Height="1px" HorizontalAlign="Left" 
                        VerticalAlign="Bottom" Width="5px" Wrap="True" />
                    <SelectedRowStyle BackColor="#CCCCFF" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FBFBF2" />
                    <SortedAscendingHeaderStyle BackColor="#848384" />
                    <SortedDescendingCellStyle BackColor="#EAEAD3" />
                    <SortedDescendingHeaderStyle BackColor="#575357" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td style="width: 616px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
