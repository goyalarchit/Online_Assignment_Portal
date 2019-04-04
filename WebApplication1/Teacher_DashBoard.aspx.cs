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
    public partial class Teacher_DashBoard : System.Web.UI.Page
    {
        String cs = @"server=localhost;Database=web1;Uid=root;Pwd=mysql;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer != null)
            {
                MySqlConnection con = new MySqlConnection(cs);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("SELECT NAME FROM `web1`.`teacher_info` WHERE `SAP_ID`=@SAP_ID;", con);
                cmd.Parameters.AddWithValue("@SAP_ID", Session["ID"]);
                object result = cmd.ExecuteScalar();
                result = result == DBNull.Value ? null : result;
                Session["NAME"] = Convert.ToString(result);
                con.Close();
                Label1.Text = "Welcome " + Session["ID"] + ", " + Session["NAME"];
            }
            else
                Response.Redirect("login.aspx");

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("create.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("view.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("grade.aspx");
        }
    }
}