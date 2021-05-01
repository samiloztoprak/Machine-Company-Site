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
    public partial class _Default : Page
    {
        SqlConnection baglanti;
        SqlCommand aramakomut;
        SqlDataReader dr;
        string baglanStr = ConfigurationManager.ConnectionStrings["dmimakinaCnString"].ConnectionString;
    
        public string urunList;
        protected void Page_Load(object sender, EventArgs e)
        {

            try
            {
                aramakomut = new SqlCommand("Select * from urunler");
                baglanti = new SqlConnection(baglanStr);
                aramakomut.Connection = baglanti;
                baglanti.Open();
                dr = aramakomut.ExecuteReader();
                while (dr.Read())
                {
                    urunList = urunList + "<div class=\"cloumn\"><div class=\"main-page-product-container\">" +
                        "<img Height=\"245px\" Width=\"245px\" src=\"content-img/" + dr["resim"].ToString() + "\" /><a href=\"urundetay.aspx?id=" + dr["id"].ToString() + "\" style=\"text-decoration: none;\"\"><p class=\"main-page-product-container-header\">" +
                         dr["adi"].ToString() + "</p></a><p class=\"main-page-product-container-content\">" +
                         dr["aciklama"].ToString() + "</p><div class=\"chart-grid\"><a href = \"#\" >" +
                        "<img src=\"img/cart-icon.png\" /></div></div></div></a>";
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