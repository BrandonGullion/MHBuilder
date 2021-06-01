using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class AddedArmorAndSkills : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "Description",
                table: "Decorations",
                type: "TEXT",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SkillId",
                table: "Decorations",
                type: "INTEGER",
                nullable: true);

            migrationBuilder.AddColumn<int>(
                name: "SlotLevel",
                table: "Decorations",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.CreateTable(
                name: "Armors",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Type = table.Column<string>(type: "TEXT", nullable: true),
                    Defense = table.Column<double>(type: "REAL", nullable: false),
                    FireRes = table.Column<double>(type: "REAL", nullable: false),
                    WaterRes = table.Column<double>(type: "REAL", nullable: false),
                    ThunderRes = table.Column<double>(type: "REAL", nullable: false),
                    IceRes = table.Column<double>(type: "REAL", nullable: false),
                    DragonRes = table.Column<double>(type: "REAL", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Armors", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Skills",
                columns: table => new
                {
                    Id = table.Column<int>(type: "INTEGER", nullable: false)
                        .Annotation("Sqlite:Autoincrement", true),
                    Name = table.Column<string>(type: "TEXT", nullable: true),
                    Description = table.Column<string>(type: "TEXT", nullable: true),
                    Stats = table.Column<string>(type: "TEXT", nullable: true),
                    Level = table.Column<int>(type: "INTEGER", nullable: false),
                    ArmorId = table.Column<int>(type: "INTEGER", nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Skills", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Skills_Armors_ArmorId",
                        column: x => x.ArmorId,
                        principalTable: "Armors",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Decorations_SkillId",
                table: "Decorations",
                column: "SkillId");

            migrationBuilder.CreateIndex(
                name: "IX_Skills_ArmorId",
                table: "Skills",
                column: "ArmorId");

            migrationBuilder.AddForeignKey(
                name: "FK_Decorations_Skills_SkillId",
                table: "Decorations",
                column: "SkillId",
                principalTable: "Skills",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Decorations_Skills_SkillId",
                table: "Decorations");

            migrationBuilder.DropTable(
                name: "Skills");

            migrationBuilder.DropTable(
                name: "Armors");

            migrationBuilder.DropIndex(
                name: "IX_Decorations_SkillId",
                table: "Decorations");

            migrationBuilder.DropColumn(
                name: "Description",
                table: "Decorations");

            migrationBuilder.DropColumn(
                name: "SkillId",
                table: "Decorations");

            migrationBuilder.DropColumn(
                name: "SlotLevel",
                table: "Decorations");
        }
    }
}
