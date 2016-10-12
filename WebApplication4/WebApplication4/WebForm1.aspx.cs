using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using DevExpress.Web.Data;

namespace WebApplication4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        Kitap K = new Kitap();
        protected void Page_Load(object sender, EventArgs e)
        {
            FirstCome();
        }
        protected void btnNewSave_Click(object sender, EventArgs e)
        {
            try
            {      
                if (GirisKontrol())
                {
                    KitapKayit();
                    Temizle();
                    FirstCome();
                }
                GridView1.DataBind();
            }
            catch (Exception hata)
            {
                Response.Write("<p style='color:Red;'>" + hata.Message + "</p>");
            }
        } 
        public void Temizle()
        {
            txtAd.Text = txtFiyati.Text = txtISBN.Text = txtSonOkunan.Text = txtSSayisi.Text = txtYazar.Text = "";
            ASPxDateAlim.Value = ASPxDateBaslama.Value = ASPxDateBitis.Value = null;
            ChcDurum.Checked = false;
        }
        public void FirstCome()
        {
            btnNewSave.Text = "Kitap Ekle";

            btnEdit.Enabled = false;
            btnDelete.Enabled = false;
            btnClear.Enabled = true;
        }
        protected bool GirisKontrol()
        {
            try
            {
                if (txtAd.Text == null || txtYazar.Text == null || txtFiyati.Text == null || txtSSayisi.Text == null || txtISBN.Text == null || ASPxDateAlim.Value == null)
                {
                    Response.Write("Adı,Yazarı,Fiyatı,Sayfa Sayısı,Alım Tarihi, Isbn Boş Geçilemez");
                    return false;
                }
                
                return true;
                
            }
            catch (Exception)
            {
                
                throw;
            }
            
        }
        protected void CheckDurum()
        {
            ChcDurum.Checked = true;
        }
        protected void KitapKayit()
        {
            K.Ad = txtAd.Text;
            K.Yazar = txtYazar.Text;
            K.Fiyat = double.Parse(txtFiyati.Text);
            K.SayfaSayisi = int.Parse(txtSSayisi.Text);
            K.AlimTarihi = DateTime.Parse(ASPxDateAlim.Value.ToString());
            if (ASPxDateBaslama.Value != null)
            {
                K.BaslamaTarihi = DateTime.Parse(ASPxDateBaslama.Value.ToString());
            }
            else
                K.BaslamaTarihi = DateTime.MinValue;
            if(txtSonOkunan.Text!="")
                K.S_O_S = int.Parse(txtSonOkunan.Text);
            if(ASPxDateBitis.Value!=null)
                K.BitisTarihi = DateTime.Parse(ASPxDateBitis.Value.ToString());
            K.ISBN = txtISBN.Text;
            K.Durum = ChcDurum.Checked;
            K.YeniKayit(K);
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                int no = Convert.ToInt32(e.CommandArgument);
                txtAd.Text = GridView1.Rows[no].Cells[1].Text;
            }
        }

        protected void txtSonOkunan_TextChanged(object sender, EventArgs e)
        {
            if (txtSSayisi.Text == txtSonOkunan.Text)
            {
                CheckDurum();
            }
        }

        protected void ASPxDateBitis_DateChanged(object sender, EventArgs e)
        {
            if(ASPxDateBitis.Value!=null)
            {
                CheckDurum();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            Temizle();
        }

           
    }
}