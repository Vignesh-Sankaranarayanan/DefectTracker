using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Teradata.Client.Provider;
using System.Management;

namespace Defect
{
    public partial class RegistrationPage : System.Web.UI.Page
    {

        DataAccesLayer dbObj = new DataAccesLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Session["New"] = null;
            this.Master.Label = "";
            this.Master.WelLogOut = "";

            LbMessage.Visible = false;
            LbMessage.Text = "";

            this.Master.Menu = "";

        }

        protected void Register_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string Password = txtPassword.Text;
            int id = 0;
            if (username == "" || Password == "")
            {
                LbMessage.Visible = true;
                LbMessage.Text = "Enter Username and Password";

            }




            else
            {
                string Username1 = "";
                string Password1 = "";

                TdDataAdapter Usersearch = dbObj.Usersearch(username, Password);
                DataTable ds2 = new DataTable();
                Usersearch.Fill(ds2);
                foreach (DataRow r in ds2.Rows)
                {
                    Username1 = (string)r["Username"];
                    Password1 = (string)r["Password1"];


                }

                if (Username1 == username)
                {
                    LbMessage.Visible = true;
                    LbMessage.Text = "User already exist";

                }
                else
                {
                    id = dbObj.InsertLogin(username, Password);
                    if (id == 1)
                    {
                        LbMessage.Visible = true;
                        LbMessage.Text = " User added succesfully";
                        Session["New"] = txtUsername.Text;
                        Response.Redirect("HomePage.aspx");
                    }

                    else
                    {
                        LbMessage.Visible = true;
                        LbMessage.Text = " Error occurred during user registration";
                        Response.Redirect("Login2.aspx");


                    }




                }

            }
        }
    }
}