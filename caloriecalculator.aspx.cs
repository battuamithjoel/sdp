using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Configuration;
public partial class caloriecalculator : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string query,a;
    protected void Page_Load(object sender, EventArgs e)
    {
        a = Session["user"].ToString();
        data();
        query = "select age from userdet where uname='" + a.ToString() + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            lblage.Text = rd[0].ToString();
        }
        rd.Close();
        con.Close();
        if (!Page.IsPostBack)
        {
            data();
            query = "select * from dailytab where uname='" + a.ToString() + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                txtworkout.Text = dr[1].ToString();
                lblworkoutmins.Text = ((Convert.ToInt32(txtworkout.Text)) * 60).ToString();
                txtsleeping.Text = dr[2].ToString();
                lblsleepmins.Text = ((Convert.ToInt32(txtsleeping.Text)) * 60).ToString();
                txtrest.Text = dr[3].ToString();
                lblrestmins.Text = ((Convert.ToInt32(txtrest.Text)) * 60).ToString();
                txtsitting.Text = dr[4].ToString();
                lblsittingmins.Text = ((Convert.ToInt32(txtsitting.Text)) * 60).ToString();
                txtheight.Text = dr[5].ToString();
                txtweight.Text = dr[6].ToString();
                lblbmi.Text = dr[7].ToString();
            }
            dr.Close();
            con.Close();
            double bmi = Convert.ToDouble(lblbmi.Text);
            if ((bmi >= 0.0) && (bmi <= 18.5))
            {
                lblweightcal.Text = "UNDER WEIGHT";
                lblweightcal.ForeColor = Color.Orange;

            }
            else if ((bmi >= 18.6) && (bmi <= 24.9))
            {
                lblweightcal.Text = "HEALTHY";
                lblweightcal.ForeColor = Color.Green;
            }
            else if ((bmi >= 25.0) && (bmi <= 29.9))
            {
                lblweightcal.Text = "OVER WEIGHT";
                lblweightcal.ForeColor = Color.Yellow;
            }
            else if ((bmi >= 30.0) && (bmi <= 40.0))
            {
                lblweightcal.Text = "OBESE";
                lblweightcal.ForeColor = Color.Red;
            }
        }
        workcalculate();
    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
    protected void txtworkout_TextChanged(object sender, EventArgs e)
    {
        lblworkoutmins.Text = ((Convert.ToInt32(txtworkout.Text)) * 60).ToString();
    }
    protected void txtsleeping_TextChanged(object sender, EventArgs e)
    {
        lblsleepmins.Text = ((Convert.ToInt32(txtsleeping.Text)) * 60).ToString();
    }
    protected void txtrest_TextChanged(object sender, EventArgs e)
    {
        lblrestmins.Text = ((Convert.ToInt32(txtrest.Text)) * 60).ToString();
    }
    protected void txtsitting_TextChanged(object sender, EventArgs e)
    {
        lblsittingmins.Text=((Convert.ToInt32(txtsitting.Text)) * 60).ToString();
    }
    int per,currentworkout,needw;
    public void workcalculate()
    {
        per = Convert.ToInt32(lblsleepmins.Text) + Convert.ToInt32(lblrestmins.Text) + Convert.ToInt32(lblsittingmins.Text);
        per = (per * 60) / 100;
        per = per / 10;
        lblwork.Text = per.ToString();
        currentworkout = Convert.ToInt32(lblworkoutmins.Text);
        if (currentworkout > per)
        {
            lblworkoutack.Text = "You Are Good in Your Workout";
        }
        else if (currentworkout < per)
        {
            needw = per - currentworkout;
            lblworkoutack.Text = "Improve Your Workout by Working " + needw.ToString() + "mins more";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        lblbmi.Text = ((Convert.ToDecimal(txtweight.Text)) / ((Convert.ToDecimal(txtheight.Text)) * (Convert.ToDecimal(txtheight.Text)))).ToString("0.##");
        double bmi = Convert.ToDouble(lblbmi.Text);
        if ((bmi >= 0.0) && (bmi <= 18.5))
        {
            lblweightcal.Text = "UNDER WEIGHT";
            lblweightcal.ForeColor = Color.Orange;

        }
        else if((bmi >= 18.6) && (bmi <= 24.9))
        {
            lblweightcal.Text = "HEALTHY";
            lblweightcal.ForeColor = Color.Green;
        }
        else if ((bmi >= 25.0) && (bmi <= 29.9))
        {
            lblweightcal.Text = "OVER WEIGHT";
            lblweightcal.ForeColor = Color.Yellow;
        }
        else if ((bmi >= 30.0) && (bmi <= 40.0))
        {
            lblweightcal.Text = "OBESE";
            lblweightcal.ForeColor = Color.Red;
        }
    }
    string pid,meal;
    decimal rowcount;
    decimal nos;
    decimal calorie, protein, carbo, potta, iron, calci, vitA, vitB6, vitC;
    protected void Button3_Click(object sender, EventArgs e)
    {
        if (txtdate.Text == "")
        {
            lblack.Visible = true;
            lblack.Text = "Please Select the date!!!";
        }
        else
        {
            lblack.Visible = false;
            if (RadioButton1.Checked == true)
            {
                meal = "Breakfast";
            }
            else if (RadioButton2.Checked == true)
            {
                meal = "Lunch";
            }
            else if (RadioButton3.Checked == true)
            {
                meal = "Dinner";
            }
            nos = Convert.ToDecimal(txtnos.Text);

            data();
            query = "select * from datasetdet where Category='" + dropcategory.SelectedItem + "' and Productname='" + dropitem.SelectedItem + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader rd = cmd.ExecuteReader();
            while (rd.Read())
            {
                calorie = Convert.ToDecimal(rd[3]) * nos;
                protein = Convert.ToDecimal(rd[4]) * nos;
                carbo = Convert.ToDecimal(rd[5]) * nos;
                potta = Convert.ToDecimal(rd[6]) * nos;
                iron = Convert.ToDecimal(rd[7]) * nos;
                calci = Convert.ToDecimal(rd[8]) * nos;
                vitA = Convert.ToDecimal(rd[9]) * nos;
                vitB6 = Convert.ToDecimal(rd[10]) * nos;
                vitC = Convert.ToDecimal(rd[11]) * nos;
                pid = rd[1].ToString();
            }
            data();
            query = "insert into caldata(Category,Productid,Productname,Calories,Protein,Carbohydrates,Potassium,Iron,Calcium,VitaminA,VitaminB6,VitaminC,quantity,uname,cdate,ctime,meal)values('" + dropcategory.SelectedItem + "','" + pid + "','" + dropitem.SelectedItem + "'," + calorie + "," + protein + "," + carbo + "," + potta + "," + iron + "," + calci + "," + vitA + "," + vitB6 + "," + vitC + "," + txtnos.Text + ",'" + Session["user"].ToString() + "','" + txtdate.Text + "','" + System.DateTime.Now.ToShortTimeString() + "','" + meal + "')";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            data();
            query = "delete from totcal where uname='" + Session["user"].ToString() + "' and cdate='" + txtdate.Text + "'";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();

            data();
            query = "select sum(Calories),sum(Protein),sum(Carbohydrates),sum(Potassium),sum(Iron),sum(Calcium),sum(VitaminA),sum(VitaminB6),sum(VitaminC) from caldata where uname='" + Session["user"].ToString() + "' and cdate='" + txtdate.Text + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                data();
                query = "insert into totcal(uname,Calories,Protein,Carbohydrates,Potassium,Iron,Calcium,VitaminA,VitaminB6,VitaminC,cdate)values('" + Session["user"].ToString() + "'," + dr[0] + "," + dr[1] + "," + dr[2] + "," + dr[3] + "," + dr[4] + "," + dr[5] + "," + dr[6] + "," + dr[7] + "," + dr[8] + ",'" + txtdate.Text + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();


            }
            dr.Close();
            con.Close();

            GridView1.DataBind();
            GridView2.DataBind();
            //average calc
            rowcount = GridView1.Rows.Count;
            data();
            query = "delete from averagetab where uname='" + Session["user"].ToString() + "' and cdate='" + txtdate.Text + "'";
            cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
            data();
            query = "select * from totcal where uname='" + Session["user"].ToString() + "' and cdate='" + txtdate.Text + "'";
            cmd = new SqlCommand(query, con);
            SqlDataReader red = cmd.ExecuteReader();
            while (red.Read())
            {
                data();
                query = "insert into averagetab(Calories,Protein,Carbohydrates,Potassium,Iron,Calcium,VitaminA,VitaminB6,VitaminC,uname,cdate)values(" + (Convert.ToDecimal(red[1]) / rowcount).ToString("0.##") + "," + (Convert.ToDecimal(red[2]) / rowcount).ToString("0.##") + "," + (Convert.ToDecimal(red[3]) / rowcount).ToString("0.##") + "," + (Convert.ToDecimal(red[4]) / rowcount).ToString("0.##") + "," + (Convert.ToDecimal(red[5]) / rowcount).ToString("0.##") + "," + (Convert.ToDecimal(red[6]) / rowcount).ToString("0.##") + "," + (Convert.ToDecimal(red[7]) / rowcount).ToString("0.##") + "," + (Convert.ToDecimal(red[8]) / rowcount).ToString("0.##") + "," + (Convert.ToDecimal(red[9]) / rowcount).ToString("0.##") + ",'" + Session["user"].ToString() + "','" + txtdate.Text + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            red.Close();
            con.Close();



           // GridView3.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        data();
        query = "update dailytab set workhr='" + txtworkout.Text + "',sleephr='" + txtsleeping.Text + "',resthr='" + txtrest.Text + "',sithr='" + txtsitting.Text + "',height='" + txtheight.Text + "',weight='" + txtweight.Text + "',bmi='" + lblbmi.Text + "',status='" + lblweightcal.Text + "' where uname='" + Session["user"].ToString() + "'";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();
        lblack0.Visible = true;
        lblack0.Text = "Updated";
    }
    protected void txtdate_TextChanged(object sender, EventArgs e)
    {
        GridView1.DataBind();
        GridView2.DataBind();
      //  GridView3.DataBind();
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        GridView1.DataBind();
        GridView2.DataBind();
       // GridView3.DataBind();
    }
}