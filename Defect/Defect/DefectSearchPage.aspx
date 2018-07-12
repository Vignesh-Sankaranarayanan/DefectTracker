<%@ Page Title="" Language="C#" MasterPageFile="~/New.Master" AutoEventWireup="true" CodeBehind="DefectSearchPage.aspx.cs" Inherits="Defect.DefectSearchPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <script type ="text/javascript">     function OpenMe(filename) {
         window.open(filename);
         
     }
</script>
    <table align="left" style="width: 100%; font-family: Arial;" font:"Arial">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="lbMessage" runat="server" Font-Bold="True" Font-Italic="True" 
                    ForeColor="#99CC00" Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LBDefectID" runat="server" Text="Defect ID"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtDefectID" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="lbProject" runat="server" Text="Release"></asp:Label>
                <asp:Image ID="ImageDefectid20" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td>
                <asp:DropDownList ID="DdlProject" runat="server">
                    <asp:ListItem>R15</asp:ListItem>
                    <asp:ListItem>R14</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LBDefectName" runat="server" Text="Defect Description"></asp:Label>
                <asp:Image ID="ImageDefectid10" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td>
                <asp:TextBox ID="TxtDefectName" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="LBTester" runat="server" Text="Tester"></asp:Label>
                <asp:Image ID="ImageDefectid19" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td>
                <asp:DropDownList ID="DDlTester" runat="server">
                    <asp:ListItem>Vignesh</asp:ListItem>
                    <asp:ListItem>Srini</asp:ListItem>
                    <asp:ListItem>Siva</asp:ListItem>
                    <asp:ListItem>Vijay</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="height: 22px">
                <asp:Label ID="LBStatus" runat="server" Text="Status"></asp:Label>
                <asp:Image ID="ImageDefectid11" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td style="height: 22px">
                <asp:DropDownList ID="DDLStatus1" runat="server">
                    <asp:ListItem>Open</asp:ListItem>
                    <asp:ListItem>Close</asp:ListItem>
                    <asp:ListItem>Onhold</asp:ListItem>
                    <asp:ListItem>Fixed</asp:ListItem>
                    <asp:ListItem>ReOpen</asp:ListItem>
                    <asp:ListItem>Not a Defect</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td style="height: 22px">
                <asp:Label ID="LBTCAssociated" runat="server" Text="Testcases Associated"></asp:Label>
            </td>
            <td style="height: 22px">
                <asp:TextBox ID="TxtTcAssociated" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LBDate" runat="server" Text="Created Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDate" runat="server" Enabled="False"></asp:TextBox>
            </td>
            <td>
                <asp:Label ID="LbModule" runat="server" Text="Module/Component"></asp:Label>
                <asp:Image ID="ImageDefectid18" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td>
                <asp:DropDownList ID="DDlModule" runat="server">
                    <asp:ListItem>CEEUI</asp:ListItem>
                    <asp:ListItem>CMT</asp:ListItem>
                    <asp:ListItem>Adapter</asp:ListItem>
                    <asp:ListItem>Creation</asp:ListItem>
                    <asp:ListItem>Delivery</asp:ListItem>
                    <asp:ListItem>Disposition</asp:ListItem>
                    <asp:ListItem>Billing</asp:ListItem>
                    <asp:ListItem>EDW2Push</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LBCycle" runat="server" Text="Test Cycle"></asp:Label>
                <asp:Image ID="ImageDefectid12" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td>
                <asp:DropDownList ID="DDlCycle" runat="server">
                    <asp:ListItem>System Testing</asp:ListItem>
                    <asp:ListItem>Regression</asp:ListItem>
                    <asp:ListItem>P2P</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="lbupdatedate" runat="server" Text="Last updated"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="TxtLastupdated" runat="server" Enabled="False"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbAssignedto" runat="server" Text="Assigned To"></asp:Label>
                <asp:Image ID="ImageDefectid13" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td>
                <asp:DropDownList ID="DDlAssignedto" runat="server">
                    <asp:ListItem>Selva</asp:ListItem>
                    <asp:ListItem>Karthik</asp:ListItem>
                    <asp:ListItem>Senthil</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                <asp:Label ID="LBComments" runat="server" Text="Comments"></asp:Label>
                <asp:Image ID="ImageDefectid17" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td>
                <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbEnvironment" runat="server" Text="Environment"></asp:Label>
                <asp:Image ID="ImageDefectid14" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
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
            <td>
                <asp:Label ID="lbseverity" runat="server" Text="Severity"></asp:Label>
                <asp:Image ID="ImageDefectid16" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
            </td>
            <td>
                <asp:DropDownList ID="DDLSeverity" runat="server">
                    <asp:ListItem>Critical</asp:ListItem>
                    <asp:ListItem>High</asp:ListItem>
                    <asp:ListItem>Medium</asp:ListItem>
                    <asp:ListItem>Low</asp:ListItem>
                    <asp:ListItem Selected="True"></asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="LbProjectname" runat="server" Text="Project"></asp:Label>
                <asp:Image ID="ImageDefectid15" runat="server" Height="10px" 
                    ImageAlign="Bottom" ImageUrl="~/Images/athterisk-red-large.png" 
                    ToolTip="Required field" Width="10px" />
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
                <asp:Label ID="lbRootcause" runat="server" Text="RootCause"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="DDLRootcause" runat="server">
                    <asp:ListItem Selected="True"></asp:ListItem>
                    <asp:ListItem>Coding Issue</asp:ListItem>
                    <asp:ListItem>Data Issue</asp:ListItem>
                    <asp:ListItem>Deploy Issue</asp:ListItem>
                    <asp:ListItem>Design Issue</asp:ListItem>
                    <asp:ListItem>Environment Issue</asp:ListItem>
                    <asp:ListItem>Requirements Issue</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                <asp:Label ID="LBAttachments" runat="server" Text="Attachments"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="lbSteps" runat="server" Text="Steps to Reproduce"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td colspan="2">
                <asp:FileUpload ID="FileUpload" runat="server" />
                <asp:Button ID="BtnUpload" runat="server" onclick="BtnUpload_Click" 
                    Text="Upload" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:TextBox ID="TxtDescription" runat="server" Height="139px" 
                    TextMode="MultiLine" Width="307px"></asp:TextBox>
            </td>
           
            <td colspan="2">
                <asp:GridView ID="GridViewAttachments" runat="server" 
                    AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" 
                    BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" 
                    onrowcommand="GridViewAttachments_RowCommand" 
                    style="margin-left: 0px; margin-bottom: 0px" Width="52px">
                    <AlternatingRowStyle BackColor="PaleGoldenrod" />
                    <Columns>
                        <asp:TemplateField HeaderText="File">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton" runat="server"
                                    CommandArgument='<%# Eval("File") %>' CommandName="Download" 
                                    Text='<%# Eval("File") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
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
            <td colspan="2">
                <asp:GridView ID="GridDefectSearch" runat="server" 
                    BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" 
                    CellPadding="2" EnablePersistedSelection="True" ForeColor="Black" 
                    GridLines="None">
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
            <td>
                <asp:Button ID="BtnSaveEditted" runat="server" onclick="BtnSaveEditted_Click" 
                    Text="Save" Width="89px" />
            </td>
            <td>
                <asp:Button ID="BtnEditDefect" runat="server" onclick="BtnEditDefect_Click" 
                    Text="Cancel" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
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
