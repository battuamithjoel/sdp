using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;
using System.Web.Configuration;
using System.Collections;
public partial class suggestion : System.Web.UI.Page
{
    SqlConnection con;
    SqlCommand cmd;
    string query;
    int age;
    double totcount,totsum,finalval;
    ArrayList arrdate = new ArrayList();
    ArrayList bmichart = new ArrayList();
    double calorie, protein, carbohydrates, potassium, iron, calcium, vitaminA, vitaminB6, vitaminC;
    double calorie_from, calorie_to, protein_from, protein_to, carbo_from, carbo_to, pottasium_from, pottasium_to, iron_from, iron_to, calicum_from, calcium_to, vitA_from, vitA_to, vitB6_from, vitB6_to, vitC_from, vitC_to;
    string  Tcalorie, Tprotein, Tcarbo, Tpottasium, Tiron, Tcalicum, TvitA, TvitB6, TvitC;
    protected void Page_Load(object sender, EventArgs e)
    {
        lbluser.Text = Session["user"].ToString();
        data();
        query = "select age from userdet where uname='" + lbluser.Text + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader red = cmd.ExecuteReader();
        while (red.Read())
        {
            lblage.Text = red[0].ToString();
        }
        red.Close();
        con.Close();

        data();
        query = "select bmi,status from dailytab where uname='" + lbluser.Text + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd = cmd.ExecuteReader();
        while (rd.Read())
        {
            lblbmi.Text = rd[0].ToString();
            lblweightcal.Text = rd[1].ToString();
        }
        rd.Close();
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
        age = Convert.ToInt32(lblage.Text);
        if ((age > 0) && (age < 20))
        {
            calorie_from = 2500;
            calorie_to = 2550;
            protein_from = 56;
            protein_to = 58;
            carbo_from = 350;
            carbo_to = 360;
            pottasium_from = 4500;
            pottasium_to = 4525;
            iron_from = 14.1;
            iron_to = 15;
            calicum_from = 150;
            calcium_to = 175;
            vitA_from = 5000;
            vitA_to = 5025;
            vitB6_from = 1.4;
            vitB6_to = 2;
            vitC_from = 90;
            vitC_to = 100;
           
        }
        else if ((age > 21) && (age < 40))
        {
            calorie_from = 2700;
            calorie_to = 2750;
            protein_from = 50;
            protein_to = 52;
            carbo_from = 325;
            carbo_to = 335;
            pottasium_from = 4600;
            pottasium_to = 4625;
            iron_from = 16.3;
            iron_to = 17;
            calicum_from = 170;
            calcium_to = 185;
            vitA_from = 5000;
            vitA_to = 5025;
            vitB6_from = 1.5;
            vitB6_to = 2;
            vitC_from = 100;
            vitC_to = 110;
          
        }
        else if ((age > 41) && (age < 100))
        {
            calorie_from = 2200;
            calorie_to = 2250;
            protein_from = 46;
            protein_to = 48;
            carbo_from = 300;
            carbo_to = 310;
            pottasium_from = 4300;
            pottasium_to = 4325;
            iron_from = 14.7;
            iron_to = 16;
            calicum_from = 180;
            calcium_to = 195;
            vitA_from = 5000;
            vitA_to = 5025;
            vitB6_from = 1.4;
            vitB6_to = 2;
            vitC_from = 90;
            vitC_to = 100;
           
        }

        data();
        query = "delete from insuffi where uname='" + lbluser.Text + "'";
        cmd = new SqlCommand(query, con);
        cmd.ExecuteNonQuery();
        con.Close();

        data();
        query = "select count(cdate) from totcal where uname='" + lbluser.Text + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader rd1 = cmd.ExecuteReader();
        while (rd1.Read())
        {
            totcount = Convert.ToDouble(rd1[0]);
        }
        rd1.Close();
        con.Close();

        data();
        query = "select Calories from totcal where uname='" + lbluser.Text + "'";
        cmd = new SqlCommand(query, con);
        SqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            arrdate.Add(dr[0].ToString());
        }
        dr.Close();
        con.Close();


        for (int i = 0; i < arrdate.Count; i++)
        {
            totsum = Convert.ToDouble(arrdate[i]) + totsum;
        }

        finalval = totsum / totcount;



       

         calorie = finalval;
                if (((calorie >= (calorie_from))&&(calorie <= (calorie_to))))
                {
                    Tcalorie = "Normal";
                }
                else if ((calorie) < calorie_from)
                {
                    Tcalorie = "Insufficient";
                }
                else if ((calorie) > calorie_to)
                {
                    Tcalorie = "Excess";
                }
        //*********************************************************************************
                arrdate.Clear();
                totsum = 0.0;
                data();
                query = "select Protein from totcal where uname='" + lbluser.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr1 = cmd.ExecuteReader();
                while (dr1.Read())
                {
                    arrdate.Add(dr1[0].ToString());
                }
                dr1.Close();
                con.Close();


