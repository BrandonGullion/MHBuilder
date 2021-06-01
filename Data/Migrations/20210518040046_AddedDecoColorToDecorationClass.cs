using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class AddedDecoColorToDecorationClass : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NumericChange",
                table: "Skills");

            migrationBuilder.DropColumn(
                name: "PercentChange",
                table: "Skills");

            migrationBuilder.DropColumn(
                name: "Rarity",
                table: "Decorations");

            migrationBuilder.RenameColumn(
                name: "Description",
                table: "Decorations",
                newName: "DecorationColor");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "DecorationColor",
                table: "Decorations",
                newName: "Description");

            migrationBuilder.AddColumn<int>(
                name: "NumericChange",
                table: "Skills",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "PercentChange",
                table: "Skills",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "Rarity",
                table: "Decorations",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);
        }
    }
}
