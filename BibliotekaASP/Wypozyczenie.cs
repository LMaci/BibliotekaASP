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
    
    public partial class Wypozyczenie
    {
        public int ID { get; set; }
        public int Czytelnik_ID { get; set; }
        public int Ksiazka_ID { get; set; }
        public System.DateTime Wydano { get; set; }
        public Nullable<System.DateTime> Zwrot { get; set; }
    
        public virtual Czytelnik Czytelnik { get; set; }
        public virtual Ksiazka Ksiazka { get; set; }
    }
}
