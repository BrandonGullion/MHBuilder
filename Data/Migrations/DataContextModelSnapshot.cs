﻿// <auto-generated />
using System;
using Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Data.Migrations
{
    [DbContext(typeof(DataContext))]
    partial class DataContextModelSnapshot : ModelSnapshot
    {
        protected override void BuildModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "5.0.5");

            modelBuilder.Entity("Classes.Armor", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<int>("ArmorSetId")
                        .HasColumnType("INTEGER");

                    b.Property<string>("ArmorSetName")
                        .HasColumnType("TEXT");

                    b.Property<int>("DecoSlot1Lvl")
                        .HasColumnType("INTEGER");

                    b.Property<int>("DecoSlot2Lvl")
                        .HasColumnType("INTEGER");

                    b.Property<int>("DecoSlot3Lvl")
                        .HasColumnType("INTEGER");

                    b.Property<double>("Defense")
                        .HasColumnType("REAL");

                    b.Property<double>("DragonRes")
                        .HasColumnType("REAL");

                    b.Property<double>("FireRes")
                        .HasColumnType("REAL");

                    b.Property<double>("IceRes")
                        .HasColumnType("REAL");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<string>("Rank")
                        .HasColumnType("TEXT");

                    b.Property<int>("Rarity")
                        .HasColumnType("INTEGER");

                    b.Property<string>("StringSkills")
                        .HasColumnType("TEXT");

                    b.Property<double>("ThunderRes")
                        .HasColumnType("REAL");

                    b.Property<string>("Type")
                        .HasColumnType("TEXT");

                    b.Property<double>("WaterRes")
                        .HasColumnType("REAL");

                    b.HasKey("Id");

                    b.ToTable("Armors");
                });

            modelBuilder.Entity("Classes.Decoration", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("DecorationColor")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<int?>("SkillId")
                        .HasColumnType("INTEGER");

                    b.Property<int>("SlotLevel")
                        .HasColumnType("INTEGER");

                    b.HasKey("Id");

                    b.HasIndex("SkillId");

                    b.ToTable("Decorations");
                });

            modelBuilder.Entity("Classes.RampageSkill", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Description")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<string>("Stats")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("RampageSkills");
                });

            modelBuilder.Entity("Classes.Skill", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<string>("Description")
                        .HasColumnType("TEXT");

                    b.Property<int>("MaxLevel")
                        .HasColumnType("INTEGER");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<string>("StatType")
                        .HasColumnType("TEXT");

                    b.Property<string>("Stats")
                        .HasColumnType("TEXT");

                    b.HasKey("Id");

                    b.ToTable("Skills");
                });

            modelBuilder.Entity("Classes.Weapon", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("INTEGER");

                    b.Property<double>("Affinity")
                        .HasColumnType("REAL");

                    b.Property<string>("ArcShot")
                        .HasColumnType("TEXT");

                    b.Property<double>("BlueSharpness")
                        .HasColumnType("REAL");

                    b.Property<string>("BowGunSpecs")
                        .HasColumnType("TEXT");

                    b.Property<int>("Damage")
                        .HasColumnType("INTEGER");

                    b.Property<int>("DecoSlot1Lvl")
                        .HasColumnType("INTEGER");

                    b.Property<int>("DecoSlot2Lvl")
                        .HasColumnType("INTEGER");

                    b.Property<int>("DecoSlot3Lvl")
                        .HasColumnType("INTEGER");

                    b.Property<int>("DefenseIncrease")
                        .HasColumnType("INTEGER");

                    b.Property<string>("ElementType")
                        .HasColumnType("TEXT");

                    b.Property<double>("ElementalDamage")
                        .HasColumnType("REAL");

                    b.Property<double>("GreenSharpness")
                        .HasColumnType("REAL");

                    b.Property<string>("Melody")
                        .HasColumnType("TEXT");

                    b.Property<string>("Name")
                        .HasColumnType("TEXT");

                    b.Property<double>("OrangeSharpness")
                        .HasColumnType("REAL");

                    b.Property<string>("PhialOrShellingType")
                        .HasColumnType("TEXT");

                    b.Property<double>("PurpleSharpness")
                        .HasColumnType("REAL");

                    b.Property<int>("Rarity")
                        .HasColumnType("INTEGER");

                    b.Property<double>("RedSharpness")
                        .HasColumnType("REAL");

                    b.Property<int>("ShellingLevel")
                        .HasColumnType("INTEGER");

                    b.Property<string>("ShotType")
                        .HasColumnType("TEXT");

                    b.Property<string>("StringRampageSkills")
                        .HasColumnType("TEXT");

                    b.Property<string>("Type")
                        .HasColumnType("TEXT");

                    b.Property<double>("WhiteSharpness")
                        .HasColumnType("REAL");

                    b.Property<double>("YellowSharpness")
                        .HasColumnType("REAL");

                    b.HasKey("Id");

                    b.ToTable("Weapons");
                });

            modelBuilder.Entity("Classes.Decoration", b =>
                {
                    b.HasOne("Classes.Skill", "Skill")
                        .WithMany()
                        .HasForeignKey("SkillId");

                    b.Navigation("Skill");
                });
#pragma warning restore 612, 618
        }
    }
}
