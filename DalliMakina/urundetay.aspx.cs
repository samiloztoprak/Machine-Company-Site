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
    public partial class urunler : System.Web.UI.Page
    {
        SqlConnection baglanti;
        SqlCommand aramakomut;
        SqlDataReader dr;
        string baglanStr = ConfigurationManager.ConnectionStrings["dmimakinaCnString"].ConnectionString;
        string searchTerm;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"]!=null)
            {
                searchTerm = Request.QueryString["id"];
                try
                {
                    aramakomut = new SqlCommand("Select * from urunler where id=" + searchTerm);
                    baglanti = new SqlConnection(baglanStr);
                    aramakomut.Connection = baglanti;
                    baglanti.Open();
                    dr = aramakomut.ExecuteReader();
                    while (dr.Read())
                    {
                        urunLabel.Text = dr["aciklama"].ToString();
                        urunImage.ImageUrl = "/content-img/"+dr["resim"].ToString();
                    }
                }
                catch { }
                finally
                {
                    baglanti.Close();
                }
            }
            else
            {
                Response.Redirect("/Default.aspx");
            }

        }
    }
}