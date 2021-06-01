using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class ChangesArmorListSkillsToString : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Skills_Armors_ArmorId",
                table: "Skills");

            migrationBuilder.DropIndex(
                name: "IX_Skills_ArmorId",
                table: "Skills");

            migrationBuilder.DropColumn(
                name: "ArmorId",
                table: "Skills");

            migrationBuilder.AddColumn<string>(
                name: "Skills",
                table: "Armors",
                type: "TEXT",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Skills",
                table: "Armors");

            migrationBuilder.AddColumn<int>(
                name: "ArmorId",
                table: "Skills",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Skills_ArmorId",
                table: "Skills",
                column: "ArmorId");

            migrationBuilder.AddForeignKey(
                name: "FK_Skills_Armors_ArmorId",
                table: "Skills",
                column: "ArmorId",
                principalTable: "Armors",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
