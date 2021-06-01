using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class UpdatedWeaponClass : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "SharpnessURL",
                table: "Weapons");

            migrationBuilder.AddColumn<int>(
                name: "BlueSharpness",
                table: "Weapons",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "GreenSharpness",
                table: "Weapons",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "OrangeSharpness",
                table: "Weapons",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "PurpleSharpness",
                table: "Weapons",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "RedSharpness",
                table: "Weapons",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "WhiteSharpness",
                table: "Weapons",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "YellowSharpness",
                table: "Weapons",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BlueSharpness",
                table: "Weapons");

            migrationBuilder.DropColumn(
                name: "GreenSharpness",
                table: "Weapons");

            migrationBuilder.DropColumn(
                name: "OrangeSharpness",
                table: "Weapons");

            migrationBuilder.DropColumn(
                name: "PurpleSharpness",
                table: "Weapons");

            migrationBuilder.DropColumn(
                name: "RedSharpness",
                table: "Weapons");

            migrationBuilder.DropColumn(
                name: "WhiteSharpness",
                table: "Weapons");

            migrationBuilder.DropColumn(
                name: "YellowSharpness",
                table: "Weapons");

            migrationBuilder.AddColumn<string>(
                name: "SharpnessURL",
                table: "Weapons",
                type: "TEXT",
                nullable: true);
        }
    }
}
