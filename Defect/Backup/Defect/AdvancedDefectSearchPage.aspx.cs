using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Odbc;
using Teradata.Client.Provider;
using System.Data.Odbc;
using System.Configuration;
using System.Data;
using System.Data.Odbc;
using System.IO;

namespace Defect
{
    public partial class AdvancedDefectSearchPage : System.Web.UI.Page
    {
        DataAccesLayer dbObj = new DataAccesLayer();
        private DateTime fromdate;
        private DateTime todate;
        DateTime Datefrom;

        DateTime DateTo;
        TdTimestamp Datefrom1;
        TdTimestamp DateTo1;
        int rowcount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            if (Session["New"] == null)
            {
                Server.Transfer("Login2.aspx", true);

                // Response.Redirect("Login.aspx");
            }
            else
            {
                BtnExport.Enabled = false;
                //this.Master.WelLogIn = "";
                //this.Master.Label = Session["New"].ToString();
                LbMessage.Visible = false;
                Calendarfrom.Visible = false;
                CalendartoDate.Visible = false;
                //txtfromdate.Text = Calendarfrom.SelectedDate.ToString();
                //txtTodate.Text = CalendartoDate.SelectedDate.ToString();
            }
        }



        protected void Calendar_SelectionChanged(object sender, EventArgs e)
        {
            txtfromdate.Text = Calendarfrom.SelectedDate.ToString();
            txtTodate.Text = CalendartoDate.SelectedDate.ToString();
            // Calendarfrom.Visible = false;
        }

