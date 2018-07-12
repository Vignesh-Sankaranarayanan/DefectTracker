using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using Teradata.Client.Provider;
using System.Data;
using System.Web.Configuration;
//using System.Web.Mail;
using System.Web.Hosting;
using System.Net.Mail;
using System.Net;
using System.Text;
using Microsoft.Office.Interop.Outlook;
using System.Web;
using System.Data;
namespace Defect
{
    public partial class NewDefectPage : System.Web.UI.Page
    {
        DataAccesLayer dbObj = new DataAccesLayer();
        int defectid = 0;
        DateTime Sysdate = DateTime.Now;
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
                    defectid = dbObj.GetNextDefectID();
                    TxtDefectID.Text = defectid.ToString();
                    TxtDefectID.Enabled = false;
                    lbMessage.Visible = false;

                    txtDate.Text = Sysdate.ToString("MM/dd/yyyy HH:mm:ss");
                    txtDate.Enabled = false;
                    //TxtLastupdated.Enabled = false;
                    //TxtLastupdated.Text = DateTime.Now.ToString();
                }
                else
                {

                }
            }
        }

        protected void BtnEnter_Click(object sender, EventArgs e)
        {
            if (TxtDefectName.Text == string.Empty || DDLStatus.SelectedIndex == -1
                || DDlAssignedto.SelectedIndex == -1 || DDlCycle.SelectedIndex == -1 ||
                DdlProject.SelectedIndex == -1 || DDlTester.SelectedIndex == -1 ||
                /*TxtTcAssociated.Text == string.Empty || */ DDlModule.SelectedIndex == -1
                || DDLProjectname.SelectedIndex == -1 || DDLEnvironment.SelectedIndex == -1 || DDLSeverity.SelectedIndex == -1
                )
            {
                lbMessage.Visible = true;
                lbMessage.Text = "Please enter data in the required fields";

            }
            else
            {
                try
                {
                    defectid = dbObj.GetNextDefectID();
                    this.Session["DefectID11"] = defectid;
                    DateTime date = Convert.ToDateTime(txtDate.Text);
                    TdTimestamp CreateDate = new TdTimestamp(date);
                    TdTimestamp UpdateDate = new TdTimestamp(date);
                    //DateTime date1 = Convert.ToDateTime(date);

                    string filenames = "";
                    string filesize = "";
                    Byte Attachments;
                    Attachments = 0;
                    string LoginUser = Session["New"].ToString();
                    string Rootcause = "";
                    //Attachments = null;
                    dbObj.InsertDefect(LoginUser, defectid, TxtDefectName.Text, CreateDate, DDLStatus.SelectedValue, DDlCycle.SelectedValue, TxtSteps.Text, DdlProject.SelectedValue, DDlTester.SelectedValue, TxtTcAssociated.Text, DDlModule.SelectedValue, DDlAssignedto.SelectedValue, UpdateDate, filenames, filesize, Attachments, DDLEnvironment.SelectedValue, DDLSeverity.SelectedValue, DDLProjectname.SelectedValue, Rootcause);
                    lbMessage.Visible = true;
                    lbMessage.Text = "Defect Added Succesfully";



                    // string MessageBody="";
                    MailMessage mailMessage = new MailMessage();
                    mailMessage.To.Add("vignesh.narayanan@caremark.com");
                    mailMessage.From = new MailAddress("vignesh.narayanan@caremark.com");
                    mailMessage.Subject = "New Defect Added-Defect ID " + defectid + "";

                    mailMessage.Body = mailMessage.Body + "<p>A New Defect has been added by " + LoginUser + " </p>";
                    mailMessage.Body = mailMessage.Body + "<p><fieldset><legend><strong>Defect Details:-</strong></legend>";
                    mailMessage.Body = mailMessage.Body + "" + LBDefectID.Text + "&nbsp:" + TxtDefectID.Text + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + LBDefectName.Text + "&nbsp:'" + TxtDefectName.Text + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + LBCycle.Text + "&nbsp:" + DDlCycle.SelectedItem.Text + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + LbModule.Text + "&nbsp:" + DDlModule.SelectedItem.Text + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + LBDate.Text + "&nbsp:" + txtDate.Text + "<br/>";
                    // mailMessage.Body = mailMessage.Body + "" + lbupdatedate.Text + "&nbsp:" + TxtLastupdated.Text + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + LBStatus.Text + "&nbsp:" + DDLStatus.Text + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + lbAssignedto.Text + "&nbsp:" + DDlAssignedto.Text + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + lbProject.Text + "&nbsp:" + DdlProject.SelectedItem.Text + "<br/>";
                    //  mailMessage.Body = mailMessage.Body + "" + LBAttachments.Text + "&nbsp:;" + GridViewAttachments. + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + LBTCAssociated.Text + "&nbsp:" + TxtTcAssociated.Text + "<br/>";
                    mailMessage.Body = mailMessage.Body + "" + LBSteps.Text + "&nbsp:" + TxtSteps.Text + "<br/>";
                    mailMessage.IsBodyHtml = true;

                    SmtpClient smtpClient = new SmtpClient("azshspp04.caremarkrx.net");

                    smtpClient.Send(mailMessage);
                    // Response.Write("E-mail sent!");
                    Server.Transfer("HomePage.aspx", true);
                }
                catch (TdException ex)
                {
                    Response.Write("Could not send the e-mail - error: " + ex.Message);
                }





            }
        }

        protected void BtnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("NewDefectPage.aspx", true);
        }

        protected void BtnBrowse_Click(object sender, EventArgs e)
        {
            this.Session["DefectID11"] = defectid;
            Server.Transfer("Attachments.aspx", true);
        }

        protected void BtnAdd_Click(object sender, EventArgs e)
        {
            if (FileUpload.FileName == "")
            {
                lbMessage.Visible = true;
                lbMessage.Text = "No attachment selected";

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

                        }
                        else
                        {
                            lbMessage.Visible = true;
                            lbMessage.Text = "Upload status: File not uploaded as similar filename exists";
                        }




                    }
                    catch (System.Exception ex)
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
                Response.AppendHeader("content-disposition", "filename=" + e.CommandArgument);
                Response.TransmitFile(Server.MapPath("~/ " + Defectid1 + "/ ") + e.CommandArgument);
                Response.End();
            }

        }

        protected void BtnCancel_Click(object sender, EventArgs e)
        {
            FileUpload.FileContent.Close();
        }
    }
}