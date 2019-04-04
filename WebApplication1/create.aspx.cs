using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Text.RegularExpressions;
using System.IO;

namespace WebApplication1
{
    public partial class create : System.Web.UI.Page
    {
        String cs = @"server=localhost;Database=web1;Uid=root;Pwd=mysql;";
        string Aid;
        string filelocation;
        ListItem liselect = new ListItem("Select", "-1");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer == null)
                Response.Redirect("Teacher_DashBoard.aspx");
            if (!IsPostBack)
            {
                Label1.Text = "Welcome " + Session["ID"] + ", " + Session["NAME"];
                populate_course();
                ddl_branch.Items.Insert(0, liselect);
                ddl_spl.Items.Insert(0, liselect);
                ddl_class.Items.Insert(0, liselect);
                ddl_sem.Items.Insert(0, liselect);
            }
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


        protected void populate_branch(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("Select * from branch where COURSE_ID=" + ddl_course.SelectedValue, con);
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
            if (validate())
            {
                if (update_db_assignment())
                {
                    find_aid();
                    if (upload())
                    {
                        if (update_description())
                            Response.Write("<script>alert('ASSIGNMENT CREATED SUCCESSFULLY')</script>");
                        else
                        {
                            roll_back_assignment();
                            Response.Write("<script>alert('ASSIGNMENT CAN NOT BE CREATED<br> PLEASE TRY AGAIN')</script>");
                        }
                    }
                    else
                    {
                        roll_back_assignment();
                        Response.Write("<script>alert('ASSIGNMENT CAN NOT BE CREATED<br> PLEASE TRY AGAIN')</script>");
                    }
                }
                else
                    Response.Write("<script>alert('ASSIGNMENT CAN NOT BE CREATED<br> PLEASE TRY AGAIN')</script>");
            }
        }
        private bool validate()
        {
            
            if(empty_TBOX())
            {
                lbl_common.Text = "FILL ALL REQUIRED FIELDS";
                lbl_common.ForeColor = System.Drawing.Color.Red;
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
            if (!Regex.IsMatch(Tbox_marks.Text, @"^[0-9]+$"))
            {
                lbl_deadline.Text = "Marks are allowed only in digits";
                return false;
            }
            return true;
        }

        private bool update_db_assignment()
        {

            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("INSERT INTO `web1`.`assignment_info` (`ASSIGNMENT_TITLE`, `SUBJECT`, `SUBJECT_CODE`, `COURSE`, `BRANCH`, `SPECIALISATION`, `SEMESTER`, `CLASS`, `DESCRIPTION`, `SAP_ID_TEACHER`, `DEADLINE`, `MAX_MARKS`, `DATE_ASSIGNED`) VALUES (@ASSIGNMENT_TITLE, @SUBJECT, @SUBJECT_CODE, @COURSE, @BRANCH, @SPECIALISATION, @SEMESTER, @CLASS, @DESCRIPTION, @SAP_ID_TEACHER, @DEADLINE, @MAX_MARKS, @DATE_ASSIGNED);", con);
            // `DEADLINE`, `MAX_MARKS`, `DATE_ASSIGNED`
            
            cmd.Parameters.AddWithValue("@ASSIGNMENT_TITLE", Tbox_Title.Text);
            cmd.Parameters.AddWithValue("@SUBJECT", Tbox_sub.Text);
            cmd.Parameters.AddWithValue("@SUBJECT_CODE", Tbox_scode.Text);
            cmd.Parameters.AddWithValue("@COURSE", ddl_course.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@BRANCH", ddl_branch.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SPECIALISATION", ddl_spl.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@SEMESTER", ddl_sem.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CLASS", ddl_class.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@DESCRIPTION", "UPDATED SOON");
            cmd.Parameters.AddWithValue("@SAP_ID_TEACHER", Session["ID"]);
            cmd.Parameters.AddWithValue("@DEADLINE", Tbox_deadline.Text);
            cmd.Parameters.AddWithValue("@MAX_MARKS", Tbox_marks.Text);
            cmd.Parameters.AddWithValue("@DATE_ASSIGNED", DateTime.Now.ToString("yyyy-M-dd HH-mm-ss"));
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
        private bool roll_back_assignment()
        {

            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("DELETE FROM `web1`.`assignment_info` WHERE (`A_ID` = @A_ID);", con);
            cmd.Parameters.AddWithValue("@A_ID", Aid);
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


        public bool update_description()
        {
            MySqlConnection con = new MySqlConnection(cs);
            con.Open();
            MySqlCommand cmd = new MySqlCommand("UPDATE `web1`.`assignment_info` SET `DESCRIPTION` = @DESCRIPTION WHERE (`A_ID` = @A_ID);", con);
            
            cmd.Parameters.AddWithValue("@DESCRIPTION",filelocation);
            cmd.Parameters.AddWithValue("@A_ID", Aid);
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


        private bool upload()
        {
            if(FileUpload1.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
                fileExtension = fileExtension.ToLower();
                if(fileExtension==".docx"|| fileExtension == ".doc"|| fileExtension == ".pdf"|| fileExtension == ".jpg"|| fileExtension == ".jpeg")
                {
                    int filesize = FileUpload1.PostedFile.ContentLength;
                    if(filesize>1024*1024*2)
                    {
                        lbl_upload.Text = "Oops ! FileSize > 2MB";
                        lbl_upload.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        filelocation = "~/Uploads/" + Aid + "/Description/";
                        if(!Directory.Exists(Server.MapPath(filelocation)))
                            Directory.CreateDirectory(Server.MapPath(filelocation));
                        filelocation = filelocation + FileUpload1.FileName;
                        FileUpload1.SaveAs(Server.MapPath(filelocation));
                        lbl_upload.Text = "File Uploaded";
                        lbl_upload.ForeColor = System.Drawing.Color.Green;
                        return true;
                    }
                }
                else
                {
                    lbl_upload.Text = "Only Files with .pdf/.docx/.doc/.jpg/.jpeg Are Allowed";
                    lbl_upload.ForeColor = System.Drawing.Color.Red;
                }
            }
            else
            {
                lbl_upload.Text = "Please select A File To Upload";
                lbl_upload.ForeColor = System.Drawing.Color.Red;
            }
            return false;
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Teacher_Dashboard.aspx");
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if(!Calendar1.Visible)
            {
                Calendar1.Visible = true;
            
            }
            else
            {
                Calendar1.Visible = false;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Tbox_deadline.Text = Calendar1.SelectedDate.ToString("yyyy-M-dd");
        }
        private bool empty_TBOX()
        {
            bool flag = false;
            if (string.IsNullOrWhiteSpace(Tbox_Title.Text))
            {

                lbl_title.Text = "Title Required";
                lbl_title.ForeColor = System.Drawing.Color.Red;
                flag = true;
            }
            if (string.IsNullOrWhiteSpace(Tbox_sub.Text))
            {

                lbl_subject.Text = "Subject Required";
                lbl_subject.ForeColor = System.Drawing.Color.Red;
                flag = true;
            }
            if (string.IsNullOrWhiteSpace(Tbox_scode.Text))
            {

                lbl_scode.Text = "Subject Code Required";
                lbl_scode.ForeColor = System.Drawing.Color.Red;
                flag = true;
            }
            if (string.IsNullOrWhiteSpace(Tbox_deadline.Text))
            {

                lbl_deadline.Text = "Please Select";
                lbl_deadline.ForeColor = System.Drawing.Color.Red;
                flag = true;
            }
            if (string.IsNullOrWhiteSpace(Tbox_marks.Text))
            {

                lbl_marks.Text = "Maximum Marks Required";
                lbl_marks.ForeColor = System.Drawing.Color.Red;
                flag = true;
            }
            return flag;
        }
        public void find_aid()
        {
            MySqlConnection con = new MySqlConnection(cs);
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM web1.assignment_info where DATE_ASSIGNED=(SELECT MAX(DATE_ASSIGNED) FROM web1.assignment_info) AND SAP_ID_TEACHER=@SAP_ID;", con);
            con.Open();
            cmd.Parameters.AddWithValue("@SAP_ID", Session["ID"]);
            object result = cmd.ExecuteScalar();
            result = result == DBNull.Value ? null : result;
            Aid = result.ToString();
            con.Close();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            if(e.Day.Date<DateTime.Now)
            {
                e.Day.IsSelectable = false;
            }
        }

        protected void Calendar1_DayRender1(object sender, DayRenderEventArgs e)
        {

        }

       
    }
}