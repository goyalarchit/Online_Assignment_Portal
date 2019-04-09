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
    public partial class grade : System.Web.UI.Page
    {
        String cs = @"server=localhost;Database=web1;Uid=root;Pwd=mysql;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer == null)
                Response.Redirect("login.aspx");
            if (!IsPostBack)
            {
                Label1.Text = "Welcome " + Session["ID"] + ", " + Session["NAME"];
                populate();
            }
        }

        protected void grade1(object sender, GridViewUpdateEventArgs e)
        {
            string sid = e.Keys[0].ToString();
            TextBox t1 = g1.Rows[e.RowIndex].FindControl("tbox_grade") as TextBox;
            string grade = t1.Text;
            if(update_grade_submit(sid,grade))
                Response.Write("<alert 'GRADE UPDATED' />");


            else
                Response.Write("GRADE CAN NOT BE UPDATED");
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected bool update_grade_submit(string sid,string grade)
        {
            MySqlConnection con = new MySqlConnection(@"server='localhost';user id='root';password=mysql;database=web1");
            MySqlCommand cmd = new MySqlCommand("UPDATE `web1`.`submit_info` SET `GRADE` = @GRADE WHERE (`S_ID` = @S_ID);", con);
            cmd.Parameters.AddWithValue("@S_ID", sid);
            cmd.Parameters.AddWithValue("@GRADE", grade);
            con.Open();
            int f = cmd.ExecuteNonQuery();
            con.Close();
            if (f == 1)
                return true;
            return false;
        }

        protected void g1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            g1.EditIndex = e.NewEditIndex;
            populate();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Teacher_DashBoard.aspx");
        }
        protected void populate()
        {
            populate_assignment();
            MySqlConnection con = new MySqlConnection(cs);
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM `web1`.`submit_info` WHERE A_ID=@A_ID;", con);
            cmd.Parameters.AddWithValue("@A_ID", Session["A_ID"]);
            con.Open();
            g1.DataSource = cmd.ExecuteReader();
            g1.DataBind();
            con.Close();
        }
        protected void populate_assignment()
        {
            MySqlConnection con = new MySqlConnection(cs);
            MySqlCommand cmd = new MySqlCommand("SELECT * FROM `web1`.`assignment_info` WHERE A_ID=@A_ID;", con);
            cmd.Parameters.AddWithValue("@A_ID", Session["A_ID"]);
            con.Open();
            MySqlDataReader r1 = cmd.ExecuteReader();
            while(r1.Read())
            {
                lbl_id.Text = Convert.ToString(r1["A_ID"]);
                lbl_title.Text = Convert.ToString(r1["ASSIGNMENT_TITLE"]);
                lbl_course.Text = Convert.ToString(r1["COURSE"]);
                lbl_branch.Text = Convert.ToString(r1["BRANCH"]);
                lbl_sem.Text = Convert.ToString(r1["SEMESTER"]);
                lbl_class.Text = Convert.ToString(r1["CLASS"]);
                lbl_spl.Text = Convert.ToString(r1["SPECIALISATION"]);
                lbl_deadline.Text = r1["DEADLINE"].ToString();
                lbl_dateasgn.Text = Convert.ToString(r1["DATE_ASSIGNED"]);
                lbl_sub.Text = Convert.ToString(r1["SUBJECT"]);
                lbl_scode.Text = Convert.ToString(r1["SUBJECT_CODE"]);
                lbl_marks.Text = Convert.ToString(r1["MAX_MARKS"]);

            }
            con.Close();
        }
    }
}