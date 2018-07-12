using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Teradata.Client.Provider;
using System.Data;
using System.Configuration;
using FreeTextBoxControls.Design;
using System.IO;
using System.Net.Mail;
using System.Web.Mail;

namespace Defect
{
    public partial class DefectDetailsPage : System.Web.UI.Page
    {
        DataTable dtnew = new DataTable();
        DataAccesLayer dbObj = new DataAccesLayer();
        DataTable dt = new DataTable();
        public byte[] bImage = new byte[0];
        public int defectid1;
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
                this.Master.WelLogIn = "";
                this.Master.Label = Session["New"].ToString();
                if (!IsPostBack)
                {
                    try
                    {
                        int Defectid1 = (int)Session["MySessionVar"];
                        int Defectid = Convert.ToInt32(Defectid1);

                        TdDataAdapter sda1 = dbObj.DefectSearch(Defectid1);
                        sda1.Fill(dt);
                        TxtDefectID.Text = dt.Rows[0]["DefectID"].ToString();
                        TxtDefectName.Text = dt.Rows[0]["DefectName"].ToString();
                        DDLStatus1.SelectedValue = dt.Rows[0]["Status"].ToString();
                        DDlCycle.SelectedValue = dt.Rows[0]["sCycle"].ToString();
                        TxtDescription.Text = dt.Rows[0]["Description"].ToString();
                        txtDate.Text = dt.Rows[0]["sDate"].ToString();
                        DDlAssignedto.SelectedValue = dt.Rows[0]["AssignedTo"].ToString();
                        TxtLastupdated.Text = dt.Rows[0]["CloseDate"].ToString();
                        DDlModule.SelectedValue = dt.Rows[0]["Module"].ToString();
                        TxtTcAssociated.Text = dt.Rows[0]["TestcasesAssociated"].ToString();
                        DDlTester.SelectedValue = dt.Rows[0]["Tester"].ToString();
                        DdlProject.SelectedValue = dt.Rows[0]["Project"].ToString();
                        DDLEnvironment.SelectedValue = dt.Rows[0]["Environment"].ToString();
                        DDLSeverity.SelectedValue = dt.Rows[0]["Severity"].ToString();
                        DDLProjectname.SelectedValue = dt.Rows[0]["Releases"].ToString();
                        DDLRootcause.SelectedValue = dt.Rows[0]["Rootcause"].ToString();
                        // TdDataAdapter sda = new TdDataAdapter();
                        TdDataAdapter sda2 = dbObj.GetComments(Defectid);
                        DataSet ds = new DataSet();
                        sda2.Fill(ds);
                        this.GridDefectSearch.DataSource = ds.Tables[0];
                        GridDefectSearch.DataKeyNames = new string[] { "LastUpdatedDate" };
                        this.GridDefectSearch.DataBind();

                        TdDataAdapter sda3 = dbObj.GetAttachments(Defectid);
                        DataSet ds1 = new DataSet();
                        sda3.Fill(ds1);
                        //this.GridViewAttachments.EnablePersistedSelection = true;
                        //this.GridViewAttachments.AutoGenerateSelectButton = true;


                        dtnew.Columns.Add("File", typeof(string));

                        foreach (DataRow r in ds1.Tables[0].Rows)
                        {
                            string Path = (string)r["Path"];
                            FileInfo fi = new FileInfo(Path);
                            dtnew.Rows.Add(fi.Name);

                        }



                        this.GridViewAttachments.DataSource = dtnew;

                        this.GridViewAttachments.DataBind();






                    }


                    catch (TdException ex)
                    {

                        throw ex;
                    }

                    finally
                    {
                        //Close the Connection from the Database

                    }

                }
                else
                {
                }
            }
        }
        protected void BtnEditDefect_Click(object sender, EventArgs e)
        {

            txtComments.Enabled = true;
            //LbLoginname.Visible = true;
            //LbSystimestamp.Visible = true;
            //LbLoginname.Text = Defect_Tracker_Tool.Login.GlobalClass.loginname + ":";
            //LbSystimestamp.Text = (DateTime.Now).ToString() + ":-"; ;
            TxtDefectName.Enabled = true;
            DDLStatus1.Enabled = true;

            DDlCycle.Enabled = true;
            TxtTcAssociated.Enabled = true;
            DDlModule.Enabled = true;
            DdlProject.Enabled = true;
            DDlAssignedto.Enabled = true;
            DDlTester.Enabled = true;
            //BtnSaveEditted.Enabled = true;





        }

        protected void BtnBacktoHomepage_Click(object sender, EventArgs e)
        {
            Server.Transfer("Home.aspx", true);
        }

        protected void BtnSaveEditted_Click(object sender, EventArgs e)
        {
            if (TxtDefectName.Text == string.Empty || DDLStatus1.SelectedIndex == -1
               || DDlAssignedto.SelectedIndex == -1 || DDlCycle.SelectedIndex == -1 ||
               DdlProject.SelectedIndex == -1 || DDlTester.SelectedIndex == -1 ||
               TxtTcAssociated.Text == string.Empty || DDlModule.SelectedIndex == -1 ||
               txtComments.Text == string.Empty)
            {
                lbMessage.Visible = true;
                lbMessage.Text = "Please enter data in all the fields";

            }
            else
            {
                defectid1 = Convert.ToInt32(this.Session["DefectID11"].ToString());
                DateTime Systimestamp = DateTime.Now;
                string LoginUser = Session["New"].ToString();
                string defectname = TxtDefectName.Text;
                string status = DDLStatus1.SelectedValue.ToString();

                string date1 = txtDate.Text.ToString();
                DateTime date = Convert.ToDateTime(date1);
                int histid = dbObj.GetHistoryid(defectid1);

                string Comments = txtComments.Text;

                DateTime Sysdate1 = DateTime.Now;
                TxtLastupdated.Text = Sysdate1.ToString();
                string item = DDLStatus1.SelectedItem.ToString();


                //defectid = dbObj.GetNextDefectID();
                // DateTime date =  Convert.ToDateTime (txtDate.Text);
                string filenames = "";
                string filesize = "";
                Byte Attachments = 0; ;
                //AtC:\Documents and Settings\z123993\my documents\Downloads\Framework-4-0\FreeTextBox.dlltachments = 0;

                //Attachments = null;
                //dbObj.UpdateDefect(Comments, LoginUser, defectid1, defectname, date, status, DDlCycle.SelectedValue, TxtDescription.Text, DdlProject.SelectedValue, DDlTester.SelectedValue, TxtTcAssociated.Text, DDlModule.SelectedValue, DDlAssignedto.SelectedValue, Sysdate1, filenames, filesize, Attachments, histid);
                //  llbMessage.Visible = true;
                lbMessage.Text = "Defect Added Succesfully";
                System.Web.Mail.MailMessage message = new System.Web.Mail.MailMessage();
                message.From = "vignesh.narayanan@caremark.com";
                message.To = "vignesh.narayanan@caremark.com";
                message.Subject = "Defect Number:-" + TxtDefectID.Text + "";
                message.Body = "Defect Editted and Saved ";
                SmtpClient client = new SmtpClient();
                //client.SendCompleted += new SendCompletedEventHandler();
                System.Web.Mail.SmtpMail.SmtpServer = "azshspp04.caremarkrx.net";
                System.Web.Mail.SmtpMail.Send(message);
                Server.Transfer("HomePage.aspx", true);
            }
        }

        protected void BtnAttachments_Click(object sender, EventArgs e)
        {
            this.Session["DefectID11"] = defectid1;
            Server.Transfer("Attachments.aspx");
        }

        protected void GridViewAttachments_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridViewAttachments.SelectedRow;
            string File = row.Cells[0].Text;
            System.Diagnostics.Process.Start(File);


        }

        protected void BtnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload.FileName == "")
            {
                lbMessage.Visible = true;

            }
            else
            {
                if (FileUpload.HasFile)
                {
                    try
                    {
                        int Defectid1 = Convert.ToInt32(TxtDefectID.Text.ToString());

                        string filename = FileUpload.FileName;
                        //'C:\Documents and Settings\z123993\my documents\visual studio 2010\Projects\Defect\Defect\ '23'~\ 'Testt.java'.
                        string pathString = Server.MapPath("~/ " + Defectid1 + "/ ");
                        if (!System.IO.Directory.Exists(pathString))
                        {

                            System.IO.Directory.CreateDirectory(pathString);
                        }

                        else
                        {
                            pathString = Server.MapPath("~/ " + Defectid1 + "/ ") + filename;
                            if (!System.IO.File.Exists(pathString))
                            {

                                FileUpload.SaveAs(Server.MapPath("~/ " + Defectid1 + "/ ") + filename);
                                string text1 = Server.MapPath("~/ " + Defectid1 + "/ ") + filename;
                                lbMessage.Visible = true;
                                lbMessage.Text = "Upload status: File uploaded!";
                                int id = dbObj.GetAttachid(Defectid1);

                                int id1 = dbObj.AddAttachments(text1, filename, Defectid1, id);
                                string Path1 = text1;
                                FileInfo fii = new FileInfo(Path1);
                                TdDataAdapter sda4 = dbObj.GetAttachments(Defectid1);
                                DataSet ds2 = new DataSet();
                                sda4.Fill(ds2);


                                DataTable dtrenew = new DataTable();
                                dtrenew.Columns.Add("File", typeof(string));

                                foreach (DataRow r in ds2.Tables[0].Rows)
                                {
                                    string Path = (string)r["Path"];
                                    FileInfo fi = new FileInfo(Path);
                                    dtrenew.Rows.Add(fi.Name);

                                }



                                this.GridViewAttachments.DataSource = dtrenew;

                                this.GridViewAttachments.DataBind();
                                //dtnew.Rows.Add(fii.Name);

                            }
                            else
                            {
                                lbMessage.Visible = true;
                                lbMessage.Text = "Upload status: File not uploaded as similar filename exists";
                            }
                        }



                    }
                    catch (Exception ex)
                    {
                        lbMessage.Visible = true;
                        lbMessage.Text = "Upload status: The file could not be uploaded. The following error occured: " + ex.Message;
                    }
                }
            }
        }

        protected void GridViewAttachments_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Download")
            {
                int Defectid1 = Convert.ToInt32(TxtDefectID.Text.ToString());
                Response.Clear();
                Response.ContentType = "application/octect-stream";
                Response.AppendHeader("content-disposition", "attachment;filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/ " + Defectid1 + "/ ") + e.CommandArgument);
                Response.End();
            }

        }



    }

}
