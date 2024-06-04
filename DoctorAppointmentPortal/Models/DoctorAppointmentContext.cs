﻿using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace DoctorAppointmentPortal.Models;

public partial class DoctorAppointmentContext : DbContext
{
    public DoctorAppointmentContext()
    {
    }

    public DoctorAppointmentContext(DbContextOptions<DoctorAppointmentContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Appointment> Appointments { get; set; }

    public virtual DbSet<DiseasesDoctorDetail> DiseasesDoctorDetails { get; set; }

    public virtual DbSet<DoctorDetail> DoctorDetails { get; set; }

    
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.Entity<Appointment>(entity =>
        {
            entity.HasKey(e => e.AppointmentId).HasName("PK__Appointm__8ECDFCA2715056A7");

            entity.ToTable("Appointment");

            entity.Property(e => e.AppointmentId).HasColumnName("AppointmentID");
            entity.Property(e => e.AppointmentTime).HasColumnType("datetime");
            entity.Property(e => e.DoctorAvalialbeTime)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Doctor_Avalialbe_Time");
            entity.Property(e => e.DoctorToVisit)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Doctor_to_Visit");
            entity.Property(e => e.MedicalIssue)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Medical_Issue");
            entity.Property(e => e.PatientName)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("patient_name");

            entity.HasOne(d => d.MedicalIssueNavigation).WithMany(p => p.Appointments)
                .HasForeignKey(d => d.MedicalIssue)
                .HasConstraintName("FK__Appointme__Medic__47DBAE45");
        });

        modelBuilder.Entity<DiseasesDoctorDetail>(entity =>
        {
            entity.HasKey(e => e.DiseasesName).HasName("pk_prim");

            entity.ToTable("Diseases_Doctor_Details");

            entity.Property(e => e.DiseasesName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.DiseasesId)
                .ValueGeneratedOnAdd()
                .HasColumnName("DiseasesID");

            entity.HasOne(d => d.SuitableDoctor).WithMany(p => p.DiseasesDoctorDetails)
                .HasForeignKey(d => d.SuitableDoctorId)
                .HasConstraintName("FK__Diseases___Suita__398D8EEE");
        });

        modelBuilder.Entity<DoctorDetail>(entity =>
        {
            entity.HasKey(e => e.DoctorId).HasName("PK__Doctor_D__2DC00EDFD4DF1CB0");

            entity.ToTable("Doctor_Details");

            entity.Property(e => e.DoctorId).HasColumnName("DoctorID");
            entity.Property(e => e.AvailableTime)
                .HasMaxLength(50)
                .IsUnicode(false)
                .HasColumnName("Available_Time");
            entity.Property(e => e.DoctorFee).HasColumnName("Doctor_Fee");
            entity.Property(e => e.DoctorName)
                .HasMaxLength(50)
                .IsUnicode(false);
            entity.Property(e => e.Specialisation)
                .HasMaxLength(50)
                .IsUnicode(false);
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
