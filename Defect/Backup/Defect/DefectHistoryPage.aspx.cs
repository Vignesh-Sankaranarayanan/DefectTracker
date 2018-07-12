using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Teradata.Client.Provider;
using System.Configuration;
using System.Data;
using System.Data.Odbc;

using System.Collections;


using System.ComponentModel;

using System.Drawing;

using System.Text;

using System.Data.SqlClient;




namespace Defect
{
    public partial class DefectHistoryPage : System.Web.UI.Page
    {
        DataAccesLayer dbObj = new DataAccesLayer();

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
                int Defectiid = 0;
                this.Master.WelLogIn = "";
                this.Master.Label = Session["New"].ToString();
                lbmessage.Visible = false;
                lbmessage.Text = "";
                Defectiid = (int)Session["MySessionVar"];
                string trteradataconnection = "Data Source='204.99.34.21';User ID='coebatch';Password='coe1234';";
                Teradata.Client.Provider.TdConnection tereconnection = new Teradata.Client.Provider.TdConnection(trteradataconnection);
                int ID;
                // string defectid = TxtHistorySearch0.Text;

                ID = dbObj.DefectIDSearch(Defectiid);
                try
                {

                    if (ID == 0)
                    {

                        lbmessage.Visible = true;
                        lbmessage.Text = "Please enter a valid DefectID and Search";
                    }

                    else
                    {


                        //  TdCommand Teracomd = new TdCommand("select * from coebatch.tbl_Defect", tereconnection);



                        //TdDataAdapter AdvancedDefectSearch =
                        //          new TdDataAdapter(@"Select DefectID,DefectName,Status,sDate,sCycle,Description,Project,Tester,TestcasesAssociated,Module,AssignedTo,Filenames,Filesize from  coebatch.tbl_Defect where  sDate between '" + fromdate + "' and '" + todate + "'", tereconnection);
                        tereconnection.Open();
                        TdDataAdapter AdvancedDefectSearch =
                              new TdDataAdapter(@"select Defectid,Defectname,sdate as CreatedDate,Status,Scycle as Cycles,Project as Releases,Tester,Module,Assignedto,Closedate as LastUpdateddate,Defecthistid,Severity,Environment,Releases as Project,Rootcause, Loginuser from coebatch.tbl_Defect_history where defectid = " + Defectiid + " order by defecthistid asc ", tereconnection);

                        // IDataSource dt1 = new IDataSource ;


                        DataSet ds = new DataSet();

                        AdvancedDefectSearch.Fill(ds);
                        this.GridHistory.DataSource = ds.Tables[0];
                        GridHistory.DataKeyNames = new string[] { "Defecthistid" };
                        this.GridHistory.DataBind();
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
                    tereconnection.Close(); ;
                }




            }
        }






    }
}

