﻿

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
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class hikaya_AjlounEntities3 : DbContext
{
    public hikaya_AjlounEntities3()
        : base("name=hikaya_AjlounEntities3")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<C__MigrationHistory> C__MigrationHistory { get; set; }

    public virtual DbSet<Article> Articles { get; set; }

    public virtual DbSet<AspNetRole> AspNetRoles { get; set; }

    public virtual DbSet<AspNetUserClaim> AspNetUserClaims { get; set; }

    public virtual DbSet<AspNetUserLogin> AspNetUserLogins { get; set; }

    public virtual DbSet<AspNetUserRole> AspNetUserRoles { get; set; }

    public virtual DbSet<AspNetUser> AspNetUsers { get; set; }

    public virtual DbSet<author> authors { get; set; }

    public virtual DbSet<Cart> Carts { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<Order_Details> Order_Details { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<place> places { get; set; }

    public virtual DbSet<Product> Products { get; set; }

    public virtual DbSet<Review> Reviews { get; set; }

    public virtual DbSet<sysdiagram> sysdiagrams { get; set; }

}

}
