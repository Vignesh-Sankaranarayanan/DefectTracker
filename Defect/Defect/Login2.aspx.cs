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
    public partial class Login2 : System.Web.UI.Page
    {
        DataAccesLayer dbObj = new DataAccesLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Session["New"] = null;
            this.Master.Label = "";
            this.Master.WelLogOut = "";
            LbError.Visible = false;
            LbError.Text = "";
            this.Master.Menu = "";
           
            



        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string Username = TxtUsername.Text;
            string password = TxtPasword.Text;

            if (Username == "" || password == "")
            {
                LbError.Visible = true;
                LbError.Text = "Enter Username and Password";

            }


            else
            {
                string Username1 = "";
                string Password1 = "";
                int id;
                TdDataAdapter Usersearch = dbObj.Usersearch(Username, password);
                DataTable ds2 = new DataTable();
                Usersearch.Fill(ds2);
                foreach (DataRow r in ds2.Rows)
                {
                    Username1 = (string)r["Username"];
                    Password1 = (string)r["Password1"];


                }

                if (Username1 == Username && password == Password1)
                {
                    Session["New"] = TxtUsername.Text;

                    Response.Redirect("HomePage.aspx");
                }
                else
                {
                    LbError.Visible = true;
                    LbError.Text = "User Not valid,Try again";
                }




                //id = dbObj.Login(Username, password);

            }
        }




    }
}