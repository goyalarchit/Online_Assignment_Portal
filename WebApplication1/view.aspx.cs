using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace WebApplication1
{
    public partial class view : System.Web.UI.Page
    {
        String cs = @"server=localhost;Database=web1;Uid=root;Pwd=mysql;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer == null || Session["ID"]==null)
                Response.Redirect("login.aspx");
            if(!IsPostBack)
            {
                Label1.Text = "Welcome " + Session["ID"] + ", " + Session["NAME"];
                try
                {
                    MySqlConnection con = new MySqlConnection(cs);
                    MySqlCommand cmd = new MySqlCommand("SELECT * FROM `web1`.`assignment_info` WHERE SAP_ID_TEACHER=@SAP_ID;", con);
                    cmd.Parameters.AddWithValue("@SAP_ID", Session["ID"]);
                    con.Open();
                    g1.DataSource = cmd.ExecuteReader();
                    g1.DataBind();
                    con.Close();
                }
                catch (Exception)
                {
                    Response.Write("<script>alert('SOME ERROR OCCURED / REDIRECTING TO DASHBOARD')</script>");
                    Response.Redirect("~/Teacher_DashBoard.aspx");
                }
            }
        }
        

        protected void g1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int a = e.RowIndex;
            string aid = e.Keys[0].ToString();
            if (delete(aid))

                Response.Write("<alert 'ROW DELETED' />");


            else
                Response.Write("ROW CAN NOT BE DELETED");
            Response.Redirect(Request.Url.AbsoluteUri);

        }
        protected bool delete(string aid)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(@"server='localhost';user id='root';password=mysql;database=web1");
                MySqlCommand cmd = new MySqlCommand("Delete from assignment_info where A_ID=@A_ID;", con);
                cmd.Parameters.AddWithValue("@A_ID", aid);
                con.Open();
                int f = cmd.ExecuteNonQuery();
                con.Close();
                if (f == 1)
                    return true;
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        
        protected void grade(object sender, GridViewUpdateEventArgs e)
        {
            Session["A_ID"] = e.Keys[0].ToString();
            Response.Redirect("~/grade.aspx");

        }
    }
}