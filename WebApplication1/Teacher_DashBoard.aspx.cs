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
            if (Request.UrlReferrer != null && Session["ID"]!=null)
            {
                if(!populate_names())
                {
                    Response.Write("<script>alert('SOME ERROR OCCURED')</script>");
                    Response.Redirect("~/login.aspx");
                }
            }
            else
                Response.Redirect("login.aspx");

        }

        
        protected bool populate_names()
        {

            try
            {
                MySqlConnection con = new MySqlConnection(cs);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("SELECT * FROM `web1`.`teacher_info` WHERE `SAP_ID`=@SAP_ID;", con);
                cmd.Parameters.AddWithValue("@SAP_ID", Session["ID"]);
                MySqlDataReader r1 = cmd.ExecuteReader();
                while (r1.Read())
                {
                    lbl_name.Text = r1["NAME"].ToString();
                    lbl_sap.Text = r1["SAP_ID"].ToString();
                    lbl_empno.Text = r1["EMP_NO"].ToString();

                }
                Session["NAME"] = lbl_name.Text;
                con.Close();
                Label1.Text = "Welcome " + Session["ID"] + ", " + Session["NAME"];
            }
            catch (Exception)
            {
                return false;
            }
            return true;
        }
    }
}