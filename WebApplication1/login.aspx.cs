using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using MySql.Data;
using System.Data;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        string cs = @"server=localhost;Database=web1;Uid=root;Pwd=mysql;";

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
        {
           
        }
        private bool authenticate(string uname,string upass,int usrtyp)
        {
            try
            {
                MySqlConnection con = new MySqlConnection(cs);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("Select count(*) from login_info where SAP_ID=@SAP_ID AND PWD=@PWD AND UTYPE=@UTYPE;", con);
                cmd.Parameters.AddWithValue("@SAP_ID", uname);
                cmd.Parameters.AddWithValue("@PWD", upass);
                cmd.Parameters.AddWithValue("@UTYPE", usrtyp);
                object result = cmd.ExecuteScalar();
                result = result == DBNull.Value ? null : result;
                int flag = Convert.ToInt32(result);
                con.Close();
                if (flag == 1)
                {
                    Session["ID"] = uname;
                    return true;
                }
                return false;
            }
            catch (Exception)
            {

                Response.Write("<script>alert('SOME ERROR OCCURED')</script>");
                return false;
            }
        }

        protected int usertype()
        {
            if (RadioButton1.Checked == true)
                return 1;
            else if (RadioButton2.Checked == true)
                return 2;
            else
                return -1;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            Response.Redirect("Register.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(TextBox1.Text))
                Label1.Text = "This Field Is Mandatory";
            if (string.IsNullOrWhiteSpace(TextBox2.Text))
                Label2.Text = "This Field Is Mandatory";
            if (usertype()<0)
                Label3.Text = "This Field Is Mandatory";
            else
            {
                int utype = usertype();
                if (authenticate(TextBox1.Text, TextBox2.Text, utype))
                {
                    if(utype==1)
                        Response.Redirect("successful.aspx");
                    else
                        Response.Redirect("Teacher_DashBoard.aspx");
                }
                else
                {
                    Label4.Text="INCORRECT USERNAME / PASSWORD";
                }
            }
        }
    }
}