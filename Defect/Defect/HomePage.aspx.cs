using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlServerCe;
using Teradata.Client.Provider;
using Microsoft.Office.Interop.Excel;
using System.Data;
using System.IO;

namespace Defect
{
    public partial class HomePage : System.Web.UI.Page
    {
        int index = 0;
        int DefectID1 = 0;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] == null)
            {
                Server.Transfer("Login2.aspx", true);

                // Response.Redirect("Login.aspx");
            }
            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            if (!this.IsPostBack)
            {

                if (Session["New"] == null)
                {
                    Server.Transfer("Login2.aspx", true);

                    // Response.Redirect("Login.aspx");
                }

                else
                {
                    Session["MySessionVar"] = 0;
                    int DefectID1 = (int)Session["MySessionVar"];

                    this.Master.Label = Session["New"].ToString();
                    LbMessage.Visible = false;
                    LbMessage.Text = "";
                    //this.Session["DefectID11"] = DefectID1;
                    //Defect = this.Session["DefectID11"].ToString();
                    string trteradataconnection = "Data Source='204.99.34.21';User ID='coebatch';Password='coe1234';";
                    Teradata.Client.Provider.TdConnection tereconnection = new Teradata.Client.Provider.TdConnection(trteradataconnection);
                    //TdDataAdapter ID;
                    // string defectid = TxtHistorySearch0.Text;

                    // ID = dbObj.DefectHome();
                    try
                    {




                        //  TdCommand Teracomd = new TdCommand("select * from coebatch.tbl_Defect", tereconnection);



                        //TdDataAdapter AdvancedDefectSearch =
                        //          new TdDataAdapter(@"Select DefectID,DefectName,Status,sDate,sCycle,Description,Project,Tester,TestcasesAssociated,Module,AssignedTo,Filenames,Filesize from  coebatch.tbl_Defect where  sDate between '" + fromdate + "' and '" + todate + "'", tereconnection);
                        tereconnection.Open();
                        TdDataAdapter AdvancedDefectSearch =
                              new TdDataAdapter(@"select Defectid,Defectname,sdate as OpenDate,Status,Scycle as Cycles,Project,Tester,Module,Assignedto,Closedate as LastUpdatedDate from coebatch.tbl_Defect order by Defectid asc ", tereconnection);

                        // IDataSource dt1 = new IDataSource ;

                        DataSet ds = new DataSet();


                        AdvancedDefectSearch.Fill(ds);
                        this.GridView1.DataSource = ds.Tables[0];
                        GridView1.DataKeyNames = new string[] { "Defectid" };
                        this.GridView1.DataBind();


                    }

                    catch (Teradata.Client.Provider.TdException ex)
                    {
                        //Throw the exception to calling environment
                        throw ex;
                    }
                    finally
                    {
                        //Close the Connection from the Database
                        tereconnection.Close(); ;
                    }

                }
            }

            else
            {


            }
        }
        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            String sortExpression = e.SortExpression;

            if (GridView1.SortDirection == SortDirection.Ascending)
            {
                //DataView myDataView = new DataView();
                //myDataView.Sort = sortExpression + " DESC";
                //GridView1.DataSource= ds.Tables[0];
                //GridView1.DataBind();

            }
            else
            {
                //DataView myDataView = new DataView();
                //myDataView.Sort = sortExpression + " ASC";
                //GridView1.DataSource = myDataView;
                //GridView1.DataBind();
            }

        }
        DataAccesLayer dbObj = new DataAccesLayer();


        protected void BtnNewDefect_Click(object sender, EventArgs e)
        {

            string DefectID1 = TxtDefectSearch.Text.ToString();
            Server.Transfer("NewDefectPage.aspx", true);


        }


        protected void Gridview1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.GridView1, "Select$" + e.Row.RowIndex);
                e.Row.Attributes["ondblclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Edit$" + e.Row.RowIndex);
        
               
            }




            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                for (int i = 0; i > e.Row.Cells.Count; i++)
                {
                    e.Row.Cells[i].CssClass = "columnscss";
                }
            }
        }

        protected void BtnDefectHistory_Click(object sender, EventArgs e)
        {
            Server.Transfer("DefectHistoryPage.aspx", true);
        }




        protected void BtnAdvancedSearch_Click(object sender, EventArgs e)
        {
            Server.Transfer("AdvancedSearch.aspx", true);
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            GridViewRow row = GridView1.SelectedRow;

            //Find your textbox within the row
            // TextBox yourTextbox = row.FindControl("YourTextBoxID") as TextBox;

            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            //    e.Row.ToolTip = "Click to select this row.";
            //}
            int index = Convert.ToInt16(GridView1.SelectedDataKey.Value);
            this.Session["MySessionVar"] = index;
            // DefectID = index;
            //  int DefectID1 = (int)Session["MySessionVar"];
            // DefectID1 = this.Session["DefectID11"].ToString();
            // Server.Transfer("DefectSearch.aspx", true);  


        }

        protected void BtnExport_Click(object sender, EventArgs e)
        {
            GridView1.AllowPaging = false;
            GridView1.DataBind();

            int Count = dbObj.GetDefectcount();
            Microsoft.Office.Interop.Excel.Application ExcelApp =
         new Microsoft.Office.Interop.Excel.Application();
            Microsoft.Office.Interop.Excel._Workbook ExcelBook;
            Microsoft.Office.Interop.Excel._Worksheet ExcelSheet;

            int i = 0;
            int j = 0;

            //create object of excel
            ExcelBook = (Microsoft.Office.Interop.Excel._Workbook)ExcelApp.Workbooks.Add(1);
            ExcelSheet = (Microsoft.Office.Interop.Excel._Worksheet)ExcelBook.ActiveSheet;
            //export header

            for (i = 1; i <= this.GridView1.Columns.Count; i++)
            {
                ExcelSheet.Cells[1, i] = this.GridView1.Columns[i - 1].HeaderText;
            }

            //export data
            for (i = 1; i <= Count; i++)
            {
                for (j = 1; j <= GridView1.Columns.Count; j++)
                {
                    ExcelSheet.Cells[i + 1, j] = GridView1.Rows[i - 1].Cells[j - 1].Text;
                }
            }

            ExcelApp.Visible = true;
            GridView1.AllowPaging = true;

        }

        protected void ImageAdd_Click(object sender, ImageClickEventArgs e)
        {
            string DefectID1 = TxtDefectSearch.Text.ToString();
            Server.Transfer("NewDefectPage.aspx", true);

        }

        protected void ImageEdit_Click(object sender, ImageClickEventArgs e)
        {

            DefectID1 = (int)(System.Web.HttpContext.Current.Session["MySessionVar"]);

            if (DefectID1 == 0)
            {
                LbMessage.Visible = true;
                LbMessage.Text = "Please select a row to edit";
                Response.Redirect("HomePage.aspx");
            }

            else
            {

                try
                {
                    //num = int.Parse(txtSearch.Text);  //here's your value
                    //DefectID1 = TxtDefectSearch.Text;
                    // string DefectID = TxtDefectSearch.Text;




                    int ID = 0;
                    // int Defect0 = 0;
                    //  Defect0 = Convert.ToInt32(DefectID1);
                    ID = dbObj.DefectIDSearch(DefectID1);
                    if (ID == 0)
                    {
                        LbMessage.Visible = true;
                        LbMessage.Text = "Please enter a valid defectid for search";
                        TxtDefectSearch.Text = "";
                    }
                    else
                    {
                        Server.Transfer("DefectSearchPage.aspx", true);
                    }
                }

                catch (TdException exc)
                {

                    throw exc;
                }

            }
        }

        protected void ImageHistory_Click(object sender, ImageClickEventArgs e)
        {
            DefectID1 = (int)Session["MySessionVar"];

            if (DefectID1 == 0)
            {
                LbMessage.Visible = true;
                LbMessage.Text = "Please select a row to view the history";
                Response.Redirect("HomePage.aspx");
            }

            else
            {

                Response.Redirect("DefectHistoryPage.aspx");
            }
        }

        protected void ImageDetails_Click(object sender, ImageClickEventArgs e)
        {
            DefectID1 = (int)Session["MySessionVar"];
            if (DefectID1 == 0)
            {
                LbMessage.Visible = true;
                LbMessage.Text = "Please select a row to view the details";
                Response.Redirect("HomePage.aspx");
            }

            else
            {
                try
                {
                    //num = int.Parse(txtSearch.Text);  //here's your value




                    int ID;
                    ID = dbObj.DefectIDSearch(DefectID1);
                    if (ID == 0)
                    {
                        LbMessage.Visible = true;
                        LbMessage.Text = "Please enter a valid defectid for search";
                        TxtDefectSearch.Text = "";
                    }
                    else
                    {
                        Server.Transfer("DefectDetailsPage.aspx", true);
                    }
                }

                catch (TdException exc)
                {

                    throw exc;
                }
            }
        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
               server control at run time. */
        }

        protected void ImageExport_Click(object sender, ImageClickEventArgs e)
        {
            string trteradataconnection = "Data Source='204.99.34.21';User ID='coebatch';Password='coe1234';";
            Teradata.Client.Provider.TdConnection tereconnection = new Teradata.Client.Provider.TdConnection(trteradataconnection);
            //TdDataAdapter ID;
            // string defectid = TxtHistorySearch0.Text;

            // ID = dbObj.DefectHome();
            try
            {




                //  TdCommand Teracomd = new TdCommand("select * from coebatch.tbl_Defect", tereconnection);



                //TdDataAdapter AdvancedDefectSearch =
                //          new TdDataAdapter(@"Select DefectID,DefectName,Status,sDate,sCycle,Description,Project,Tester,TestcasesAssociated,Module,AssignedTo,Filenames,Filesize from  coebatch.tbl_Defect where  sDate between '" + fromdate + "' and '" + todate + "'", tereconnection);
                tereconnection.Open();
                TdDataAdapter AdvancedDefectSearch =
                      new TdDataAdapter(@"select Defectid,Defectname,sdate as OpenDate,Status,Scycle as Cycles,Project,Tester,Module,Assignedto,Closedate as LastUpdatedDate from coebatch.tbl_Defect order by Defectid asc ", tereconnection);

                // IDataSource dt1 = new IDataSource ;


                DataSet ds = new DataSet();

                AdvancedDefectSearch.Fill(ds);
                this.GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "Defectid" };
                this.GridView1.DataBind();

            }

            catch (Teradata.Client.Provider.TdException ex)
            {
                //Throw the exception to calling environment
                throw ex;
            }
            finally
            {
                //Close the Connection from the Database
                tereconnection.Close(); ;
            }

            string attachment = "attachment; filename=Export.xls";
            Response.ClearContent(); Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            // GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridView1.HeaderRow.Cells)
            {
                cell.BackColor = GridView1.HeaderStyle.BackColor;
                cell.Height = 25;
            }


            foreach (GridViewRow row in GridView1.Rows)
            {

                foreach (TableCell cell in row.Cells)
                {
                    if (row.RowIndex % 1 == 0)
                    {
                        //cell.BackColor = GridView1.AlternatingRowStyle.BackColor;
                        cell.Height = 25;
                    }
                    else
                    {
                        cell.BackColor = GridView1.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridView1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();

            //int columns = this.GridView1.Columns.Count;
            //    //GridView1.AllowPaging = false;
            //   // GridView1.DataBind();

            //    int Count = dbObj.GetDefectcount();
            //    Microsoft.Office.Interop.Excel.Application ExcelApp =
            // new Microsoft.Office.Interop.Excel.Application();
            //    Microsoft.Office.Interop.Excel._Workbook ExcelBook;
            //    Microsoft.Office.Interop.Excel._Worksheet ExcelSheet;

            //    int i = 0;
            //    int j = 0;

            //    //create object of excel
            //    ExcelBook = (Microsoft.Office.Interop.Excel._Workbook)ExcelApp.Workbooks.Add(1);
            //    ExcelSheet = (Microsoft.Office.Interop.Excel._Worksheet)ExcelBook.ActiveSheet;
            //    //export header

            //    for (i = 1; i <= this.GridView1.Columns.Count; i++)
            //    {
            //        ExcelSheet.Cells[1, i] = this.GridView1.Columns[i - 1].HeaderText;
            //    }

            //    //export data
            //    for (i = 1; i <= Count; i++)
            //    {
            //        for (j = 1; j <= GridView1.Columns.Count; j++)
            //        {
            //            ExcelSheet.Cells[i + 1, j] = GridView1.Rows[i - 1].Cells[j - 1].Text;
            //        }
            //    }

            //    ExcelApp.Visible = true;
            //    //GridView1.AllowPaging = true;

        }

        protected void Imagefilter_Click(object sender, ImageClickEventArgs e)
        {
            //Defect = this.Session["DefectID11"].ToString();
            string trteradataconnection = "Data Source='204.99.34.21';User ID='coebatch';Password='coe1234';";
            Teradata.Client.Provider.TdConnection tereconnection = new Teradata.Client.Provider.TdConnection(trteradataconnection);

            string defectid = TxtDefectSearch.Text;
            // int defect = Convert.ToInt32(defectid);


            try
            {



                tereconnection.Open();
                TdDataAdapter AdvancedDefectSearch =
                      new TdDataAdapter(@"select Defectid,Defectname,sdate as OpenDate,Status,Scycle as Cycles,Project,Tester,Module,Assignedto,Closedate as LastUpdatedDate from coebatch.tbl_Defect where CAST(defectid AS VARCHAR(8)) LIKE '%" + defectid + "%' order by Defectid asc ", tereconnection);

                // IDataSource dt1 = new IDataSource ;


                DataSet ds = new DataSet();

                AdvancedDefectSearch.Fill(ds);


                this.GridView1.DataSource = ds.Tables[0];
                GridView1.DataKeyNames = new string[] { "Defectid" };
                this.GridView1.DataBind();

            }

            catch (Teradata.Client.Provider.TdException ex)
            {
                //Throw the exception to calling environment
                throw ex;
            }
            finally
            {
                //Close the Connection from the Database
                tereconnection.Close(); ;
            }
        }



    }
}