using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string cs = @"server=localhost;Database=dit;Uid=root;Pwd=mysql;";
        protected void Page_Load(object sender, EventArgs e)
        {
            

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {

        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (TextBox1.Text == "ARCHIT" && TextBox2.Text == "123")
            {
                MySqlConnection con = new MySqlConnection(cs);
                con.Open();
                //Response.Redirect("successful.aspx");
                try
                {
                    
                    MySqlCommand cmd = new MySqlCommand("Select * from student43;",con);
                    MySqlDataReader rd = cmd.ExecuteReader();
                    GridView1.DataSource = rd;
                    GridView1.DataBind();
                    Panel1.Visible = true;
                }
                finally
                {
                    con.Close();
                }
            }
            else
            {
                Response.Write("<script>alert('INCORRECT USERNAME / PASSWORD')</script>");
            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}