using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace DalliMakina
{
    public partial class loginorregister : System.Web.UI.Page
    {
        SqlConnection baglanti;
        SqlCommand kayitkomut;
        SqlCommand giriskomut;
        SqlCommand aramakomut;
        SqlDataReader dr;
        string baglanStr = ConfigurationManager.ConnectionStrings["dmimakinaCnString"].ConnectionString;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullaniciId"] != null)
            {
                Response.Redirect("Default.aspx");
            }

            baglanti = new SqlConnection(baglanStr);
            kayitkomut = new SqlCommand("INSERT INTO Uye (kul_adi, adi, s_adi, mail, sifre, kademe) VALUES('"+kadiTxBox.Text+ "','" + adiTxBox.Text + "','" + sadiTxBox.Text + "','" + mailTxBox.Text + "','" + sifreTxBox.Text + "', 0)", baglanti);
            giriskomut = new SqlCommand("SELECT * FROM Uye where kul_adi='"+ gkadiTxBox.Text +"' AND sifre='"+gsifreTxBox.Text+"'");
        }

        protected void kayitBtn_Click(object sender, EventArgs e)
        {
            if(adiTxBox.Text!="" || sadiTxBox.Text!="" || kadiTxBox.Text!="" || mailTxBox.Text!="" || sifreTxBox.Text != ""){
                try
                {
                    baglanti.Open();
                    aramakomut = new SqlCommand("Select id from Uye Where kul_adi='" + kadiTxBox.Text + "'");
                    aramakomut.Connection = baglanti;
                    dr = aramakomut.ExecuteReader();
                    if (!dr.Read())
                    {
                        kayitkomut.ExecuteNonQuery();
                        sncTxt.Text = "Kayıt başarılı";
                    }
                    else
                    {
                        sncTxt.Text = "Bu kullanıcı adı dolu";
                    }
                }
                catch (Exception ex)
                {
                    sncTxt.Text = "Hata oluştu: " + ex.Message;
                }
                finally
                {
                    baglanti.Close();
                }
            }
            else
            {
                sncTxt.Text = "Tüm alanları doldurunuz";
            }
        }

        protected void girisBtn_Click(object sender, EventArgs e)
        {
            if(gkadiTxBox.Text != "" || gsifreTxBox.Text != "")
            {
                try
                {
                    baglanti.Open();
                    giriskomut.Connection = baglanti;
                    dr = giriskomut.ExecuteReader();
                    if (dr.Read())
                    {
                        sncTxt.Text = "Giriş başarılı";
                        Session["KullaniciId"] = dr["id"].ToString();
                        Session["KullanıcıKademesi"] = dr["kademe"].ToString();
                        if (dr["kademe"].ToString() == "1")
                        {
                            Response.Redirect("admin.aspx");
                        }
                        else
                        {
                            Response.Redirect("Default.aspx");
                        }
                        
                    }
                    else
                    {
                        sncTxt.Text = "Giriş başarısız";
                    }
                }
                catch (Exception ex)
                {
                    sncTxt.Text = "Hata oluştu: " + ex.Message;
                }
                finally
                {
                    baglanti.Close();
                }
            }
            else
            {
                sncTxt.Text = "Tüm alanları doldurunuz";
            }
        }
    }
}