                for (int i = 0; i < arrdate.Count; i++)
                {
                    totsum = Convert.ToDouble(arrdate[i]) + totsum;
                }

                finalval = totsum / totcount;



                protein = finalval;
                if (((protein >= (protein_from)) && (protein <= (protein_to))))
                {
                    Tprotein = "Normal";
                }
                else if (protein < protein_from)
                {
                    Tprotein = "Insufficient";
                }
                else if (protein > protein_to)
                {
                    Tprotein = "Excess";
                }
        //*********************************************************
                arrdate.Clear();
                totsum = 0.0;
                data();
                query = "select Carbohydrates from totcal where uname='" + lbluser.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr2 = cmd.ExecuteReader();
                while (dr2.Read())
                {
                    arrdate.Add(dr2[0].ToString());
                }
                dr2.Close();
                con.Close();


                for (int i = 0; i < arrdate.Count; i++)
                {
                    totsum = Convert.ToDouble(arrdate[i]) + totsum;
                }

                finalval = totsum / totcount;


                carbohydrates = finalval;                                                                           
                if (((carbohydrates >= (carbo_from)) && (carbohydrates <= (carbo_to))))
                {
                    Tcarbo = "Normal";
                }
                else if (carbohydrates < carbo_from)
                {
                    Tcarbo = "Insufficient";
                }
                else if (carbohydrates > carbo_to)
                {
                    Tcarbo = "Excess";
                }

        //******************************************************
                arrdate.Clear();
                totsum = 0.0;
                data();
                query = "select Potassium from totcal where uname='" + lbluser.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr3 = cmd.ExecuteReader();
                while (dr3.Read())
                {
                    arrdate.Add(dr3[0].ToString());
                }
                dr3.Close();
                con.Close();
                for (int i = 0; i < arrdate.Count; i++)
                {
                    totsum = Convert.ToDouble(arrdate[i]) + totsum;
                }

                finalval = totsum / totcount;

                potassium = finalval;
                if (((potassium >= (pottasium_from)) && (potassium  <= (pottasium_to))))
                {
                    Tpottasium = "Normal";
                }
                else if (potassium < pottasium_from)
                {
                    Tpottasium = "Insufficient";
                }
                else if (potassium > pottasium_to)
                {
                    Tpottasium = "Excess";
                }
        //*******************************************************************
                arrdate.Clear();
                totsum = 0.0;
                data();
                query = "select Iron from totcal where uname='" + lbluser.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr4 = cmd.ExecuteReader();
                while (dr4.Read())
                {
                    arrdate.Add(dr4[0].ToString());
                }
                dr4.Close();
                con.Close();
                for (int i = 0; i < arrdate.Count; i++)
                {
                    totsum = Convert.ToDouble(arrdate[i]) + totsum;
                }

                finalval = totsum / totcount;

                iron = finalval;
       
                if (((iron >= (iron_from)) && (iron <= (iron_to))))
                {
                    Tiron = "Normal";
                }
                else if (iron < iron_from)
                {
                    Tiron = "Insufficient";
                }
                else if (iron > iron_to)
                {
                    Tiron = "Excess";
                }
          //****************************************************************************
                arrdate.Clear();
                totsum = 0.0;
                data();
                query = "select Calcium from totcal where uname='" + lbluser.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr5 = cmd.ExecuteReader();
                while (dr5.Read())
                {
                    arrdate.Add(dr5[0].ToString());
                }
                dr5.Close();
                con.Close();
                for (int i = 0; i < arrdate.Count; i++)
                {
                    totsum = Convert.ToDouble(arrdate[i]) + totsum;
                }

                finalval = totsum / totcount;

                calcium = finalval;
                if (((calcium >= (calicum_from)) && (calcium <= (calcium_to))))
                {
                    Tcalicum = "Normal";
                }
                else if (calcium < calicum_from)
                {
                    Tcalicum = "Insufficient";
                }
                else if (calcium > calcium_to)
                {
                    Tcalicum = "Excess";
                }
        //*****************************************************************************************
                arrdate.Clear();
                totsum = 0.0;
                data();
                query = "select VitaminA from totcal where uname='" + lbluser.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr6 = cmd.ExecuteReader();
                while (dr6.Read())
                {
                    arrdate.Add(dr6[0].ToString());
                }
                dr6.Close();
                con.Close();
                for (int i = 0; i < arrdate.Count; i++)
                {
                    totsum = Convert.ToDouble(arrdate[i]) + totsum;
                }

