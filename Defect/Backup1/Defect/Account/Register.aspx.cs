using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using Teradata.Client.Provider;

namespace test.Account
{
    public partial class Register : System.Web.UI.Page
    {
        Defect.DataAccesLayer dbObj = new Defect.DataAccesLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
           // RegisterUser.ContinueDestinationPageUrl = Request.QueryString["ReturnUrl"];
        }

        protected void RegisterUser_CreatedUser(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(RegisterUser.UserName, false /* createPersistentCookie */);
            

            string continueUrl = RegisterUser.ContinueDestinationPageUrl;
            if (String.IsNullOrEmpty(continueUrl))
            {
                continueUrl = "~/";
            }
            Response.Redirect(continueUrl);
            //String LoginUser = "";
            //String Password ="";
            //String Email ="";
            
            //LoginUser = RegisterUser.UserName;
            //Password = RegisterUser.Password;
            //Email = RegisterUser.Email;

            //int id = dbObj.InsertLogin(LoginUser, Password, Email);
            //if (id == 0)
            //{
            //    RegisterUser.InvalidAnswerErrorMessage = "Username laready exist";
            //}
            //else
            //{
            //    Server.Transfer("Home.aspx", true);
            //}
              
        }

    }
}
