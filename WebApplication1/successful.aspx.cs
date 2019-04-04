using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class successful : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["ID"]!=null)
            {
                Response.Write("LOGIN IS SUCCESSFUL" + Session["ID"]);
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }
    }
}