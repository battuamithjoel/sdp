using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.Configuration;

public partial class usersignup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e) { }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string conn = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        string gen = RadioButton1.Checked ? "male" : "female";

        using (var con = new SqlConnection(conn))
        {
            con.Open();
            using (var tran = con.BeginTransaction())
            {
                using (var cmd = new SqlCommand(
                    "INSERT INTO userdet(name,gender,phone,email,uname,pwd,age) VALUES(@name,@gender,@phone,@email,@uname,@pwd,@age)",
                    con, tran))
                {
                    cmd.Parameters.AddWithValue("@name", txtname.Text ?? string.Empty);
                    cmd.Parameters.AddWithValue("@gender", gen);
                    cmd.Parameters.AddWithValue("@phone", txtphone.Text ?? string.Empty);
                    cmd.Parameters.AddWithValue("@email", txtemail.Text ?? string.Empty);
                    cmd.Parameters.AddWithValue("@uname", txtusername.Text ?? string.Empty);
                    cmd.Parameters.AddWithValue("@pwd", txtpassword.Text ?? string.Empty);
                    cmd.Parameters.AddWithValue("@age", txtage.Text ?? string.Empty);
                    cmd.ExecuteNonQuery();
                }

                using (var cmd2 = new SqlCommand(
                    "INSERT INTO dailytab(uname,workhr,sleephr,resthr,sithr,height,weight,bmi) VALUES(@uname,0,0,0,0,0,0,0)",
                    con, tran))
                {
                    cmd2.Parameters.AddWithValue("@uname", txtusername.Text ?? string.Empty);
                    cmd2.ExecuteNonQuery();
                }

                tran.Commit();
            }
        }

        Response.Redirect("index.aspx");
    }

    protected void txtusername_TextChanged(object sender, EventArgs e)
    {
        string conn = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        bool exists = false;
        using (var con = new SqlConnection(conn))
        using (var cmd = new SqlCommand("SELECT 1 FROM userdet WHERE uname = @u", con))
        {
            cmd.Parameters.AddWithValue("@u", txtusername.Text ?? string.Empty);
            con.Open();
            exists = cmd.ExecuteScalar() != null;
        }

        lblack.Visible = exists;
        Button1.Enabled = !exists;
    }
}
