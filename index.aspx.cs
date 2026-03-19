using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Configuration;
public partial class index : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string query;
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
        if (txtusername.Text == "admin")
        {
            data();
            query = "select uname,pwd from adminlogin where uname='" + txtusername.Text + "' and pwd='" + txtpassword.Text + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Response.Redirect("uploaddataset.aspx");
            }
            else
            {
                lblack.Visible = true;
                lblack.Text = "Invalid User";
            }
            rd.Close();
            con.Close();
        }
        else
        {
            data();
            query = "select uname,pwd from userdet where uname='" + txtusername.Text + "' and pwd='" + txtpassword.Text + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Session["user"] = txtusername.Text.ToString();
                Response.Redirect("userhome.aspx");
            }
            else
            {
                lblack.Visible = true;
                lblack.Text = "Invalid User";
            }
            rd.Close();
            con.Close();
        }
    }
}