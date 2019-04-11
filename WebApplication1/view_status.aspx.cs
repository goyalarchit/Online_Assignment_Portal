using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;
using System.IO;
namespace WebApplication1
{
    public partial class view_status : System.Web.UI.Page
    {
        DataSet Ds1;
        string filelocation,Aid;
        String cs = @"server=localhost;Database=web1;Uid=root;Pwd=mysql;";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.UrlReferrer == null)
                Response.Redirect("login.aspx");
            if (!IsPostBack)
            {
                Label1.Text = "Welcome " + Session["ID"] + ", " + Session["NAME"];
                statustable();
                populate_ddl();
            }
        }
        protected void statustable()
        {
            try
            {
                MySqlConnection con = new MySqlConnection(cs);

                string cd = "SELECT * FROM `web1`.`assignment_info` A JOIN `web1`.`student_info` B ON A.COURSE=B.COURSE AND A.BRANCH=B.BRANCH AND A.SPECIALISATION =B.SPECIALISATION AND A.CLASS=B.CLASS AND A.SEMESTER=B.SEMESTER WHERE SAP_ID=@SAP_ID ;";
                string cd1 = "SELECT * FROM `web1`.`submit_info` A JOIN `web1`.`student_info` B ON A.SAP_ID=B.SAP_ID WHERE A.SAP_ID=@SAP_ID;";
                MySqlCommand cmd = new MySqlCommand(cd, con);
                cmd.Parameters.AddWithValue("@SAP_ID", Session["ID"]);
                MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                ds.Tables.Add("t1");
                ds.Tables.Add("t2");
                da.Fill(ds.Tables["t1"]);

                cmd.CommandText = cd1;
                da.SelectCommand = cmd;
                da.Fill(ds.Tables["t2"]);
                ds.Tables["t1"].Columns.Add("STATUS");
                ds.Tables["t1"].Columns.Add("GRADE");
                int i = ds.Tables["t1"].Rows.Count;
                int j = ds.Tables["t1"].Rows.Count;
                int flag = 0;
                DataTable asgn = ds.Tables["t1"];
                DataTable rd = ds.Tables["t2"];
                foreach (DataRow row in asgn.Rows)
                {
                    flag = 0;
                    foreach (DataRow row2 in rd.Rows)
                    {
                        if ((Convert.ToString(row["A_ID"])).Equals(Convert.ToString(row2["A_ID"])))
                        {
                            if (String.IsNullOrEmpty(row2["GRADE"].ToString()))
                            {
                                row["GRADE"] = null;
                                row["STATUS"] = "SUBMITTED";
                            }
                            else
                            {
                                row["GRADE"] = Convert.ToString(row2["GRADE"]);
                                row["STATUS"] = "GRADED";
                            }
                            flag = 1;
                        }
                    }
                    if (flag == 0)
                    {
                        DateTime date = Convert.ToDateTime(row["DEADLINE"]);
                        if (date < DateTime.Now)
                        {
                            row["STATUS"] = "DELAYED";
                            row["GRADE"] = null;
                        }
                        else
                        {
                            row["STATUS"] = "PENDING";
                            row["GRADE"] = null;
                        }
                    }
                }
                Ds1 = ds;
                g1.DataSource = ds.Tables["t1"];
                g1.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/successful.aspx");
        }
        public void populate_ddl()
        {
            DropDownList1.Items.Add(new ListItem("SELECT ASSIGNMENT ID"));
            foreach (DataRow row in Ds1.Tables["t1"].Rows)
            {
                string s1 = Convert.ToString(row["STATUS"]);
                if(s1.Equals("PENDING"))
                {
                    DropDownList1.Items.Add(new ListItem(Convert.ToString(row["A_ID"])));
                }
            }
            DropDownList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(Convert.ToString(DropDownList1.SelectedValue).Equals("SELECT ASSIGNMENT ID"))
            {
                lbl_upload.Text = "Please Select An Assignment ID";
                lbl_upload.ForeColor = System.Drawing.Color.Red;
            }
            else
            {
                Aid = DropDownList1.SelectedValue;
                if (upload())
                    {
                    if (update_submit())
                    {
                        Response.Write("<script>alert('ASSIGNMENT SUBMITTED SUCCESSFULLY')</script>");
                        Response.Redirect("~/view_status.aspx");
                    }
                    else
                    {
                        delete_upload();
                        Response.Write("<script>alert('ASSIGNMENT CAN NOT BE SUBMITTED<br> PLEASE TRY AGAIN')</script>");
                    }
                    }
                else
                    Response.Write("<script>alert('ASSIGNMENT CAN NOT BE SUBMITTED<br> PLEASE TRY AGAIN')</script>");
            }
        }

        private bool upload()
        {
            if (FileUpload1.HasFile)
            {
                string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);
                fileExtension = fileExtension.ToLower();
                if (fileExtension == ".docx" || fileExtension == ".doc" || fileExtension == ".pdf" || fileExtension == ".jpg" || fileExtension == ".jpeg")
                {
                    int filesize = FileUpload1.PostedFile.ContentLength;
                    if (filesize > 1024 * 1024 * 2)
                    {
                        lbl_upload.Text = "Oops ! FileSize > 2MB";
                        lbl_upload.ForeColor = System.Drawing.Color.Red;
                    }
                    else
                    {
                        filelocation = "~/Uploads/" + Aid + "/Submission/";
                        if (!Directory.Exists(Server.MapPath(filelocation)))
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
        private bool update_submit()
        {

            try
            {
                MySqlConnection con = new MySqlConnection(cs);
                con.Open();
                MySqlCommand cmd = new MySqlCommand("INSERT INTO `web1`.`submit_info` (`SAP_ID`, `ROLL_NO`, `NAME`, `FILE_LOCATION`, `GRADE`, `A_ID`) VALUES(@SAP_ID, @ROLL_NO, @NAME, @FILE_LOCATION, '', @A_ID);", con);
                cmd.Parameters.AddWithValue("@SAP_ID", Session["ID"]);
                cmd.Parameters.AddWithValue("@ROLL_NO", Session["ROLL_NO"]);
                cmd.Parameters.AddWithValue("@NAME", Session["NAME"]);
                cmd.Parameters.AddWithValue("@FILE_LOCATION", filelocation);
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
            catch (Exception)
            {
                return false;
            }
        }

        public void delete_upload()
        {
            System.IO.Directory.Delete(Server.MapPath(filelocation));
        }

    }
}