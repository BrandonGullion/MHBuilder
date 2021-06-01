using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class UpdatedRampageSkillsInWeaponClass : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Weapons_Skills_RampageSkillId",
                table: "Weapons");

            migrationBuilder.DropIndex(
                name: "IX_Weapons_RampageSkillId",
                table: "Weapons");

            migrationBuilder.DropColumn(
                name: "RampageSkillId",
                table: "Weapons");

            migrationBuilder.AddColumn<string>(
                name: "StringRampageSkills",
                table: "Weapons",
                type: "TEXT",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "StringRampageSkills",
                table: "Weapons");

            migrationBuilder.AddColumn<int>(
                name: "RampageSkillId",
                table: "Weapons",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Weapons_RampageSkillId",
                table: "Weapons",
                column: "RampageSkillId");

            migrationBuilder.AddForeignKey(
                name: "FK_Weapons_Skills_RampageSkillId",
                table: "Weapons",
                column: "RampageSkillId",
                principalTable: "Skills",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