                finalval = totsum / totcount;
                vitaminA = finalval;
                if (((vitaminA >= (vitA_from)) && (vitaminA <= (vitA_to))))
                {
                    TvitA = "Normal";
                }
                else if (vitaminA < vitA_from)
                {
                    TvitA = "Insufficient";
                }
                else if (vitaminA > vitA_to)
                {
                    TvitA = "Excess";
                }
        //*****************************************************************************
                arrdate.Clear();
                totsum = 0.0;
                data();
                query = "select VitaminB6 from totcal where uname='" + lbluser.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr7 = cmd.ExecuteReader();
                while (dr7.Read())
                {
                    arrdate.Add(dr7[0].ToString());
                }
                dr7.Close();
                con.Close();
                for (int i = 0; i < arrdate.Count; i++)
                {
                    totsum = Convert.ToDouble(arrdate[i]) + totsum;
                }

                finalval = totsum / totcount;
                vitaminB6 = finalval;

                if (((vitaminB6 >= (vitB6_from)) && (vitaminB6 <= (vitB6_to))))
                {
                    TvitB6 = "Normal";
                }
                else if (vitaminB6 < vitB6_from)
                {
                    TvitB6 = "Insufficient";
                }
                else if (vitaminB6 > vitB6_to)
                {
                    TvitB6 = "Excess";
                }
        //*********************************************************************************
                arrdate.Clear();
                totsum = 0.0;
                data();
                query = "select VitaminC from totcal where uname='" + lbluser.Text + "'";
                cmd = new SqlCommand(query, con);
                SqlDataReader dr8 = cmd.ExecuteReader();
                while (dr8.Read())
                {
                    arrdate.Add(dr8[0].ToString());
                }
                dr8.Close();
                con.Close();
                for (int i = 0; i < arrdate.Count; i++)
                {
                    totsum = Convert.ToDouble(arrdate[i]) + totsum;
                }

                finalval = totsum / totcount;
                vitaminC = finalval;

                if (((vitaminC >= (vitC_from)) && (vitaminC <= (vitC_to))))
                {
                    TvitC = "Normal";
                }
                else if (vitaminC < vitC_from)
                {
                    TvitC = "Insufficient";
                }
                else if (vitaminC > vitC_to)
                {
                    TvitC = "Excess";
                }

                data();
                query = "insert into insuffi(uname,Calories,Protein,Carbohydrates,Potassium,Iron,Calcium,VitaminA,VitaminB6,VitaminC)values('" + lbluser.Text + "','" + Tcalorie + "','" + Tprotein + "','" + Tcarbo + "','" + Tpottasium + "','" + Tiron + "','" + Tcalicum + "','" + TvitA + "','" + TvitB6 + "','" + TvitC + "')";
                cmd = new SqlCommand(query, con);
                cmd.ExecuteNonQuery();
                con.Close();

        
            GridView2.DataBind();
        
        Panel1.Visible = true;
        //data();
        //query = "select MAX(cdate) from insuffi";
        //cmd = new SqlCommand(query, con);
        //SqlDataReader rdd = cmd.ExecuteReader();
        //while (rdd.Read())
        //{
        //    lbldate.Text = rdd[0].ToString();
        //}
        //rdd.Close();
        //con.Close();

        data();
        query = "select * from insuffi";
        cmd = new SqlCommand(query, con);
        SqlDataReader des = cmd.ExecuteReader();
        while (des.Read())
        {
            if (des[2].ToString() == "Insufficient")
            {
                lblprotein.Text = "Marasmus,Kwashiorkor";
            }
            else
            {
                lblprotein.Text = ".....";
            }
            if (des[3].ToString() == "Insufficient")
            {
                lblcarbo.Text = "Acidosis,Ketosis,Hypoglecemia,Constipation";
            }
            else
            {
                lblcarbo.Text = ".....";
            }
            if (des[4].ToString() == "Insufficient")
            {
                lblpotassium.Text = "Hypokalemia";
            }
            else
            {
                lblpotassium.Text = ".....";
            }
            if (des[5].ToString() == "Insufficient")
            {
                lbliron.Text = "Anemia";
            }
            else
            {
                lbliron.Text = ".....";
            }
            if (des[6].ToString() == "Insufficient")
            {
                lblcalcium.Text = "Hypocalcemia";
            }
            else
            {
                lblcalcium.Text = ".....";
            }
            if (des[7].ToString() == "Insufficient")
            {
                lblvitA.Text = "Night blindness";
            }
            else
            {
                lblvitA.Text = ".....";
            }
            if (des[8].ToString() == "Insufficient")
            {
                lblvitB6.Text = "Beri Beri, Pellegra, Biotin, Ariboflavinosis, Hypocobalaminemia, Paraesthesia";
            }
            else
            {
                lblvitB6.Text = ".....";
            }
            if (des[9].ToString() == "Insufficient")
            {
                lblvitC.Text = "Scurvy";
            }
            else
            {
                lblvitC.Text = ".....";
            }
        }

    }
    public void data()
    {
        string connstring = WebConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        con = new SqlConnection(connstring);
        con.Open();
    }
}