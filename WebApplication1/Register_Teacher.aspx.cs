using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;

namespace WebApplication1
{
    public partial class Register_Teacher : System.Web.UI.Page
    {
        String cs = @"server=localhost;Database=web1;Uid=root;Pwd=mysql;";
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (validate())
            {
                if (update_db_login())
                {
                    if (update_db_teacher())
                        Response.Write("<script>alert('ACCOUNT CREATED SUCCESSFULLY')</script>");
                    else
                    {
                        roll_back_login();
                        Response.Write("<script>alert('ACCOUNT CAN NOT BE CREATED<br/> PLEASE TRY AGAIN')</script>");
                    }
                }
                else
                    Response.Write("<script>alert('ACCOUNT CAN NOT BE CREATED<br/> PLEASE TRY AGAIN')</script>");
            }
        }
        private bool validate()
        {
            if (string.IsNullOrWhiteSpace(TextBox1.Text) || string.IsNullOrWhiteSpace(TextBox2.Text) || string.IsNullOrWhiteSpace(TextBox3.Text) || string.IsNullOrWhiteSpace(TextBox4.Text) || string.IsNullOrWhiteSpace(TextBox5.Text))
            {
                Response.Write("<script>alert('FILL ALL REQUIRED FIELDS')</script>");
                return false;
            }

            if (!Regex.IsMatch(TextBox4.Text, @"^[a-zA-Z ]+$"))
            {
                Response.Write("<script>alert('NAME CAN CONTAIN ONLY LETTERS')</script>");
                return false;
            }
            if (!Regex.IsMatch(TextBox1.Text, @"^[0-9]+$"))
            {
                Response.Write("<script>alert('SAP_ID CAN CONTAIN ONLY DIGITS')</script>");
                return false;
            }
            if (!Regex.IsMatch(TextBox5.Text, @"^[0-9]+$"))
            {
                Response.Write("<script>alert('EMPLOYEE NUMBER CAN CONTAIN ONLY DIGITS')</script>");
                return false;
            }
            if (TextBox2.Text != TextBox3.Text)
            {
                Response.Write("<script>alert('PASSWORD DOES NOT MATCH')</script>");
                return false;
            }
            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Select count(*) from teacher_info where EMP_NO=@EMP_NO;", con);
            cmd.Parameters.AddWithValue("@EMP_NO", TextBox5.Text);
            int f = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (f == 1)
            {
                Response.Write("<script>alert('USER ALREADY EXISTS/ CONTACT SYSTEM ADMINISTRATOR')</script>");
                return false;
            }
            con.Open();
            cmd.CommandText = "Select count(*) from login_info where SAP_ID=@SAP_ID;";
            cmd.Parameters.AddWithValue("@SAP_ID", TextBox1.Text);
            f = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();
            if (f == 1)
            {
                Response.Write("<script>alert('USER ALREADY EXISTS/ CONTACT SYSTEM ADMINISTRATOR')</script>");
                return false;
            }
            return true;
        }
        private bool update_db_login()
        {

            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO `web1`.`login_info` (`SAP_ID`, `PWD`, `UTYPE`) VALUES (@SAP_ID, @PWD, '2');", con);
            cmd.Parameters.AddWithValue("@SAP_ID", TextBox1.Text);
            cmd.Parameters.AddWithValue("@PWD", TextBox2.Text);
            object result = cmd.ExecuteNonQuery();
            result = result == DBNull.Value ? null : result;
            int flag = Convert.ToInt32(result);
            con.Close();
            if (flag == 1)
            {
                return true;
            }
            return false;
        }
        private bool update_db_teacher()
        {

            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO `web1`.`teacher_info` (`SAP_ID`, `EMP_NO`, `NAME`) VALUES (@SAP_ID, @EMP_NO, @NAME);", con);
            cmd.Parameters.AddWithValue("@SAP_ID", TextBox1.Text);
            cmd.Parameters.AddWithValue("@EMP_NO", TextBox5.Text);
            cmd.Parameters.AddWithValue("@NAME", TextBox4.Text);
            object result = cmd.ExecuteNonQuery();
            result = result == DBNull.Value ? null : result;
            int flag = Convert.ToInt32(result);
            con.Close();
            if (flag == 1)
            {
                return true;
            }
            return false;
        }
        private bool roll_back_login()
        {

            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("DELETE FROM `web1`.`login_info` WHERE (`SAP_ID` = @SAP_ID);", con);
            cmd.Parameters.AddWithValue("@SAP_ID", TextBox1.Text);
            object result = cmd.ExecuteNonQuery();
            result = result == DBNull.Value ? null : result;
            int flag = Convert.ToInt32(result);
            con.Close();
            if (flag == 1)
            {
                return true;
            }
            return false;
        }
    }
}