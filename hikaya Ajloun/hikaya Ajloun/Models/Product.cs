//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace hikaya_Ajloun.Models
{
    using System;
    using System.Collections.Generic;
    using System.Web.Mvc;

    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Carts = new HashSet<Cart>();
            this.Reviews = new HashSet<Review>();
        }
    
        public int productId { get; set; }
        public string productName { get; set; }
        public string productImage_1 { get; set; }
        public string productImage_2 { get; set; }
        public string productImage_3 { get; set; }
        public string productImage_4 { get; set; }
        public string productImage_5 { get; set; }
        public int price { get; set; }
        public string productDescription { get; set; }
        public int categoryId { get; set; }
        public string availability { get; set; }
        [AllowHtml]
        public string shipping_return { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Cart> Carts { get; set; }
        public virtual Category Category { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Review> Reviews { get; set; }
    }
}
