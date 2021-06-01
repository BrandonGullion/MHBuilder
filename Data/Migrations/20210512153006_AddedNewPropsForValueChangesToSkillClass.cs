using Microsoft.EntityFrameworkCore.Migrations;

namespace Data.Migrations
{
    public partial class AddedNewPropsForValueChangesToSkillClass : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "Level",
                table: "Skills",
                newName: "PercentChange");

            migrationBuilder.AddColumn<int>(
                name: "NumericChange",
                table: "Skills",
                type: "INTEGER",
                nullable: false,
                defaultValue: 0);

            migrationBuilder.AddColumn<string>(
                name: "StatType",
                table: "Skills",
                type: "TEXT",
                nullable: true);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "NumericChange",
                table: "Skills");

            migrationBuilder.DropColumn(
                name: "StatType",
                table: "Skills");

            migrationBuilder.RenameColumn(
                name: "PercentChange",
                table: "Skills",
                newName: "Level");
        }
    }
}
