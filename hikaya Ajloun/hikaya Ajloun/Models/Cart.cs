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
    
    public partial class Cart
    {
        public int cartId { get; set; }
        public Nullable<int> productId { get; set; }
        public string userId { get; set; }
        public Nullable<int> amount { get; set; }
        public Nullable<int> quantity { get; set; }
    
        public virtual AspNetUser AspNetUser { get; set; }
        public virtual Product Product { get; set; }
    }
}
