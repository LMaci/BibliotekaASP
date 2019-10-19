using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotekaASP
{
    public partial class Ksiazki : System.Web.UI.Page
    {

        BibliotekaEntities db = new BibliotekaEntities();
        Autor aktualnyAutor;
        Ksiazka aktualnaKsiazka;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void gvKsiazki_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(gvKsiazki.DataKeys[gvKsiazki.SelectedRow.RowIndex].Value.ToString());
            aktualnaKsiazka = db.Ksiazka.Single(x => x.ID == id);

            tbTytul.Text = aktualnaKsiazka.Tytul;
            DropDownList1.SelectedIndex = (aktualnaKsiazka.Kategoria_ID) - 1;
            tbISBN.Text = aktualnaKsiazka.ISBN;
            tbOpis.Text = aktualnaKsiazka.Opis;


        }

        protected void gvAutorzy_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(gvAutorzy.DataKeys[gvAutorzy.SelectedRow.RowIndex].Value.ToString());

            aktualnyAutor = db.Autor.Single(x => x.ID == id);
            tbImie.Text = aktualnyAutor.Imie;
            tbNazwisko.Text = aktualnyAutor.Nazwisko;
            gvKsiazki.SelectedIndex = -1;

            aktualnaKsiazka = null;
            tbTytul.Text = null;
            DropDownList1.Text = null;
            tbISBN.Text = null;
            tbOpis.Text = null;
        }

        protected void btDodaj_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbImie.Text) && !String.IsNullOrEmpty(tbNazwisko.Text) && !String.IsNullOrEmpty(tbTytul.Text) &&
                    !String.IsNullOrEmpty(tbISBN.Text))
            {
                try
                {
                    aktualnyAutor = db.Autor.Single(x => x.Imie == tbImie.Text && x.Nazwisko == tbNazwisko.Text);
                }
                catch
                {
                    Autor nowyAutor = new Autor();
                    nowyAutor.Imie = tbImie.Text;
                    nowyAutor.Nazwisko = tbNazwisko.Text;
                    db.Autor.Add(nowyAutor);
                    aktualnyAutor = nowyAutor;
                }
                finally
                {
                    Ksiazka nowaKsiazka = new Ksiazka();
                    nowaKsiazka.Tytul = tbTytul.Text;
                    nowaKsiazka.Kategoria_ID = int.Parse(DropDownList1.SelectedValue.ToString());
                    nowaKsiazka.ISBN = tbISBN.Text;
                    nowaKsiazka.Opis = tbOpis.Text;
                    nowaKsiazka.Autor_ID = aktualnyAutor.ID;

                    db.Ksiazka.Add(nowaKsiazka);

                    db.SaveChanges();
                    DataBind();
                }
            }
            else if (String.IsNullOrEmpty(tbTytul.Text) && !String.IsNullOrEmpty(tbImie.Text) && !String.IsNullOrEmpty(tbNazwisko.Text))
            {
                Autor nowyAutor = new Autor();
                nowyAutor.Imie = tbImie.Text;
                nowyAutor.Nazwisko = tbNazwisko.Text;
                db.Autor.Add(nowyAutor);
                db.SaveChanges();
                DataBind();
            } else Response.Write("Sprawdź poprawność danych");
        }

        protected void btAktualizuj_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbImie.Text) && !String.IsNullOrEmpty(tbNazwisko.Text) && !String.IsNullOrEmpty(tbTytul.Text) &&
                    !String.IsNullOrEmpty(tbISBN.Text))
            {
                try
                {
                    aktualnyAutor = db.Autor.First(x => x.Imie == tbImie.Text && x.Nazwisko == tbNazwisko.Text);
                    aktualnyAutor.Imie = tbImie.Text;
                    aktualnyAutor.Nazwisko = tbNazwisko.Text;

                    int id = int.Parse(gvKsiazki.DataKeys[gvKsiazki.SelectedRow.RowIndex].Value.ToString());
                    aktualnaKsiazka = db.Ksiazka.Single(x => x.ID == id);

                    aktualnaKsiazka.Autor_ID = aktualnyAutor.ID;
                    aktualnaKsiazka.Tytul = tbTytul.Text;
                    aktualnaKsiazka.Kategoria_ID = int.Parse(DropDownList1.SelectedValue.ToString());
                    aktualnaKsiazka.ISBN = tbISBN.Text;
                    aktualnaKsiazka.Opis = tbOpis.Text;

                    db.SaveChanges();
                    DataBind();
                }
                catch
                {
                    Response.Write("Brak autora w bazie danych! :(");
                }
            } else Response.Write("Sprawdź poprawność danych");
        }

        protected void btUsun_Click(object sender, EventArgs e)
        {
            int id = int.Parse(gvKsiazki.DataKeys[gvKsiazki.SelectedRow.RowIndex].Value.ToString());
            aktualnaKsiazka = db.Ksiazka.Single(x => x.ID == id);

            db.Ksiazka.Remove(aktualnaKsiazka);
            db.SaveChanges();
            DataBind();
        }
    }
}