        protected void Caltodate_SelectionChanged(object sender, EventArgs e)
        {
            txtTodate.Text = CalendartoDate.SelectedDate.ToString();
            //CalendartoDate.Visible = false;
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            DateTime Sysdate = DateTime.Now;

            fromdate = Calendarfrom.SelectedDate;
            todate = CalendartoDate.SelectedDate;
            int defect = 0;
            if (fromdate > todate || fromdate > Sysdate || todate > Sysdate)
            {
                LbMessage.Visible = true;
                LbMessage.Text = "Please enter the valid date range";
            }
            else
            {
                if

                    (DDLAssignedto.SelectedValue == "" && DDLEnvironment.SelectedValue == "" &&
                DDLModule.SelectedValue == "" && DDLProject.SelectedValue == "" && DDLProjectname.SelectedValue == "" &&
                DDlStatus.SelectedValue == "" &&
                DDLTester.SelectedValue == "" && txtfromdate.Text == "" && txtTodate.Text == "" && TxtDefectname.Text == "" && DDLCycle.SelectedValue == "")
                {

                    LbMessage.Visible = true;
                    LbMessage.Text = "Please select any of the search items";
                }
                else
                {
                    try
                    {

                        string trteradataconnection = "Data Source='204.99.34.21';User ID='coebatch';Password='coe1234';";
                        if (txtfromdate.Text != "" && txtTodate.Text != "")
                        {
                            Datefrom = Convert.ToDateTime(txtfromdate.Text);

                            DateTo = Convert.ToDateTime(txtTodate.Text);
                            Datefrom1 = new TdTimestamp(Datefrom);
                            DateTo1 = new TdTimestamp(DateTo);

                        }
                        else
                        {
                            DateTime timetora = DateTime.Now;
                            string text = timetora.ToString("MM/dd/yyyy HH:mm:ss");
                            DateTime Test1 = Convert.ToDateTime(text);


                            DateTo1 = new TdTimestamp(Test1);

                        }

                        Teradata.Client.Provider.TdConnection tereconnection = new Teradata.Client.Provider.TdConnection(trteradataconnection);

                        //TdCommand Teracomd = new TdCommand("select * from coebatch.tbl_Defect", tereconnection);
                        //TdDataAdapter AdvancedDefectSearch =
                        //          new TdDataAdapter(@"Select DefectID,DefectName,Status,sDate,sCycle,Description,Project,Tester,TestcasesAssociated,Module,AssignedTo,Filenames,Filesize from  coebatch.tbl_Defect where  sDate between '" + fromdate + "' and '" + todate + "'", tereconnection);
                        TdCommand cmd = new TdCommand("COEBATCH.ADVANCEDDEFECTSEARCH1", tereconnection);

                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.Add("VDefectname", TdType.VarChar).Value = TxtDefectname.Text;
                        cmd.Parameters.Add("VStatus", TdType.VarChar).Value = DDlStatus.SelectedValue;
                        cmd.Parameters.Add("VAssignedto", TdType.VarChar).Value = DDLAssignedto.SelectedValue;
                        cmd.Parameters.Add("VTester", TdType.VarChar).Value = DDLTester.SelectedValue;
                        cmd.Parameters.Add("VOpendate", TdType.Timestamp).Value = Datefrom1;
                        cmd.Parameters.Add("VOpendate1", TdType.Timestamp).Value = DateTo1;
                        cmd.Parameters.Add("VProject", TdType.VarChar).Value = DDLProject.SelectedValue;
                        cmd.Parameters.Add("VModule", TdType.VarChar).Value = DDLModule.SelectedValue;
                        cmd.Parameters.Add("VEnvironment", TdType.VarChar).Value = DDLEnvironment.SelectedValue;
                        cmd.Parameters.Add("VRelease", TdType.VarChar).Value = DDLProjectname.SelectedValue;
                        cmd.Parameters.Add("VCycle", TdType.VarChar).Value = DDLCycle.SelectedValue;
                        //cmd.Parameters.Add("cur1", TdType.AnyType).Direction =  ParameterDirection.Output;


                        tereconnection.Open();







                        DataTable dt = new DataTable();


                        dt.Load(cmd.ExecuteReader());


                        // defect = cmd.ExecuteNonQuery();

                        //    TdDataAdapter AdvancedDefectSearch =
                        //             new TdDataAdapter();
                        //AdvancedDefectSearch= new TdDataAdapter(cmd);

                        //// IDataSource dt1 = new IDataSource ;
                        //tereconnection.Open();


                        //DataSet ds = new DataSet();

                        //AdvancedDefectSearch.Fill(ds);
                        GridAdvancedSearch.DataSource = dt;
                        GridAdvancedSearch.DataBind();
                        //this.GridAdvancedSearch.DataSource = ds.Tables[0].DataSet;
                        //GridAdvancedSearch.DataKeyNames = new string[] { "Defectid" }; 
                        //this.GridAdvancedSearch.DataBind();
                        //this.GridAdvancedSearch.Visible = true;
                        if (GridAdvancedSearch.Rows.Count > 0)
                        {
                            rowcount = GridAdvancedSearch.Rows.Count;
                            BtnExport.Enabled = true;
                        }
                        else
                        {

                            BtnExport.Enabled = false;
                        }
                    }


                    catch (Teradata.Client.Provider.TdException ex)
                    {
                        //Throw the exception to calling environment
                        throw ex;
                    }
                    finally
                    {
                        //Close the Connection from the Database

                    }

                    //GridAdvancedSearch.DataSource = dt;
                    // AdvancedDefectSearch.Fill(dt);
                }
            }

        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Server.Transfer("HomePage.aspx", true);
        }

        protected void BtnExport_Click(object sender, EventArgs e)
        {

            // GridAdvancedSearch.AllowPaging = false;
            // GridAdvancedSearch.DataBind();

            string attachment = "attachment; filename=Export.xls";
            Response.ClearContent(); Response.AddHeader("content-disposition", attachment);
            Response.ContentType = "application/ms-excel";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);

            // GridView1.HeaderRow.BackColor = Color.White;
            foreach (TableCell cell in GridAdvancedSearch.HeaderRow.Cells)
            {
                cell.BackColor = GridAdvancedSearch.HeaderStyle.BackColor;
                cell.Height = 25;
            }


            foreach (GridViewRow row in GridAdvancedSearch.Rows)
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
                        cell.BackColor = GridAdvancedSearch.RowStyle.BackColor;
                    }
                    cell.CssClass = "textmode";
                }
            }

            GridAdvancedSearch.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();


        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //
        }

        protected void txtfromdate_TextChanged(object sender, EventArgs e)
        {
            Calendarfrom.Visible = true;
        }

        protected void txtTodate_TextChanged(object sender, EventArgs e)
        {
            CalendartoDate.Visible = true;
        }

        protected void Btnfromdate_Click(object sender, EventArgs e)
        {
            Calendarfrom.Visible = true;
        }

        protected void Btntodate_Click(object sender, EventArgs e)
        {
            CalendartoDate.Visible = true;
        }

    }
}