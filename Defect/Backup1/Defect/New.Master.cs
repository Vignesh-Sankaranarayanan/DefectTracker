using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Defect
{
    public partial class New : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string Label
        {
            get
            {
                return LbUser.Text;
            }
            set
            {
                LbUser.Text = value;
            }
        }

        public string Menu
        {
            get
            {
                return null;
            }
            set
            {
                NavigationMenu.Visible = false;

            }
        }

        public string WelLogOut
        {
            get
            {
                return lbWelcome.Text;
            }
            set
            {
                lbWelcome.Visible = false;
                HyperLogout.Visible = false;
            }
        }

        public string WelLogIn
        {
            get
            {
                return lbWelcome.Text;
            }
            set
            {
                lbWelcome.Visible = true;
                HyperLogout.Visible = true;
            }
        }
    }
}