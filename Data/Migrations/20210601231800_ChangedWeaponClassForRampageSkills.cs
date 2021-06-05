using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class ChangedWeaponClassForRampageSkills : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "RampageSlots",
                table: "Weapons");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<int>(
                name: "RampageSlots",
                table: "Weapons",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);
        }
    }
}
