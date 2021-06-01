using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class removedPrevAndUpgradeWeaponFromWeaponClass : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PreviousWeapon",
                table: "Weapons");

            migrationBuilder.DropColumn(
                name: "UpgradeWeapon",
                table: "Weapons");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "PreviousWeapon",
                table: "Weapons",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "UpgradeWeapon",
                table: "Weapons",
                type: "TEXT",
                nullable: true);
        }
    }
}
