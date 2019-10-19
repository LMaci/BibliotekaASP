using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BibliotekaASP
{
    public partial class Czytelnik1 : System.Web.UI.Page
    {
        private BibliotekaEntities db = new BibliotekaEntities();
        private Czytelnik aktualnyCzytelnik;

        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void gvCzytelnik_SelectedIndexChanged(object sender, EventArgs e)
        {
            int id = int.Parse(gvCzytelnik.DataKeys[gvCzytelnik.SelectedIndex].Value.ToString());
            aktualnyCzytelnik = db.Czytelnik.Single(x => x.ID == id);

            tbImie.Text = aktualnyCzytelnik.Imie;
            tbNazwisko.Text = aktualnyCzytelnik.Nazwisko;
            tbPesel.Text = aktualnyCzytelnik.PESEL;
            tbTelefon.Text = aktualnyCzytelnik.Telefon;
            tbEmail.Text = aktualnyCzytelnik.Email;

            lbImie.Text = aktualnyCzytelnik.Imie;
            lbNazwisko.Text = aktualnyCzytelnik.Nazwisko;

            Panel2.Visible = true;
            Panel3.Visible = false;
            pDaty.Visible = false;
        }

        protected void btDodaj_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbImie.Text) && !String.IsNullOrEmpty(tbNazwisko.Text) && !String.IsNullOrEmpty(tbPesel.Text))
            {
                Czytelnik nowyCzytelnik = new Czytelnik();
                nowyCzytelnik.Imie = tbImie.Text;
                nowyCzytelnik.Nazwisko = tbNazwisko.Text;
                nowyCzytelnik.PESEL = tbPesel.Text;
                nowyCzytelnik.Telefon = tbTelefon.Text;
                nowyCzytelnik.Email = tbEmail.Text;


                db.Czytelnik.Add(nowyCzytelnik);
                db.SaveChanges();
                DataBind();

                CzyscTB();
            }
            else Response.Write("Sprawdź poprawność danych!");
        }

        protected void btAktualizuj_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbImie.Text) && !String.IsNullOrEmpty(tbNazwisko.Text) && !String.IsNullOrEmpty(tbPesel.Text))
            {
                int id = int.Parse(gvCzytelnik.DataKeys[gvCzytelnik.SelectedIndex].Value.ToString());
                aktualnyCzytelnik = db.Czytelnik.Single(x => x.ID == id);

                aktualnyCzytelnik.Imie = tbImie.Text;
                aktualnyCzytelnik.Nazwisko = tbNazwisko.Text;
                aktualnyCzytelnik.PESEL = tbPesel.Text;
                aktualnyCzytelnik.Email = tbEmail.Text;
                aktualnyCzytelnik.Telefon = tbTelefon.Text;

                db.Entry(aktualnyCzytelnik).State = System.Data.Entity.EntityState.Modified;
                db.SaveChanges();
                DataBind();

                CzyscTB();

            }
            else Response.Write("Sprawdź poprawność danych");
        }

        protected void CzyscTB()
        {
            aktualnyCzytelnik = null;
            tbImie.Text = null;
            tbNazwisko.Text = null;
            tbPesel.Text = null;
            tbEmail.Text = null;
            tbTelefon.Text = null;
        }

        protected void btUsun_Click(object sender, EventArgs e)
        {
            int id = int.Parse(gvCzytelnik.DataKeys[gvCzytelnik.SelectedIndex].Value.ToString());
            aktualnyCzytelnik = db.Czytelnik.Single(x => x.ID == id);
            if (aktualnyCzytelnik != null)
            {
                db.Czytelnik.Remove(aktualnyCzytelnik);
                db.SaveChanges();
                DataBind();

                CzyscTB();
            }
            else Response.Write("Aby usunąć czytelnika musisz najpierw wybrać kogoś z listy!");
            
        }


        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int iOddaj = GridView1.SelectedRow.RowIndex;
            TextBox1.Text = GridView1.Rows[iOddaj].Cells[2].Text;
            if (GridView1.Rows[iOddaj].Cells[3].Text != "&nbsp;")
                TextBox2.Text = GridView1.Rows[iOddaj].Cells[3].Text;
            else TextBox2.Text = null;
            Panel3.Visible = true;

        }

        protected void btAktualizujWypo_Click(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(TextBox1.Text))
            {
                int id = int.Parse(GridView1.DataKeys[GridView1.SelectedRow.RowIndex].Value.ToString());

                Wypozyczenie oddaj;
                oddaj = db.Wypozyczenie.Single(x => x.ID == id);
                oddaj.Wydano = Convert.ToDateTime(TextBox1.Text);
                if (!String.IsNullOrEmpty(TextBox2.Text))
                    oddaj.Zwrot = Convert.ToDateTime(TextBox2.Text);
                else oddaj.Zwrot = null;
                db.SaveChanges();
                GridView1.DataBind();
            }
            else Response.Write("Sprawdź poprawność danych!");
            
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.SelectedIndex = -1;
            TextBox1.Text = null;
            TextBox2.Text = null;
            pDaty.Visible = true;
            Panel3.Visible = false;

        }
    }
}