using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotekaASP
{
    public partial class Wypozyczenie1 : System.Web.UI.Page
    {
        BibliotekaEntities db = new BibliotekaEntities();
        Czytelnik aktualnyCzytelnik;
        Ksiazka aktualnaKsiazka;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Value.ToString());
            aktualnyCzytelnik = db.Czytelnik.Single(x => x.ID == id);

            lbImie.Text = aktualnyCzytelnik.Imie;
            lbNazwisko.Text = aktualnyCzytelnik.Nazwisko;
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(GridView2.DataKeys[GridView2.SelectedRow.RowIndex].Value.ToString());
            aktualnaKsiazka = db.Ksiazka.Single(x => x.ID == id);

            lbKsiazka.Text = aktualnaKsiazka.Tytul;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //if(String.IsNullOrEmpty(lbNazwisko.Text) && String.IsNullOrEmpty(lbKsiazka.Text))
            //{
                int id1 = int.Parse(GridView2.DataKeys[GridView2.SelectedRow.RowIndex].Value.ToString());
                aktualnaKsiazka = db.Ksiazka.Single(x => x.ID == id1);

                int id2 = int.Parse(GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Value.ToString());
                aktualnyCzytelnik = db.Czytelnik.Single(x => x.ID == id2);

                Wypozyczenie noweWypozyczenie = new Wypozyczenie();
                noweWypozyczenie.Czytelnik_ID = aktualnyCzytelnik.ID;
                noweWypozyczenie.Ksiazka_ID = aktualnaKsiazka.ID;
                noweWypozyczenie.Wydano = DateTime.Now;
                db.Wypozyczenie.Add(noweWypozyczenie);
                db.SaveChanges();

                lbImie.Text = null;
                lbNazwisko.Text = null;
                lbKsiazka.Text = null;

                Response.Write("Wypożyczono książkę");
            //}
        }
    }
}