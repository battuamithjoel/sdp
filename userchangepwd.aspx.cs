using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class userchangepwd : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string query,a;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        a = Session["user"].ToString();
        data();
        query = "select pwd from userdet where uname='" + a.ToString() + "'' and pwd='" + txtold.Text + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        if (rd.Read())
        {
            data();
            query = "update userdet set pwd='" + txtnew.Text + "' where uname='" + a.ToString() + "'' and pwd='" + txtold.Text + "'";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            lblack.Visible = true;
            lblack.Text = "Password Updated Successfully";
        }
        else
        {
            lblack.Visible = true;
            lblack.Text = "Invalid Old Password";
        }
        rd.Close();
        con.Close();
    }
}