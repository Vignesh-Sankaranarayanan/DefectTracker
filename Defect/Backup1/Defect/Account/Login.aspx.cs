using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

namespace test.Account
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SetAuthCookie(LoginUser.UserName, false);
            
            RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString["ReturnUrl"]);
            
        }

        protected void LoginUser_Authenticate(object sender, AuthenticateEventArgs e)
        {
            FormsAuthentication.SetAuthCookie(LoginUser.UserName, false);
            
           
        }

       

       

    }


}
