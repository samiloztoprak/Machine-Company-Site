using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DalliMakina
{
    public partial class admin : System.Web.UI.Page
    {

        SqlConnection baglanti;
        SqlCommand kayitkomut;
        SqlCommand aramakomut;
        SqlDataReader dr;
        string baglanStr = ConfigurationManager.ConnectionStrings["dmimakinaCnString"].ConnectionString;

        public string[] baslik = new string[8];
        public string[] icerik = new string[8];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["KullanıcıKademesi"] == null)
            {
                Session["KullanıcıKademesi"] = "0";
            }
            string a = Session["KullanıcıKademesi"].ToString();
            if (a != "1")
            {
                Response.Redirect("/loginorregister.aspx");
            }

            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Panel2.Visible = true;
            Panel1.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Panel3.Visible = true;
            Panel2.Visible = false;
            Panel1.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            Panel4.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel1.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            Panel5.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel1.Visible = false;
            Panel6.Visible = false;
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            Panel6.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel1.Visible = false;
        }

        protected void kayitBtn_Click(object sender, EventArgs e)
        {
            if (adiTxBox.Text != "" || sadiTxBox.Text != "" || kadiTxBox.Text != "" || mailTxBox.Text != "" || sifreTxBox.Text != "")
            {
                try
                {
                    baglanti = new SqlConnection(baglanStr);
                    kayitkomut = new SqlCommand("INSERT INTO Uye (kul_adi, adi, s_adi, mail, sifre, kademe) VALUES('" + kadiTxBox.Text + "','" + adiTxBox.Text + "','" + sadiTxBox.Text + "','" + mailTxBox.Text + "','" + sifreTxBox.Text + "'," + int.Parse(kademeDList.SelectedValue) + ") "
                                                , baglanti);
                    baglanti.Open();
                    aramakomut=new SqlCommand("Select id from Uye Where kul_adi='"+ kadiTxBox.Text +"'");
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
                    GridView1.DataBind();
                }
            }
            else
            {
                sncTxt.Text = "Tüm alanları doldurunuz";
            }
            Panel1.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void urunKaydetBtn_Click(object sender, EventArgs e)
        {
            if (urunResimYukleBtn.HasFile)
            {
                try
                {
                    if(urunResimYukleBtn.PostedFile.ContentType == "image/jpeg")
                    {
                        if (urunResimYukleBtn.PostedFile.ContentLength < 10485760)
                        {
                            urunResimYukleBtn.SaveAs(Server.MapPath("~/content-img/") + urunResimYukleBtn.FileName);

                            baglanti = new SqlConnection(baglanStr);
                            kayitkomut = new SqlCommand("INSERT INTO urunler (adi, aciklama, resim, kategori) VALUES('" + urunAdiTxBox.Text + "','" + urunAciklamaTxBox.Text + "','" + urunResimYukleBtn.FileName + "','" + urunKategoriTxBox.Text + "') "
                                                        , baglanti);
                            baglanti.Open();
                            kayitkomut.ExecuteNonQuery();
                        }
                        else
                        {
                            resimYukleUyariTxt.Text = "Dosya 10MB den büyük olamaz.";
                        }
                    }
                    else
                    {
                        resimYukleUyariTxt.Text = "Resim Dosyası Seçiniz";
                    }
                }
                catch (Exception ex)
                {
                    resimYukleUyariTxt.Text = "Hata Oluştu: " + ex.Message.ToString();
                }
                finally
                {
                    GridView2.DataBind();
                    baglanti.Close();
                }
            }
            else
            {
                resimYukleUyariTxt.Text = "Dosya Seçin ve GÖNDER Butonuna Tıklayın.";
            }
            Panel3.Visible = true;
            Panel2.Visible = false;
            Panel1.Visible = false;
            Panel4.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void tmenukaydetBtn_Click(object sender, EventArgs e)
        {
            try
            {
                baglanti = new SqlConnection(baglanStr);
                SqlCommand guncellemekomut1 = new SqlCommand("Update Topmenu Set baslik='"+
                    tmenuitem1txBox.Text+"', link='"+tmenulink1txBox.Text+"' where id=1"
                                            , baglanti);
                SqlCommand guncellemekomut2 = new SqlCommand("Update Topmenu Set baslik='" +
                    tmenuitem2txBox.Text + "', link='" + tmenulink2txBox.Text + "' where id=2"
                                            , baglanti);
                SqlCommand guncellemekomut3 = new SqlCommand("Update Topmenu Set baslik='" +
                    tmenuitem3txBox.Text + "' where id=3"
                                            , baglanti);
                SqlCommand guncellemekomut4 = new SqlCommand("Update Topmenu Set baslik='" +
                    tmenuitem4txBox.Text + "', link='" + tmenulink4txBox.Text + "' where id=4"
                                            , baglanti);
                baglanti.Open();
                guncellemekomut1.ExecuteNonQuery();
                guncellemekomut2.ExecuteNonQuery();
                guncellemekomut3.ExecuteNonQuery();
                guncellemekomut4.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                tmenukaydetBtn.Text = ex.Message;
            }
            finally
            {
                baglanti.Close();
            }

            Panel4.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel1.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void tmenuBtn_Click(object sender, EventArgs e)
        {
            baglanti = new SqlConnection(baglanStr);
            aramakomut = new SqlCommand("Select * from Topmenu");
            aramakomut.Connection = baglanti;
            try
            {
                baglanti.Open();
                dr = aramakomut.ExecuteReader();
                string[] baslik = new string[4];
                string[] link = new string[4];
                int i = 0;
                while (dr.Read())
                {
                    baslik[i] = dr["baslik"].ToString();
                    link[i] = dr["link"].ToString();
                    i++;
                }
                tmenuitem1txBox.Text = baslik[0];
                tmenulink1txBox.Text = link[0];
                tmenuitem2txBox.Text = baslik[1];
                tmenulink2txBox.Text = link[1];
                tmenuitem3txBox.Text = baslik[2];
                tmenuitem4txBox.Text = baslik[3];
                tmenulink4txBox.Text = link[3];
            }
            catch { }
            finally
            {
                baglanti.Close();
            }
            Panel4.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel1.Visible = false;
            Panel5.Visible = false;
            Panel6.Visible = false;
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            baglanti = new SqlConnection(baglanStr);
            aramakomut = new SqlCommand("Select * from foother");
            aramakomut.Connection = baglanti;
            try
            {
                baglanti.Open();
                dr = aramakomut.ExecuteReader();
                
                int i = 0;
                while (dr.Read())
                {
                    baslik[i] = dr["baslik"].ToString();
                    icerik[i] = dr["icerik"].ToString();
                    i++;
                }

                f1bTextBox.Text = baslik[0];
                f1iTextBox.Text = icerik[0];
                f2bTextBox.Text = baslik[1];
                f2iTextBox.Text = icerik[1];
                f3bTextBox.Text = baslik[2];
                f3iTextBox.Text = icerik[2];
                f4bTextBox.Text = baslik[3];
                f4iTextBox.Text = icerik[3];
                f5bTextBox.Text = baslik[4];
                f5iTextBox.Text = icerik[4];
                f6bTextBox.Text = baslik[5];
                f6iTextBox.Text = icerik[5];
                f7bTextBox.Text = baslik[6];
                f7iTextBox.Text = icerik[6];
                f8bTextBox.Text = baslik[7];
                f8iTextBox.Text = icerik[7];

            }
            catch { }
            finally
            {
                baglanti.Close();
            }
            Panel5.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel1.Visible = false;
            Panel6.Visible = false;
        }

        protected void fguncelleBtn_Click(object sender, EventArgs e)
        {
            try
            {
                baglanti = new SqlConnection(baglanStr);
                SqlCommand guncellemekomut1 = new SqlCommand("Update foother Set baslik='" +
                    f1bTextBox.Text + "', icerik='" + f1iTextBox.Text + "' where id=1"
                                            , baglanti);
                SqlCommand guncellemekomut2 = new SqlCommand("Update foother Set baslik='" +
                    f2bTextBox.Text + "', icerik='" + f2iTextBox.Text + "' where id=2"
                                            , baglanti);
                SqlCommand guncellemekomut3 = new SqlCommand("Update foother Set baslik='" +
                    f3bTextBox.Text + "', icerik='" + f3iTextBox.Text + "' where id=3"
                                            , baglanti);
                SqlCommand guncellemekomut4 = new SqlCommand("Update foother Set baslik='" +
                    f4bTextBox.Text + "', icerik='" + f4iTextBox.Text + "' where id=4"
                                            , baglanti);
                SqlCommand guncellemekomut5 = new SqlCommand("Update foother Set baslik='" +
                    f5bTextBox.Text + "', icerik='" + f5iTextBox.Text + "' where id=5"
                                            , baglanti);
                SqlCommand guncellemekomut6 = new SqlCommand("Update foother Set baslik='" +
                    f6bTextBox.Text + "', icerik='" + f6iTextBox.Text + "' where id=6"
                                            , baglanti);
                SqlCommand guncellemekomut7 = new SqlCommand("Update foother Set baslik='" +
                    f7bTextBox.Text + "', icerik='" + f7iTextBox.Text + "' where id=7"
                                            , baglanti);
                SqlCommand guncellemekomut8 = new SqlCommand("Update foother Set baslik='" +
                    f8bTextBox.Text + "', icerik='" + f8iTextBox.Text + "' where id=8"
                                            , baglanti);
                baglanti.Open();
                guncellemekomut1.ExecuteNonQuery();
                guncellemekomut2.ExecuteNonQuery();
                guncellemekomut3.ExecuteNonQuery();
                guncellemekomut4.ExecuteNonQuery();
                guncellemekomut5.ExecuteNonQuery();
                guncellemekomut6.ExecuteNonQuery();
                guncellemekomut7.ExecuteNonQuery();
                guncellemekomut8.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                tmenukaydetBtn.Text = ex.Message;
            }
            finally
            {
                baglanti.Close();
            }
            Panel5.Visible = true;
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel4.Visible = false;
            Panel1.Visible = false;
            Panel6.Visible = false;
        }
    }
}