using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;
namespace WebApplication1
{
    public partial class Register : System.Web.UI.Page
    {
        String cs= @"server=localhost;Database=web1;Uid=root;Pwd=mysql;";
        ListItem liselect= new ListItem("Select","-1");
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                populate_course();
                ddl_branch.Items.Insert(0, liselect);
                ddl_spl.Items.Insert(0, liselect);
                ddl_class.Items.Insert(0, liselect);
                ddl_sem.Items.Insert(0, liselect);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }
        public void populate_course()
        {
            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Select * from course", con);
            ddl_course.DataSource = cmd.ExecuteReader();
            ddl_course.DataTextField = "COURSE_NAME";
            ddl_course.DataValueField = "COURSE_ID";
            ddl_course.DataBind();
            con.Close();
        }

        protected void popu(object sender, EventArgs e)
        {

        }

        protected void populate_branch(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Select * from branch where COURSE_ID="+ddl_course.SelectedValue, con);
            ddl_branch.Items.Clear();
            ddl_branch.DataSource = cmd.ExecuteReader();
            ddl_branch.DataTextField = "BRANCH_NAME";
            ddl_branch.DataValueField = "BRANCH_ID";
            ddl_branch.DataBind();
            ddl_branch.Items.Insert(0, liselect);
            con.Close();
        }

        protected void populate_specialization(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Select * from specialisation where BRANCH_ID=" + ddl_branch.SelectedValue, con);
            ddl_spl.Items.Clear();
            ddl_spl.DataSource = cmd.ExecuteReader();
            ddl_spl.DataTextField = "SPECIALISATION_NAME";
            ddl_spl.DataValueField = "SPECIALISATION_ID";
            ddl_spl.DataBind();
            ddl_spl.Items.Insert(0, liselect);
            con.Close();
        }

        protected void populate_class(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Select * from class where SPECIALISATION_ID=" + ddl_spl.SelectedValue, con);
            ddl_class.Items.Clear();

            ddl_class.DataSource = cmd.ExecuteReader();
            ddl_class.DataTextField = "CLASS_NAME";
            ddl_class.DataValueField = "CLASS_ID";
            ddl_class.DataBind();
            ddl_class.Items.Insert(0, liselect);
            con.Close();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(validate())
            {
                if (update_db_login())
                {
                    if (update_db_student())
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

            if (ddl_course.SelectedItem.Text == "Select" || ddl_branch.SelectedItem.Text == "Select" || ddl_spl.SelectedItem.Text == "Select" || ddl_sem.SelectedItem.Text == "Select" || ddl_class.SelectedItem.Text == "Select")
            {
                Response.Write("<script>alert('FILL ALL REQUIRED FIELDS')</script>");
                return false;
            }
            if (ddl_course.Items.Count < 1 || ddl_branch.Items.Count < 1 || ddl_spl.Items.Count < 1 || ddl_sem.Items.Count < 1 || ddl_class.Items.Count < 1)
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
                Response.Write("<script>alert('ROLL NUMBER CAN CONTAIN ONLY DIGITS')</script>");
                return false;
            }
            if (TextBox2.Text != TextBox3.Text)
            {
                Response.Write("<script>alert('PASSWORD DOES NOT MATCH')</script>");
                return false;
            }
            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Select count(*) from student_info where ROLL_NO=@ROLL_NO;", con);
            cmd.Parameters.AddWithValue("@ROLL_NO", TextBox5.Text);
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
            MySqlCommand cmd = new MySqlCommand("INSERT INTO `web1`.`login_info` (`SAP_ID`, `PWD`, `UTYPE`) VALUES (@SAP_ID, @PWD, '1');", con);
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
        private bool update_db_student()
        {

            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO `web1`.`student_info` (`SAP_ID`, `ROLL_NO`, `NAME`, `COURSE`, `BRANCH`, `SPECIALISATION`, `SEMESTER`, `CLASS`) VALUES (@SAP_ID, @ROLL_NO, @NAME, @COURSE, @BRANCH, @SPECIALISATION, @SEMESTER, @CLASS);", con);
            cmd.Parameters.AddWithValue("@SAP_ID", TextBox1.Text);
            cmd.Parameters.AddWithValue("@ROLL_NO", TextBox5.Text);
            cmd.Parameters.AddWithValue("@NAME", TextBox4.Text);
            cmd.Parameters.AddWithValue("@COURSE", ddl_course.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BRANCH", ddl_branch.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SPECIALISATION", ddl_spl.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SEMESTER", ddl_sem.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CLASS", ddl_class.SelectedItem.Text);
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