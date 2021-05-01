using System.Collections.Generic;


public class Sepet
{
    //tanımladığımız urun sınıfını liste olarak alıyoruz
    public Dictionary<int, urun=""> urunler = null;
    public Sepet()
    {
        //sınıf ilk çağrıldığında sepetle ürünü ilişkilendiriyoruz.
        urunler = new Dictionary<int, urun= "" > ();
    }
    //yukarda oluşturduğumuz listeye eleman eklemek için
    public void Ekle(Urun u)
    {
        if (urunler.ContainsKey(u.id))
        {
            //zaten listede(yani sepette varsa) sadece adetini 1 artırıyoruz
            urunler[u.id].adet += 1;
        }
        else
        {
            //listede yoksa benzersiz idsi ile listemize ekliyoruz.
            urunler.Add(u.id, u);
        }
    }
}</int,></int,>