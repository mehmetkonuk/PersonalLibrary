using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace WebApplication4
{
    public class Kitap
    {
        //sql baglantı
        private DataClasses1DataContext dbcon = new DataClasses1DataContext();
        public int Id { get; set; }
        public string Ad { get; set; }
        public string Yazar { get; set; }
        public double Fiyat { get; set; }
        public int SayfaSayisi { get; set; }
        public DateTime AlimTarihi { get; set; }
        public DateTime BaslamaTarihi { get; set; }
        public int S_O_S { get; set; }
        public DateTime BitisTarihi { get; set; }
        public string ISBN { get; set; }
        public bool Durum { get; set; }

        public void YeniKayit(Kitap K)
        {
            try
            {
                Kitaplar kitap = new Kitaplar();
                kitap.ad = Ad;
                kitap.Yazar = Yazar;
                kitap.Sayfa_Sayisi = SayfaSayisi;
                kitap.Alim_Tarihi = AlimTarihi;
                if (BaslamaTarihi.Date == DateTime.MinValue)
                    kitap.Okuma_Tarihi = null;//baslama
                else
                    kitap.Okuma_Tarihi = BaslamaTarihi;
                kitap.Son_Okunan_Sayfa = S_O_S;
                kitap.Bitiş_Tarihi = null;//bitiş
                kitap.ISBN = ISBN;
                kitap.Durum = Durum;
                dbcon.Kitaplars.InsertOnSubmit(kitap);
                dbcon.SubmitChanges();
            }
            catch(Exception)
            {
                throw;
            }
        }
    }
}