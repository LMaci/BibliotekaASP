//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BibliotekaASP
{
    using System;
    using System.Collections.Generic;
    
    public partial class Ksiazka
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ksiazka()
        {
            this.Wypozyczenie = new HashSet<Wypozyczenie>();
        }
    
        public int ID { get; set; }
        public string Tytul { get; set; }
        public string ISBN { get; set; }
        public int Autor_ID { get; set; }
        public int Kategoria_ID { get; set; }
        public string Opis { get; set; }
    
        public virtual Autor Autor { get; set; }
        public virtual Kategoria Kategoria { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Wypozyczenie> Wypozyczenie { get; set; }
    }
}
