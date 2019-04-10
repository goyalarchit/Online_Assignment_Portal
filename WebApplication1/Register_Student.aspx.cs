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
            int f = 1;
            if (!Regex.IsMatch(TextBox4.Text, @"^[a-zA-Z ]+$"))
            {
                Label1.Text="NAME CAN CONTAIN ONLY LETTERS";
                f = 0;
            }
            if (!Regex.IsMatch(TextBox1.Text, @"^[0-9]+$"))
            {
                Label8.Text="SAP ID CAN CONTAIN ONLY DIGITS";
                f = 0;
            }
            if (!Regex.IsMatch(TextBox5.Text, @"^[0-9]+$"))
            {
                Label2.Text = "ROLL NUMBER CAN CONTAIN ONLY DIGITS";
                f = 0;
            }
            if (string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                Label8.Text = "Required";
                f=0;
            }
            if (string.IsNullOrWhiteSpace(TextBox2.Text))
            {
                Label9.Text = "Required";
                f=0;
            }
            if (string.IsNullOrWhiteSpace(TextBox3.Text))
            {
                Label10.Text = "Required";
                f = 0;
            }
            if (string.IsNullOrWhiteSpace(TextBox4.Text))
            {
                Label1.Text = "Required";
                f = 0;
            }
            if (string.IsNullOrWhiteSpace(TextBox5.Text))
            {
                Label2.Text = "Required";
                f = 0;
            }
            if (ddl_course.SelectedItem.Text == "Select")
            {
                Label3.Text="Required";
                f = 0;
            }
            if (ddl_branch.SelectedItem.Text == "Select")
            {
                Label4.Text = "Required";
                f = 0;
            }
            if (ddl_spl.SelectedItem.Text == "Select")
            {
                Label5.Text = "Required";
                f = 0;
            }
            if (ddl_sem.SelectedItem.Text == "Select")
            {
                Label6.Text = "Required";
                f = 0;
            }
            if (ddl_class.SelectedItem.Text == "Select")
            {
                Label7.Text = "Required";
                f = 0;
            }
            
            if (TextBox2.Text != TextBox3.Text)
            {
                Label10.Text = "PASSWORD DOES NOT MATCH";
                f = 0;
            }

            try
            {
                MySqlConnection con = new MySqlConnection(cs);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("Select count(*) from student_info where ROLL_NO=@ROLL_NO;", con);
                cmd.Parameters.AddWithValue("@ROLL_NO", TextBox5.Text);
                int flag = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                if (flag == 1)
                {
                    Label11.Text="USER ALREADY EXISTS/ CONTACT SYSTEM ADMINISTRATOR";
                    f = 0;
                }
                con.Open();
                cmd.CommandText = "Select count(*) from login_info where SAP_ID=@SAP_ID;";
                cmd.Parameters.AddWithValue("@SAP_ID", TextBox1.Text);
                flag = Convert.ToInt32(cmd.ExecuteScalar());
                con.Close();
                if (flag == 1)
                {
                    Label11.Text = "USER ALREADY EXISTS/ CONTACT SYSTEM ADMINISTRATOR";
                    f = 0;
                }
            }
            catch (Exception )
            {
                Label11.Text = "SOME ERROR OCCURRED :( PLEASE TRY AGAIN LATER";
                return false;
            }
            if (f == 0)
                return false;
            return true;
        }
        private bool update_db_login()
        {

            try
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
            catch (Exception )
            {
                Label11.Text = "SOME ERROR OCCURRED :( PLEASE TRY AGAIN LATER";
                return false;
            }
        }
        private bool update_db_student()
        {

            try
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
            catch (Exception)
            {
                Label11.Text = "SOME ERROR OCCURRED :( PLEASE TRY AGAIN LATER";
                return false;
            }
        }
        private bool roll_back_login()
        {

            try
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
            catch (Exception)
            {
                Label11.Text = "SOME ERROR OCCURRED :( PLEASE TRY AGAIN LATER";
                return false;
            }
        }
    }

}