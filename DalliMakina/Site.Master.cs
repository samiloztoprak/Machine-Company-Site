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
    public partial class SiteMaster : MasterPage
    {
        SqlConnection baglanti;
        SqlCommand aramakomut;
        SqlCommand aramakomut2;

        SqlDataReader dr;
        SqlDataReader dr2;

        string baglanStr = ConfigurationManager.ConnectionStrings["dmimakinaCnString"].ConnectionString;
        public string[] link;
        public string kategoriHtml;
        public string urunHtml;
        public string[] footherBaslik;
        public string[] footherIcerik;


        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti = new SqlConnection(baglanStr);
            aramakomut = new SqlCommand("Select * from Topmenu");
            aramakomut.Connection = baglanti;
            try
            {
                baglanti.Open();
                dr = aramakomut.ExecuteReader();
                Label[] lbl = new Label[4];
                link = new string[4];
                lbl[0] = mtxt1;
                lbl[1] = mtxt2;
                lbl[2] = mtxt3;
                lbl[3] = mtxt4;
                int i = 0;
                while (dr.Read())
                {
                    lbl[i].Text = dr["baslik"].ToString();
                    link[i] = dr["link"].ToString();
                    i++;
                }
            }
            catch (Exception ex)
            {
                mtxt1.Text = "Error";
                mtxt2.Text = "Error";
                mtxt3.Text = "Error";
                mtxt4.Text = ex.Message;
            }
            finally
            {
                baglanti.Close();
            }

            baglanti = new SqlConnection(baglanStr);
            aramakomut = new SqlCommand("Select distinct kategori from urunler");
            aramakomut.Connection = baglanti;
            try
            {
                baglanti.Open();
                dr = aramakomut.ExecuteReader();
                int i = 1;
                while (dr.Read())
                {
                    kategoriHtml = kategoriHtml + "<a href=\"#\" onload=\"productsDropDownMenuItem('item-" + i + "','item-" + i + "-button')\" onclick=\"productsDropDownMenuItem('item-" + i + "','item-" + i + "-button')\" class=\"item-" + i + "-button\">" + dr["kategori"] + "</a>";
                    i++;
                }
            }
            catch (Exception ex)
            {
                kategoriHtml = ex.Message;
            }
            finally
            {
                baglanti.Close();
            }
            baglanti = new SqlConnection(baglanStr);
            aramakomut = new SqlCommand("Select distinct kategori from urunler");
            aramakomut2 = new SqlCommand("Select * from urunler");
            aramakomut.Connection = baglanti;
            aramakomut2.Connection = baglanti;
            try
            {
                baglanti.Open();
                dr = aramakomut.ExecuteReader();
                int i = 0;
                List<string> kategori=new List<string>();
                List<string> adi = new List<string>();
                List<string> resim = new List<string>();
                while (dr.Read())
                {
                    kategori.Add(dr["kategori"].ToString());
                }
                while (i<kategori.Count)
                {
                    dr2 = aramakomut2.ExecuteReader();
                    urunHtml = urunHtml + "<div id=\"item-" + (i+1) + "\" class=\"dropdown-content-product-list-container\">"
                           + "<div class=\"dropdown-content-product-list-grid-header\"><div class=\"menu-grid-header\">" + kategori[i] + "</div></div>";
                    while (dr2.Read())
                    {
                        if (kategori[i] == dr2["kategori"].ToString())
                        {
                            urunHtml = urunHtml +
                            "<div class=\"dropdown-content-product-list-grid\">" +
                            "<a href=\"" + dr2["adi"].ToString() + "\">" +
                            "<img src=\"content-img\\" + dr2["resim"].ToString() + "\"/>" + dr2["adi"].ToString() +
                            "</a></div>";
                        }
                    } 
                    urunHtml = urunHtml + "</div>";
                    i++;
                    dr2.Close();
                }
            }
            catch (Exception ex)
            {
                urunHtml = ex.Message;
            }
            finally
            {
                baglanti.Close();
            }

            try
            {
                footherBaslik = new String[8];
                footherIcerik = new String[8];
                aramakomut = new SqlCommand("Select * from foother");
                aramakomut.Connection = baglanti;
                baglanti.Open();
                dr = aramakomut.ExecuteReader();
                int j = 0;
                while (dr.Read())
                {
                    footherBaslik[j] = dr["baslik"].ToString();
                    footherIcerik[j] = dr["icerik"].ToString();
                    j++;
                }
            }
            catch { }
            finally
            {
                baglanti.Close();
            }

            
        }
    }
}