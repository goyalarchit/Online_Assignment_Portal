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

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_status.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("upload.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/successful.aspx");
        }
    }
}