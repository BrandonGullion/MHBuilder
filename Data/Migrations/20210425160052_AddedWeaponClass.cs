using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class AddedWeaponClass : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Type",
                table: "Skills",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "DecoSlot1Lvl",
                table: "Armors",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "DecoSlot2Lvl",
                table: "Armors",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<int>(
                name: "DecoSlot3Lvl",
                table: "Armors",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Weapons",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Type = table.Column<string>(type: "TEXT", nullable: true),
                    PhialOrShellingType = table.Column<string>(type: "TEXT", nullable: true),
                    SharpnessURL = table.Column<string>(type: "TEXT", nullable: true),
                    Damage = table.Column<double>(type: "REAL", nullable: false),
                    ElementalDamage = table.Column<double>(type: "REAL", nullable: false),
                    Affinity = table.Column<double>(type: "REAL", nullable: false),
                    RampageSlots = table.Column<int>(type: "INTEGER", nullable: false),
                    RampageSkillId = table.Column<int>(type: "INTEGER", nullable: true),
                    DecoSlot1Lvl = table.Column<int>(type: "INTEGER", nullable: false),
                    DecoSlot2Lvl = table.Column<int>(type: "INTEGER", nullable: false),
                    DecoSlot3Lvl = table.Column<int>(type: "INTEGER", nullable: false),
                    PreviousWeapon = table.Column<string>(type: "TEXT", nullable: true),
                    UpgradeWeapon = table.Column<string>(type: "TEXT", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Weapons", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Weapons_Skills_RampageSkillId",
                        column: x => x.RampageSkillId,
                        principalTable: "Skills",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Weapons_RampageSkillId",
                table: "Weapons",
                column: "RampageSkillId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Weapons");

            migrationBuilder.DropColumn(
                name: "Type",
                table: "Skills");

            migrationBuilder.DropColumn(
                name: "DecoSlot1Lvl",
                table: "Armors");

            migrationBuilder.DropColumn(
                name: "DecoSlot2Lvl",
                table: "Armors");

            migrationBuilder.DropColumn(
                name: "DecoSlot3Lvl",
                table: "Armors");
        }
    }
}
