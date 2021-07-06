BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "__EFMigrationsHistory" (
	"MigrationId"	TEXT NOT NULL,
	"ProductVersion"	TEXT NOT NULL,
	CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY("MigrationId")
);
CREATE TABLE IF NOT EXISTS "Armors" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT,
	"Type"	TEXT,
	"Defense"	REAL NOT NULL,
	"FireRes"	REAL NOT NULL,
	"WaterRes"	REAL NOT NULL,
	"ThunderRes"	REAL NOT NULL,
	"IceRes"	REAL NOT NULL,
	"DragonRes"	REAL NOT NULL,
	"DecoSlot1Lvl"	INTEGER NOT NULL DEFAULT 0,
	"DecoSlot2Lvl"	INTEGER NOT NULL DEFAULT 0,
	"DecoSlot3Lvl"	INTEGER NOT NULL DEFAULT 0,
	"Rarity"	INTEGER NOT NULL DEFAULT 0,
	"ArmorSetId"	INTEGER NOT NULL DEFAULT 0,
	"ArmorSetName"	TEXT,
	"StringSkills"	TEXT,
	"Rank"	TEXT,
	CONSTRAINT "PK_Armors" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Decorations" (
	"Id"	INTEGER NOT NULL,
	"DecorationColor"	TEXT,
	"Name"	TEXT,
	"SkillId"	INTEGER,
	"SlotLevel"	INTEGER NOT NULL,
	CONSTRAINT "PK_Decorations" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_Decorations_Skills_SkillId" FOREIGN KEY("SkillId") REFERENCES "Skills"("Id") ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "RampageSkills" (
	"Id"	INTEGER NOT NULL,
	"Name"	TEXT,
	"Description"	TEXT,
	"Stats"	TEXT,
	CONSTRAINT "PK_RampageSkills" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Skills" (
	"Id"	INTEGER NOT NULL,
	"Description"	TEXT,
	"MaxLevel"	INTEGER NOT NULL,
	"Name"	TEXT,
	"StatType"	TEXT,
	"Stats"	TEXT,
	"JewelName"	TEXT,
	CONSTRAINT "PK_Skills" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Weapons" (
	"Id"	INTEGER NOT NULL,
	"Affinity"	REAL NOT NULL,
	"BlueSharpness"	REAL NOT NULL,
	"Damage"	INTEGER NOT NULL,
	"DecoSlot1Lvl"	INTEGER NOT NULL,
	"DecoSlot2Lvl"	INTEGER NOT NULL,
	"DecoSlot3Lvl"	INTEGER NOT NULL,
	"DefenseIncrease"	INTEGER NOT NULL,
	"ElementType"	TEXT,
	"ElementalDamage"	REAL NOT NULL,
	"GreenSharpness"	REAL NOT NULL,
	"Name"	TEXT,
	"OrangeSharpness"	REAL NOT NULL,
	"PhialOrShellingType"	TEXT,
	"PurpleSharpness"	REAL NOT NULL,
	"Rarity"	INTEGER NOT NULL,
	"RedSharpness"	REAL NOT NULL,
	"ShellingLevel"	INTEGER NOT NULL,
	"Melody"	TEXT,
	"StringRampageSkills"	TEXT,
	"Type"	TEXT,
	"WhiteSharpness"	REAL NOT NULL,
	"YellowSharpness"	REAL NOT NULL,
	"ArcShot"	TEXT,
	"ShotType"	TEXT,
	"BowGunSpecs"	TEXT,
	CONSTRAINT "PK_Weapons" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Fixes" (
	"Id"	INTEGER NOT NULL,
	"Title"	TEXT,
	"DateCreated"	TEXT,
	"Content"	TEXT,
	CONSTRAINT "PK_Fixes" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "Updates" (
	"Id"	INTEGER NOT NULL,
	"Title"	TEXT,
	"Content"	TEXT,
	"DateCreated"	TEXT,
	CONSTRAINT "PK_Updates" PRIMARY KEY("Id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "AspNetRoles" (
	"Id"	TEXT NOT NULL,
	"Name"	TEXT,
	"NormalizedName"	TEXT,
	"ConcurrencyStamp"	TEXT,
	CONSTRAINT "PK_AspNetRoles" PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "AspNetUsers" (
	"Id"	TEXT NOT NULL,
	"DisplayName"	TEXT,
	"UserName"	TEXT,
	"NormalizedUserName"	TEXT,
	"Email"	TEXT,
	"NormalizedEmail"	TEXT,
	"EmailConfirmed"	INTEGER NOT NULL,
	"PasswordHash"	TEXT,
	"SecurityStamp"	TEXT,
	"ConcurrencyStamp"	TEXT,
	"PhoneNumber"	TEXT,
	"PhoneNumberConfirmed"	INTEGER NOT NULL,
	"TwoFactorEnabled"	INTEGER NOT NULL,
	"LockoutEnd"	TEXT,
	"LockoutEnabled"	INTEGER NOT NULL,
	"AccessFailedCount"	INTEGER NOT NULL,
	CONSTRAINT "PK_AspNetUsers" PRIMARY KEY("Id")
);
CREATE TABLE IF NOT EXISTS "AspNetRoleClaims" (
	"Id"	INTEGER NOT NULL,
	"RoleId"	TEXT NOT NULL,
	"ClaimType"	TEXT,
	"ClaimValue"	TEXT,
	CONSTRAINT "PK_AspNetRoleClaims" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_AspNetRoleClaims_AspNetRoles_RoleId" FOREIGN KEY("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetUserClaims" (
	"Id"	INTEGER NOT NULL,
	"UserId"	TEXT NOT NULL,
	"ClaimType"	TEXT,
	"ClaimValue"	TEXT,
	CONSTRAINT "PK_AspNetUserClaims" PRIMARY KEY("Id" AUTOINCREMENT),
	CONSTRAINT "FK_AspNetUserClaims_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetUserLogins" (
	"LoginProvider"	TEXT NOT NULL,
	"ProviderKey"	TEXT NOT NULL,
	"ProviderDisplayName"	TEXT,
	"UserId"	TEXT NOT NULL,
	CONSTRAINT "PK_AspNetUserLogins" PRIMARY KEY("LoginProvider","ProviderKey"),
	CONSTRAINT "FK_AspNetUserLogins_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetUserRoles" (
	"UserId"	TEXT NOT NULL,
	"RoleId"	TEXT NOT NULL,
	CONSTRAINT "PK_AspNetUserRoles" PRIMARY KEY("UserId","RoleId"),
	CONSTRAINT "FK_AspNetUserRoles_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE,
	CONSTRAINT "FK_AspNetUserRoles_AspNetRoles_RoleId" FOREIGN KEY("RoleId") REFERENCES "AspNetRoles"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "AspNetUserTokens" (
	"UserId"	TEXT NOT NULL,
	"LoginProvider"	TEXT NOT NULL,
	"Name"	TEXT NOT NULL,
	"Value"	TEXT,
	CONSTRAINT "PK_AspNetUserTokens" PRIMARY KEY("UserId","LoginProvider","Name"),
	CONSTRAINT "FK_AspNetUserTokens_AspNetUsers_UserId" FOREIGN KEY("UserId") REFERENCES "AspNetUsers"("Id") ON DELETE CASCADE
);
CREATE TABLE IF NOT EXISTS "Bulletins" (
	"Id"	INTEGER NOT NULL,
	"Title"	TEXT,
	"Content"	TEXT,
	"Date"	TEXT,
	CONSTRAINT "PK_Bulletins" PRIMARY KEY("Id" AUTOINCREMENT)
);
INSERT INTO "__EFMigrationsHistory" VALUES ('20210425040318_InitCreate','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210425045001_AddedArmorAndSkills','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210425160052_AddedWeaponClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210427195128_updatedAllClassesWithRarity','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210428133836_AddedArmorSetIdToArmor','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210502185600_AddedElementTypeToWeaponClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210510012739_AddedArmorSetNameToArmorClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210512153006_AddedNewPropsForValueChangesToSkillClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210514143222_ChangesArmorListSkillsToString','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210515171353_SettingUpSkillClassForHttpPostCalls','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210516192317_CheckingIfDataBaseIsSetUpCorrectly','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210516201807_ChanedToListInArmor','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210518040046_AddedDecoColorToDecorationClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210519040617_AddedDefenseStatToWeapons','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210524165008_AddedLevelToSkillClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210524175619_NotMappingArmorSkillList','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210526144005_AddedRankToArmors','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210601180419_UpdatedWeaponClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210601181436_UpdatedRampageSkillsInWeaponClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210601183550_removedPrevAndUpgradeWeaponFromWeaponClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210601222234_AddedRampageSkillsToDbContext','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210601224219_RemovedStatsFromRampageSkillAndRemovedTypeFromSkill','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210601231800_ChangedWeaponClassForRampageSkills','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210605171006_AddedShelling','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210605172636_AddedMelodyToWeaponClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210606173935_AddedShotTypeAndArcShotToBow','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210606182544_AddedBowGunSpecsToWeaponClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210608212751_AddedJewelNameToSkillClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210622222640_AddedUpdatesAndFixes','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210623001951_AddedContentToFixClass','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210628200007_IdentityAdded','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210704231711_CreatedBulletinDBItems','5.0.5');
INSERT INTO "__EFMigrationsHistory" VALUES ('20210704234523_RemovedRequireForDisplayName','5.0.5');
INSERT INTO "Armors" VALUES (16,'Kamura Head Scarf','Helm',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,1,'Kamura','14*','Low');
INSERT INTO "Armors" VALUES (17,'Kamura Garb','Chest',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,1,'Kamura','15*','Low');
INSERT INTO "Armors" VALUES (18,'Kamura Braces','Arms',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,1,'Kamura','16*','Low');
INSERT INTO "Armors" VALUES (19,'Kamura Obi','Coil',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,1,'Kamura','17*','Low');
INSERT INTO "Armors" VALUES (20,'Kamura Leggings','Legs',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,1,'Kamura','18*','Low');
INSERT INTO "Armors" VALUES (21,'Leather Headgear','Helm',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,2,'Leather','10*','Low');
INSERT INTO "Armors" VALUES (22,'Leather Vest','Chest',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,2,'Leather','11*','Low');
INSERT INTO "Armors" VALUES (23,'Leather Gloves','Arms',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,2,'Leather','12*','Low');
INSERT INTO "Armors" VALUES (24,'Leather Belt','Coil',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,2,'Leather','13*','Low');
INSERT INTO "Armors" VALUES (25,'Leather Pants','Legs',1.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,2,'Leather','12*','Low');
INSERT INTO "Armors" VALUES (26,'Chainmail Headgear','Helm',4.0,0.0,0.0,1.0,0.0,0.0,0,0,0,1,3,'Chainmail ','11*19*','Low');
INSERT INTO "Armors" VALUES (27,'Chainmail Vest','Chest',4.0,0.0,0.0,1.0,0.0,0.0,0,0,0,1,3,'Chainmail ','20*19*','Low');
INSERT INTO "Armors" VALUES (28,'Chainmail Gloves','Arms',4.0,0.0,0.0,1.0,0.0,0.0,0,0,0,1,3,'Chainmail ','11*','Low');
INSERT INTO "Armors" VALUES (29,'Chainmail Belt','Coil',4.0,0.0,0.0,1.0,0.0,0.0,0,0,0,1,3,'Chainmail ','21*','Low');
INSERT INTO "Armors" VALUES (30,'Chainmail Pants','Legs',4.0,0.0,0.0,1.0,0.0,0.0,0,0,0,1,3,'Chainmail ','22*','Low');
INSERT INTO "Armors" VALUES (31,'Hunter''s Helm','Helm',4.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,4,'Hunter','23*','Low');
INSERT INTO "Armors" VALUES (32,'Hunter''s Mail','Chest',4.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,4,'Hunter','8*','Low');
INSERT INTO "Armors" VALUES (33,'Hunter''s Vambraces','Arms',4.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,4,'Hunter','24*','Low');
INSERT INTO "Armors" VALUES (34,'Hunter''s Coil','Coil',4.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,4,'Hunter','25*','Low');
INSERT INTO "Armors" VALUES (35,'Hunter''s Greaves','Legs',4.0,0.0,0.0,0.0,0.0,0.0,0,0,0,1,4,'Hunter','8*25*','Low');
INSERT INTO "Armors" VALUES (36,'Izuchi Helm','Helm',10.0,2.0,-1.0,-2.0,0.0,0.0,0,0,0,1,5,'Izuchi','17*','Low');
INSERT INTO "Armors" VALUES (37,'Izuchi Mail','Chest',10.0,2.0,-1.0,-2.0,0.0,0.0,0,0,0,1,5,'Izuchi','17*26*','Low');
INSERT INTO "Armors" VALUES (38,'Izuchi Braces','Arms',10.0,2.0,-1.0,-2.0,0.0,0.0,0,0,0,1,5,'Izuchi','27*','Low');
INSERT INTO "Armors" VALUES (39,'Izuchi Coil','Coil',10.0,2.0,-1.0,-2.0,0.0,0.0,0,0,0,1,5,'Izuchi','17*','Low');
INSERT INTO "Armors" VALUES (40,'Izuchi Greaves','Legs',10.0,2.0,-1.0,-2.0,0.0,0.0,0,0,0,1,5,'Izuchi','26*','Low');
INSERT INTO "Armors" VALUES (41,'Baggi Helm','Helm',10.0,-4.0,-1.0,-1.0,2.0,1.0,0,0,0,1,6,'Baggi','28*','Low');
INSERT INTO "Armors" VALUES (42,'Baggi Mail','Chest',10.0,-4.0,-1.0,-1.0,2.0,1.0,0,0,0,1,6,'Baggi','8*','Low');
INSERT INTO "Armors" VALUES (43,'Baggi Vambraces','Arms',10.0,-4.0,-1.0,-1.0,2.0,1.0,0,0,0,1,6,'Baggi','29*28*','Low');
INSERT INTO "Armors" VALUES (44,'Baggi Coil','Coil',10.0,-4.0,-1.0,-1.0,2.0,1.0,0,0,0,1,6,'Baggi','29*','Low');
INSERT INTO "Armors" VALUES (45,'Baggi Greaves','Legs',10.0,-4.0,-1.0,-1.0,2.0,1.0,0,0,0,1,6,'Baggi','8*','Low');
INSERT INTO "Armors" VALUES (46,'Vaik Helm','Helm',18.0,0.0,3.0,-2.0,-1.0,0.0,0,0,0,2,7,'Vaik','30*','Low');
INSERT INTO "Armors" VALUES (47,'Vaik Mail','Chest',18.0,0.0,3.0,-2.0,-1.0,0.0,0,0,0,2,7,'Vaik','31*','Low');
INSERT INTO "Armors" VALUES (48,'Vaik Braces','Arms',18.0,0.0,3.0,-2.0,-1.0,0.0,0,0,0,2,7,'Vaik','32*','Low');
INSERT INTO "Armors" VALUES (49,'Vaik Coil','Coil',18.0,0.0,3.0,-2.0,-1.0,0.0,0,0,0,2,7,'Vaik','31*','Low');
INSERT INTO "Armors" VALUES (50,'Vaik Greaves','Legs',18.0,0.0,3.0,-2.0,-1.0,0.0,0,0,0,2,7,'Vaik','30*','Low');
INSERT INTO "Armors" VALUES (51,'Lagombi Helm','Helm',10.0,-3.0,1.0,0.0,4.0,0.0,0,0,0,1,8,'Lagombi','17*','Low');
INSERT INTO "Armors" VALUES (52,'Lagombi Mail','Chest',10.0,-3.0,1.0,0.0,4.0,0.0,0,0,0,1,8,'Lagombi','33*','Low');
INSERT INTO "Armors" VALUES (53,'Lagombi Vambraces','Arms',10.0,-3.0,1.0,0.0,4.0,0.0,0,0,0,1,8,'Lagombi','28*','Low');
INSERT INTO "Armors" VALUES (54,'Lagombi Coil','Coil',10.0,-3.0,1.0,0.0,4.0,0.0,0,0,0,1,8,'Lagombi','27*','Low');
INSERT INTO "Armors" VALUES (55,'Lagombi Greaves','Legs',10.0,-3.0,1.0,0.0,4.0,0.0,0,0,0,1,8,'Lagombi','17*','Low');
INSERT INTO "Armors" VALUES (56,'Alloy Helm','Helm',10.0,-1.0,0.0,-1.0,-1.0,0.0,0,0,0,2,9,'Alloy','34*','Low');
INSERT INTO "Armors" VALUES (57,'Alloy Mail','Chest',10.0,-1.0,0.0,-1.0,-1.0,0.0,0,0,0,2,9,'Alloy','35*','Low');
INSERT INTO "Armors" VALUES (58,'Alloy Vambraces','Arms',10.0,-1.0,0.0,-1.0,-1.0,0.0,0,0,0,2,9,'Alloy','17*','Low');
INSERT INTO "Armors" VALUES (59,'Alloy Coil','Coil',10.0,-1.0,0.0,-1.0,-1.0,0.0,0,0,0,2,9,'Alloy','34*17*','Low');
INSERT INTO "Armors" VALUES (60,'Alloy Greaves','Legs',10.0,-1.0,0.0,-1.0,-1.0,0.0,0,0,0,2,9,'Alloy','35*','Low');
INSERT INTO "Armors" VALUES (61,'Bone Helm','Helm',10.0,0.0,0.0,0.0,-1.0,0.0,0,0,0,2,10,'Bone','36*','Low');
INSERT INTO "Armors" VALUES (62,'Bone Mail','Chest',10.0,0.0,0.0,0.0,-1.0,0.0,0,0,0,2,10,'Bone','37*','Low');
INSERT INTO "Armors" VALUES (63,'Bone Vambraces','Arms',10.0,0.0,0.0,0.0,-1.0,0.0,0,0,0,2,10,'Bone','37*','Low');
INSERT INTO "Armors" VALUES (64,'Bone Coil','Coil',10.0,0.0,0.0,0.0,-1.0,0.0,0,0,0,2,10,'Bone','38*','Low');
INSERT INTO "Armors" VALUES (65,'Bone Greaves','Legs',10.0,0.0,0.0,0.0,-1.0,0.0,0,0,0,2,10,'Bone','39*','Low');
INSERT INTO "Armors" VALUES (66,'Chaoshroom','Helm',12.0,2.0,-2.0,0.0,0.0,0.0,0,0,0,2,11,'Chaos','40*','Low');
INSERT INTO "Armors" VALUES (67,'Chaos Plate ','Chest',12.0,2.0,-2.0,0.0,0.0,0.0,0,0,0,2,11,'Chaos','','Low');
INSERT INTO "Armors" VALUES (68,'Shell Studded Hat ','Helm',12.0,0.0,2.0,1.0,-1.0,0.0,0,0,0,2,12,'Shell Studded','41*','Low');
INSERT INTO "Armors" VALUES (69,'Shell Studded Vest','Chest',12.0,0.0,2.0,1.0,-1.0,0.0,0,0,0,2,12,'Shell Studded','42*','Low');
INSERT INTO "Armors" VALUES (70,'Shell Studded Gloves ','Arms',12.0,0.0,2.0,1.0,-1.0,0.0,0,0,0,2,12,'Shell Studded','43*','Low');
INSERT INTO "Armors" VALUES (71,'Shell Studded Sash','Coil',12.0,0.0,2.0,1.0,-1.0,0.0,0,0,0,2,12,'Shell Studded','44*','Low');
INSERT INTO "Armors" VALUES (72,'Shell Studded Sandals','Legs',12.0,0.0,2.0,1.0,-1.0,0.0,0,0,0,2,12,'Shell Studded','45*','Low');
INSERT INTO "Armors" VALUES (73,'Slagtoth Hood','Helm',12.0,-2.0,2.0,0.0,-1.0,1.0,0,0,0,1,13,'Slagtoth','46*','Low');
INSERT INTO "Armors" VALUES (74,'Slagtoth Cloak','Chest',12.0,-2.0,2.0,0.0,-1.0,1.0,0,0,0,1,13,'Slagtoth','46*','Low');
INSERT INTO "Armors" VALUES (75,'Rhenoplos Helm','Helm',14.0,2.0,0.0,0.0,-2.0,0.0,0,0,0,2,14,'Rhenoplos ','47*','Low');
INSERT INTO "Armors" VALUES (76,'Rhenoplos Mail','Chest',14.0,2.0,0.0,0.0,-2.0,0.0,0,0,0,2,14,'Rhenoplos ','48*25*','Low');
INSERT INTO "Armors" VALUES (77,'Rhenoplos Braces','Arms',14.0,2.0,0.0,0.0,-2.0,0.0,0,0,0,2,14,'Rhenoplos ','48*','Low');
INSERT INTO "Armors" VALUES (78,'Rhenoplos Coil','Coil',14.0,2.0,0.0,0.0,-2.0,0.0,0,0,0,2,14,'Rhenoplos ','49*','Low');
INSERT INTO "Armors" VALUES (79,'Rhenoplos Greaves','Legs',14.0,2.0,0.0,0.0,-2.0,0.0,0,0,0,2,14,'Rhenoplos ','49*','Low');
INSERT INTO "Armors" VALUES (80,'Droth Mail','Chest',14.0,-2.0,4.0,-1.0,0.0,0.0,0,0,0,2,15,'Droth','41*','Low');
INSERT INTO "Armors" VALUES (81,'Droth Coil','Coil',14.0,-2.0,4.0,-1.0,0.0,0.0,0,0,0,2,15,'Droth','50*','Low');
INSERT INTO "Armors" VALUES (82,'Droth Greaves ','Legs',14.0,-2.0,4.0,-1.0,0.0,0.0,0,0,0,2,15,'Droth','41*','Low');
INSERT INTO "Armors" VALUES (83,'Bnahabra Hat','Helm',14.0,-2.0,0.0,0.0,0.0,2.0,0,0,0,2,16,'Bnahabra','43*','Low');
INSERT INTO "Armors" VALUES (84,'Bnahabra Suit','Chest',14.0,-2.0,0.0,0.0,0.0,2.0,0,0,0,2,16,'Bnahabra','51*','Low');
INSERT INTO "Armors" VALUES (85,'Bnahabra Gloves','Arms',14.0,-2.0,0.0,0.0,0.0,2.0,0,0,0,2,16,'Bnahabra','52*','Low');
INSERT INTO "Armors" VALUES (86,'Bnahabra Coil','Coil',14.0,-2.0,0.0,0.0,0.0,2.0,0,0,0,2,16,'Bnahabra','51*','Low');
INSERT INTO "Armors" VALUES (87,'Bnahabra Boots','Legs',14.0,-2.0,0.0,0.0,0.0,2.0,0,0,0,2,16,'Bnahabra','43*','Low');
INSERT INTO "Armors" VALUES (88,'Jaggi Gauntlets ','Arms',14.0,0.0,0.0,0.0,1.0,0.0,0,0,0,2,17,'Jaggi','8*','Low');
INSERT INTO "Armors" VALUES (89,'Jaggi Shinguards','Legs',14.0,0.0,0.0,0.0,1.0,0.0,0,0,0,2,17,'Jaggi','53*','Low');
INSERT INTO "Armors" VALUES (90,'Kulu-Ya-Ku Helm','Helm',16.0,0.0,-3.0,0.0,1.0,0.0,0,0,0,2,17,'Kulu-Ya-Ku','54*','Low');
INSERT INTO "Armors" VALUES (91,'Kulu-Ya-Ku Mail','Chest',16.0,0.0,-3.0,0.0,1.0,0.0,0,0,0,2,17,'Kulu-Ya-Ku','55*','Low');
INSERT INTO "Armors" VALUES (92,'Kulu-Ya-Ku Braces','Arms',16.0,0.0,-3.0,0.0,1.0,0.0,0,0,0,2,17,'Kulu-Ya-Ku','56*','Low');
INSERT INTO "Armors" VALUES (93,'Kulu-Ya-Ku Coil','Coil',16.0,0.0,-3.0,0.0,1.0,0.0,0,0,0,2,17,'Kulu-Ya-Ku','37*','Low');
INSERT INTO "Armors" VALUES (94,'Kulu-Ya-Ku Greaves','Legs',16.0,0.0,-3.0,0.0,1.0,0.0,0,0,0,2,17,'Kulu-Ya-Ku','25*17*','Low');
INSERT INTO "Armors" VALUES (95,'Wroggi Helm','Helm',16.0,2.0,-2.0,1.0,-4.0,0.0,0,0,0,2,18,'Wroggi','57*','Low');
INSERT INTO "Armors" VALUES (96,'Wroggi Mail','Chest',16.0,2.0,-2.0,1.0,-4.0,0.0,0,0,0,2,18,'Wroggi','58*','Low');
INSERT INTO "Armors" VALUES (97,'Wroggi Vambraces','Arms',16.0,2.0,-2.0,1.0,-4.0,0.0,0,0,0,2,18,'Wroggi','30*','Low');
INSERT INTO "Armors" VALUES (98,'Wroggi Coil','Coil',16.0,2.0,-2.0,1.0,-4.0,0.0,0,0,0,2,18,'Wroggi','58*','Low');
INSERT INTO "Armors" VALUES (99,'Wroggi Greaves','Legs',16.0,2.0,-2.0,1.0,-4.0,0.0,0,0,0,2,18,'Wroggi','57*','Low');
INSERT INTO "Armors" VALUES (100,'Aknosom Helm','Helm',16.0,3.0,-3.0,-1.0,0.0,0.0,0,0,0,2,19,'Aknosom ','59*','Low');
INSERT INTO "Armors" VALUES (101,'Aknosom Mail','Chest',16.0,3.0,-3.0,-1.0,0.0,0.0,0,0,0,2,19,'Aknosom ','24*','Low');
INSERT INTO "Armors" VALUES (102,'Aknosom Braces','Arms',16.0,3.0,-3.0,-1.0,0.0,0.0,0,0,0,2,19,'Aknosom ','59*','Low');
INSERT INTO "Armors" VALUES (103,'Aknosom Coil','Coil',16.0,3.0,-3.0,-1.0,0.0,0.0,0,0,0,2,19,'Aknosom ','26*','Low');
INSERT INTO "Armors" VALUES (104,'Aknosom Greaves','Legs',16.0,3.0,-3.0,-1.0,0.0,0.0,0,0,0,2,19,'Aknosom ','59*','Low');
INSERT INTO "Armors" VALUES (105,'Ludroth Helm','Helm',18.0,-3.0,4.0,-1.0,0.0,0.0,0,0,0,2,20,'Ludroth','34*','Low');
INSERT INTO "Armors" VALUES (106,'Ludroth Mail','Chest',18.0,-3.0,4.0,-1.0,0.0,0.0,0,0,0,2,20,'Ludroth','22*','Low');
INSERT INTO "Armors" VALUES (107,'Ludroth Braces','Arms',18.0,-3.0,4.0,-1.0,0.0,0.0,0,0,0,2,20,'Ludroth','60*','Low');
INSERT INTO "Armors" VALUES (108,'Ludroth Coil','Coil',18.0,-3.0,4.0,-1.0,0.0,0.0,0,0,0,2,20,'Ludroth','34*34*','Low');
INSERT INTO "Armors" VALUES (109,'Ludroth Greaves','Legs',18.0,-3.0,4.0,-1.0,0.0,0.0,0,0,0,2,20,'Ludroth','61*','Low');
INSERT INTO "Armors" VALUES (110,'Barroth Helm','Helm',18.0,-3.0,-1.0,3.0,-1.0,0.0,0,0,0,2,21,'Barroth','8*','Low');
INSERT INTO "Armors" VALUES (111,'Barroth Mail','Chest',18.0,-3.0,-1.0,3.0,-1.0,0.0,0,0,0,2,21,'Barroth','8*19*','Low');
INSERT INTO "Armors" VALUES (112,'Barroth Vambraces','Arms',18.0,-3.0,-1.0,3.0,-1.0,0.0,0,0,0,2,21,'Barroth','33*','Low');
INSERT INTO "Armors" VALUES (113,'Barroth Coil','Coil',18.0,-3.0,-1.0,3.0,-1.0,0.0,0,0,0,2,21,'Barroth','21*','Low');
INSERT INTO "Armors" VALUES (114,'Barroth Greaves','Legs',18.0,-3.0,-1.0,3.0,-1.0,0.0,0,0,0,2,21,'Barroth','21*','Low');
INSERT INTO "Armors" VALUES (115,'Khezu Helm','Helm',16.0,-4.0,1.0,4.0,2.0,1.0,0,0,0,2,22,'Khezu','13*','Low');
INSERT INTO "Armors" VALUES (116,'Khezu Mail','Chest',16.0,-4.0,1.0,4.0,2.0,1.0,0,0,0,2,22,'Khezu','18*','Low');
INSERT INTO "Armors" VALUES (117,'Khezu Vambraces ','Arms',16.0,-4.0,1.0,4.0,2.0,1.0,0,0,0,2,22,'Khezu','18*26*62*','Low');
INSERT INTO "Armors" VALUES (118,'Khezu Coil','Coil',16.0,-4.0,1.0,4.0,2.0,1.0,0,0,0,2,22,'Khezu','38*56*','Low');
INSERT INTO "Armors" VALUES (119,'Khezu Greaves','Legs',16.0,-4.0,1.0,4.0,2.0,1.0,0,0,0,2,22,'Khezu','42*','Low');
INSERT INTO "Armors" VALUES (120,'Tetranadon Helm','Helm',18.0,-1.0,4.0,-2.0,1.0,0.0,0,0,0,2,23,'Tetranadon','63*','Low');
INSERT INTO "Armors" VALUES (121,'Tetranadon Mail','Chest',18.0,-1.0,4.0,-2.0,1.0,0.0,0,0,0,2,23,'Tetranadon','32*','Low');
INSERT INTO "Armors" VALUES (122,'Tetranadon Braces','Arms',18.0,-1.0,4.0,-2.0,1.0,0.0,0,0,0,2,23,'Tetranadon','64*','Low');
INSERT INTO "Armors" VALUES (123,'Tetranadon Coil','Coil',18.0,-1.0,4.0,-2.0,1.0,0.0,0,0,0,2,23,'Tetranadon','16*','Low');
INSERT INTO "Armors" VALUES (124,'Tetranadon Greaves','Legs',18.0,-1.0,4.0,-2.0,1.0,0.0,0,0,0,2,23,'Tetranadon','10*','Low');
INSERT INTO "Armors" VALUES (125,'Ingot Helm','Helm',18.0,-1.0,-1.0,1.0,0.0,0.0,0,0,0,2,24,'Ingot','66*','Low');
INSERT INTO "Armors" VALUES (126,'Ingot Mail','Chest',18.0,-1.0,-1.0,1.0,0.0,0.0,0,0,0,2,24,'Ingot','66*','Low');
INSERT INTO "Armors" VALUES (127,'Ingot Vambraces','Arms',18.0,-1.0,-1.0,1.0,0.0,0.0,0,0,0,2,24,'Ingot','62*62*','Low');
INSERT INTO "Armors" VALUES (128,'Ingot Coil','Coil',18.0,-1.0,-1.0,1.0,0.0,0.0,0,0,0,2,24,'Ingot','61*','Low');
INSERT INTO "Armors" VALUES (129,'Ingot Greaves','Legs',18.0,-1.0,-1.0,1.0,0.0,0.0,0,0,0,2,24,'Ingot','17*','Low');
INSERT INTO "Armors" VALUES (130,'Meloha Hat','Helm',18.0,0.0,1.0,3.0,0.0,0.0,0,0,0,2,25,'Meloha','67*','Low');
INSERT INTO "Armors" VALUES (131,'Meloha Jacket','Chest',18.0,0.0,1.0,3.0,0.0,0.0,0,0,0,2,25,'Meloha','11*13*','Low');
INSERT INTO "Armors" VALUES (132,'Meloha Branch','Arms',18.0,0.0,1.0,3.0,0.0,0.0,0,0,0,2,25,'Meloha','67*13*','Low');
INSERT INTO "Armors" VALUES (133,'Meloha Folia','Coil',18.0,0.0,1.0,3.0,0.0,0.0,0,0,0,2,25,'Meloha','11*42*','Low');
INSERT INTO "Armors" VALUES (134,'Meloha Roots','Legs',18.0,0.0,1.0,3.0,0.0,0.0,0,0,0,2,25,'Meloha','26*26*','Low');
INSERT INTO "Armors" VALUES (135,'Death Stench Brain','Helm',18.0,3.0,1.0,1.0,-1.0,0.0,0,0,0,2,26,'Death Stench','68*68*','Low');
INSERT INTO "Armors" VALUES (136,'Death Stench Muscle','Chest',18.0,3.0,1.0,1.0,-1.0,0.0,0,0,0,2,26,'Death Stench','69*','Low');
INSERT INTO "Armors" VALUES (137,'Death Stench Grip','Arms',18.0,3.0,1.0,1.0,-1.0,0.0,0,0,0,2,26,'Death Stench','54*','Low');
INSERT INTO "Armors" VALUES (138,'Death Stench Bowels','Coil',18.0,3.0,1.0,1.0,-1.0,0.0,0,0,0,2,26,'Death Stench','68*','Low');
INSERT INTO "Armors" VALUES (139,'Death Stench Heel','Legs',18.0,3.0,1.0,1.0,-1.0,0.0,0,0,0,2,26,'Death Stench','69*','Low');
INSERT INTO "Armors" VALUES (140,'Mosgharl Visor ','Helm',18.0,-3.0,1.0,0.0,3.0,0.0,0,0,0,2,27,'Mosgharl','70*','Low');
INSERT INTO "Armors" VALUES (141,'Mosgharl Ribplate','Chest',18.0,-3.0,1.0,0.0,3.0,0.0,0,0,0,2,27,'Mosgharl','42*42*','Low');
INSERT INTO "Armors" VALUES (142,'Mosgharl Creeper','Arms',18.0,-3.0,1.0,0.0,3.0,0.0,0,0,0,2,27,'Mosgharl','70*','Low');
INSERT INTO "Armors" VALUES (143,'Mosgharl Folia','Coil',18.0,-3.0,1.0,0.0,3.0,0.0,0,0,0,2,27,'Mosgharl','59*59*','Low');
INSERT INTO "Armors" VALUES (144,'Mosgharl Roots','Legs',18.0,-3.0,1.0,0.0,3.0,0.0,0,0,0,2,27,'Mosgharl','43*43*','Low');
INSERT INTO "Armors" VALUES (145,'Gargwa Mask ','Helm',14.0,-3.0,-2.0,-2.0,1.0,0.0,0,0,0,2,28,'Gargwa','72*','Low');
INSERT INTO "Armors" VALUES (146,'Bullfango Mask','Helm',14.0,0.0,4.0,-2.0,0.0,0.0,0,0,0,1,29,'Bullfango','73*','Low');
INSERT INTO "Armors" VALUES (147,'Uroktor Torso','Chest',18.0,4.0,-2.0,0.0,-1.0,0.0,0,0,0,2,30,'Uroktor','74*74*','Low');
INSERT INTO "Armors" VALUES (148,'Uroktor Coil','Coil',18.0,4.0,-2.0,0.0,-1.0,0.0,0,0,0,2,30,'Uroktor','74*','Low');
INSERT INTO "Armors" VALUES (149,'Remobra Headgear','Helm',18.0,1.0,1.0,1.0,1.0,2.0,0,0,0,2,31,'Remobra','66*66*','Low');
INSERT INTO "Armors" VALUES (150,'Remobra Suit','Chest',18.0,1.0,1.0,1.0,1.0,2.0,0,0,0,2,31,'Remobra','23*','Low');
INSERT INTO "Armors" VALUES (151,'Remobra Gloves','Arms',18.0,1.0,1.0,1.0,1.0,2.0,0,0,0,2,31,'Remobra','75*66*','Low');
INSERT INTO "Armors" VALUES (152,'Remobra Belt','Coil',18.0,1.0,1.0,1.0,1.0,2.0,0,0,0,2,31,'Remobra','75*','Low');
INSERT INTO "Armors" VALUES (153,'Remobra Feet','Legs',18.0,1.0,1.0,1.0,1.0,2.0,0,0,0,2,31,'Remobra','14*','Low');
INSERT INTO "Armors" VALUES (154,'Jaggi Mask','Helm',14.0,0.0,0.0,0.0,0.0,0.0,0,0,0,2,32,'Jaggi','33*','Low');
INSERT INTO "Armors" VALUES (155,'Volvidon Helm','Helm',20.0,2.0,-3.0,0.0,-1.0,1.0,0,0,0,2,33,'Volvidon','51*','Low');
INSERT INTO "Armors" VALUES (156,'Volvidon Mail','Chest',20.0,2.0,-3.0,0.0,-1.0,1.0,0,0,0,2,33,'Volvidon','69*','Low');
INSERT INTO "Armors" VALUES (157,'Volvidon Vambraces','Arms',20.0,2.0,-3.0,0.0,-1.0,1.0,0,0,0,2,33,'Volvidon','57*','Low');
INSERT INTO "Armors" VALUES (158,'Volvidon Coil','Coil',20.0,2.0,-3.0,0.0,-1.0,1.0,0,0,0,2,33,'Volvidon','69*','Low');
INSERT INTO "Armors" VALUES (159,'Volvidon Greaves','Legs',20.0,2.0,-3.0,0.0,-1.0,1.0,0,0,0,2,33,'Volvidon','57*','Low');
INSERT INTO "Armors" VALUES (160,'Bishaten Helm','Helm',22.0,-2.0,2.0,2.0,-4.0,2.0,0,0,0,2,34,'Bishaten','23*25*','Low');
INSERT INTO "Armors" VALUES (161,'Bishaten Mail','Chest',22.0,-2.0,2.0,2.0,-4.0,2.0,0,0,0,2,34,'Bishaten','76*','Low');
INSERT INTO "Armors" VALUES (162,'Bishaten Vambraces','Arms',22.0,-2.0,2.0,2.0,-4.0,2.0,0,0,0,2,34,'Bishaten','25*','Low');
INSERT INTO "Armors" VALUES (163,'Bishaten Coil','Coil',22.0,-2.0,2.0,2.0,-4.0,2.0,0,0,0,2,34,'Bishaten','23*','Low');
INSERT INTO "Armors" VALUES (164,'Bishaten Greaves','Legs',22.0,-2.0,2.0,2.0,-4.0,2.0,0,0,0,2,34,'Bishaten','54*','Low');
INSERT INTO "Armors" VALUES (165,'Pukei-Pukei Helm','Helm',20.0,0.0,3.0,-3.0,0.0,1.0,0,0,0,2,35,'Pukei-Pukei','64*','Low');
INSERT INTO "Armors" VALUES (166,'Pukei-Pukei Mail','Chest',20.0,0.0,3.0,-3.0,0.0,1.0,0,0,0,2,35,'Pukei-Pukei','27*','Low');
INSERT INTO "Armors" VALUES (167,'Pukei-Pukei Braces','Arms',20.0,0.0,3.0,-3.0,0.0,1.0,0,0,0,2,35,'Pukei-Pukei','77*','Low');
INSERT INTO "Armors" VALUES (168,'Pukei-Pukei Coil','Coil',20.0,0.0,3.0,-3.0,0.0,1.0,0,0,0,2,35,'Pukei-Pukei','58*58*','Low');
INSERT INTO "Armors" VALUES (169,'Pukei-Pukei Greaves','Legs',20.0,0.0,3.0,-3.0,0.0,1.0,0,0,0,2,35,'Pukei-Pukei','27*','Low');
INSERT INTO "Armors" VALUES (170,'Basarios Helm','Helm',22.0,0.0,-2.0,1.0,1.0,-3.0,0,0,0,2,36,'Basarios','19*','Low');
INSERT INTO "Armors" VALUES (171,'Basarios Mail','Chest',22.0,0.0,-2.0,1.0,1.0,-3.0,0,0,0,2,36,'Basarios','21*','Low');
INSERT INTO "Armors" VALUES (172,'Basarios Vambraces','Arms',22.0,0.0,-2.0,1.0,1.0,-3.0,0,0,0,2,36,'Basarios','21*35*','Low');
INSERT INTO "Armors" VALUES (173,'Basarios Coil','Coil',22.0,0.0,-2.0,1.0,1.0,-3.0,0,0,0,2,36,'Basarios','35*19*','Low');
INSERT INTO "Armors" VALUES (174,'Basarios Greaves','Legs',22.0,0.0,-2.0,1.0,1.0,-3.0,0,0,0,2,36,'Basarios','78*19*','Low');
INSERT INTO "Armors" VALUES (175,'Somnacanth Helm','Helm',22.0,-1.0,2.0,-3.0,0.0,1.0,0,0,0,2,37,'Somnacanth','79*','Low');
INSERT INTO "Armors" VALUES (176,'Somnacanth Mail','Chest',22.0,-1.0,2.0,-3.0,0.0,1.0,0,0,0,2,37,'Somnacanth','23*','Low');
INSERT INTO "Armors" VALUES (177,'Somnacanth Braces','Arms',22.0,-1.0,2.0,-3.0,0.0,1.0,0,0,0,2,37,'Somnacanth','80*14*','Low');
INSERT INTO "Armors" VALUES (178,'Somnacanth Coil','Coil',22.0,-1.0,2.0,-3.0,0.0,1.0,0,0,0,2,37,'Somnacanth','80*','Low');
INSERT INTO "Armors" VALUES (179,'Somnacanth Greaves','Legs',22.0,-1.0,2.0,-3.0,0.0,1.0,0,0,0,2,37,'Somnacanth','14*','Low');
INSERT INTO "Armors" VALUES (180,'Rathian Helm','Helm',22.0,3.0,0.0,-2.0,0.0,-3.0,0,0,0,2,38,'Rathian','81*','Low');
INSERT INTO "Armors" VALUES (181,'Rathian Mail','Chest',22.0,3.0,0.0,-2.0,0.0,-3.0,0,0,0,2,38,'Rathian','13*','Low');
INSERT INTO "Armors" VALUES (182,'Rathian Braces','Arms',22.0,3.0,0.0,-2.0,0.0,-3.0,0,0,0,2,38,'Rathian','81*','Low');
INSERT INTO "Armors" VALUES (183,'Rathian Coil','Coil',22.0,3.0,0.0,-2.0,0.0,-3.0,0,0,0,2,38,'Rathian','13*76*','Low');
INSERT INTO "Armors" VALUES (184,'Rathian Greaves ','Legs',22.0,3.0,0.0,-2.0,0.0,-3.0,0,0,0,2,38,'Rathian','46*','Low');
INSERT INTO "Armors" VALUES (185,'Barioth Helm','Helm',20.0,-5.0,0.0,-1.0,3.0,0.0,0,0,0,2,39,'Barioth','82*','Low');
INSERT INTO "Armors" VALUES (186,'Barioth Mail','Chest',20.0,-5.0,0.0,-1.0,3.0,0.0,0,0,0,2,39,'Barioth','24*','Low');
INSERT INTO "Armors" VALUES (187,'Barioth Vambraces','Arms',20.0,-5.0,0.0,-1.0,3.0,0.0,0,0,0,2,39,'Barioth','17*','Low');
INSERT INTO "Armors" VALUES (188,'Barioth Coil','Coil',20.0,-5.0,0.0,-1.0,3.0,0.0,0,0,0,2,39,'Barioth','17*17*','Low');
INSERT INTO "Armors" VALUES (189,'Barioth Greaves','Legs',20.0,-5.0,0.0,-1.0,3.0,0.0,0,0,0,2,39,'Barioth','24*','Low');
INSERT INTO "Armors" VALUES (190,'Kadachi Helm','Helm',20.0,0.0,-3.0,3.0,0.0,0.0,0,0,0,2,40,'Tobi-Kadachi','83*','Low');
INSERT INTO "Armors" VALUES (191,'Tobi-Kadachi Mail','Chest',20.0,0.0,-3.0,3.0,0.0,0.0,0,0,0,2,40,'Tobi-Kadachi','17*','Low');
INSERT INTO "Armors" VALUES (192,'Tobi-Kadachi Braces','Arms',20.0,0.0,-3.0,3.0,0.0,0.0,0,0,0,2,40,'Tobi-Kadachi','27*','Low');
INSERT INTO "Armors" VALUES (193,'Tobi-Kadachi Coil','Coil',20.0,0.0,-3.0,3.0,0.0,0.0,0,0,0,2,40,'Tobi-Kadachi','62*62*','Low');
INSERT INTO "Armors" VALUES (194,'Tobi-Kadachi Greaves','Legs',20.0,0.0,-3.0,3.0,0.0,0.0,0,0,0,2,40,'Tobi-Kadachi','27*17*','Low');
INSERT INTO "Armors" VALUES (195,'Makluva Hood','Helm',24.0,1.0,2.0,-2.0,0.0,0.0,0,0,0,3,41,'Makluva','29*','Low');
INSERT INTO "Armors" VALUES (196,'Makluva Cover','Chest',24.0,1.0,2.0,-2.0,0.0,0.0,0,0,0,3,41,'Makluva','34*34*','Low');
INSERT INTO "Armors" VALUES (197,'Makluva Sleeves','Arms',24.0,1.0,2.0,-2.0,0.0,0.0,0,0,0,3,41,'Makluva','72*','Low');
INSERT INTO "Armors" VALUES (198,'Makluva Coil','Coil',24.0,1.0,2.0,-2.0,0.0,0.0,0,0,0,3,41,'Makluva','63*','Low');
INSERT INTO "Armors" VALUES (199,'Makluva Pants','Legs',24.0,1.0,2.0,-2.0,0.0,0.0,0,0,0,3,41,'Makluva','63*','Low');
INSERT INTO "Armors" VALUES (200,'Rhopessa Vertex','Helm',24.0,-2.0,0.0,3.0,-2.0,2.0,0,0,0,3,42,'Rhopessa','75*','Low');
INSERT INTO "Armors" VALUES (201,'Rhopessa Thorax','Chest',24.0,-2.0,0.0,3.0,-2.0,2.0,0,0,0,3,42,'Rhopessa','75*84*','Low');
INSERT INTO "Armors" VALUES (202,'Rhopessa Brachia','Arms',24.0,-2.0,0.0,3.0,-2.0,2.0,0,0,0,3,42,'Rhopessa','52*','Low');
INSERT INTO "Armors" VALUES (203,'Rhopessa Elytra','Coil',24.0,-2.0,0.0,3.0,-2.0,2.0,0,0,0,3,42,'Rhopessa','84*84*','Low');
INSERT INTO "Armors" VALUES (204,'Rhopessa Crura','Legs',24.0,-2.0,0.0,3.0,-2.0,2.0,0,0,0,3,42,'Rhopessa','17*17*','Low');
INSERT INTO "Armors" VALUES (205,'Medium''s Hair-Tie','Helm',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,43,'Medium','63*46*','Low');
INSERT INTO "Armors" VALUES (206,'Medium''s Robe','Chest',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,43,'Medium','76*','Low');
INSERT INTO "Armors" VALUES (207,'Medium''s Prayer','Arms',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,43,'Medium','76*','Low');
INSERT INTO "Armors" VALUES (208,'Medium''s Obi','Coil',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,43,'Medium','63*','Low');
INSERT INTO "Armors" VALUES (209,'Medium''s Hakama','Legs',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,43,'Medium','76*','Low');
INSERT INTO "Armors" VALUES (210,'Channeler''s Hair-Tie','Helm',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,44,'Channeler','85*77*','Low');
INSERT INTO "Armors" VALUES (211,'Channeler''s Robe','Chest',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,44,'Channeler','85*77*','Low');
INSERT INTO "Armors" VALUES (212,'Channeler''s Hope','Arms',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,44,'Channeler','52*15*','Low');
INSERT INTO "Armors" VALUES (213,'Channeler''s Obi','Coil',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,44,'Channeler','86*','Low');
INSERT INTO "Armors" VALUES (214,'Channeler''s Hakama','Legs',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,44,'Channeler','52*86*','Low');
INSERT INTO "Armors" VALUES (215,'Sinister Helm','Helm',28.0,3.0,-3.0,-2.0,1.0,1.0,0,0,0,3,45,'Sinister','87*88*','Low');
INSERT INTO "Armors" VALUES (216,'Sinister Garb','Chest',28.0,3.0,-3.0,-2.0,1.0,1.0,0,0,0,3,45,'Sinister','89*87*','Low');
INSERT INTO "Armors" VALUES (217,'Sinister Gauntlets','Arms',28.0,3.0,-3.0,-2.0,1.0,1.0,0,0,0,3,45,'Sinister','89*','Low');
INSERT INTO "Armors" VALUES (218,'Sinister Tassets','Coil',28.0,3.0,-3.0,-2.0,1.0,1.0,0,0,0,3,45,'Sinister','89*88*88*','Low');
INSERT INTO "Armors" VALUES (219,'Sinister Greaves','Legs',28.0,3.0,-3.0,-2.0,1.0,1.0,0,0,0,3,45,'Sinister','87*','Low');
INSERT INTO "Armors" VALUES (220,'Anjanath Helm','Helm',26.0,3.0,-3.0,-1.0,-1.0,0.0,0,0,0,3,46,'Anjanath','38*56*','Low');
INSERT INTO "Armors" VALUES (221,'Anjanath Mail','Chest',26.0,3.0,-3.0,-1.0,-1.0,0.0,0,0,0,3,46,'Anjanath','38*60*','Low');
INSERT INTO "Armors" VALUES (222,'Anjanath Vambraces','Arms',26.0,3.0,-3.0,-1.0,-1.0,0.0,0,0,0,3,46,'Anjanath','8*56*','Low');
INSERT INTO "Armors" VALUES (223,'Anjanath Coil','Coil',26.0,3.0,-3.0,-1.0,-1.0,0.0,0,0,0,3,46,'Anjanath','8*8*','Low');
INSERT INTO "Armors" VALUES (224,'Anjanath Greaves','Legs',26.0,3.0,-3.0,-1.0,-1.0,0.0,0,0,0,3,46,'Anjanath','60*','Low');
INSERT INTO "Armors" VALUES (225,'Nargacuga Helm','Helm',26.0,-2.0,1.0,-3.0,1.0,1.0,0,0,0,3,47,'Nargacuga','52*','Low');
INSERT INTO "Armors" VALUES (226,'Nargacuga Mail','Chest',26.0,-2.0,1.0,-3.0,1.0,1.0,0,0,0,3,47,'Nargacuga','17*','Low');
INSERT INTO "Armors" VALUES (227,'Nargacuga Braces','Arms',26.0,-2.0,1.0,-3.0,1.0,1.0,0,0,0,3,47,'Nargacuga','57*52*','Low');
INSERT INTO "Armors" VALUES (228,'Nargacuga Coil','Coil',26.0,-2.0,1.0,-3.0,1.0,1.0,0,0,0,3,47,'Nargacuga','57*','Low');
INSERT INTO "Armors" VALUES (229,'Nargacuga Greaves','Legs',26.0,-2.0,1.0,-3.0,1.0,1.0,0,0,0,3,47,'Nargacuga','52*17*','Low');
INSERT INTO "Armors" VALUES (230,'Mizutsune Helm','Helm',26.0,0.0,2.0,-3.0,1.0,-1.0,0,0,0,3,48,'Mizutsune','34*','Low');
INSERT INTO "Armors" VALUES (231,'Mizutsune Mail','Chest',26.0,0.0,2.0,-3.0,1.0,-1.0,0,0,0,3,48,'Mizutsune','90*34*','Low');
INSERT INTO "Armors" VALUES (232,'Mizutsune Braces','Arms',26.0,0.0,2.0,-3.0,1.0,-1.0,0,0,0,3,48,'Mizutsune','34*46*','Low');
INSERT INTO "Armors" VALUES (233,'Mizutsune Coil','Coil',26.0,0.0,2.0,-3.0,1.0,-1.0,0,0,0,3,48,'Mizutsune','46*','Low');
INSERT INTO "Armors" VALUES (234,'Mizutsune Greaves','Legs',26.0,0.0,2.0,-3.0,1.0,-1.0,0,0,0,3,48,'Mizutsune','46*90*','Low');
INSERT INTO "Armors" VALUES (235,'Rathalos Helm','Helm',28.0,4.0,0.0,-2.0,0.0,-4.0,0,0,0,3,49,'Rathalos','8*59*','Low');
INSERT INTO "Armors" VALUES (236,'Rathalos Mail','Chest',28.0,4.0,0.0,-2.0,0.0,-4.0,0,0,0,3,49,'Rathalos','36*66*','Low');
INSERT INTO "Armors" VALUES (237,'Rathalos Braces','Arms',28.0,4.0,0.0,-2.0,0.0,-4.0,0,0,0,3,49,'Rathalos','8*','Low');
INSERT INTO "Armors" VALUES (238,'Rathalos Coil','Coil',28.0,4.0,0.0,-2.0,0.0,-4.0,0,0,0,3,49,'Rathalos','8*66*','Low');
INSERT INTO "Armors" VALUES (239,'Rathalos Greaves','Legs',28.0,4.0,0.0,-2.0,0.0,-4.0,0,0,0,3,49,'Rathalos','8*59*','Low');
INSERT INTO "Armors" VALUES (240,'Zinogre Helm','Helm',28.0,0.0,-1.0,4.0,-4.0,1.0,0,0,0,3,50,'Zinogre','91*17*','Low');
INSERT INTO "Armors" VALUES (241,'Zinogre Mail','Chest',28.0,0.0,-1.0,4.0,-4.0,1.0,0,0,0,3,50,'Zinogre','91*17*','Low');
INSERT INTO "Armors" VALUES (242,'Zinogre Braces','Arms',28.0,0.0,-1.0,4.0,-4.0,1.0,0,0,0,3,50,'Zinogre','27*','Low');
INSERT INTO "Armors" VALUES (243,'Zinogre Coil','Coil',28.0,0.0,-1.0,4.0,-4.0,1.0,0,0,0,3,50,'Zinogre','91*','Low');
INSERT INTO "Armors" VALUES (244,'Zinogre Greaves','Legs',28.0,0.0,-1.0,4.0,-4.0,1.0,0,0,0,3,50,'Zinogre','27*27*','Low');
INSERT INTO "Armors" VALUES (245,'Skull Visage','Helm',28.0,-3.0,-3.0,-3.0,-3.0,4.0,0,0,0,3,51,'Skull','92*','Low');
INSERT INTO "Armors" VALUES (246,'Goss Harag Helm','Helm',30.0,-4.0,1.0,-1.0,4.0,0.0,0,0,0,3,52,'Goss Harag','86*','Low');
INSERT INTO "Armors" VALUES (247,'Goss Harag Mail','Chest',30.0,-4.0,1.0,-1.0,4.0,0.0,0,0,0,3,52,'Goss Harag','82*','Low');
INSERT INTO "Armors" VALUES (248,'Goss Harag Braces','Arms',30.0,-4.0,1.0,-1.0,4.0,0.0,0,0,0,3,52,'Goss Harag','82*93*','Low');
INSERT INTO "Armors" VALUES (249,'Goss Harag Coil','Coil',30.0,-4.0,1.0,-1.0,4.0,0.0,0,0,0,3,52,'Goss Harag','93*87*','Low');
INSERT INTO "Armors" VALUES (250,'Goss Harag Greaves','Legs',30.0,-4.0,1.0,-1.0,4.0,0.0,0,0,0,3,52,'Goss Harag','86*','Low');
INSERT INTO "Armors" VALUES (251,'Almudron Helm','Helm',30.0,-4.0,3.0,3.0,-2.0,-2.0,0,0,0,3,53,'Almudron','69*','Low');
INSERT INTO "Armors" VALUES (252,'Almudron Mail','Chest',30.0,-4.0,3.0,3.0,-2.0,-2.0,0,0,0,3,53,'Almudron','85*','Low');
INSERT INTO "Armors" VALUES (253,'Almudron Vambraces','Arms',30.0,-4.0,3.0,3.0,-2.0,-2.0,0,0,0,3,53,'Almudron','69*52*','Low');
INSERT INTO "Armors" VALUES (254,'Almudron Coil','Coil',30.0,-4.0,3.0,3.0,-2.0,-2.0,0,0,0,3,53,'Almudron','61*','Low');
INSERT INTO "Armors" VALUES (255,'Almudron Greaves','Legs',30.0,-4.0,3.0,3.0,-2.0,-2.0,0,0,0,3,53,'Almudron','85*','Low');
INSERT INTO "Armors" VALUES (256,'Tigrex Helm','Helm',30.0,2.0,0.0,-3.0,0.0,-2.0,0,0,0,3,54,'Tigrex','94*63*','Low');
INSERT INTO "Armors" VALUES (257,'Tigrex Mail','Chest',30.0,2.0,0.0,-3.0,0.0,-2.0,0,0,0,3,54,'Tigrex','94*73*','Low');
INSERT INTO "Armors" VALUES (258,'Tigrex Braces','Arms',30.0,2.0,0.0,-3.0,0.0,-2.0,0,0,0,3,54,'Tigrex','73*73*','Low');
INSERT INTO "Armors" VALUES (259,'Tigrex Coil','Coil',30.0,2.0,0.0,-3.0,0.0,-2.0,0,0,0,3,54,'Tigrex','94*','Low');
INSERT INTO "Armors" VALUES (260,'Tigrex Greaves','Legs',30.0,2.0,0.0,-3.0,0.0,-2.0,0,0,0,3,54,'Tigrex','63*','Low');
INSERT INTO "Armors" VALUES (261,'Diablos Helm','Helm',30.0,3.0,-1.0,-1.0,-3.0,-1.0,0,0,0,3,55,'Diablos','21*22*','Low');
INSERT INTO "Armors" VALUES (262,'Diablos Mail','Chest',30.0,3.0,-1.0,-1.0,-3.0,-1.0,0,0,0,3,55,'Diablos','21*','Low');
INSERT INTO "Armors" VALUES (263,'Diablos Vambraces','Arms',30.0,3.0,-1.0,-1.0,-3.0,-1.0,0,0,0,3,55,'Diablos','95*','Low');
INSERT INTO "Armors" VALUES (264,'Diablos Coil','Coil',30.0,3.0,-1.0,-1.0,-3.0,-1.0,0,0,0,3,55,'Diablos','22*','Low');
INSERT INTO "Armors" VALUES (265,'Diablos Greaves','Legs',30.0,3.0,-1.0,-1.0,-3.0,-1.0,0,0,0,3,55,'Diablos','21*95*','Low');
INSERT INTO "Armors" VALUES (266,'Jelly Hat','Helm',24.0,1.0,3.0,0.0,2.0,0.0,0,0,0,3,56,'Jelly','14*','Low');
INSERT INTO "Armors" VALUES (267,'Jelly Vest','Chest',24.0,1.0,3.0,0.0,2.0,0.0,0,0,0,3,56,'Jelly','96*','Low');
INSERT INTO "Armors" VALUES (268,'Jelly Gloves','Arms',24.0,1.0,3.0,0.0,2.0,0.0,0,0,0,3,56,'Jelly','14*','Low');
INSERT INTO "Armors" VALUES (269,'Jelly Coil','Coil',24.0,1.0,3.0,0.0,2.0,0.0,0,0,0,3,56,'Jelly','36*','Low');
INSERT INTO "Armors" VALUES (270,'Jelly Boots','Legs',24.0,1.0,3.0,0.0,2.0,0.0,0,0,0,3,56,'Jelly','96*','Low');
INSERT INTO "Armors" VALUES (271,'Aelucanth Vertex','Helm',24.0,-2.0,0.0,3.0,-2.0,-2.0,0,0,0,3,57,'Aelucanth','75*','Low');
INSERT INTO "Armors" VALUES (272,'Aelucanth Thorax','Chest',24.0,-2.0,0.0,3.0,-2.0,-2.0,0,0,0,3,57,'Aelucanth','75*84*','Low');
INSERT INTO "Armors" VALUES (273,'Aelucanth Brachia','Arms',24.0,-2.0,0.0,3.0,-2.0,-2.0,0,0,0,3,57,'Aelucanth','52*','Low');
INSERT INTO "Armors" VALUES (274,'Aelucanth Elytra','Coil',24.0,-2.0,0.0,3.0,-2.0,-2.0,0,0,0,3,57,'Aelucanth','84*84*','Low');
INSERT INTO "Armors" VALUES (275,'Aelucanth Crura','Legs',24.0,-2.0,0.0,3.0,-2.0,-2.0,0,0,0,3,57,'Aelucanth','17*17*','Low');
INSERT INTO "Armors" VALUES (276,'Utsushi Mask (V)','Helm',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,58,'Utsushi Visible','63*46*','Low');
INSERT INTO "Armors" VALUES (277,'Utsushi Chest (V)','Chest',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,58,'Utsushi Visible','76*','Low');
INSERT INTO "Armors" VALUES (278,'Utsushi Braces (V)','Arms',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,58,'Utsushi Visible','76*','Low');
INSERT INTO "Armors" VALUES (279,'Utsushi Tassets (V)','Coil',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,58,'Utsushi Visible','63*','Low');
INSERT INTO "Armors" VALUES (280,'Utsushi Greaves (V)','Legs',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,58,'Utsushi Visible','76*','Low');
INSERT INTO "Armors" VALUES (281,'Utsushi Mask (H)','Helm',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,59,'Utsushi Hidden','85*77*','Low');
INSERT INTO "Armors" VALUES (282,'Utsushi Chest (H)','Chest',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,59,'Utsushi Hidden','85*77*','Low');
INSERT INTO "Armors" VALUES (283,'Utsushi Braces (H)','Arms',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,59,'Utsushi Hidden','52*15*','Low');
INSERT INTO "Armors" VALUES (284,'Utsushi Tassets (H)','Coil',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,59,'Utsushi Hidden','86*','Low');
INSERT INTO "Armors" VALUES (285,'Utsushi Greaves (H)','Legs',24.0,3.0,0.0,0.0,0.0,0.0,0,0,0,3,59,'Utsushi Hidden','52*86*','Low');
INSERT INTO "Armors" VALUES (286,'Spio Vertex','Helm',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,60,'Spio','58*','Low');
INSERT INTO "Armors" VALUES (287,'Spio Thorax','Chest',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,60,'Spio','17*','Low');
INSERT INTO "Armors" VALUES (288,'Spio Brachia','Arms',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,60,'Spio','97*','Low');
INSERT INTO "Armors" VALUES (289,'Spio Elytra','Coil',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,60,'Spio','17*','Low');
INSERT INTO "Armors" VALUES (290,'Spio Crura','Legs',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,60,'Spio','97*','Low');
INSERT INTO "Armors" VALUES (291,'Skalda Vertex','Helm',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,61,'Skalda','58*','Low');
INSERT INTO "Armors" VALUES (292,'Skalda Thorax','Chest',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,61,'Skalda','17*','Low');
INSERT INTO "Armors" VALUES (293,'Skalda Brachia','Arms',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,61,'Skalda','97*','Low');
INSERT INTO "Armors" VALUES (294,'Skalda Elytra','Coil',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,61,'Skalda','17*','Low');
INSERT INTO "Armors" VALUES (295,'Skalda Crura','Legs',12.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,3,61,'Skalda','97*','Low');
INSERT INTO "Armors" VALUES (296,'Kamura Head Scarf S','Helm',30.0,2.0,0.0,0.0,0.0,0.0,1,0,0,4,1,'Kamura S','14*98*','High');
INSERT INTO "Armors" VALUES (297,'Kamura Garb S','Chest',30.0,2.0,0.0,0.0,0.0,0.0,1,0,0,4,1,'Kamura S','15*15*18*17*','High');
INSERT INTO "Armors" VALUES (298,'Kamura Braces S','Arms',30.0,2.0,0.0,0.0,0.0,0.0,2,0,0,4,1,'Kamura S','17*17*16*','High');
INSERT INTO "Armors" VALUES (299,'Kamura Obi S','Coil',30.0,2.0,0.0,0.0,0.0,0.0,1,1,0,4,1,'Kamura S','15*17*','High');
INSERT INTO "Armors" VALUES (300,'Kamura Leggings S','Legs',30.0,2.0,0.0,0.0,0.0,0.0,1,0,0,4,1,'Kamura S','18*18*98*','High');
INSERT INTO "Armors" VALUES (301,'Leather Headgear S','Helm',30.0,0.0,0.0,0.0,0.0,0.0,1,1,0,4,2,'Leather S','12*10*','High');
INSERT INTO "Armors" VALUES (302,'Leather Vest S','Chest',30.0,0.0,0.0,0.0,0.0,0.0,2,0,0,4,2,'Leather S','11*','High');
INSERT INTO "Armors" VALUES (303,'Leather Gloves S','Arms',30.0,0.0,0.0,0.0,0.0,0.0,1,1,0,4,2,'Leather S','12*64*','High');
INSERT INTO "Armors" VALUES (304,'Leather Belt S','Coil',30.0,0.0,0.0,0.0,0.0,0.0,1,0,0,4,2,'Leather S','13*10*10*','High');
INSERT INTO "Armors" VALUES (305,'Leather Pants S','Legs',30.0,0.0,0.0,0.0,0.0,0.0,2,0,0,4,2,'Leather S','12*','High');
INSERT INTO "Armors" VALUES (306,'Chainmail Headgear S','Helm',32.0,0.0,0.0,1.0,0.0,0.0,2,0,0,4,3,'Chainmail S','11*19*','High');
INSERT INTO "Armors" VALUES (307,'Chainmail Vest S','Chest',32.0,0.0,0.0,1.0,0.0,0.0,1,0,0,4,3,'Chainmail S','19*99*99*','High');
INSERT INTO "Armors" VALUES (308,'Chainmail Gloves S','Arms',32.0,0.0,0.0,1.0,0.0,0.0,1,1,0,4,3,'Chainmail S','11*19*','High');
INSERT INTO "Armors" VALUES (309,'Chainmail Belt S','Coil',32.0,0.0,0.0,1.0,0.0,0.0,1,1,0,4,3,'Chainmail S','19*21*','High');
INSERT INTO "Armors" VALUES (310,'Chainmail Pants S','Legs',32.0,0.0,0.0,1.0,0.0,0.0,1,1,0,4,3,'Chainmail S','11*22*','High');
INSERT INTO "Armors" VALUES (311,'Hunter''s Helm S','Helm',32.0,0.0,0.0,0.0,0.0,0.0,2,0,0,4,4,'Hunter S','23*','High');
INSERT INTO "Armors" VALUES (312,'Hunter''s Mail S','Chest',32.0,0.0,0.0,0.0,0.0,0.0,1,0,0,4,4,'Hunter S','8*100*','High');
INSERT INTO "Armors" VALUES (313,'Hunter''s Vambraces S','Arms',32.0,0.0,0.0,0.0,0.0,0.0,1,0,0,4,4,'Hunter S','24*','High');
INSERT INTO "Armors" VALUES (314,'Hunter''s Coil S','Coil',32.0,0.0,0.0,0.0,0.0,0.0,1,1,0,4,4,'Hunter S','25*25*','High');
INSERT INTO "Armors" VALUES (315,'Hunter''s Greaves S','Legs',32.0,0.0,0.0,0.0,0.0,0.0,2,0,0,4,4,'Hunter S','25*8*8*','High');
INSERT INTO "Armors" VALUES (316,'Alloy Helm S','Helm',32.0,-1.0,0.0,-1.0,-1.0,0.0,1,0,0,4,5,'Alloy S','34*101*','High');
INSERT INTO "Armors" VALUES (317,'Alloy Mail S','Chest',32.0,-1.0,0.0,-1.0,-1.0,0.0,2,0,0,4,5,'Alloy S','35*35*','High');
INSERT INTO "Armors" VALUES (318,'Alloy Vambraces S','Arms',32.0,-1.0,0.0,-1.0,-1.0,0.0,1,0,0,4,5,'Alloy S','34*17*','High');
INSERT INTO "Armors" VALUES (319,'Alloy Coil S','Coil',32.0,-1.0,0.0,-1.0,-1.0,0.0,1,1,0,4,5,'Alloy S','17*34*34*','High');
INSERT INTO "Armors" VALUES (320,'Alloy Greaves S','Legs',32.0,-1.0,0.0,-1.0,-1.0,0.0,2,0,0,4,5,'Alloy S','17*35*','High');
INSERT INTO "Armors" VALUES (321,'Bone Helm S','Helm',32.0,0.0,0.0,0.0,-1.0,0.0,1,0,0,4,6,'Bone S','36*37*','High');
INSERT INTO "Armors" VALUES (322,'Bone Mail S','Chest',32.0,0.0,0.0,0.0,-1.0,0.0,1,0,0,4,6,'Bone S','60*37*','High');
INSERT INTO "Armors" VALUES (323,'Bone Vambraces S','Arms',32.0,0.0,0.0,0.0,-1.0,0.0,1,1,0,4,6,'Bone S','39*37*','High');
INSERT INTO "Armors" VALUES (324,'Bone Coil S','Coil',32.0,0.0,0.0,0.0,-1.0,0.0,2,1,0,4,6,'Bone S','38*','High');
INSERT INTO "Armors" VALUES (325,'Bone Greaves S','Legs',32.0,0.0,0.0,0.0,-1.0,0.0,2,0,0,4,6,'Bone S','39*39*38*','High');
INSERT INTO "Armors" VALUES (326,'Bnahabra Hat S','Helm',34.0,-2.0,0.0,0.0,0.0,2.0,2,0,0,4,7,'Bnahabra S','58*43*43*','High');
INSERT INTO "Armors" VALUES (327,'Bnahabra Suit S','Chest',34.0,-2.0,0.0,0.0,0.0,2.0,1,1,0,4,7,'Bnahabra S','51*52*','High');
INSERT INTO "Armors" VALUES (328,'Bnahabra Gloves S','Arms',34.0,-2.0,0.0,0.0,0.0,2.0,1,0,0,4,7,'Bnahabra S','58*58*52*','High');
INSERT INTO "Armors" VALUES (329,'Bnahabra Coil S','Coil',34.0,-2.0,0.0,0.0,0.0,2.0,1,1,0,4,7,'Bnahabra S','51*52*','High');
INSERT INTO "Armors" VALUES (330,'Bnahabra Boots S','Legs',34.0,-2.0,0.0,0.0,0.0,2.0,2,1,0,4,7,'Bnahabra S','51*43*','High');
INSERT INTO "Armors" VALUES (331,'Izuchi Helm S','Helm',36.0,2.0,-1.0,-2.0,0.0,0.0,1,1,0,4,8,'Izuchi S','17*','High');
INSERT INTO "Armors" VALUES (332,'Izuchi Mail S','Chest',36.0,2.0,-1.0,-2.0,0.0,0.0,1,0,0,4,8,'Izuchi S','17*17*26*','High');
INSERT INTO "Armors" VALUES (333,'Izuchi Braces S','Arms',36.0,2.0,-1.0,-2.0,0.0,0.0,1,1,0,4,8,'Izuchi S','27*27*','High');
INSERT INTO "Armors" VALUES (334,'Izuchi Coil S','Coil',36.0,2.0,-1.0,-2.0,0.0,0.0,1,1,0,4,8,'Izuchi S','17*17*','High');
INSERT INTO "Armors" VALUES (335,'Izuchi Greaves S','Legs',36.0,2.0,-1.0,-2.0,0.0,0.0,1,1,0,4,8,'Izuchi S','26*27*','High');
INSERT INTO "Armors" VALUES (336,'Baggi Helm S','Helm',36.0,-4.0,-1.0,-1.0,2.0,1.0,2,1,0,4,9,'Baggi S','28*28*','High');
INSERT INTO "Armors" VALUES (337,'Baggi Mail S','Chest',36.0,-4.0,-1.0,-1.0,2.0,1.0,1,0,0,4,9,'Baggi S','8*28*','High');
INSERT INTO "Armors" VALUES (338,'Baggi Vambraces S','Arms',36.0,-4.0,-1.0,-1.0,2.0,1.0,1,1,0,4,9,'Baggi S','29*29*28*','High');
INSERT INTO "Armors" VALUES (339,'Baggi Coil S','Coil',36.0,-4.0,-1.0,-1.0,2.0,1.0,1,0,0,4,9,'Baggi S','8*8*29*','High');
INSERT INTO "Armors" VALUES (340,'Baggi Greaves S','Legs',36.0,-4.0,-1.0,-1.0,2.0,1.0,2,1,0,4,9,'Baggi S','8*','High');
INSERT INTO "Armors" VALUES (341,'Kulu-Ya-Ku Helm S','Helm',38.0,0.0,-3.0,0.0,1.0,0.0,1,1,0,4,10,'Kulu S','54*','High');
INSERT INTO "Armors" VALUES (342,'Kulu-Ya-Ku Mail S','Chest',38.0,0.0,-3.0,0.0,1.0,0.0,2,0,0,4,10,'Kulu S','56*56*55*','High');
INSERT INTO "Armors" VALUES (343,'Kulu-Ya-Ku Braces S','Arms',38.0,0.0,-3.0,0.0,1.0,0.0,2,0,0,4,10,'Kulu S','56*37*37*','High');
INSERT INTO "Armors" VALUES (344,'Kulu-Ya-Ku Coil S','Coil',38.0,0.0,-3.0,0.0,1.0,0.0,1,1,0,4,10,'Kulu S','37*54*','High');
INSERT INTO "Armors" VALUES (345,'Kulu-Ya-Ku Greaves S','Legs',38.0,0.0,-3.0,0.0,1.0,0.0,1,0,0,4,10,'Kulu S','17*17*25*','High');
INSERT INTO "Armors" VALUES (346,'Wroggi Helm S','Helm',38.0,2.0,-2.0,1.0,-4.0,0.0,1,0,0,4,11,'Wroggi S','57*102*','High');
INSERT INTO "Armors" VALUES (347,'Wroggi Mail S','Chest',38.0,2.0,-2.0,1.0,-4.0,0.0,1,0,0,4,11,'Wroggi S','58*102*','High');
INSERT INTO "Armors" VALUES (348,'Wroggi Vambraces S','Arms',38.0,2.0,-2.0,1.0,-4.0,0.0,3,0,0,4,11,'Wroggi S','30*','High');
INSERT INTO "Armors" VALUES (349,'Wroggi Coil S','Coil',38.0,2.0,-2.0,1.0,-4.0,0.0,1,0,0,4,11,'Wroggi S','30*58*58*','High');
INSERT INTO "Armors" VALUES (350,'Wroggi Greaves S','Legs',38.0,2.0,-2.0,1.0,-4.0,0.0,1,1,0,4,11,'Wroggi S','30*57*','High');
INSERT INTO "Armors" VALUES (351,'Azuros Helm S','Helm',36.0,-2.0,0.0,-2.0,0.0,0.0,1,1,0,4,12,'Azuros S','92*19*','High');
INSERT INTO "Armors" VALUES (352,'Azuros Mail S','Chest',36.0,-2.0,0.0,-2.0,0.0,0.0,2,0,0,4,12,'Azuros S','88*','High');
INSERT INTO "Armors" VALUES (353,'Azuros Vambraces S','Arms',36.0,-2.0,0.0,-2.0,0.0,0.0,1,0,0,4,12,'Azuros S','88*19*19*','High');
INSERT INTO "Armors" VALUES (354,'Azuros Coil S','Coil',36.0,-2.0,0.0,-2.0,0.0,0.0,1,1,0,4,12,'Azuros S','88*19*','High');
INSERT INTO "Armors" VALUES (355,'Azuros Greaves S','Legs',36.0,-2.0,0.0,-2.0,0.0,0.0,3,2,1,4,12,'Azuros S','','High');
INSERT INTO "Armors" VALUES (356,'Lagombi Helm S','Helm',36.0,-3.0,1.0,0.0,3.0,0.0,3,0,0,4,13,'Lagombi S','17*28*28*','High');
INSERT INTO "Armors" VALUES (357,'Lagombi Mail S','Chest',36.0,-3.0,1.0,0.0,3.0,0.0,1,1,0,4,13,'Lagombi S','33*27*','High');
INSERT INTO "Armors" VALUES (358,'Lagombi Vambraces S','Arms',36.0,-3.0,1.0,0.0,3.0,0.0,2,1,0,4,13,'Lagombi S','17*17*28*','High');
INSERT INTO "Armors" VALUES (359,'Lagombi Coil S','Coil',36.0,-3.0,1.0,0.0,3.0,0.0,2,0,0,4,13,'Lagombi S','27*27*','High');
INSERT INTO "Armors" VALUES (360,'Lagombi Greaves S','Legs',36.0,-3.0,1.0,0.0,3.0,0.0,1,1,0,4,13,'Lagombi S','83*17*','High');
INSERT INTO "Armors" VALUES (362,'Aknosom Helm S','Helm',38.0,3.0,-3.0,-1.0,0.0,0.0,2,0,0,4,14,'Aknosom S','24*59*','High');
INSERT INTO "Armors" VALUES (363,'Aknosom Mail S','Chest',38.0,3.0,-3.0,-1.0,0.0,0.0,1,0,0,4,14,'Aknosom S','24*20*','High');
INSERT INTO "Armors" VALUES (364,'Aknosom Braces S','Arms',38.0,3.0,-3.0,-1.0,0.0,0.0,1,1,0,4,14,'Aknosom S','59*20*','High');
INSERT INTO "Armors" VALUES (365,'Aknosom Coil S','Coil',38.0,3.0,-3.0,-1.0,0.0,0.0,3,1,0,4,14,'Aknosom S','24*','High');
INSERT INTO "Armors" VALUES (366,'Aknosom Greaves S','Legs',38.0,3.0,-3.0,-1.0,0.0,0.0,1,0,0,4,14,'Aknosom S','20*59*59*','High');
INSERT INTO "Armors" VALUES (367,'Khezu Helm S','Helm',38.0,-4.0,1.0,4.0,2.0,1.0,1,0,0,4,15,'Khezu S','38*13*','High');
INSERT INTO "Armors" VALUES (368,'Khezu Mail S','Chest',38.0,-4.0,1.0,4.0,2.0,1.0,1,1,0,4,15,'Khezu S','18*13*','High');
INSERT INTO "Armors" VALUES (369,'Khezu Vambraces S','Arms',38.0,-4.0,1.0,4.0,2.0,1.0,1,1,0,4,15,'Khezu S','18*26*62*','High');
INSERT INTO "Armors" VALUES (370,'Khezu Coil S','Coil',38.0,-4.0,1.0,4.0,2.0,1.0,1,1,0,4,15,'Khezu S','38*56*','High');
INSERT INTO "Armors" VALUES (371,'Khezu Greaves S','Legs',38.0,-4.0,1.0,4.0,2.0,1.0,1,1,0,4,15,'Khezu S','38*56*26*','High');
INSERT INTO "Armors" VALUES (372,'Tetranadon Helm S','Helm',40.0,-1.0,4.0,-2.0,1.0,0.0,1,0,0,4,16,'Tetranadon S','32*63*','High');
INSERT INTO "Armors" VALUES (373,'Tetranadon Mail S','Chest',40.0,-1.0,4.0,-2.0,1.0,0.0,1,0,0,1,16,'Tetranadon S','32*57*','High');
INSERT INTO "Armors" VALUES (374,'Tetranadon Braces S','Arms',40.0,-1.0,4.0,-2.0,1.0,0.0,1,1,0,1,16,'Tetranadon S','16*64*','High');
INSERT INTO "Armors" VALUES (375,'Tetranadon Coil S','Coil',40.0,-1.0,4.0,-2.0,1.0,0.0,1,1,0,1,16,'Tetranadon S','16*16*','High');
INSERT INTO "Armors" VALUES (376,'Tetranadon Greaves S','Legs',40.0,-1.0,4.0,-2.0,1.0,0.0,1,0,0,1,16,'Tetranadon S','32*10*','High');
INSERT INTO "Armors" VALUES (377,'Ingot Helm S','Heml',40.0,-1.0,-1.0,1.0,0.0,0.0,3,1,0,1,17,'Ingot S','66*','High');
INSERT INTO "Armors" VALUES (378,'Ingot Mail S','Chest',40.0,-1.0,-1.0,1.0,0.0,0.0,2,1,0,1,17,'Ingot S','66*66*','High');
INSERT INTO "Armors" VALUES (379,'Ingot Braces S','Arms',40.0,-1.0,-1.0,1.0,0.0,0.0,1,0,0,1,17,'Ingot S','66*66*','High');
INSERT INTO "Armors" VALUES (380,'Ingot Coil S','Coil',40.0,-1.0,-1.0,1.0,0.0,0.0,2,0,0,1,17,'Ingot S','61*61*','High');
INSERT INTO "Armors" VALUES (381,'Ingot Greaves S','Legs',40.0,-1.0,-1.0,1.0,0.0,0.0,1,0,0,1,17,'Ingot S','8*8*17*17*','High');
INSERT INTO "Armors" VALUES (382,'Chaos Archbun ','Helm',40.0,2.0,-2.0,0.0,0.0,0.0,1,1,0,1,18,'Chaos S','40*','High');
INSERT INTO "Armors" VALUES (383,'Chaos Archplate','Chest',40.0,2.0,-2.0,0.0,0.0,0.0,0,0,0,1,18,'Chaos S','40*40*','High');
INSERT INTO "Armors" VALUES (384,'Edel Vizor S','Helm',40.0,-1.0,3.0,-1.0,0.0,0.0,2,2,0,4,19,'Edel S','97*97*','High');
INSERT INTO "Armors" VALUES (385,'Edel Ribplate S','Chest',40.0,-1.0,3.0,-1.0,0.0,0.0,1,1,0,4,19,'Edel S','13*13*','High');
INSERT INTO "Armors" VALUES (386,'Edel Creeper S','Arms',40.0,-1.0,3.0,-1.0,0.0,0.0,0,0,0,4,19,'Edel S','103*','High');
INSERT INTO "Armors" VALUES (387,'Edel Folia S','Coil',40.0,-1.0,3.0,-1.0,0.0,0.0,0,0,0,4,19,'Edel S','13*','High');
INSERT INTO "Armors" VALUES (388,'Edel Roots S','Legs',40.0,-1.0,3.0,-1.0,0.0,0.0,3,1,0,4,19,'Edel S','97*','High');
INSERT INTO "Armors" VALUES (389,'Rhenoplos Helm S','Helm',42.0,2.0,0.0,0.0,-2.0,0.0,1,0,0,4,20,'Rhenoplos S','47*47*25*','High');
INSERT INTO "Armors" VALUES (390,'Rhenoplos Mail S','Chest',42.0,2.0,0.0,0.0,-2.0,0.0,2,1,0,4,20,'Rhenoplos S','48*25*25*','High');
INSERT INTO "Armors" VALUES (391,'Rhenoplos Braces S','Arms',42.0,2.0,0.0,0.0,-2.0,0.0,2,1,0,4,20,'Rhenoplos S','48*48*','High');
INSERT INTO "Armors" VALUES (392,'Rhenoplos Coil S','Coil',42.0,2.0,0.0,0.0,-2.0,0.0,3,1,0,4,20,'Rhenoplos S','49*49*','High');
INSERT INTO "Armors" VALUES (393,'Rhenoplos Greaves S','Legs',42.0,2.0,0.0,0.0,-2.0,0.0,1,1,0,4,20,'Rhenoplos S','47*49*','High');
INSERT INTO "Armors" VALUES (394,'Bullfango Mask S','Helm',36.0,0.0,4.0,-2.0,0.0,0.0,1,0,0,4,21,'Bullfango S','73*73*','High');
INSERT INTO "Armors" VALUES (395,'Droth Mail S','Chest',42.0,-2.0,4.0,1.0,0.0,0.0,2,1,0,4,22,'Droth S','34*34*','High');
INSERT INTO "Armors" VALUES (396,'Droth Coil S','Coil',42.0,-2.0,4.0,1.0,0.0,0.0,3,1,0,4,22,'Droth S','50*','High');
INSERT INTO "Armors" VALUES (397,'Droth Greaves S','Legs',42.0,-2.0,4.0,1.0,0.0,0.0,2,0,0,4,22,'Droth S','34*34*34*','High');
INSERT INTO "Armors" VALUES (398,'Jaggi Gauntlets S','Arms',42.0,0.0,0.0,0.0,1.0,0.0,1,1,0,4,23,'Jaggi S','8*','High');
INSERT INTO "Armors" VALUES (399,'Jaggi Shinguards S','Legs',42.0,0.0,0.0,0.0,1.0,0.0,2,1,0,4,23,'Jaggi S','53*','High');
INSERT INTO "Armors" VALUES (400,'Jaggi Mask S','Helm',36.0,0.0,0.0,0.0,0.0,0.0,2,0,0,4,24,'Jaggi Mask S','33*','High');
INSERT INTO "Armors" VALUES (401,'Volvidon Helm S','Helm',50.0,2.0,-3.0,0.0,-1.0,1.0,1,1,0,4,25,'Volvidon S','51*51*73*','High');
INSERT INTO "Armors" VALUES (402,'Volvidon Mail S','Chest',50.0,2.0,-3.0,0.0,-1.0,1.0,2,0,0,4,25,'Volvidon S','69*83*','High');
INSERT INTO "Armors" VALUES (403,'Volvidon Vambraces S','Arms',50.0,2.0,-3.0,0.0,-1.0,1.0,1,1,1,4,25,'Volvidon S','57*51*','High');
INSERT INTO "Armors" VALUES (404,'Volvidon Coil S','Coil',50.0,2.0,-3.0,0.0,-1.0,1.0,1,1,0,4,25,'Volvidon S','69*73*','High');
INSERT INTO "Armors" VALUES (405,'Volvidon Greaves S','Legs',50.0,2.0,-3.0,0.0,-1.0,1.0,1,1,0,4,25,'Volvidon S','69*57*57*','High');
INSERT INTO "Armors" VALUES (406,'Ludroth Helm S','Helm',48.0,-3.0,4.0,-1.0,0.0,0.0,1,1,0,4,26,'Ludroth S','60*20*','High');
INSERT INTO "Armors" VALUES (407,'Ludroth Mail S','Chest',48.0,-3.0,4.0,-1.0,0.0,0.0,2,0,0,4,26,'Ludroth S','22*22*','High');
INSERT INTO "Armors" VALUES (408,'Ludroth Braces S','Arms',48.0,-3.0,4.0,-1.0,0.0,0.0,2,1,1,4,26,'Ludroth S','60*','High');
INSERT INTO "Armors" VALUES (409,'Ludroth Coil S','Coil',48.0,-3.0,4.0,-1.0,0.0,0.0,1,0,0,4,26,'Ludroth S','60*20*','High');
INSERT INTO "Armors" VALUES (410,'Ludroth Greaves S','Legs',48.0,-3.0,4.0,-1.0,0.0,0.0,3,0,0,4,26,'Ludroth S','61*61*','High');
INSERT INTO "Armors" VALUES (411,'Barroth Helm S','Helm',50.0,-3.0,-1.0,3.0,-1.0,0.0,2,1,0,4,27,'Barroth S','8*19*95*','High');
INSERT INTO "Armors" VALUES (412,'Barroth Mail S','Chest',50.0,-3.0,-1.0,3.0,-1.0,0.0,2,0,0,4,27,'Barroth S','8*19*19*','High');
INSERT INTO "Armors" VALUES (413,'Barroth Vambraces S','Arms',50.0,-3.0,-1.0,3.0,-1.0,0.0,1,1,0,4,27,'Barroth S','8*8*33*','High');
INSERT INTO "Armors" VALUES (414,'Barroth Coil S','Coil',50.0,-3.0,-1.0,3.0,-1.0,0.0,1,0,0,4,27,'Barroth S','21*21*19*','High');
INSERT INTO "Armors" VALUES (415,'Barroth Greaves S','Legs',50.0,-3.0,-1.0,3.0,-1.0,0.0,2,1,0,4,27,'Barroth S','21*19*95*','High');
INSERT INTO "Armors" VALUES (416,'Bishaten Helm S','Helm',52.0,-2.0,2.0,2.0,-4.0,2.0,1,0,0,4,28,'Bishaten S','23*76*25*','High');
INSERT INTO "Armors" VALUES (417,'Bishaten Mail S','Mail',52.0,-2.0,2.0,2.0,-4.0,2.0,3,0,0,4,28,'Bishaten S','76*','High');
INSERT INTO "Armors" VALUES (418,'Bishaten Vambraces S','Arms',52.0,-2.0,2.0,2.0,-4.0,2.0,3,0,0,4,28,'Bishaten S','23*25*','High');
INSERT INTO "Armors" VALUES (419,'Bishaten Coil S','Coil',52.0,-2.0,2.0,2.0,-4.0,2.0,1,1,0,4,28,'Bishaten S','23*54*','High');
INSERT INTO "Armors" VALUES (420,'Bishaten Greaves S','Legs',52.0,-2.0,2.0,2.0,-4.0,2.0,3,1,1,4,28,'Bishaten S','54*','High');
INSERT INTO "Armors" VALUES (421,'Pukei-Pukei Helm S','Helm',50.0,0.0,3.0,-3.0,0.0,1.0,2,0,0,5,29,'Pukei-Pukei S','64*77*','High');
INSERT INTO "Armors" VALUES (422,'Pukei-Pukei Mail S','Chest',50.0,0.0,3.0,-3.0,0.0,1.0,1,0,0,5,29,'Pukei-Pukei S','64*27*27*','High');
INSERT INTO "Armors" VALUES (423,'Pukei-Pukei Braces S','Arms',50.0,0.0,3.0,-3.0,0.0,1.0,2,0,0,5,29,'Pukei-Pukei S','77*44*','High');
INSERT INTO "Armors" VALUES (424,'Pukei-Pukei Coil S','Coil',50.0,0.0,3.0,-3.0,0.0,1.0,2,1,0,5,29,'Pukei-Pukei S','77*58*58*','High');
INSERT INTO "Armors" VALUES (425,'Pukei-Pukei Greaves S','Legs',50.0,0.0,3.0,-3.0,0.0,1.0,2,1,0,5,29,'Pukei-Pukei S','27*44*','High');
INSERT INTO "Armors" VALUES (426,'Jyuratodus Helm S','Helm',48.0,-1.0,2.0,-3.0,0.0,0.0,2,1,0,5,30,'Jyura S','95*57*','High');
INSERT INTO "Armors" VALUES (427,'Jyuratodus Mail S','Chest',48.0,-1.0,2.0,-3.0,0.0,0.0,1,1,1,5,30,'Jyura S','61*61*57*','High');
INSERT INTO "Armors" VALUES (428,'Jyuratodus Vambraces S','Arms',48.0,-1.0,2.0,-3.0,0.0,0.0,3,2,1,5,30,'Jyura S','','High');
INSERT INTO "Armors" VALUES (429,'Jyuratodus Coil S','Coil',48.0,-1.0,2.0,-3.0,0.0,0.0,1,1,0,5,30,'Jyura S','104*61*95*','High');
INSERT INTO "Armors" VALUES (430,'Jyuratodus Greaves S','Legs',48.0,-1.0,2.0,-3.0,0.0,0.0,2,1,1,5,30,'Jyura S','104*104*','High');
INSERT INTO "Armors" VALUES (431,'Basarios Helm S','Helm',52.0,0.0,-2.0,1.0,1.0,-3.0,2,1,0,5,31,'Basarios S','78*19*19*','High');
INSERT INTO "Armors" VALUES (432,'Basarios Mail S','Chest',52.0,0.0,-2.0,1.0,1.0,-3.0,1,1,0,5,31,'Basarios S','21*78*','High');
INSERT INTO "Armors" VALUES (433,'Basarios Vambraces S','Arms',52.0,0.0,-2.0,1.0,1.0,-3.0,1,1,0,5,31,'Basarios S','21*21*35*','High');
INSERT INTO "Armors" VALUES (434,'Basarios Coil S','Coil',52.0,0.0,-2.0,1.0,1.0,-3.0,2,0,0,5,31,'Basarios S','35*19*19*','High');
INSERT INTO "Armors" VALUES (435,'Basarios Greaves S','Legs',52.0,0.0,-2.0,1.0,1.0,-3.0,3,0,0,5,31,'Basarios S','78*19*','High');
INSERT INTO "Armors" VALUES (436,'Rathian Helm S','Helm',52.0,3.0,0.0,-2.0,0.0,-3.0,2,1,0,5,32,'Rathian S','81*','High');
INSERT INTO "Armors" VALUES (437,'Rathian Mail S','Chest',52.0,3.0,0.0,-2.0,0.0,-3.0,3,1,1,5,32,'Rathian S','13*11*','High');
INSERT INTO "Armors" VALUES (438,'Rathian Braces S','Arms',52.0,3.0,0.0,-2.0,0.0,-3.0,1,1,0,5,32,'Rathian S','81*76*','High');
INSERT INTO "Armors" VALUES (439,'Rathian Coil S','Coil',52.0,3.0,0.0,-2.0,0.0,-3.0,2,0,0,5,32,'Rathian S','13*13*76*','High');
INSERT INTO "Armors" VALUES (440,'Rathian Greaves S','Legs',52.0,3.0,0.0,-2.0,0.0,-3.0,2,0,0,5,32,'Rathian S','81*46*','High');
INSERT INTO "Armors" VALUES (441,'Skull Visage S','Helm',52.0,-3.0,-3.0,-3.0,-3.0,4.0,3,2,0,5,33,'Skull S','92*','High');
INSERT INTO "Armors" VALUES (442,'Chrome Metal Coil S','Coil',46.0,-2.0,-2.0,-2.0,-2.0,-2.0,3,2,1,5,34,'Chrome Metal S','','High');
INSERT INTO "Armors" VALUES (443,'Chrome Metal Boots S','Legs',46.0,-2.0,-2.0,-2.0,-2.0,-2.0,3,0,0,5,34,'Chrome Metal S','99*99*','High');
INSERT INTO "Armors" VALUES (444,'Dober Helm','Helm',52.0,-2.0,0.0,0.0,0.0,4.0,1,1,0,5,35,'Dober','84*8*16*','High');
INSERT INTO "Armors" VALUES (445,'Dober Mail','Chest',52.0,-2.0,0.0,0.0,0.0,4.0,1,0,0,5,35,'Dober','84*38*61*16*','High');
INSERT INTO "Armors" VALUES (446,'Dober Vambraces','Arms',52.0,-2.0,0.0,0.0,0.0,4.0,2,1,1,5,35,'Dober','84*61*','High');
INSERT INTO "Armors" VALUES (447,'Dober Coil','Coil',52.0,-2.0,0.0,0.0,0.0,4.0,2,0,0,5,35,'Dober','84*8*8*','High');
INSERT INTO "Armors" VALUES (448,'Dober Greaves','Legs',52.0,-2.0,0.0,0.0,0.0,4.0,2,0,0,5,35,'Dober','84*38*16*','High');
INSERT INTO "Armors" VALUES (449,'S. Studded Hat S','Helm',52.0,0.0,2.0,1.0,-1.0,0.0,2,1,0,5,36,'Shell-Studded S','44*44*','High');
INSERT INTO "Armors" VALUES (450,'S. Studded Vest S','Chest',52.0,0.0,2.0,1.0,-1.0,0.0,1,1,0,5,36,'Shell-Studded S','32*47*','High');
INSERT INTO "Armors" VALUES (451,'S. Studded Gloves S','Arms',52.0,0.0,2.0,1.0,-1.0,0.0,1,1,0,5,36,'Shell-Studded S','45*32*','High');
INSERT INTO "Armors" VALUES (452,'S. Studded Sash S','Coil',52.0,0.0,2.0,1.0,-1.0,0.0,3,1,0,5,36,'Shell-Studded S','44*','High');
INSERT INTO "Armors" VALUES (453,'S. Studded Sandals S','Legs',52.0,0.0,2.0,1.0,-1.0,0.0,1,1,0,5,36,'Shell-Studded S','45*47*','High');
INSERT INTO "Armors" VALUES (454,'Melahoa Hat S','Helm',52.0,0.0,1.0,3.0,0.0,0.0,2,2,0,5,37,'Melahoa S','67*67*','High');
INSERT INTO "Armors" VALUES (455,'Melahoa Jacket S','Chest',52.0,0.0,1.0,3.0,0.0,0.0,1,1,0,5,37,'Melahoa S','11*11*13*','High');
INSERT INTO "Armors" VALUES (456,'Melahoa Branch S','Arms',52.0,0.0,1.0,3.0,0.0,0.0,1,1,0,5,37,'Melahoa S','67*11*13*','High');
INSERT INTO "Armors" VALUES (457,'Melahoa Folia S','Coil',52.0,0.0,1.0,3.0,0.0,0.0,2,0,0,5,37,'Melahoa S','11*26*','High');
INSERT INTO "Armors" VALUES (458,'Melahoa Roots S','Legs',52.0,0.0,1.0,3.0,0.0,0.0,1,1,0,5,37,'Melahoa S','13*26*26*','High');
INSERT INTO "Armors" VALUES (459,'Death Stench Brain S','Helm',52.0,3.0,1.0,1.0,-1.0,0.0,2,0,0,5,38,'Death Stench S','101*','High');
INSERT INTO "Armors" VALUES (460,'D. Stench Muscle S','Chest',52.0,3.0,1.0,1.0,-1.0,0.0,2,0,0,5,38,'Death Stench S','92*69*','High');
INSERT INTO "Armors" VALUES (461,'D. Stench Grip S','Arms',52.0,3.0,1.0,1.0,-1.0,0.0,1,0,0,5,38,'Death Stench S','54*54*','High');
INSERT INTO "Armors" VALUES (462,'D. Stench Bowels S','Coil',52.0,3.0,1.0,1.0,-1.0,0.0,1,1,0,5,38,'Death Stench S','101*54*','High');
INSERT INTO "Armors" VALUES (463,'D. Stench Heel S','Legs',52.0,3.0,1.0,1.0,-1.0,0.0,1,1,0,5,38,'Death Stench S','101*69*','High');
INSERT INTO "Armors" VALUES (464,'Mosgharl Visor S','Helm',52.0,-3.0,1.0,0.0,3.0,0.0,2,2,0,5,39,'Mosgharl S','70*70*','High');
INSERT INTO "Armors" VALUES (465,'Mosgharl Ribplate S','Chest',52.0,-3.0,1.0,0.0,3.0,0.0,2,0,0,5,39,'Mosgharl S','42*42*','High');
INSERT INTO "Armors" VALUES (466,'Mosgharl Creeper S','Arms',52.0,-3.0,1.0,0.0,3.0,0.0,2,1,1,5,39,'Mosgharl S','70*99*','High');
INSERT INTO "Armors" VALUES (467,'Mosgharl Folia S','Coil',52.0,-3.0,1.0,0.0,3.0,0.0,1,0,0,5,39,'Mosgharl S','59*59*59*','High');
INSERT INTO "Armors" VALUES (468,'Mosgharl Roots S','Legs',52.0,-3.0,1.0,0.0,3.0,0.0,2,1,0,5,39,'Mosgharl S','43*43*','High');
INSERT INTO "Armors" VALUES (469,'Makluva Hood S','Helm',52.0,1.0,2.0,-2.0,0.0,0.0,2,2,0,5,40,'Makluva S','29*29*','High');
INSERT INTO "Armors" VALUES (470,'Makluva Cover S','Chest',52.0,1.0,2.0,-2.0,0.0,0.0,1,0,0,5,40,'Makluva S','34*34*34*','High');
INSERT INTO "Armors" VALUES (471,'Makluva Sleeves S','Arms',52.0,1.0,2.0,-2.0,0.0,0.0,2,0,0,5,40,'Makluva S','90*72*','High');
INSERT INTO "Armors" VALUES (472,'Makluva Coil S','Coil',52.0,1.0,2.0,-2.0,0.0,0.0,3,0,0,5,40,'Makluva S','29*','High');
INSERT INTO "Armors" VALUES (473,'Makluva Pants S','Legs',52.0,1.0,2.0,-2.0,0.0,0.0,1,1,0,5,40,'Makluva S','90*63*','High');
INSERT INTO "Armors" VALUES (474,'Medium''s Hair-Tie S','Helm',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,41,'Medium S','63*46*105*','High');
INSERT INTO "Armors" VALUES (475,'Medium''s Robe S','Chest',52.0,3.0,0.0,0.0,0.0,0.0,1,1,0,5,41,'Medium S','76*105*','High');
INSERT INTO "Armors" VALUES (476,'Medium''s Prayer S','Arms',52.0,3.0,0.0,0.0,0.0,0.0,3,0,0,5,41,'Medium S','76*','High');
INSERT INTO "Armors" VALUES (477,'Medium''s Obi S','Coil',52.0,3.0,0.0,0.0,0.0,0.0,2,0,0,5,41,'Medium S','63*63*','High');
INSERT INTO "Armors" VALUES (478,'Medium''s Hakama S','Legs',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,41,'Medium S','76*46*105*','High');
INSERT INTO "Armors" VALUES (479,'Channeler''s Hair-Tie S','Helm',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,42,'Channeler S','85*85*77*77*15*','High');
INSERT INTO "Armors" VALUES (480,'Channeler''s Robe S','Chest',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,42,'Channeler S','85*77*52*86*','High');
INSERT INTO "Armors" VALUES (481,'Channeler''s Hope S','Arms',52.0,3.0,0.0,0.0,0.0,0.0,2,0,0,5,42,'Channeler S','52*15*','High');
INSERT INTO "Armors" VALUES (482,'Channeler''s Obi S','Coil',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,42,'Channeler S','86*86*15*','High');
INSERT INTO "Armors" VALUES (483,'Channeler''s Hakama S','Legs',52.0,3.0,0.0,0.0,0.0,0.0,1,1,0,5,42,'Channeler S','52*86*','High');
INSERT INTO "Armors" VALUES (484,'Uroktor Torso S','Chest',52.0,4.0,-2.0,0.0,-1.0,0.0,2,0,0,5,43,'Uroktor S','59*59*59*','High');
INSERT INTO "Armors" VALUES (485,'Uroktor Coil S','Coil',52.0,4.0,-2.0,0.0,-1.0,0.0,2,1,0,5,43,'Uroktor S','59*59*','High');
INSERT INTO "Armors" VALUES (486,'Remobra Headgear S','Helm',52.0,1.0,1.0,1.0,1.0,3.0,2,0,0,5,44,'Remobra S','66*66*','High');
INSERT INTO "Armors" VALUES (487,'Remobra Suit S','Chest',52.0,1.0,1.0,1.0,1.0,3.0,1,1,0,5,44,'Remobra S','106*','High');
INSERT INTO "Armors" VALUES (488,'Remobra Gloves S','Arms',52.0,1.0,1.0,1.0,1.0,3.0,2,0,0,5,44,'Remobra S','75*66*','High');
INSERT INTO "Armors" VALUES (489,'Remobra Belt S','Coil',52.0,1.0,1.0,1.0,1.0,3.0,1,1,0,5,44,'Remobra S','75*75*','High');
INSERT INTO "Armors" VALUES (490,'Remobra Feet S','Legs',52.0,1.0,1.0,1.0,1.0,3.0,1,1,0,5,44,'Remobra S','107*','High');
INSERT INTO "Armors" VALUES (491,'Somnacanth Helm S','Helm',58.0,-1.0,2.0,-3.0,0.0,1.0,2,1,0,5,45,'Somnacanth S','79*','High');
INSERT INTO "Armors" VALUES (492,'Somnacanth Mail S','Chest',58.0,-1.0,2.0,-3.0,0.0,1.0,1,1,0,5,45,'Somnacanth S','79*23*','High');
INSERT INTO "Armors" VALUES (493,'Somnacanth Braces S','Arms',58.0,-1.0,2.0,-3.0,0.0,1.0,2,0,0,5,45,'Somnacanth S','80*80*14*','High');
INSERT INTO "Armors" VALUES (494,'Somnacanth Coil S','Coil',58.0,-1.0,2.0,-3.0,0.0,1.0,3,0,0,5,45,'Somnacanth S','79*80*','High');
INSERT INTO "Armors" VALUES (495,'Somnacanth Greaves S','Legs',58.0,-1.0,2.0,-3.0,0.0,1.0,1,1,0,5,45,'Somnacanth S','14*14*','High');
INSERT INTO "Armors" VALUES (496,'Barioth Helm S','Helm',58.0,-3.0,0.0,-1.0,3.0,0.0,1,0,0,5,46,'Barioth S','82*82*','High');
INSERT INTO "Armors" VALUES (498,'Barioth Mail S','Chest',58.0,-3.0,0.0,-1.0,3.0,0.0,2,1,1,5,46,'Barioth S','24*54*','High');
INSERT INTO "Armors" VALUES (499,'Barioth Vambraces S','Arms',58.0,-3.0,0.0,-1.0,3.0,0.0,2,0,0,5,46,'Barioth S','24*54*17*','High');
INSERT INTO "Armors" VALUES (500,'Barioth Coil S','Coil',58.0,-3.0,0.0,-1.0,3.0,0.0,1,0,0,5,46,'Barioth S','82*17*17*','High');
INSERT INTO "Armors" VALUES (501,'Barioth Greaves S','Legs',58.0,-3.0,0.0,-1.0,3.0,0.0,3,1,0,5,46,'Barioth S','24*','High');
INSERT INTO "Armors" VALUES (502,'Kadachi Helm S','Helm',58.0,0.0,-3.0,3.0,0.0,0.0,1,1,0,5,47,'Kadachi S','83*27*17*','High');
INSERT INTO "Armors" VALUES (503,'Tobi-Kadachi Mail S','Chest',58.0,0.0,-3.0,3.0,0.0,0.0,3,0,0,5,47,'Kadachi S','108*17*','High');
INSERT INTO "Armors" VALUES (504,'Tobi-Kadachi Braces S','Arms',58.0,0.0,-3.0,3.0,0.0,0.0,2,0,0,5,47,'Kadachi S','27*27*27*','High');
INSERT INTO "Armors" VALUES (505,'Tobi-Kadachi Coil S','Coil',58.0,0.0,-3.0,3.0,0.0,0.0,1,1,0,5,47,'Kadachi S','108*108*','High');
INSERT INTO "Armors" VALUES (506,'Tobi-Kadachi Greaves S','Legs',58.0,0.0,-3.0,3.0,0.0,0.0,2,1,0,5,47,'Kadachi S','27*17*17*','High');
INSERT INTO "Armors" VALUES (507,'Anjanath Helm S','Helm',60.0,3.0,-3.0,-1.0,-1.0,0.0,2,0,0,5,48,'Anja S','38*56*','High');
INSERT INTO "Armors" VALUES (508,'Anjanath Mail S','Chest',60.0,3.0,-3.0,-1.0,-1.0,0.0,1,1,0,5,48,'Anja S','38*38*60*','High');
INSERT INTO "Armors" VALUES (509,'Anjanath Vambraces S','Arms',60.0,3.0,-3.0,-1.0,-1.0,0.0,1,0,0,5,48,'Anja S','56*56*8*8*','High');
INSERT INTO "Armors" VALUES (510,'Anjanath Coil S','Coil',60.0,3.0,-3.0,-1.0,-1.0,0.0,2,1,1,5,48,'Anja S','8*8*','High');
INSERT INTO "Armors" VALUES (511,'Anjanath Greaves S','Legs',60.0,3.0,-3.0,-1.0,-1.0,0.0,2,0,0,5,48,'Anja S','60*60*','High');
INSERT INTO "Armors" VALUES (512,'Nargacuga Helm S','Helm',60.0,-2.0,1.0,-3.0,1.0,1.0,3,0,0,6,49,'Nargacuga S','52*','High');
INSERT INTO "Armors" VALUES (513,'Nargacuga Mail S','Chest',60.0,-2.0,1.0,-3.0,1.0,1.0,1,1,0,6,49,'Nargacuga S','52*17*17*','High');
INSERT INTO "Armors" VALUES (514,'Nargacuga Braces S','Arms',60.0,-2.0,1.0,-3.0,1.0,1.0,1,1,0,6,49,'Nargacuga S','52*57*','High');
INSERT INTO "Armors" VALUES (515,'Nargacuga Coil S','Coil',60.0,-2.0,1.0,-3.0,1.0,1.0,2,0,0,6,49,'Nargacuga S','57*57*17*','High');
INSERT INTO "Armors" VALUES (516,'Nargacuga Greaves S','Legs',60.0,-2.0,1.0,-3.0,1.0,1.0,1,0,0,6,49,'Nargacuga S','52*52*17*','High');
INSERT INTO "Armors" VALUES (517,'Mizutsune Helm S','Helm',60.0,0.0,2.0,-3.0,1.0,-1.0,2,1,0,6,50,'Mizutsune S','98*','High');
INSERT INTO "Armors" VALUES (518,'Mizutsune Mail S','Chest',60.0,0.0,2.0,-3.0,1.0,-1.0,1,0,0,6,50,'Mizutsune S','90*98*','High');
INSERT INTO "Armors" VALUES (519,'Mizutsune Braces S','Arms',60.0,0.0,2.0,-3.0,1.0,-1.0,2,0,0,6,50,'Mizutsune S','98*46*','High');
INSERT INTO "Armors" VALUES (520,'Mizutsune Coil S','Coil',60.0,0.0,2.0,-3.0,1.0,-1.0,2,1,0,6,50,'Mizutsune S','90*46*','High');
INSERT INTO "Armors" VALUES (521,'Mizutsune Greaves S','Legs',60.0,0.0,2.0,-3.0,1.0,-1.0,3,1,1,6,50,'Mizutsune S','90*','High');
INSERT INTO "Armors" VALUES (522,'Rathalos Helm S','Helm',62.0,3.0,1.0,-2.0,1.0,-3.0,1,1,0,6,51,'Rathalos S','8*36*','High');
INSERT INTO "Armors" VALUES (523,'Rathalos Mail S','Chest',62.0,3.0,1.0,-2.0,1.0,-3.0,1,0,0,6,51,'Rathalos S','8*36*66*','High');
INSERT INTO "Armors" VALUES (524,'Rathalos Braces S','Arms',62.0,3.0,1.0,-2.0,1.0,-3.0,2,0,0,6,51,'Rathalos S','8*8*','High');
INSERT INTO "Armors" VALUES (525,'Rathalos Coil S','Coil',62.0,3.0,1.0,-2.0,1.0,-3.0,2,0,0,6,51,'Rathalos S','8*8*66*','High');
INSERT INTO "Armors" VALUES (526,'Rathalos Greaves S','Legs',62.0,3.0,1.0,-2.0,1.0,-3.0,1,1,0,6,51,'Rathalos S','8*36*','High');
INSERT INTO "Armors" VALUES (527,'Zinogre Helm S','Helm',62.0,0.0,-1.0,4.0,-4.0,1.0,1,0,0,6,52,'Zinogre S','91*107*','High');
INSERT INTO "Armors" VALUES (528,'Zinogre Mail S','Chest',62.0,0.0,-1.0,4.0,-4.0,1.0,1,0,0,6,52,'Zinogre S','91*107*','High');
INSERT INTO "Armors" VALUES (529,'Zinogre Braces S','Arms',62.0,0.0,-1.0,4.0,-4.0,1.0,2,0,0,6,52,'Zinogre S','91*27*','High');
INSERT INTO "Armors" VALUES (530,'Zinogre Coil S','Coil',62.0,0.0,-1.0,4.0,-4.0,1.0,3,1,0,6,52,'Zinogre S','91*','High');
INSERT INTO "Armors" VALUES (531,'Zinogre Greaves S','Legs',62.0,0.0,-1.0,4.0,-4.0,1.0,1,0,0,6,52,'Zinogre S','91*27*27*','High');
INSERT INTO "Armors" VALUES (532,'Rhopessa Vertex S','Helm',62.0,-2.0,0.0,3.0,-2.0,2.0,1,0,0,6,53,'Rhopessa S','75*75*','High');
INSERT INTO "Armors" VALUES (533,'Rhopessa Thorax S','Chest',62.0,-2.0,0.0,3.0,-2.0,2.0,1,0,0,6,53,'Rhopessa S','75*17*17*84*','High');
INSERT INTO "Armors" VALUES (534,'Rhopessa Brachia S','Arms',62.0,-2.0,0.0,3.0,-2.0,2.0,3,0,0,6,53,'Rhopessa S','52*','High');
INSERT INTO "Armors" VALUES (535,'Rhopessa Elytra S','Coil',62.0,-2.0,0.0,3.0,-2.0,2.0,1,0,0,6,53,'Rhopessa S','84*84*84*','High');
INSERT INTO "Armors" VALUES (536,'Rhopessa Crura S','Legs',62.0,-2.0,0.0,3.0,-2.0,2.0,1,1,0,6,53,'Rhopessa S','17*17*84*','High');
INSERT INTO "Armors" VALUES (537,'Jelly Hat S','Helm',62.0,1.0,3.0,0.0,2.0,0.0,3,0,0,6,54,'Jelly S','36*14*','High');
INSERT INTO "Armors" VALUES (538,'Jelly Vest S','Chest',62.0,1.0,3.0,0.0,2.0,0.0,2,1,0,6,54,'Jelly S','96*96*','High');
INSERT INTO "Armors" VALUES (539,'Jelly Gloves S','Arms',62.0,1.0,3.0,0.0,2.0,0.0,1,1,0,6,54,'Jelly S','14*14*','High');
INSERT INTO "Armors" VALUES (540,'Jelly Coil S','Coil',62.0,1.0,3.0,0.0,2.0,0.0,2,1,0,6,54,'Jelly S','36*36*','High');
INSERT INTO "Armors" VALUES (541,'Jelly Boots S','Legs',62.0,1.0,3.0,0.0,2.0,0.0,3,1,0,6,54,'Jelly S','96*','High');
INSERT INTO "Armors" VALUES (542,'Brigade Lobos S','Helm',62.0,1.0,0.0,2.0,0.0,2.0,3,1,0,6,55,'Brigade S','11*11*','High');
INSERT INTO "Armors" VALUES (543,'Brigade Suit S','Chest',62.0,1.0,0.0,2.0,0.0,2.0,1,0,0,6,55,'Brigade S','103*12*','High');
INSERT INTO "Armors" VALUES (544,'Brigade Vambraces S','Arms',62.0,1.0,0.0,2.0,0.0,2.0,3,1,0,6,55,'Brigade S','12*12*','High');
INSERT INTO "Armors" VALUES (545,'Brigade Coil S','Coil',62.0,1.0,0.0,2.0,0.0,2.0,3,1,0,6,55,'Brigade S','105*','High');
INSERT INTO "Armors" VALUES (546,'Brigade Boots S','Legs',62.0,1.0,0.0,2.0,0.0,2.0,1,1,1,6,55,'Brigade S','109*11*11*','High');
INSERT INTO "Armors" VALUES (547,'Mighty Bow Feather','Helm',56.0,0.0,0.0,0.0,0.0,0.0,0,0,0,6,56,'Might Bow Feather','110*','High');
INSERT INTO "Armors" VALUES (548,'Gargwa Mask S','Helm',54.0,-3.0,-2.0,-2.0,1.0,0.0,0,0,0,6,57,'Gargwa S','72*105*','High');
INSERT INTO "Armors" VALUES (549,'Sinister Helm S','Helm',64.0,3.0,-3.0,-2.0,1.0,1.0,2,0,0,6,58,'Sinister S','87*100*99*','High');
INSERT INTO "Armors" VALUES (550,'Sinister Garb S','Chest',64.0,3.0,-3.0,-2.0,1.0,1.0,2,0,0,6,58,'Sinister S','89*87*','High');
INSERT INTO "Armors" VALUES (551,'Sinister Gauntlets S','Arms',64.0,3.0,-3.0,-2.0,1.0,1.0,2,0,0,6,58,'Sinister S','89*100*100*','High');
INSERT INTO "Armors" VALUES (552,'Sinister Tassets S','Coil',64.0,3.0,-3.0,-2.0,1.0,1.0,3,0,0,6,58,'Sinister S','89*','High');
INSERT INTO "Armors" VALUES (553,'Sinister Greaves S','Legs',64.0,3.0,-3.0,-2.0,1.0,1.0,1,1,0,6,58,'Sinister S','89*87*99*','High');
INSERT INTO "Armors" VALUES (554,'Goss Harag Helm S','Helm',64.0,-4.0,1.0,-1.0,4.0,0.0,1,1,0,6,59,'Goss Harag S','82*86*','High');
INSERT INTO "Armors" VALUES (555,'Goss Harag Mail S','Chest',64.0,-4.0,1.0,-1.0,4.0,0.0,2,1,0,6,59,'Goss Harag S','82*87*','High');
INSERT INTO "Armors" VALUES (556,'Goss Harag Braces S','Arms',64.0,-4.0,1.0,-1.0,4.0,0.0,2,0,0,6,59,'Goss Harag S','82*93*','High');
INSERT INTO "Armors" VALUES (557,'Goss Harag Coil S','Coil',64.0,-4.0,1.0,-1.0,4.0,0.0,2,1,0,6,59,'Goss Harag S','93*87*','High');
INSERT INTO "Armors" VALUES (558,'Goss Harag Greaves S','Legs',64.0,-4.0,1.0,-1.0,4.0,0.0,1,0,0,6,59,'Goss Harag S','93*86*86*86*','High');
INSERT INTO "Armors" VALUES (559,'Almudron Helm S','Helm',64.0,-4.0,3.0,3.0,-2.0,-2.0,2,2,0,6,60,'Almudron S','69*69*','High');
INSERT INTO "Armors" VALUES (560,'Almudron Mail S','Chest',64.0,-4.0,3.0,3.0,-2.0,-2.0,1,0,0,6,60,'Almudron S','85*85*61*','High');
INSERT INTO "Armors" VALUES (561,'Almudron Vambraces S','Arms',64.0,-4.0,3.0,3.0,-2.0,-2.0,1,1,0,6,60,'Almudron S','69*52*52*','High');
INSERT INTO "Armors" VALUES (562,'Almudron Coil S','Coil',64.0,-4.0,3.0,3.0,-2.0,-2.0,2,1,0,6,60,'Almudron S','52*61*','High');
INSERT INTO "Armors" VALUES (563,'Almudron Greaves S','Legs',64.0,-4.0,3.0,3.0,-2.0,-2.0,3,1,0,6,60,'Almudron S','85*','High');
INSERT INTO "Armors" VALUES (564,'Tigrex Helm S','Helm',64.0,2.0,0.0,-3.0,0.0,-2.0,2,1,0,6,61,'Tigrex S','94*63*','High');
INSERT INTO "Armors" VALUES (565,'Tigrex Mail S','Chest',64.0,2.0,0.0,-3.0,0.0,-2.0,1,1,0,6,61,'Tigrex S','94*94*73*','High');
INSERT INTO "Armors" VALUES (566,'Tigrex Braces S','Arms',64.0,2.0,0.0,-3.0,0.0,-2.0,3,0,0,6,61,'Tigrex S','73*73*108*','High');
INSERT INTO "Armors" VALUES (567,'Tigrex Coil S','Coil',64.0,2.0,0.0,-3.0,0.0,-2.0,2,1,0,6,61,'Tigrex S','94*94*','High');
INSERT INTO "Armors" VALUES (568,'Tigrex Greaves S','Legs',64.0,2.0,0.0,-3.0,0.0,-2.0,1,0,0,6,61,'Tigrex S','63*63*108*','High');
INSERT INTO "Armors" VALUES (569,'Diablos Helm S','Helm',64.0,3.0,-1.0,-1.0,-3.0,-1.0,2,0,0,6,62,'Diablos S','21*22*','High');
INSERT INTO "Armors" VALUES (570,'Diablos Mail S','Chest',64.0,3.0,-1.0,-1.0,-3.0,-1.0,1,0,0,6,62,'Diablos S','21*21*95*','High');
INSERT INTO "Armors" VALUES (571,'Diablos Vambraces S','Arms',64.0,3.0,-1.0,-1.0,-3.0,-1.0,2,1,0,6,62,'Diablos S','95*','High');
INSERT INTO "Armors" VALUES (572,'Diablos Coil S','Coil',64.0,3.0,-1.0,-1.0,-3.0,-1.0,1,1,0,6,62,'Diablos S','21*22*','High');
INSERT INTO "Armors" VALUES (573,'Diablos Greaves S','Legs',64.0,3.0,-1.0,-1.0,-3.0,-1.0,2,0,0,6,62,'Diablos S','21*95*','High');
INSERT INTO "Armors" VALUES (574,'Rakna Helm','Helm',66.0,4.0,-2.0,-1.0,-3.0,1.0,1,1,0,6,63,'Rakna-Kadaki','45*42*','High');
INSERT INTO "Armors" VALUES (575,'Rakna Mail','Chest',66.0,4.0,-2.0,-1.0,-3.0,1.0,2,1,0,6,63,'Rakna-Kadaki','45*42*','High');
INSERT INTO "Armors" VALUES (576,'Rakna Armguards','Arms',66.0,4.0,-2.0,-1.0,-3.0,1.0,2,0,0,6,63,'Rakna-Kadaki','27*27*22*','High');
INSERT INTO "Armors" VALUES (577,'Rakna Coil','Coil',66.0,4.0,-2.0,-1.0,-3.0,1.0,2,2,0,6,63,'Rakna-Kadaki','45*','High');
INSERT INTO "Armors" VALUES (578,'Rakna Greaves','Legs',66.0,4.0,-2.0,-1.0,-3.0,1.0,1,0,0,6,63,'Rakna-Kadaki','27*27*22*22*','High');
INSERT INTO "Armors" VALUES (579,'Golden Headdress','Helm',70.0,2.0,1.0,3.0,-5.0,2.0,2,1,0,7,64,'Golden','16*16*54*','High');
INSERT INTO "Armors" VALUES (580,'Golden Haori','Chest',70.0,2.0,1.0,3.0,-5.0,2.0,2,0,0,7,64,'Golden','16*54*91*','High');
INSERT INTO "Armors" VALUES (581,'Golden Kote','Arms',70.0,2.0,1.0,3.0,-5.0,2.0,3,1,0,7,64,'Golden','16*91*','High');
INSERT INTO "Armors" VALUES (582,'Golden Obi','Coil',70.0,2.0,1.0,3.0,-5.0,2.0,1,0,0,7,64,'Golden','16*106*54*','High');
INSERT INTO "Armors" VALUES (583,'Golden Hakama','Coil',70.0,2.0,1.0,3.0,-5.0,2.0,1,1,0,7,64,'Golden','106*106*91*','High');
INSERT INTO "Armors" VALUES (584,'Ibushi''s Helm','Helm',66.0,-1.0,0.0,0.0,0.0,-2.0,0,0,0,7,65,'Ibushi','111*38*57*112*','High');
INSERT INTO "Armors" VALUES (585,'Ibushi''s Breastplate','Chest',66.0,-1.0,0.0,0.0,0.0,-2.0,0,0,0,7,65,'Ibushi','111*21*99*112*','High');
INSERT INTO "Armors" VALUES (586,'Ibushi''s Pauldrons','Arms',66.0,-1.0,0.0,0.0,0.0,-2.0,0,0,0,7,65,'Ibushi','111*27*22*112*','High');
INSERT INTO "Armors" VALUES (587,'Ibushi''s Fauld','Coil',66.0,-1.0,0.0,0.0,0.0,-2.0,0,0,0,7,65,'Ibushi','111*61*52*112*','High');
INSERT INTO "Armors" VALUES (588,'Foot Of Ibushi','Legs',66.0,-1.0,0.0,0.0,0.0,-2.0,0,0,0,7,65,'Ibushi','111*56*104*112*','High');
INSERT INTO "Armors" VALUES (589,'Narwa''s Helm','Helm',76.0,2.0,1.0,4.0,-3.0,-4.0,0,0,0,7,66,'Narwa','113*69*95*112*','High');
INSERT INTO "Armors" VALUES (590,'Narwa''s Breastplate','Chest',76.0,2.0,1.0,4.0,-3.0,-4.0,0,0,0,7,66,'Narwa','113*27*82*112*','High');
INSERT INTO "Armors" VALUES (591,'Narwa''s Pauldrons','Arms',76.0,2.0,1.0,4.0,-3.0,-4.0,0,0,0,7,66,'Narwa','113*21*36*112*','High');
INSERT INTO "Armors" VALUES (592,'Narwa''s Fauld','Coil',76.0,2.0,1.0,4.0,-3.0,-4.0,0,0,0,7,66,'Narwa','113*21*48*112*','High');
INSERT INTO "Armors" VALUES (593,'Foot Of Narwa','Legs',76.0,2.0,1.0,4.0,-3.0,-4.0,0,0,0,7,66,'Narwa','113*52*60*112*','High');
INSERT INTO "Armors" VALUES (594,'Aelucanth Vertex S','Helm',62.0,-2.0,0.0,3.0,-2.0,2.0,1,0,0,6,67,'Aelucanth S','75*75*','High');
INSERT INTO "Armors" VALUES (595,'Aelucanth Thorax S','Chest',62.0,-2.0,0.0,3.0,-2.0,2.0,1,0,0,6,67,'Aelucanth S','75*17*17*84*','High');
INSERT INTO "Armors" VALUES (596,'Aelucanth Brachia S','Arms',62.0,-2.0,0.0,3.0,-2.0,2.0,3,0,0,6,67,'Aelucanth S','52*','High');
INSERT INTO "Armors" VALUES (597,'Aelucanth Elytra S','Coil',62.0,-2.0,0.0,3.0,-2.0,2.0,1,0,0,6,67,'Aelucanth S','84*84*84*','High');
INSERT INTO "Armors" VALUES (598,'Aelucanth Crura S','Legs',62.0,-2.0,0.0,3.0,-2.0,2.0,1,1,0,6,67,'Aelucanth S','17*17*84*','High');
INSERT INTO "Armors" VALUES (599,'Spio Vertex S','Helm',32.0,3.0,-1.0,-1.0,-1.0,3.0,2,0,0,4,68,'Spio S','58*58*','High');
INSERT INTO "Armors" VALUES (600,'Spio Thorax S','Chest',32.0,3.0,-1.0,-1.0,-1.0,3.0,2,0,0,4,68,'Spio S','91*','High');
INSERT INTO "Armors" VALUES (601,'Spio Brachia S','Arms',32.0,3.0,-1.0,-1.0,-1.0,3.0,1,1,0,4,68,'Spio S','91*97*','High');
INSERT INTO "Armors" VALUES (602,'Spio Elytra S','Coil',32.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,4,68,'Spio S','107*107*','High');
INSERT INTO "Armors" VALUES (603,'Spio Crura S','Legs',32.0,3.0,-1.0,-1.0,-1.0,3.0,1,0,0,4,68,'Spio S','91*108*97*','High');
INSERT INTO "Armors" VALUES (604,'Skalda Vertex S','Helm',32.0,3.0,-1.0,-1.0,-1.0,3.0,2,0,0,4,69,'Skalda S','58*58*','High');
INSERT INTO "Armors" VALUES (605,'Skalda Thorax S','Chest',32.0,3.0,-1.0,-1.0,-1.0,3.0,2,0,0,4,69,'Skalda S','91*','High');
INSERT INTO "Armors" VALUES (606,'Skalda Brachia S','Arms',32.0,3.0,-1.0,-1.0,-1.0,3.0,1,1,0,4,69,'Skalda S','91*97*','High');
INSERT INTO "Armors" VALUES (607,'Skalda Elytra S','Coil',32.0,3.0,-1.0,-1.0,-1.0,3.0,0,0,0,4,69,'Skalda S','107*107*','High');
INSERT INTO "Armors" VALUES (608,'Skalda Crura S','Legs',32.0,3.0,-1.0,-1.0,-1.0,3.0,1,0,0,4,69,'Skalda S','91*108*97*','High');
INSERT INTO "Armors" VALUES (609,'Vaik Helm S','Helm',52.0,0.0,32.0,-2.0,-1.0,0.0,2,1,0,5,70,'Vaik S','30*30*','High');
INSERT INTO "Armors" VALUES (610,'Vaik Mail S','Chest',52.0,0.0,32.0,-2.0,-1.0,0.0,3,2,1,5,70,'Vaik S','','High');
INSERT INTO "Armors" VALUES (611,'Vaik Braces S','Arms',52.0,0.0,32.0,-2.0,-1.0,0.0,1,1,0,5,70,'Vaik S','32*32*','High');
INSERT INTO "Armors" VALUES (612,'Vaik Coil S','Coil',52.0,0.0,32.0,-2.0,-1.0,0.0,2,0,0,5,70,'Vaik S','32*','High');
INSERT INTO "Armors" VALUES (613,'Vaik Greaves S','Legs',52.0,0.0,32.0,-2.0,-1.0,0.0,3,1,0,5,70,'Vaik S','30*','High');
INSERT INTO "Armors" VALUES (614,'Utsushi Mask S (Visible)','Helm',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,71,'Utsushi S (Visible)','63*46*105*','High');
INSERT INTO "Armors" VALUES (615,'Utsushi Chest S (Visible)','Chest',52.0,3.0,0.0,0.0,0.0,0.0,1,1,0,5,71,'Utsushi S (Visible)','76*105*','High');
INSERT INTO "Armors" VALUES (616,'Utsushi Braces S (Visible)','Arms',52.0,3.0,0.0,0.0,0.0,0.0,3,0,0,5,71,'Utsushi S (Visible)','76*','High');
INSERT INTO "Armors" VALUES (617,'Utsushi Tassets S (Visible)','Coil',52.0,3.0,0.0,0.0,0.0,0.0,2,0,0,5,71,'Utsushi S (Visible)','63*46*','High');
INSERT INTO "Armors" VALUES (618,'Utsushi Greaves S (Visible)','Legs',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,71,'Utsushi S (Visible)','76*46*105*','High');
INSERT INTO "Armors" VALUES (619,'Utsushi Mask S (Hidden)','Helm',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,72,'Utsushi S (Hidden)','85*85*77*77*15*','High');
INSERT INTO "Armors" VALUES (620,'Utsushi Chest S (Hidden)','Chest',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,72,'Utsushi S (Hidden)','77*85*52*86*','High');
INSERT INTO "Armors" VALUES (621,'Utsushi Greaves S (Hidden)','Arms',52.0,3.0,0.0,0.0,0.0,0.0,2,0,0,5,72,'Utsushi S (Hidden)','52*15*','High');
INSERT INTO "Armors" VALUES (622,'Utsushi Tassets S (Hidden)','Coil',52.0,3.0,0.0,0.0,0.0,0.0,1,0,0,5,72,'Utsushi S (Hidden)','86*86*15*','High');
INSERT INTO "Armors" VALUES (623,'Utsushi Greaves S (Hidden)','Legs',52.0,3.0,0.0,0.0,0.0,0.0,1,1,0,5,72,'Utsushi S (Hidden)','52*86*','High');
INSERT INTO "Armors" VALUES (624,'Slagtoth Hood S','Helm',42.0,-2.0,2.0,0.0,-1.0,1.0,3,0,0,4,73,'Slagtoth S','50*46*','High');
INSERT INTO "Armors" VALUES (625,'Slagtoth Cloak S','Chest',42.0,-2.0,2.0,0.0,-1.0,1.0,2,1,0,4,73,'Slagtoth S','46*46*','High');
INSERT INTO "Armors" VALUES (626,'Bazelgeuse Helm','Helm',72.0,3.0,1.0,-4.0,-2.0,-2.0,2,0,0,7,74,'Bazelgeuse','48*21*','High');
INSERT INTO "Armors" VALUES (627,'Bazelgeuse Mail','Chest',72.0,3.0,1.0,-4.0,-2.0,-2.0,1,1,0,7,74,'Bazelgeuse','104*104*86*','High');
INSERT INTO "Armors" VALUES (628,'Bazelgeuse Braces','Arms',72.0,3.0,1.0,-4.0,-2.0,-2.0,2,2,0,7,74,'Bazelgeuse','78*104*','High');
INSERT INTO "Armors" VALUES (629,'Bazelgeuse Coil','Coil',72.0,3.0,1.0,-4.0,-2.0,-2.0,2,2,0,7,74,'Bazelgeuse','78*21*','High');
INSERT INTO "Armors" VALUES (630,'Bazelgeuse Greaves','Legs',72.0,3.0,1.0,-4.0,-2.0,-2.0,3,0,0,7,74,'Bazelgeuse','48*48*21*','High');
INSERT INTO "Armors" VALUES (631,'Mizuha Cap','Helm',74.0,-5.0,1.0,0.0,3.0,-3.0,1,0,0,7,75,'Mizuha','108*108*44*44*52*52*','High');
INSERT INTO "Armors" VALUES (632,'Mizuha Guards','Chest',74.0,-5.0,1.0,0.0,3.0,-3.0,1,0,0,7,75,'Mizuha','114*58*108*44*','High');
INSERT INTO "Armors" VALUES (633,'Mizuha Sleeves','Arms',74.0,-5.0,1.0,0.0,3.0,-3.0,1,0,0,7,75,'Mizuha','114*58*52*','High');
INSERT INTO "Armors" VALUES (634,'Mizuha Sash','Coil',74.0,-5.0,1.0,0.0,3.0,-3.0,1,0,0,7,75,'Mizuha','114*58*20*20*','High');
INSERT INTO "Armors" VALUES (635,'Mizuha Gaiters','Legs',74.0,-5.0,1.0,0.0,3.0,-3.0,2,0,0,7,75,'Mizuha','114*52*','High');
INSERT INTO "Armors" VALUES (636,'Kushala Glare','Helm',74.0,-1.0,2.0,-2.0,3.0,-3.0,1,0,0,7,76,'Kushala','100*100*32*32*','High');
INSERT INTO "Armors" VALUES (637,'Kushala Cista','Chest',74.0,-1.0,2.0,-2.0,3.0,-3.0,2,0,0,7,76,'Kushala','116*26*50*','High');
INSERT INTO "Armors" VALUES (638,'Kushala Grip','Arms',74.0,-1.0,2.0,-2.0,3.0,-3.0,1,0,0,7,76,'Kushala','116*26*86*86*','High');
INSERT INTO "Armors" VALUES (639,'Kushala Cocoon','Coil',74.0,-1.0,2.0,-2.0,3.0,-3.0,1,0,0,7,76,'Kushala','116*26*100*47*','High');
INSERT INTO "Armors" VALUES (640,'Kushala Crus','Legs',74.0,-1.0,2.0,-2.0,3.0,-3.0,1,0,0,7,76,'Kushala','116*100*47*','High');
INSERT INTO "Armors" VALUES (641,'Kaiser Crown','Helm',74.0,4.0,-4.0,1.0,-1.0,-3.0,1,0,0,7,77,'Kaiser','17*17*17*106*','High');
INSERT INTO "Armors" VALUES (642,'Kaiser Mail','Chest',74.0,4.0,-4.0,1.0,-1.0,-3.0,1,0,0,7,77,'Kaiser','117*17*118*','High');
INSERT INTO "Armors" VALUES (643,'Kaiser Vambraces','Arms',74.0,4.0,-4.0,1.0,-1.0,-3.0,2,0,0,7,77,'Kaiser','117*17*106*','High');
INSERT INTO "Armors" VALUES (644,'Kaiser Coil','Coil',74.0,4.0,-4.0,1.0,-1.0,-3.0,3,0,0,7,77,'Kaiser','117*17*','High');
INSERT INTO "Armors" VALUES (645,'Kaiser Greaves','Legs',74.0,4.0,-4.0,1.0,-1.0,-3.0,1,0,0,7,77,'Kaiser','117*118*','High');
INSERT INTO "Armors" VALUES (646,'Damascus Helm','Helm',68.0,-1.0,2.0,-3.0,1.0,-1.0,0,0,0,7,78,'Damascus','49*49*94*94*','High');
INSERT INTO "Armors" VALUES (647,'Damascus Mail','Chest',68.0,-1.0,2.0,-3.0,1.0,-1.0,1,1,0,7,78,'Damascus','49*100*','High');
INSERT INTO "Armors" VALUES (648,'Damascus Vambraces','Arms',68.0,-1.0,2.0,-3.0,1.0,-1.0,2,1,0,7,78,'Damascus','94*','High');
INSERT INTO "Armors" VALUES (649,'Damascus Coil','Coil',68.0,-1.0,2.0,-3.0,1.0,-1.0,1,0,0,7,78,'Damascus','94*100*','High');
INSERT INTO "Armors" VALUES (650,'Damascus Greaves','Legs',68.0,-1.0,2.0,-3.0,1.0,-1.0,1,0,0,7,78,'Damascus','100*100*','High');
INSERT INTO "Armors" VALUES (651,'Valstrax Helm','Helm',80.0,-2.0,-2.0,-2.0,-2.0,3.0,2,1,0,7,79,'Valstrax','119*107*','High');
INSERT INTO "Armors" VALUES (652,'Valstrax Mail','Chest',80.0,-2.0,-2.0,-2.0,-2.0,3.0,3,1,0,7,79,'Valstrax','119*98*98*','High');
INSERT INTO "Armors" VALUES (653,'Valstrax Braces','Arms',80.0,-2.0,-2.0,-2.0,-2.0,3.0,2,0,0,7,79,'Valstrax','119*107*107*','High');
INSERT INTO "Armors" VALUES (654,'Valstrax Coil','Coil',80.0,-2.0,-2.0,-2.0,-2.0,3.0,2,0,0,7,79,'Valstrax','119*98*87*87*','High');
INSERT INTO "Armors" VALUES (655,'Valstrax Greaves','Legs',80.0,-2.0,-2.0,-2.0,-2.0,3.0,3,1,0,7,79,'Valstrax','119*87*','High');
INSERT INTO "RampageSkills" VALUES (1,'Attack Boost I
','Increases attack power by +4',NULL);
INSERT INTO "RampageSkills" VALUES (2,'Attack Boost II','Increases attack power by +6',NULL);
INSERT INTO "RampageSkills" VALUES (3,'Attack Boost III','Increases attack power by +8',NULL);
INSERT INTO "RampageSkills" VALUES (4,'Attack Boost IV','Increases attack power by +10',NULL);
INSERT INTO "RampageSkills" VALUES (5,'Affinity Boost I','Increases affinity by +4%',NULL);
INSERT INTO "RampageSkills" VALUES (6,'Affinity Boost II','Increases affinity by +6%',NULL);
INSERT INTO "RampageSkills" VALUES (7,'Affinity Boost III','Increases affinity by +8%',NULL);
INSERT INTO "RampageSkills" VALUES (8,'Affinity Boost IV','Increases affinity by +10%',NULL);
INSERT INTO "RampageSkills" VALUES (9,'Defense Boost I','Increases defense by +10',NULL);
INSERT INTO "RampageSkills" VALUES (10,'Defense Boost II','Increases defense by +20',NULL);
INSERT INTO "RampageSkills" VALUES (11,'Defense Boost III','Increases defense by +30',NULL);
INSERT INTO "RampageSkills" VALUES (12,'Fire Boost I','Fire element attack power +4',NULL);
INSERT INTO "RampageSkills" VALUES (13,'Fire Boost II','Fire element attack power +6',NULL);
INSERT INTO "RampageSkills" VALUES (14,'Fire Boost III','Fire element attack power +8',NULL);
INSERT INTO "RampageSkills" VALUES (15,'Water Boost I','Fire element attack power +4',NULL);
INSERT INTO "RampageSkills" VALUES (16,'Water Boost II','Fire element attack power +6',NULL);
INSERT INTO "RampageSkills" VALUES (17,'Water Boost III','Fire element attack power +8',NULL);
INSERT INTO "RampageSkills" VALUES (18,'Water Boost IV','Water element attack power +10',NULL);
INSERT INTO "RampageSkills" VALUES (19,'Thunder Boost I','Water element attack power +4',NULL);
INSERT INTO "RampageSkills" VALUES (20,'Thunder Boost II','Water element attack power +6',NULL);
INSERT INTO "RampageSkills" VALUES (21,'Thunder Boost III','Water element attack power +8',NULL);
INSERT INTO "RampageSkills" VALUES (22,'Ice Boost I','Water element attack power +4',NULL);
INSERT INTO "RampageSkills" VALUES (23,'Ice Boost II','Water element attack power +6',NULL);
INSERT INTO "RampageSkills" VALUES (24,'Ice Boost III','Water element attack power +8',NULL);
INSERT INTO "RampageSkills" VALUES (25,'Ice Boost IV','Water element attack power +10',NULL);
INSERT INTO "RampageSkills" VALUES (26,'Dragon Boost I','Dragon element attack power +4',NULL);
INSERT INTO "RampageSkills" VALUES (27,'Dragon Boost II','Dragon element attack power +6',NULL);
INSERT INTO "RampageSkills" VALUES (28,'Dragon Boost III','Dragon element attack power +8',NULL);
INSERT INTO "RampageSkills" VALUES (29,'Poison Boost I','Poison buildup +3',NULL);
INSERT INTO "RampageSkills" VALUES (30,'Poison Boost II','Poison buildup +5',NULL);
INSERT INTO "RampageSkills" VALUES (31,'Poison Boost III','Poison buildup +7',NULL);
INSERT INTO "RampageSkills" VALUES (32,'Paralysis Boost I','Paralysis buildup +2',NULL);
INSERT INTO "RampageSkills" VALUES (33,'Paralysis Boost II','Paralysis buildup +4',NULL);
INSERT INTO "RampageSkills" VALUES (34,'Paralysis Boost III','Paralysis buildup +6',NULL);
INSERT INTO "RampageSkills" VALUES (35,'Sleep Boost I','Paralysis buildup +2',NULL);
INSERT INTO "RampageSkills" VALUES (36,'Sleep Boost II','Paralysis buildup +4',NULL);
INSERT INTO "RampageSkills" VALUES (37,'Sleep Boost III','Paralysis buildup +6',NULL);
INSERT INTO "RampageSkills" VALUES (38,'Blast Boost I','Blast buildup +3',NULL);
INSERT INTO "RampageSkills" VALUES (39,'Blast Boost II','Blast buildup +5',NULL);
INSERT INTO "RampageSkills" VALUES (40,'Blast Boost III','Blast buildup +7',NULL);
INSERT INTO "RampageSkills" VALUES (41,'Master Rider','Increases damage inflicted by Wyvern Riding, and increases the Wyvern Riding Timer.',NULL);
INSERT INTO "RampageSkills" VALUES (42,'Dulling Strike','Has a chance to increase attack power when your sharpness guage is green or lower.',NULL);
INSERT INTO "RampageSkills" VALUES (43,'Brutal Strike','Has a chance to increase damage with a negative affinity attack.',NULL);
INSERT INTO "RampageSkills" VALUES (44,'Silkbind Boost','Increases damage dealt using Silkbind attacks.',NULL);
INSERT INTO "RampageSkills" VALUES (45,'Fireblight Exploit','Increases damage to monsters afflicted with fireblight.',NULL);
INSERT INTO "RampageSkills" VALUES (46,'Waterblight Exploit','Increases damage to monsters afflicted with waterblight.',NULL);
INSERT INTO "RampageSkills" VALUES (47,'Thunderblight Exploit','Increases damage to monsters afflicted with thunderblight.',NULL);
INSERT INTO "RampageSkills" VALUES (48,'Iceblight Exploit','Increases damage to monsters afflicted with iceblight.',NULL);
INSERT INTO "RampageSkills" VALUES (49,'Element Exploit','Increases damage when exploiting a foe''s elemental weakness.',NULL);
INSERT INTO "RampageSkills" VALUES (50,'Wyvern Exploit','Increases damage to Bird, Flying, Brute, Piscine, and Fanged Wyverns, as well as Leviathans.',NULL);
INSERT INTO "RampageSkills" VALUES (51,'Anti-Aerial Species','Increases damage to flying monsters.',NULL);
INSERT INTO "RampageSkills" VALUES (52,'Anti-Aquatic Species','Increases damage to aquatic monsters.',NULL);
INSERT INTO "RampageSkills" VALUES (53,'Small Monster Exploit','Increases damage to small monsters.',NULL);
INSERT INTO "RampageSkills" VALUES (54,'Spiribird Doubled','Occasionally inceases the effect of Spiribirds.',NULL);
INSERT INTO "RampageSkills" VALUES (55,'Buddy Rally','Increases Palico and Palamute attack power and defense',NULL);
INSERT INTO "RampageSkills" VALUES (56,'Boost Equipped Coating','Coating element +10',NULL);
INSERT INTO "RampageSkills" VALUES (57,'Chameleos Soul','Landing a hit will yield a small chance of boosting Health, Stamina, Attack, or Defense.',NULL);
INSERT INTO "RampageSkills" VALUES (58,'Cluster Effect I','Enables loading of Cluster Bombs 1 & 2, and increases ammo capacity.',NULL);
INSERT INTO "RampageSkills" VALUES (59,'Cluster Effect II','Enables loading of all Cluster Bombs, and increases ammo capacity.',NULL);
INSERT INTO "RampageSkills" VALUES (60,'Coating Switch Boost','Coating element + 10',NULL);
INSERT INTO "RampageSkills" VALUES (61,'Spread Effect I','Enables using of spread ammo 1 & 2 and increases ammo capacity.',NULL);
INSERT INTO "RampageSkills" VALUES (62,'Spread Effect II','Enables using of all spread ammo and increases ammo capacity.',NULL);
INSERT INTO "RampageSkills" VALUES (63,'Pierce Effect I','Unlocks usage of 1 and 2 Pierce Ammo and increases ammo capacity',NULL);
INSERT INTO "RampageSkills" VALUES (64,'Pierce Effect II','Unlocks usage of al l Pierce Ammo and increases ammo capacity',NULL);
INSERT INTO "RampageSkills" VALUES (65,'Sticky Effect I','Able to use Stick Ammo 1 & 2 and increases ammo capacity.',NULL);
INSERT INTO "RampageSkills" VALUES (66,'Normal Effect I','Unlock the usage of Normal ammo 1 & 2 and increases ammo capacity.',NULL);
INSERT INTO "RampageSkills" VALUES (67,'Normal Effect II','Unlock all normal ammo and increases ammo capacity.',NULL);
INSERT INTO "RampageSkills" VALUES (68,'Magnamalo Soul','Increases attack when afflicted by hellfire status.',NULL);
INSERT INTO "RampageSkills" VALUES (69,'Lasting Arc Shot','Prolongs the bow''s arc shot effect.',NULL);
INSERT INTO "RampageSkills" VALUES (70,'Poison Coating Boost','Strengthens Poison Coating if coatings can be applied to weapon.',NULL);
INSERT INTO "RampageSkills" VALUES (71,'Paralysis Coating Boost','Strengthens Paralysis Coating if coatings can be applied to weapon.',NULL);
INSERT INTO "RampageSkills" VALUES (72,'Ibushi Soul','Increases elemental attack power with each piece of armor in the same set equipped.',NULL);
INSERT INTO "RampageSkills" VALUES (73,'Kinsect Level Boost I','Raises Kinsect level to 1.',NULL);
INSERT INTO "RampageSkills" VALUES (74,'Kinsect Level Boost II','Raises Kinsect level to 4.',NULL);
INSERT INTO "RampageSkills" VALUES (75,'Kinsect Level Boost III','Raises Kinsect level to 5.',NULL);
INSERT INTO "RampageSkills" VALUES (76,'Narwa Soul','Increases Attack with each piece of armor in the same set equipped.',NULL);
INSERT INTO "RampageSkills" VALUES (77,'Wyrmstake Boost','Increases Wyrmstake Cannon''s Damage level by 1',NULL);
INSERT INTO "RampageSkills" VALUES (78,'Maximum Volume','Increases a performance''s range of effect once it is activated',NULL);
INSERT INTO "RampageSkills" VALUES (79,'Valstrax Soul','Increases Dragon Element attack by 20% when afflicted with Dragonblight',NULL);
INSERT INTO "RampageSkills" VALUES (80,'Defense Grinder I','Sharpness has no change when guarding',NULL);
INSERT INTO "RampageSkills" VALUES (81,'Defense Grinder II','Sharpness regenerates slightly when guarding',NULL);
INSERT INTO "Skills" VALUES (8,'Increase Attack Power',7,'Attack Boost',NULL,'Attack +3*Attack +6*Attack +9*Attack +5% Bonus: +7* Attack +6% Bonus: +8*Attack +8% Bonus: +9*Attack +10% Bonus: +10','Attack Jewel 2');
INSERT INTO "Skills" VALUES (10,'Reduces maximum stamina depletion over time.',3,'Hunger Resistance','','Extends the time until your stamina cap reduces by 50%.*Extends the time until your stamina cap reduces by 100%.*Prevents your stamina cap from decreasing.','Hungerless Jewel 1');
INSERT INTO "Skills" VALUES (11,'Increases the quantity of herbs and other consumable items you gather.',4,'Botanist','','One extra consumable herb item per gather*One extra consumable herb, fruit, nut, or seed item per gather.*One extra consumable herb, fruit, nut, seed, or insect item per gather.*One extra consumable herb, fruit, nut, seed, insect, or mushroom item per gather.','Botany Jewel 1');
INSERT INTO "Skills" VALUES (12,'Increases the number of times you can use a gathering point.',3,'Geologist','',' Allows you to gather one extra time from bonepiles.*Allows you to gather one extra time from gathering points.*Allows you to gather on extra time from mining outcrops.','Geology Jewel 1');
INSERT INTO "Skills" VALUES (13,'Increases the amount recovered when restoring health.',3,'Recovery Up','','Slightly increases recovery.*Increases recovery.*Greatly increases recovery.','Medicine Jewel 2');
INSERT INTO "Skills" VALUES (14,'Has a predetermined chance of reducing the damage you take.',3,'Divine Blessing','','While active, reduces damage taken by 15%*While active, reduces damage taken by 30%*While active, reduces damage taken by 50%','Protection Jewel 2');
INSERT INTO "Skills" VALUES (15,'Improves your handling of Wirebugs.',3,'Wirebug Whisperer','','Extends the duration you can keep a Wirebug by 30%*Further increases passive Wirebug recovery rate*Further increases passive recovery rate while on the ground.','Wirebug Jewel 2');
INSERT INTO "Skills" VALUES (16,'Increases attack power and defense when health drops to 35% or lower.',5,'Heroics','','While active, increases defense by 50 points.*Attack +5% and defense +50 while active.*Attack +5% and defense +100 while active.* Attack +10% and defense +100 while active*While active, attack power +30% and defense increasing effects are negated.','Potential Jewel 2');
INSERT INTO "Skills" VALUES (17,'Increases affinity.',7,'Critical Eye','','Affinity +5%*Affinity +10%*Affinity +15%*Affinity +20%*Affinity +25%*Affinity +30%*Affinity +40%','Expert Jewel 2');
INSERT INTO "Skills" VALUES (18,'Reduces stamina consumption when running on walls.',3,'Wall Runner','','Reduces stamina consumption by 25% while wall running.*Reduces stamina consumption by 50% while wall running.*Wall running temporarily increases attack power.','Wall Run Jewel 2');
INSERT INTO "Skills" VALUES (19,'Increases defense. Resistances will also improve as the level increases.',7,'Defense Boost ','','Defense +5*Defense +10*Defense +5 and Bonus +10*Defense +5%, Bonus +20, All elemental resistances +3*Defense +8%, Bonus +20, All elemental resistances +3*Defense +8%, Bonus +35, All elemental resistances + 5*Defense +10%, Bonus +35, All elemental resistances +5','Defense Jewel 1');
INSERT INTO "Skills" VALUES (20,'Increases attack when your health if full',3,'Peak Performance','','Attack +5 while active*Attack +10 while active*Attack +20 while active','Flawless Jewel 2');
INSERT INTO "Skills" VALUES (21,'Reduces knockbacks and stamina depletion when guarding.',5,'Guard','','Very slightly decreases the impact of attacks.*Slightly decreases the impact of attacks and reduces stamina depletion by 15%.*Decreases the impact of attacks and reduces stamina depletion by 15%*Decreases the impact of attacks and reduces stamina depletion by 30%*Greatly decreases the impact of attacks and reduces stamina depletion by 30%','Ironwall Jewel 2');
INSERT INTO "Skills" VALUES (22,'Speeds up stamina recovery.',3,'Stamina Surge','','Stamina recovery speed +10%*Stamina recovery speed +20%*Stamina recovery speed +40% ','Refresh Jewel 2');
INSERT INTO "Skills" VALUES (23,'Extends the duration of some item effects.',3,'Item Prolonger','','Item effect duration: +10%*Item effect duration: +25%*Item effect duration: +50%*','Enduring Jewel 1');
INSERT INTO "Skills" VALUES (24,'Speeds up weapon sheathing.',3,'Quick Sheath','','Slightly increases sheathing speed.*Moderately increases sheathing speed.*Greatly increases sheathing speed.','Sheath Jewel 1');
INSERT INTO "Skills" VALUES (25,'Reduce stun duration.',3,'Stun Resistance','','Reduces the duration of stun by 60%.*Reduces the duration of stun by 90%.*Prevents stun','Steadfast Jewel 1');
INSERT INTO "Skills" VALUES (26,'Speeds healing of recoverable damage (the red portion of the health gauge).',3,'Recovery Speed','','Doubles the speed at which you heal recoverable damage.*Triples the speed at which you heal recoverable damage.*Quadruples the speed at which you heal recoverable damage.','Racovery Jewel 1');
INSERT INTO "Skills" VALUES (27,'Reduces stamina depletion when evading, blocking, or doing certain other actions.',5,'Constitution','','Reduces fixed stamina depletion by 10%.*Reduces fixed stamina depletion by 20%.*Reduces fixed stamina depletion by 30%.*Reduces fixed stamina depletion by 40%.*Reduces fixed stamina depletion by 50%.','Physique Jewel 2');
INSERT INTO "Skills" VALUES (28,'Increases ice element attack power. (Elemental attack power has a maximum limit.)',5,'Ice Attack ','','Ice attack +2*Ice attack +3*Ice attack +5%, Bonus: +4*Ice attack +10%, Bonus +4*Ice attack +20%, Bonus +4','Frost Jewel 1');
INSERT INTO "Skills" VALUES (29,'Reduces the duration of sleep.',3,'Sleep Resistance ','','Reduces the duration of sleep by 30%.*Reduces the duration of sleep by 60%*Prevents sleep.','Pep Jewel 1');
INSERT INTO "Skills" VALUES (30,'Increases bowgun loading capacity. (There is a cap to loading capacity.)',3,'Ammo Up','','Expands clip size for some ammo types.*Expands clip size for many ammo types.*Expands clip size for most ammo types.','Capacity Jewel 2');
INSERT INTO "Skills" VALUES (31,'Suppresses the deviation of bowgun shots.',2,'Steadiness','','Deviation -1*Deviation -2','Sniper Jewel 1');
INSERT INTO "Skills" VALUES (32,'Increases the attack power of Normal Ammo and Rapid-type arrows.',3,'Normal/Rapid Up','','Slightly increases the power of Normal Ammo and Rapid-type arrows.*Increases the power of Normal Ammo and Rapid-type arrows.*Greatly increases the power of Normal Ammo and Rapid-type arrows.','Forceshot Jewel 3');
INSERT INTO "Skills" VALUES (33,'Sliding increases your affinity for a short while.',1,'Affinity Sliding ','','Enable skill use.','Slider Jewel 1');
INSERT INTO "Skills" VALUES (34,'Increases water element attack power. (Elemental attack power has a maximum limit.)',5,'Water Attack','','Water attack +2*Water attack +3*Water attack +5%, Bonus: +4*Water attack +10%, Bonus +4*Water attack +20%, Bonus +4','Stream Jewel 1');
INSERT INTO "Skills" VALUES (35,'Speeds up weapon sharpening when using a whetstone.',3,'Speed Sharpening','','Removes one cycle from the sharpening process.*Removes two cycles from the sharpening process.*Removes three cycles from the sharpening process.','Grinder Jewel 1');
INSERT INTO "Skills" VALUES (36,'Makes it easier to break or sever parts of large monsters.',3,'Partbreaker','','Part damage: +10%*Part damage: +20%*Part damage: +30%','Destroyer Jewel 2');
INSERT INTO "Skills" VALUES (37,'Makes it easier to break or sever parts of large monsters.',3,'Stamina Thief','','Exhaust power +20%*Exhaust power +30%*Exhaust power +40%','Drain Jewel 1');
INSERT INTO "Skills" VALUES (38,'Increases the fill rate for weapons with gauges and the charge rate for weapons with charge attacks.',3,'Focus','','5% faster gauge fill rate and 5% faster charge times.*10% faster gauge fill rate and 10% faster charge times.*20% faster gauge fill rate and 15% faster charge times.','Charger Jewel 2');
INSERT INTO "Skills" VALUES (39,'Reduces impairments to mobility while stuck in monster muck or deep snow.',2,'Muck Resistance','','Reduces limits on movement speed.*Negates limits to movement speed.','Muck Jewel 1');
INSERT INTO "Skills" VALUES (40,'Lets you digest mushrooms that would otherwise be inedible and gain their advantageous effects.',3,'Mushroomancer','','Lets you digest blue mushrooms and toadstools*Additionally lets you digest nitroshrooms and parashrooms.*Additionally lets you digest mandragoras and exciteshrooms.','Fungiform Jewel 3');
INSERT INTO "Skills" VALUES (41,'Increases water resistance. Also improves defense at higher levels.',3,'Water Resistance ','','Water resistance +6*Water resistance +12*Water resistance +20 and Defense +10','Water Res Jewel 1');
INSERT INTO "Skills" VALUES (42,'Increases bowgun reloading and bow coating loading speed.',3,'Reload Speed','','Bowgun speed +1. Improves bow handling.*Bowgun speed +2. Loads bow coating automatically.*Bowgun speed +3.','Quickload Jewel 1');
INSERT INTO "Skills" VALUES (43,'Reduces recoil while firing bowgun ammo',3,'Recoil Down','','Recoil -1*Recoil -2*Recoil -3','Absorber Jewel 1');
INSERT INTO "Skills" VALUES (44,'Shortens the distance before ammo and arrows reach maximum power.',3,'Aim Booster','','Slightly extends range.*Extends range.*Greatly extends range.','Precise Jewel 2');
INSERT INTO "Skills" VALUES (45,'Increases the attack power of Spread Ammo and Spread-type arrows.',3,'Spread Up','','Slightly increases the power of Spread Ammo, Shrapnel Ammo, and Spread-type arrows.*Increases the power of Spread Ammo, Shrapnel Ammo, and Spread-type arrows.*Greatly increases the power of Spread Ammo, Shrapnel Ammo, and Spread-type arrows.','Spread Jewel 3');
INSERT INTO "Skills" VALUES (46,'Gives you  a predetermined chance of consuming food or drink item for free.',3,'Free Meal','',' Activates 10% of the time.*Activates 25% of the time.*Activates 45% of the time.','Satiated Jewel 1');
INSERT INTO "Skills" VALUES (47,'Increases the attack power of piercing ammo and Piercing-type arrows.',3,'Pierce Up','','Slightly increases the power of Piercing Ammo and Piercing-type arrows.*Increases the power of Piercing Ammo and Piercing-type arrows.*Greatly increases the power of Piercing Ammo and Piercing-type arrows.','Pierce Jewel 3');
INSERT INTO "Skills" VALUES (48,'Strengthens explosive attacks like shells, Wyvern''s Fire, charge blade phial attacks, and Sticky Ammo.',3,'Artillery','','Increases power of each attack by 10% and reduces Wyvern''s Fire cooldown by 15%.*Increases power of each attack by 20% and reduces Wyvern''s Fire cooldown by 30%.*Increases power of each attack by 30% and reduces Wyvern''s Fire cooldown by 50%.','Artillery Jewel 2');
INSERT INTO "Skills" VALUES (49,'Grants protection against ground tremors.',3,'Tremor Resistance','','Nullifies minor ground tremors.*Nullifies minor ground tremors and reduces the effects of major ground tremors.*Nullifies minor and major ground tremors.','Thunder Res Jewel 1');
INSERT INTO "Skills" VALUES (50,'Increases the attention drawn when attacking a monster.',1,'Diversion','','Activates skill effect.','Diversion Jewel 1');
INSERT INTO "Skills" VALUES (51,'Increases paralysis element attack power. (Elemental attack power has a maximum limit.)',3,'Paralysis Attack','','Paralysis buildup +5% and Bonus: +1.*Paralysis buildup +10% and Bonus: +2*Paralysis5buildup +20% and Bonus: +1','Paralyzer Jewel 2');
INSERT INTO "Skills" VALUES (52,'Extends the invulnerability period when evading.',5,'Evade Window','','Very slightly increases invulnerability window.*Slightly increases invulnerability window.*Increases invulnerability window.*Greatly increases invulnerability window.*Massively increases invulnerability window.','Evasion Jewel 2');
INSERT INTO "Skills" VALUES (53,'Improves your Wyvern Riding skills.',1,'Master Mounter ','','Makes filling the Riding Gauge easier and increases ease of parrying','Rodeo Jewel 2');
INSERT INTO "Skills" VALUES (54,'Increases affinity if stamina is kept full for a period of time.',3,'Maximum Might','',' While active, increases affinity by 10%.*While active, increases affinity by 20%.*While active, increases affinity by 30%.','Mighty Jewel 2');
INSERT INTO "Skills" VALUES (55,'Increases overall performance speed and shockwave damage.',1,'Horn Maestro','','Activates skill effect','Sonorous Jewel 1');
INSERT INTO "Skills" VALUES (56,'Makes it easier to stun monsters.',3,'Slugger','','Stun power +20%*Stun power +30%*Stun power +40%','KO Jewel 2');
INSERT INTO "Skills" VALUES (57,'Increases evade distance.',3,'Evade Extender ','','Slightly extends evasion distance.*Extends evasion distance.*Greatly extends evasion distance.','Jumping Jewel 2');
INSERT INTO "Skills" VALUES (58,'Increases poison element attack power. (Elemental attack power has a maximum limit.)',3,'Poison Attack ','','Poison buildup +5% and Bonus +1*Poison buildup +10% and Bonus +2*Poison  buildup +20% and Bonus +5','Venom Jewel 1');
INSERT INTO "Skills" VALUES (59,'Increases fire element attack power. (Elemental attack power has a maximum limit.)',5,'Fire Attack ','','Fire attack +2*Fire attack +3*Fire attack +5%, Bonus: +4*Fire attack +10%, Bonus +4*Fire attack +20%, Bonus +4','Blaze Jewel 1');
INSERT INTO "Skills" VALUES (60,'Slows down stamina depletion for actions which continuously drain stamina (such as dashing).',3,'Marathon Runner','','Reduces continuous stamina depletion by 15%*Reduces continuous stamina depletion by 30%*Reduces continuous stamina depletion by 50%','Sprinter Jewel 2');
INSERT INTO "Skills" VALUES (61,'Long swords, dual blades, insect glaives, switch axes, and charge blades stay powered up longer.',3,'Power Prolonger','','Slightly boosts the duration weapons are powered up*Boosts the duration weapons are powered up.*Greatly boosts the duration weapons are powered up.','Enhancer Jewel 2');
INSERT INTO "Skills" VALUES (62,'Increases thunder elemental attack power. (Elemental attack power has a maximum limit.)',5,'Thunder Attack ','','Thunder attack +2*Thunder attack +3*Thunder attack +5%, Bonus: +4*Thunder attack +10%, Bonus +4*Thunder attack +20%, Bonus +4','Bolt Jewel 1');
INSERT INTO "Skills" VALUES (63,'Increases meat-eating and item-consumption speed.',3,'Speed Eating ','','Slightly increases eating speed.*Increases eating speed.*Greatly increases eating speed.','Gobbler Jewel 2');
INSERT INTO "Skills" VALUES (64,'Increases the power of bowgun special ammo and Dragon Piercer.',2,'Special Ammo Boost','','Increases the power of bowgun special ammo and Dragon Piercer by 10%.*Increases the power of bowgun special ammo and Dragon Piercer by 20%.','Trueshot Jewel 2');
INSERT INTO "Skills" VALUES (66,'Grants protection against wind pressure.',3,'Windproof','','Negates minor wind pressure*Negates minor and major wind pressure.*Negates minor and major wind pressure and reduces the effects of dragon wind pressure.','Wind Res Jewel 1');
INSERT INTO "Skills" VALUES (67,'Reduces the duration of paralysis.',3,'Paralysis Resistance ','','Reduces the duration of paralysis by 30%*Reduces the duration of paralysis by 60%*Prevents paralysis','Antipara Jewel 1');
INSERT INTO "Skills" VALUES (68,'Increases dragon resistance. Also improves defense at higher levels.',3,'Dragon Resistance ','','Dragon resistance +6*Dragon resistance +12*Dragon resistance +20 and Defense +10','Dragon Res Jewel 1');
INSERT INTO "Skills" VALUES (69,'Increases switch speed and power for switch axes and charge blades.',3,'Rapid Morph','','Speed +10%*Speed +20% Morph attack damage +10%*Speed +30% Morph attack damage +20%','Quickswitch Jewel 2');
INSERT INTO "Skills" VALUES (70,'Grants protection against blast blight.',3,'Blast Resistance ','','Delays blast blight and reduces blast damage.*Greatly delays blast blight and greatly reduces blast damage.*Prevents blast blight.','Antiblast Jewel 1');
INSERT INTO "Skills" VALUES (71,'Increases bowgun reloading and bow coating loading speed.',3,'Reload Speed ','','Bowgun speed +1. Improves bow handling.*Bowgun speed +2. Loads bow coating automatically.*Bowgun speed +3.','Quickload Jewel 1');
INSERT INTO "Skills" VALUES (72,'Allows you to do a dive-evade when facing towards large monsters, and extends the dive-evade distance.',1,'Leap Of Faith','','Enables skill use','Dive Jewel 1');
INSERT INTO "Skills" VALUES (73,'Increases attack power when your weapon sharpness is low.',3,'Bludgeoner','','+5% attack power when your weapon sharpness gauge is yellow or lower.*+10% attack power when your sharpness gauge is yellow or lower.*+10% attack power when your sharpness gauge is green or lower.','Blunt Jewel 2');
INSERT INTO "Skills" VALUES (74,'Increases fire resistance. Also improves defense at higher levels.',3,'Fire Resistance','','Fire resistance +6*Fire resistance +12*Fire resistance+20 and Defense +10','Fire Res Jewel 1');
INSERT INTO "Skills" VALUES (75,'Increases elemental damage (fire, water, thunder, ice, dragon) when landing critical hits.',3,'Critical Element','','Grants elemental damage +5% while active*Grants elemental damage +10% while active*Grants elemental damage +15% while active','Crit Element Jewel 3');
INSERT INTO "Skills" VALUES (76,'Allows the effects of certain items to also affect nearby allies.',5,'Wide-Range','','Items affect nearby allies with 33% of their efficacy.*Items affect nearby allies in a wider radius with 33% of their efficacy.*Items affect nearby allies in a wider radius with 66% of their efficacy.*Items affect nearby allies in a much wider radius with 66% of their efficacy.*Items affect nearby allies in a much wider radius with full efficacy.','Friendship Jewel 2');
INSERT INTO "Skills" VALUES (77,'Bow and bowgun shots have a chance not to expend coatings or ammo.',3,'Spare Shot','','Activates 3% of the time.*Activates 10% of the time.*Activates 20% of the time.','Thrift Jewel 2');
INSERT INTO "Skills" VALUES (78,'Improves reloading, and increases the gunlance''s shell capacity and charge blade''s phial capacity.',2,'Load Shells','','Increases ammo and coating reloading speed.*Gunlance loading capacity +1 Increases charge blade phials.','Magazine Jewel 2');
INSERT INTO "Skills" VALUES (79,'Increases sleep element attack power. (Elemental power has a maximum limit.)',3,'Sleep Attack','','Sleep buildup +5% Bonus: +1*Sleep buildup +10% Bonus: +2*Sleep buildup +20% Bonus: +5','Sleep Jewel 2');
INSERT INTO "Skills" VALUES (80,'Increases the damage of explosive items.',3,'Bombardier','','Explosive power +10%*Explosive power +20%*Explosive power +30%','Bomber Jewel 1');
INSERT INTO "Skills" VALUES (81,'Grants protection against all elemental blights.',3,'Blight Resistance','','Reduces the duration of all elemental blights by 50%.*Reduces the duration of all elemental blights by 75%.*Nullifies all elemental blights.','Resistor Jewel 2');
INSERT INTO "Skills" VALUES (82,'Increases affinity for a short time after performing a draw attack. (Does not include Silkbind attacks.)',3,'Critical Draw','','Affinity +10%*Affinity +20%*Affinity +40%','Draw Jewel 2');
INSERT INTO "Skills" VALUES (83,'Prevents attacks from knocking you back during a jump',1,'Jump Master','','Negates knockback during jumps.','Leap Jewel 3');
INSERT INTO "Skills" VALUES (84,'Increases dragon element attack power. (Elemental attack power has a maximum limit.)',5,'Dragon Attack','','Dragon attack +2*Dragon attack +3*Dragon attack +5% and Bonus: +4*Dragon attack +10% and Bonus: +4*Dragon attack +20% and Bonus: +4','Dragon Jewel 1');
INSERT INTO "Skills" VALUES (85,'Prevents your weapon from losing sharpness.',3,'Razor Sharp','','Activates 10% of the time*Activates 25% of the time*Activates 50% of the time','Razor Jewel 2');
INSERT INTO "Skills" VALUES (86,'Increases attack power and affinity when large monsters become enraged',5,'Agitator','',' Attack +4 and Affinity +3% while active.*Attack +8 and Affinity +5% while active.*Attack +12 and Affinity +7% while active.*Attack +16 and Affinity +10% while active.*Attack +20 and Affinity +15% while active.','Challenger Jewel 2');
INSERT INTO "Skills" VALUES (87,'Increases attack when you have recoverable damage (the red portion of your health gauge)',5,'Resentment','','Attack +5 while active*Attack +10 while active.*Attack +15 while active.*Attack +20 while active.*Attack +25 while active.','Furor Jewel 2');
INSERT INTO "Skills" VALUES (88,'Temporarily increases attack power after being knocked back.',3,'Counterstrike','','Attack +10 after activation.*Attack +15 after activation.*Attack +25 after activation.','Counter Jewel 2');
INSERT INTO "Skills" VALUES (89,'Grants hellfire resistance and confers explosive hellfire powers to your attacks.',4,'Hellfire Cloak','','Reduces damage from hellfire.*Increases damage from hellfire blasts.*Inflicts hellfire blight when monsters are enraged.*Effect persists for one minute after a monster''s rage has subsided.','Hellfire Jewel 3');
INSERT INTO "Skills" VALUES (90,'Reduces bubble blight and grants increased evasion when afflicted.',3,'Bubbly Dance','','Reduces the effects of major bubbleblight.*Reduces major bubbleblight to minor bubbleblight and increases evasiveness while afflicted.*Also inflicts bubbleblight when performing consecutive evasive movement.','Bubble Jewel 2');
INSERT INTO "Skills" VALUES (91,'Temporarily increases affinity and reduces stamina depletion when certain conditions are met',5,'Latent Power','','While active, increases affinity by 10% and reduces stamina depletion by 30%*While active, increases affinity by 20% and reduces stamina depletion by 30%*While active, increases affinity by 30% and reduces stamina depletion by 50%*While active, increases affinity by 40% and reduces stamina depletion by 50%*While active, increases affinity by 50% and reduces stamina depletion by 50%','Throttle Jewel 2');
INSERT INTO "Skills" VALUES (92,'Increases your attack and defense when you fall in battle. (Disabled for some quests. Can stack twice.)',1,'Fortify','','Increases attack by 10% and defense by 15% with each use.','Fortitude Jewel 2');
INSERT INTO "Skills" VALUES (93,'Adds a stun effect to draw attacks and slightly increases attack power. (Does not include Silkbind attacks.)',3,'Punishing Draw','','Applies a minor chance to stun. Attack power of draw attacks +3*Applies a chance to stun. Attack power of draw attacks +5* Applies a great chance to stun. Attack power of draw attacks +7','Sharp Jewel 2');
INSERT INTO "Skills" VALUES (94,'Grants protection from large monsters'' roars.',5,'Earplugs','','Reduces the effects of weak monster roars.*Nullifies weak monster roars.*Nullifies weak monster roars and reduces the effects of strong monster roars.*Nullifies weak and strong monster roars.*Nullifies weak and strong monster roars. Reduces the effects of powerful monster roars.','Earplug Jewel 3');
INSERT INTO "Skills" VALUES (95,'Temporarily increases attack power after executing a perfectly-timed guard.',3,'Offensive Guard','','+5% while active.*+10% while active.*+15% while active.','Guardian Jewel 3');
INSERT INTO "Skills" VALUES (96,'Increases blast element attack power.',3,'Blast Attack','','Blast buildup +5% Bonus: +1*Blast buildup +10% Bonus: +2*Blast buildup +20% Bonus: +5','Blast Jewel 2');
INSERT INTO "Skills" VALUES (97,'Reduces damage while poisoned.',3,'Poison Resistance','','Reduces the number of times you take poison damage.*Greatly reduces the number of times you take poison damage.*Prevents poison and reduces venom','Antidote Jewel 1');
INSERT INTO "Skills" VALUES (98,'Increases attack power when you are suffering from an abnormal status.',3,'Resuscitate','','Attack +5 while active.*Attack +10 while active.*Attack +20 while active.','Crisis Jewel 2');
INSERT INTO "Skills" VALUES (99,'Prevents knockbacks and other reactions to small damage.',3,'Flinch Free','','Prevents knockbacks.*Prevents knockbacks- Tripping is reduced to a knockback instead.*Prevents knockbacks and tripping.','Brace Jewel 1');
INSERT INTO "Skills" VALUES (100,'Extends the weapon sharpness gauge. However, it will not increase the gauge past its maximum.',5,'Handicraft','','Weapon sharpness +10*Weapon sharpness +20*Weapon sharpness +30*Weapon sharpness +40*Weapon sharpness +50','Handicraft Jewel 3');
INSERT INTO "Skills" VALUES (101,'Weapon sharpness does not decrease for a set time after sharpening.',3,'Protective Polish','','Effect lasts 30 seconds*Effect lasts 60 seconds *Effect lasts 90 seconds','Sharp Jewel 2');
INSERT INTO "Skills" VALUES (102,'Improves light bowgun rapid fire',3,'Rapid Fire Up','','Rapid Fire damage +5%*Rapid Fire damage +10%*Rapid Fire damage +20%','Salvo Jewel 3');
INSERT INTO "Skills" VALUES (103,'High chance of increased capture rewards (No effect when joining mid-quest)',1,'Capture Master','','Activates skill effect.',NULL);
INSERT INTO "Skills" VALUES (104,'Allows you to guard against ordinarily un-blockable attacks.',3,'Guard Up','','Reduces damage taken by 30%*Reduces damage taken by 50%*Reduces damage taken by 80%','Shield Jewel 2');
INSERT INTO "Skills" VALUES (105,'Good chance of increased quest rewards. (No effect when joining mid-quest.)',3,'Good Luck','','Slightly increases luck.*Increases luck.*Greatly increases luck.','Fate Jewel 3');
INSERT INTO "Skills" VALUES (106,'Increases the damage of critical hits',3,'Critical Boost','','Increases damage dealt by critical hits to 30%*Increases damage dealt by critical hits to 35%*Increases damage dealt by critical hits to 40%','Critical Jewel 2');
INSERT INTO "Skills" VALUES (107,'Increases the affinity of attacks that exploit a monster weak spot.',3,'Weakness Exploit','','Attacks that hit weak spots have 15% increases affinity.*Attacks that hit weak spots have 30% increases affinity.*Attacks that hit weak spots have 50% increases affinity.','Tenderizer Jewel 2');
INSERT INTO "Skills" VALUES (108,'Your attacks are deflected less and deal more damage to hard targets.',3,'Mind''s Eye','','+10% damage to hard targets and a 50% reduction to your attacks being deflected.*+15% damage to hard targets and a 100% reduction to your attacks being deflected.*+30% damage to hard targets and a 100% reduction to your attacks being deflected.','Mind''s Eye Jewel 2');
INSERT INTO "Skills" VALUES (109,'Prevents knockback from attacks while carving',1,'Carving Pro','','Activates skill effect','Carver Jewel 1');
INSERT INTO "Skills" VALUES (110,'Increases max bow charge level by one',1,'Bow Charge Plus','','Activates skill effect.',NULL);
INSERT INTO "Skills" VALUES (111,'Gain the power of the elder dragon Wind Serpent Ibushi',5,'Wind Alignment','','Dragon Resistance +1*Dragon Resistance +2*Dragon Resistance +3*Dragon Resistance +4*Also grants the effect Great Luck (Fortunate)',NULL);
INSERT INTO "Skills" VALUES (112,'Strengthens thunder and dragon power and improves skills of the same elements.',5,'Stormsoul','','Thunder and Dragon attack +5%*Thunder and Dragon attack +10%*Thunder and Dragon attack +15%*Also increases the level of other skills by +1*Also increases the level of other skills by +1 (Stacks with previous Bonus)',NULL);
INSERT INTO "Skills" VALUES (113,'Gain the power of the elder dragon Thunder Serpent Narwa',5,'Thunder Alignment','','Thunder Resistance +1*Thunder Resistance +2*Thunder Resistance +3*Thunder Resistance +4*Also grants the effect Great Luck (Fortunate)',NULL);
INSERT INTO "Skills" VALUES (114,'Gain the power of the elder dragon Chameleos',4,'Chameleos Blessing','','Sometimes increases the effects of Spiribirds.*Also negates minor and major wind pressure.*Also extends the duration of your poison''s effect on monsters*Also negates all wind pressure.',NULL);
INSERT INTO "Skills" VALUES (116,'Gain the power of the elder dragon Kushala Daora',4,'Kushala Blessing','','Water and Ice attack +5%*Water and Ice attack +10%*Also allows recovery to exceed the red portion of the health gauge.*Also nullifies heat damage.','');
INSERT INTO "Skills" VALUES (117,'Gain the power of the elder dragon Teostra',4,'Teostra Blessing','','Fire attack and blast buildup +5%*Fire attack and blast buildup +10%*Also prevents poison and venom.*Also negates theft.',NULL);
INSERT INTO "Skills" VALUES (118,'Prevents your weapon from losing sharpness during critical hits',3,'Master''s Touch','','Grants a 20% chance of no sharpness loss while active.*Grants a 40% chance of no sharpness loss while active.*Grants a 80% chance of no sharpness loss while active.','Mastery Jewel 2');
INSERT INTO "Skills" VALUES (119,'Draconic energy fills you after losing a certain amount of health. Weapons lose all non-dragon effects.',5,'Dragonheart','','When your health is at 50% or less, you contract dragonblight, and all elemental resistances are set to 30.*When your health is at 50% or less, you contract dragonblight, and all elemental resistances are set to 50.*When your health is at 70% or less, you contract dragonblight, and all elemental resistances are set to 50.*Contract dragonblight when at 70% health or less. Sets elemental resistances to 50 and gain 5% attack power.*Contract dragonblight when at 80% health or less. Sets elemental resistances to 50 and gain 10% attack power.',NULL);
INSERT INTO "Weapons" VALUES (170,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Cleaver I',25.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (171,0.0,21.0,200,0,0,0,0,'Dragon',12.0,10.0,'Azure Elder Great Sword II',4.0,'None',0.0,6,4.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','GreatSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (172,0.0,0.0,180,0,0,0,0,'Dragon',10.0,25.0,'Azure Elder Great Sword I',5.0,'None',0.0,5,5.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (173,10.0,0.0,190,3,0,0,0,'Thunder',24.0,21.0,'Demon Rod II',9.0,'None',0.0,6,4.0,0,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (174,10.0,0.0,180,0,0,0,0,'Thunder',20.0,20.0,'Demon Rod I',4.0,'None',0.0,5,11.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','GreatSword',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (175,0.0,10.0,200,2,1,0,0,'Blast',25.0,20.0,'Sinister Shadowblade',2.0,'None',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','GreatSword',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (176,0.0,0.0,140,0,0,0,0,'Blast',18.0,21.0,'Sinister Blade II',5.0,'None',0.0,3,40.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','GreatSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (177,0.0,0.0,130,0,0,0,0,'Blast',15.0,20.0,'Sinister Blade I',4.0,'None',0.0,3,37.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (178,0.0,2.0,150,1,1,0,0,'Ice',35.0,24.0,'Lagombi Charlotte',7.0,'None',0.0,4,14.0,0,NULL,'Attack Boost II/Ice Boost II/Dulling Strike','GreatSword',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (179,0.0,0.0,100,0,0,0,0,'Ice',25.0,6.0,'Snowclad II',14.0,'None',0.0,2,16.0,0,NULL,'Attack Boost I/Ice Boost II/Small Monster Exploit','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (180,0.0,0.0,90,0,0,0,0,'Ice',20.0,0.0,'Snowclad I',19.0,'None',0.0,1,16.0,0,NULL,'Attack Boost I/Ice Boost I/Small Monster Exploit','GreatSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (181,0.0,0.0,170,2,1,1,0,'Water',35.0,20.0,'Cataclysm Blade',10.0,'None',0.0,5,14.0,0,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','GreatSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (182,0.0,0.0,100,0,0,0,0,'Water',32.0,12.0,'Cataclysm Sword II',15.0,'None',0.0,2,11.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (183,0.0,0.0,90,0,0,0,0,'Water',30.0,9.0,'Cataclysm Sword I',16.0,'None',0.0,2,9.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (184,0.0,2.0,170,1,0,0,0,'Thunder',35.0,29.0,'Usurper''s Storm II',6.0,'None',0.0,5,14.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (185,0.0,0.0,120,0,0,0,0,'Thunder',30.0,20.0,'Usurper''s Storm I',9.0,'None',0.0,3,16.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (186,-20.0,0.0,220,3,0,0,0,'Fire',26.0,0.0,'Gnashing Flammenzahn',30.0,'None',0.0,6,30.0,0,NULL,'Affinity Boost II/Fire Boost III/Brutal Strike','GreatSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (187,-20.0,0.0,200,3,0,0,0,'Fire',24.0,11.0,'Flammenzahn II',25.0,'None',0.0,5,28.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','GreatSword',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (188,-20.0,0.0,140,0,0,0,0,'Fire',20.0,8.0,'Flammenzahn I',17.0,'None',0.0,3,28.0,0,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (189,0.0,7.0,180,0,0,0,0,'None',0.0,7.0,'Jaggi Greatblade',38.0,'None',0.0,5,11.0,0,NULL,'Defense Boost II/Dulling Strike/Defense Grinder I','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (190,0.0,0.0,110,0,0,0,0,'None',0.0,8.0,'Hack Blade II',34.0,'None',0.0,2,11.0,0,NULL,'Defense Boost II/Dulling Strike/Small Monster Exploit','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (191,0.0,0.0,100,0,0,0,0,'None',0.0,4.0,'Hack Blade I',26.0,'None',0.0,2,9.0,0,NULL,'Defense Boost I/Dulling Strike/Small Monster Exploit','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (192,-25.0,10.0,230,0,0,0,16,'None',0.0,28.0,'Feud Hornsword',15.0,'None',0.0,6,9.0,0,NULL,'Affinity Boost III/Defense Boost II/Defense Grinder I','GreatSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (193,-25.0,7.0,210,0,0,0,12,'None',0.0,27.0,'Quarrel Hornsword II',16.0,'None',0.0,6,24.0,0,NULL,'Affinity Boost II/Defense Boost I/Defense Grinder I','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (194,-25.0,0.0,170,0,0,0,8,'None',0.0,25.0,'Quarrel Hornsword I',10.0,'None',0.0,3,14.0,0,NULL,'Affinity Boost I/Defense Boost I/Dulling Strike','GreatSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (195,0.0,5.0,210,1,0,0,0,'Fire',40.0,25.0,'Rathalos Firesword',10.0,'None',0.0,6,10.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (196,0.0,4.0,190,1,0,0,0,'Fire',38.0,29.0,'Red Wing II',10.0,'None',0.0,6,11.0,0,NULL,'Attack Bonus II/Fire Boost I/Element Exploit','GreatSword',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (197,0.0,4.0,180,1,0,0,0,'Fire',36.0,25.0,'Red Wing I',19.0,'None',0.0,5,16.0,0,NULL,'Attack Bonus II/Fire Boost I/Element Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (198,-10.0,10.0,210,0,0,0,0,'Water',20.0,20.0,'Terracutter',17.0,'None',0.0,6,28.0,0,NULL,'Affinity Boost II/Water Boost II/Brutal Strike','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (199,-10.0,7.0,200,0,0,0,0,'Water',17.0,21.0,'Jyura Mudblade II',17.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost I/Water Boost II/Brutal Strike','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (200,0.0,6.0,180,0,0,0,0,'Thunder',46.0,9.0,'Thunderbolt Great Sword I',4.0,'None',0.0,6,4.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','GreatSword',0.0,46.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (201,-10.0,2.0,190,0,0,0,0,'Water',15.0,20.0,'Jyura Mudblade I',22.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost I/Water Boost I/Brutal Strike','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (202,10.0,5.0,180,1,0,0,0,'Ice',40.0,20.0,'Icesteel Edge I',10.0,'None',0.0,6,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (203,0.0,10.0,180,3,1,1,0,'Poison',60.0,20.0,'Grand Shamshir I',5.0,'None',0.0,6,25.0,0,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (204,0.0,0.0,170,2,0,0,0,'Dragon',42.0,0.0,'Redwing Claymore I',0.0,'None',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','GreatSword',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (205,0.0,4.0,190,0,0,0,0,'Blast',45.0,18.0,'King Teostra Blade',10.0,'None',0.0,7,35.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','GreatSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (206,10.0,2.0,210,3,0,0,0,'Thunder',26.0,20.0,'Great Demon Rod',15.0,'None',0.0,7,15.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','GreatSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (207,0.0,16.0,190,2,1,1,0,'Poison',66.0,18.0,'Foreboding Shamshir',8.0,'None',0.0,7,12.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (208,10.0,6.0,190,1,0,0,0,'Ice',45.0,8.0,'Daora''s Decimator',18.0,'None',0.0,7,18.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','GreatSword',2.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (209,0.0,12.0,190,0,0,0,0,'Thunder',50.0,8.0,'Abyssal Storm Cleaver',3.0,'None',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','GreatSword',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (210,0.0,25.0,210,0,0,0,0,'Dragon',15.0,12.0,'Abyssal Galeblade',5.0,'None',0.0,7,5.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','GreatSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (211,0.0,8.0,200,1,1,0,0,'Thunder',38.0,19.0,'Despot''s Blackstorm',9.0,'None',0.0,6,14.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','GreatSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (212,15.0,8.0,190,1,0,0,0,'Water',30.0,10.0,'Akanesasu',18.0,'None',0.0,6,18.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (213,0.0,5.0,200,0,0,0,0,'None',0.0,10.0,'Rampage Cleaver V',15.0,'None',0.0,6,10.0,0,NULL,'Any','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (214,0.0,6.0,190,0,0,0,0,'None',0.0,4.0,'Rampage Cleaver IV',15.0,'None',0.0,6,11.0,0,NULL,'Any','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (215,0.0,4.0,180,0,0,0,0,'None',0.0,5.0,'Rampage Cleaver III',15.0,'None',0.0,5,11.0,0,NULL,'Any','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (216,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage Cleaver II',16.0,'None',0.0,5,14.0,0,NULL,'Any','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (217,0.0,0.0,150,0,0,0,0,'None',0.0,4.0,'Rampage Cleaver I',16.0,'None',0.0,4,16.0,0,NULL,'Any','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (218,0.0,0.0,150,3,0,0,0,'Paralysis',45.0,15.0,'Cat''s Curse',14.0,'None',0.0,6,9.0,0,NULL,'Attack Boost IV/Dulling Strike/Buddy Rally','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (219,0.0,0.0,130,2,0,0,0,'Paralysis',40.0,11.0,'Cat''s Soul II',15.0,'None',0.0,5,11.0,0,NULL,'Attack Boost III/Dulling Strike/Buddy Rally','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (220,0.0,0.0,100,2,0,0,0,'Paralysis',36.0,7.0,'Cat''s Soul I',9.0,'None',0.0,4,16.0,0,NULL,'Attack Boost III/Dulling Strike/Buddy Rally','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (221,0.0,0.0,190,2,1,1,0,'Dragon',25.0,16.0,'Dragonslayer Parasol',25.0,'None',0.0,5,18.0,0,NULL,'Defense Boost III/Dragon Boost III/Dragon Exploit','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (222,0.0,0.0,170,1,1,1,0,'Dragon',22.0,5.0,'Ninja Parasol II',26.0,'None',0.0,4,25.0,0,NULL,'Defense Boost III/Dragon Boost II/Dragon Exploit','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (223,0.0,0.0,160,0,0,0,0,'Dragon',20.0,4.0,'Ninja Parasol I',26.0,'None',0.0,3,24.0,0,NULL,'Defense Boost II/Dragon Boost II/Dragon Exploit','GreatSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (224,0.0,7.0,150,0,0,0,0,'Ice',70.0,25.0,'Freezer Speartuna',15.0,'None',0.0,6,11.0,0,NULL,'Attack Boost IV/Element Exploit/Iceblight Exploit','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (225,0.0,3.0,140,0,0,0,0,'Ice',60.0,24.0,'Frozen Speartuna II',10.0,'None',0.0,5,19.0,0,NULL,'Attack Boost III/Element Exploit/Iceblight Exploit','GreatSword',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (226,0.0,0.0,130,0,0,0,0,'Ice',50.0,16.0,'Frozen Speartuna I',10.0,'None',0.0,4,24.0,0,NULL,'Attack Boost III/Element Exploit/Iceblight Exploit','GreatSword',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (227,0.0,0.0,180,3,1,0,20,'Sleep',15.0,11.0,'Soporific Shellblade',20.0,'None',0.0,5,11.0,0,NULL,'Defense Boost III/Sleep Boost II/Anti-Aquatic Species','GreatSword',0.0,31.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (228,0.0,0.0,120,0,0,0,17,'Sleep',10.0,5.0,'Sleepy Shellblade II',21.0,'None',0.0,3,9.0,0,NULL,'Defense Boost II/Sleep Boost I/Anti-Aquatic Species','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (229,0.0,0.0,100,0,0,0,15,'Sleep',8.0,2.0,'Sleepy Shellblade I',11.0,'None',0.0,2,11.0,0,NULL,'Defense Boost I/Sleep Boost I/Anti-Aquatic Species','GreatSword',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (230,0.0,0.0,210,0,0,0,0,'Poison',35.0,5.0,'Roguish Deathcap',6.0,'None',0.0,5,6.0,0,NULL,'Poison Boost I/Dulling Strike/Spiribird Doubled','GreatSword',0.0,41.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (231,0.0,0.0,180,0,0,0,0,'Poison',32.0,2.0,'Wyvern''s Perch II',10.0,'None',0.0,4,6.0,0,NULL,'Poison Boost I/Dulling Strike/Spiribird Doubled','GreatSword',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (232,0.0,0.0,100,0,0,0,0,'Poison',30.0,0.0,'Wyvern''s Perch I',6.0,'None',0.0,2,4.0,0,NULL,'Poison Boost I/Dulling Strike/Spiribird Doubled','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (233,10.0,3.0,180,0,0,0,0,'Blast',15.0,20.0,'Teostra Blade I',5.0,'None',0.0,6,30.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (234,0.0,10.0,210,0,0,0,0,'Poison',28.0,15.0,'Sieglinde',10.0,'None',0.0,6,21.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (235,0.0,5.0,180,0,0,0,0,'Poison',25.0,25.0,'Valkyrie Blade II',15.0,'None',0.0,5,14.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','GreatSword',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (236,0.0,0.0,170,0,0,0,0,'None',0.0,20.0,'Valkyrie Blade I',15.0,'None',0.0,5,14.0,0,NULL,'Attack Boost I/Poison Boost I/Small Monster Exploit','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (237,30.0,0.0,110,0,0,0,0,'None',0.0,30.0,'Hidden Blade I',20.0,'None',0.0,3,12.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (238,0.0,5.0,160,1,1,0,0,'Poison',45.0,20.0,'Poison Serpentblade',5.0,'None',0.0,5,35.0,0,NULL,'Attack Boost IV/Poison Boost I/Dulling Strike','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (239,0.0,0.0,100,0,0,0,0,'Poison',42.0,15.0,'Deadly Serpentblade II',10.0,'None',0.0,3,15.0,0,NULL,'Attack Boost III/Poison Boost I/Dulling Strike','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (240,0.0,0.0,90,0,0,0,0,'Poison',40.0,5.0,'Deadly Serpentblade I',17.0,'None',0.0,2,10.0,0,NULL,'Attack Boost II/Poison Boost I/Dulling Strike','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (241,15.0,5.0,150,2,1,0,0,'None',0.0,20.0,'Snapper Blade',25.0,'None',0.0,4,12.5,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (242,12.0,0.0,80,0,0,0,0,'None',0.0,7.0,'Izuchi Blade II',20.0,'None',0.0,1,6.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (243,10.0,0.0,69,0,0,0,0,'None',0.0,0.0,'Izuchi Blade I',20.0,'None',0.0,1,7.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','GreatSword',0.0,27.5,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (244,0.0,5.0,140,2,0,0,0,'Thunder',40.0,20.0,'Khezu Shock Blade',10.0,'None',0.0,4,25.0,0,NULL,'Attack Boost IV/Thunder Boost II/Thunderblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (245,0.0,0.0,110,0,0,0,0,'Thunder',35.0,10.0,'Khezu Shock Sword II',20.0,'None',0.0,3,20.0,0,NULL,'Attack Boost III/Thunder Boost I/Thunderblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (246,0.0,0.0,90,0,0,0,0,'Thunder',30.0,10.0,'Khezu Shock Sword I',15.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (247,-15.0,15.0,210,1,0,0,0,'None',0.0,35.0,'Tigrex Great Sword',10.0,'None',0.0,6,12.5,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (248,-20.0,10.0,200,1,0,0,0,'None',0.0,25.0,'Tiger Jawblade II',10.0,'None',0.0,6,12.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (249,-20.0,3.0,150,0,0,0,0,'None',0.0,25.0,'Tiger Jawblade I',5.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (250,-20.0,1.0,200,0,0,0,0,'None',0.0,15.0,'Carapace Blade',10.0,'None',0.0,5,15.0,0,NULL,'Affinity Boost II/Defense Boost II/Brutal Strike','GreatSword',0.0,55.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (251,-20.0,0.0,130,0,0,0,0,'None',0.0,10.0,'Carapace Sword II',15.0,'None',0.0,2,12.0,0,NULL,'Affinity Boost I/Defense Boost II/Brutal Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (252,-20.0,0.0,120,0,0,0,0,'None',0.0,5.0,'Carapace Sword I',15.0,'None',0.0,2,12.0,0,NULL,'Affinity Boost I/Defense Boost I/Brutal Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (253,0.0,0.0,180,1,1,1,0,'None',0.0,10.0,'Colossal Axeblade',30.0,'None',0.0,4,30.0,0,NULL,'Defense Boost III/Dulling Strike/Defense Grinder I','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (254,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Axeblade II',20.0,'None',0.0,3,20.0,0,NULL,'Defense Boost II/Dulling Strike/Defense Grinder I','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (255,0.0,0.0,120,0,0,0,0,'None',0.0,1.0,'Axeblade I',20.0,'None',0.0,2,25.0,0,NULL,'Defense Boost II/Dulling Strike/Defense Grinder I','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (256,10.0,10.0,160,1,0,0,0,'Water',25.0,10.0,'Hanayako Yohino II',30.0,'None',0.0,5,30.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (257,10.0,0.0,110,0,0,0,0,'Water',20.0,10.0,'Hanayako Yohino I',15.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (258,-15.0,10.0,230,2,0,0,0,'Ice',20.0,10.0,'Abominable Great Sword',10.0,'None',0.0,6,25.0,0,NULL,'Affinity Boost I/Ice Boost III/Brutal Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (259,-15.0,5.0,200,2,0,0,0,'Ice',17.0,10.0,'Gossblade II',10.0,'None',0.0,5,25.0,0,NULL,'Affinity Boost I/Ice Boost II/Brutal Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (260,-15.0,0.0,170,0,0,0,0,'Ice',15.0,10.0,'Gossblade I',10.0,'None',0.0,3,25.0,0,NULL,'Affinity Boost I/Ice Boost I/Brutal Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (261,0.0,15.0,190,2,1,0,0,'None',0.0,15.0,'Kamura Ninja Cleaver',25.0,'None',0.0,5,10.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (262,0.0,10.0,150,2,0,0,0,'None',0.0,10.0,'Kamura Cleaver V',25.0,'None',0.0,4,15.0,0,NULL,'Affinity Boost II/Defense Boost II/Master Rider','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (263,0.0,5.0,140,0,0,0,0,'None',0.0,5.0,'Kamura Cleaver IV',25.0,'None',0.0,3,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (264,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Kamura Cleaver III',20.0,'None',0.0,2,20.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (265,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Cleaver II',20.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (266,30.0,15.0,160,2,0,0,0,'None',0.0,30.0,'Hidden Blade II',10.0,'None',0.0,5,27.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (267,35.0,15.0,180,2,0,0,0,'None',0.0,25.0,'Dark of Night',10.0,'None',0.0,6,18.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (268,0.0,0.0,90,0,0,0,0,'Sleep',16.0,8.0,'Frilled Blade I',15.0,'None',0.0,2,12.0,0,NULL,'Attack Boost I/Sleep Boost I/Dulling Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (269,0.0,0.0,120,1,1,0,0,'Sleep',19.0,10.0,'Frilled Blade II',17.0,'None',0.0,4,10.0,0,NULL,'Attack Boost II/Sleep Boost I/Dulling Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (270,0.0,5.0,200,0,0,0,0,'None',0.0,20.0,'Blade of Talos',15.0,'None',0.0,5,21.0,0,NULL,'Affinity Boost III/Defense Boost II/Silkbind Boost','GreatSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (271,0.0,5.0,180,0,0,0,0,'None',0.0,10.0,'Golem Blade I',15.0,'None',0.0,4,25.0,0,NULL,'Affinity Boost II/Defense Boost II/Silkbind Boost','GreatSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (272,0.0,0.0,180,1,1,0,0,'Dragon',30.0,10.0,'Great Wyvern Fang',11.0,'None',0.0,5,21.0,0,NULL,'Attack Boost IV/Dragon Boost I/Dulling Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (273,0.0,0.0,150,0,0,0,0,'Dragon',27.0,5.0,'Wyvern Fang I',7.0,'None',0.0,3,25.0,0,NULL,'Attack Boost III/Dragon Boost I/Dulling Strike','GreatSword',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (274,0.0,0.0,130,0,0,0,0,'None',0.0,0.0,'Giant Jawblade',20.0,'None',0.0,2,21.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','GreatSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (275,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Jawblade I',10.0,'None',0.0,2,24.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (276,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Slasher',16.0,'None',0.0,1,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (277,0.0,0.0,90,0,0,0,9,'None',0.0,0.0,'Bone Blade I',25.0,'None',0.0,1,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (278,0.0,0.0,160,2,0,0,20,'Water',24.0,15.0,'Tetranadon Cutter',21.0,'None',0.0,4,9.0,0,NULL,'Defense Boost I/Water Boost III/Dulling Strike','GreatSword',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (279,0.0,0.0,130,0,0,0,15,'Water',20.0,7.0,'Tetranadon Edge II',20.0,'None',0.0,3,7.0,0,NULL,'Defense Boost I/Water Boost II/Dulling Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (280,0.0,0.0,110,0,0,0,10,'Water',18.0,5.0,'Tetranadon Edge I',13.0,'None',0.0,2,7.0,0,NULL,'Defense Boost I/Water Boost I/Dulling Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (281,0.0,4.0,160,2,0,0,0,'Fire',27.0,36.0,'Daybreak Cleaver',15.0,'None',0.0,4,7.0,0,NULL,'Attack Boost II/Fire Boost II/Fireblight Eploit','GreatSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (282,0.0,0.0,130,0,0,0,0,'Fire',23.0,22.0,'Aknosom Blade II',15.0,'None',0.0,3,7.0,0,NULL,'Attack Boost II/Fire Boost I/Fireblight Eploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (283,0.0,0.0,100,0,0,0,0,'Fire',20.0,10.0,'Aknosom Blade I',15.0,'None',0.0,2,7.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Eploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (284,0.0,0.0,180,2,0,0,0,'Dragon',45.0,0.0,'Reddnaught Claymore',0.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','GreatSword',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (285,35.0,13.0,160,2,0,0,0,'Ice',38.0,30.0,'Paladire',20.0,'None',0.0,5,13.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (286,30.0,0.0,100,0,0,0,0,'Ice',30.0,20.0,'Icicle Fang I',15.0,'None',0.0,2,13.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (287,0.0,10.0,170,2,1,0,0,'Poison',36.0,25.0,'Datura Cleaver',17.0,'None',0.0,5,15.0,0,NULL,'Attack Boost III/Defense Boost I/Poison Boost II','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (288,0.0,0.0,130,0,0,0,0,'Poison',30.0,15.0,'Pukei Edge II',25.0,'None',0.0,3,15.0,0,NULL,'Any','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (289,0.0,0.0,100,0,0,0,0,'Poison',24.0,10.0,'Pukei Edge I',20.0,'None',0.0,2,15.0,0,NULL,'Any','GreatSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (290,0.0,3.0,160,2,1,0,20,'Fire',45.0,7.0,'Crimson Goat',16.0,'None',0.0,5,13.0,0,NULL,'Attack Boost IV/Defense Boost II/Defense Grinder II','GreatSword',0.0,43.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (291,0.0,0.0,130,0,0,0,15,'Fire',42.0,8.0,'Barbaroi Blade II',13.0,'None',0.0,3,15.0,0,NULL,'Attack Boost III/Defense Boost II/Defense Grinder I','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (292,0.0,0.0,100,0,0,0,10,'Fire',40.0,5.0,'Barbaroi Blade I',10.0,'None',0.0,2,19.0,0,NULL,'Attack Boost III/Defense Boost II/Defense Grinder I','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (293,0.0,5.0,180,1,1,0,0,'Poison',40.0,20.0,'Chrome Quietus',10.0,'None',0.0,5,21.0,0,NULL,'Attack Boost III/Poison Boost I/Silkbind Boost','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (294,0.0,0.0,160,1,1,0,0,'Poison',35.0,20.0,'Chrome Razor I',20.0,'None',0.0,4,15.0,0,NULL,'Attack Boost II/Poison Boost I/Silkbind Boost','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (295,0.0,0.0,140,0,0,0,0,'None',0.0,15.0,'Buster Blade',17.0,'None',0.0,3,19.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (296,0.0,0.0,110,0,0,0,0,'None',0.0,5.0,'Buster Sword I',17.0,'None',0.0,2,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','GreatSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (297,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Steel Sword',20.0,'None',0.0,1,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (298,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Iron Sword I',20.0,'None',0.0,1,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (299,0.0,0.0,160,2,1,0,0,'Sleep',22.0,25.0,'Illusory Frilled Blade',25.0,'None',0.0,5,13.0,0,NULL,'Attack Boost III/Sleep Boost I/Dulling Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (300,30.0,5.0,120,0,0,0,0,'Ice',34.0,30.0,'Icicle Fang II',20.0,'None',0.0,3,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (301,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Cleaver S',15.0,'None',0.0,7,10.0,0,NULL,'Any','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (302,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Cleaver I',25.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (303,0.0,21.0,200,0,0,0,0,'Dragon',12.0,10.0,'Azure Elder Great Sword II',4.0,'None',0.0,6,4.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','GreatSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (304,0.0,0.0,180,0,0,0,0,'Dragon',10.0,25.0,'Azure Elder Great Sword I',5.0,'None',0.0,5,5.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (305,10.0,0.0,190,3,0,0,0,'Thunder',24.0,21.0,'Demon Rod II',9.0,'None',0.0,6,4.0,0,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (306,10.0,0.0,180,0,0,0,0,'Thunder',20.0,20.0,'Demon Rod I',4.0,'None',0.0,5,11.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','GreatSword',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (307,0.0,10.0,200,2,1,0,0,'Blast',25.0,20.0,'Sinister Shadowblade',2.0,'None',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','GreatSword',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (308,0.0,0.0,140,0,0,0,0,'Blast',18.0,21.0,'Sinister Blade II',5.0,'None',0.0,3,40.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','GreatSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (309,0.0,0.0,130,0,0,0,0,'Blast',15.0,20.0,'Sinister Blade I',4.0,'None',0.0,3,37.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (310,0.0,2.0,150,1,1,0,0,'Ice',35.0,24.0,'Lagombi Charlotte',7.0,'None',0.0,4,14.0,0,NULL,'Attack Boost II/Ice Boost II/Dulling Strike','GreatSword',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (311,0.0,0.0,100,0,0,0,0,'Ice',25.0,6.0,'Snowclad II',14.0,'None',0.0,2,16.0,0,NULL,'Attack Boost I/Ice Boost II/Small Monster Exploit','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (312,0.0,0.0,90,0,0,0,0,'Ice',20.0,0.0,'Snowclad I',19.0,'None',0.0,1,16.0,0,NULL,'Attack Boost I/Ice Boost I/Small Monster Exploit','GreatSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (313,0.0,0.0,170,2,1,1,0,'Water',35.0,20.0,'Cataclysm Blade',10.0,'None',0.0,5,14.0,0,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','GreatSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (314,0.0,0.0,100,0,0,0,0,'Water',32.0,12.0,'Cataclysm Sword II',15.0,'None',0.0,2,11.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (315,0.0,0.0,90,0,0,0,0,'Water',30.0,9.0,'Cataclysm Sword I',16.0,'None',0.0,2,9.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (316,0.0,2.0,170,1,0,0,0,'Thunder',35.0,29.0,'Usurper''s Storm II',6.0,'None',0.0,5,14.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (317,0.0,0.0,120,0,0,0,0,'Thunder',30.0,20.0,'Usurper''s Storm I',9.0,'None',0.0,3,16.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (318,-20.0,0.0,220,3,0,0,0,'Fire',26.0,0.0,'Gnashing Flammenzahn',30.0,'None',0.0,6,30.0,0,NULL,'Affinity Boost II/Fire Boost III/Brutal Strike','GreatSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (319,-20.0,0.0,200,3,0,0,0,'Fire',24.0,11.0,'Flammenzahn II',25.0,'None',0.0,5,28.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','GreatSword',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (320,-20.0,0.0,140,0,0,0,0,'Fire',20.0,8.0,'Flammenzahn I',17.0,'None',0.0,3,28.0,0,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (321,0.0,7.0,180,0,0,0,0,'None',0.0,7.0,'Jaggi Greatblade',38.0,'None',0.0,5,11.0,0,NULL,'Defense Boost II/Dulling Strike/Defense Grinder I','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (322,0.0,0.0,110,0,0,0,0,'None',0.0,8.0,'Hack Blade II',34.0,'None',0.0,2,11.0,0,NULL,'Defense Boost II/Dulling Strike/Small Monster Exploit','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (323,0.0,0.0,100,0,0,0,0,'None',0.0,4.0,'Hack Blade I',26.0,'None',0.0,2,9.0,0,NULL,'Defense Boost I/Dulling Strike/Small Monster Exploit','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (324,-25.0,10.0,230,0,0,0,16,'None',0.0,28.0,'Feud Hornsword',15.0,'None',0.0,6,9.0,0,NULL,'Affinity Boost III/Defense Boost II/Defense Grinder I','GreatSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (325,-25.0,7.0,210,0,0,0,12,'None',0.0,27.0,'Quarrel Hornsword II',16.0,'None',0.0,6,24.0,0,NULL,'Affinity Boost II/Defense Boost I/Defense Grinder I','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (326,-25.0,0.0,170,0,0,0,8,'None',0.0,25.0,'Quarrel Hornsword I',10.0,'None',0.0,3,14.0,0,NULL,'Affinity Boost I/Defense Boost I/Dulling Strike','GreatSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (327,0.0,5.0,210,1,0,0,0,'Fire',40.0,25.0,'Rathalos Firesword',10.0,'None',0.0,6,10.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (328,0.0,4.0,190,1,0,0,0,'Fire',38.0,29.0,'Red Wing II',10.0,'None',0.0,6,11.0,0,NULL,'Attack Bonus II/Fire Boost I/Element Exploit','GreatSword',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (329,0.0,4.0,180,1,0,0,0,'Fire',36.0,25.0,'Red Wing I',19.0,'None',0.0,5,16.0,0,NULL,'Attack Bonus II/Fire Boost I/Element Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (330,-10.0,10.0,210,0,0,0,0,'Water',20.0,20.0,'Terracutter',17.0,'None',0.0,6,28.0,0,NULL,'Affinity Boost II/Water Boost II/Brutal Strike','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (331,-10.0,7.0,200,0,0,0,0,'Water',17.0,21.0,'Jyura Mudblade II',17.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost I/Water Boost II/Brutal Strike','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (332,0.0,6.0,180,0,0,0,0,'Thunder',46.0,9.0,'Thunderbolt Great Sword I',4.0,'None',0.0,6,4.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','GreatSword',0.0,46.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (333,-10.0,2.0,190,0,0,0,0,'Water',15.0,20.0,'Jyura Mudblade I',22.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost I/Water Boost I/Brutal Strike','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (334,10.0,5.0,180,1,0,0,0,'Ice',40.0,20.0,'Icesteel Edge I',10.0,'None',0.0,6,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (335,0.0,10.0,180,3,1,1,0,'Poison',60.0,20.0,'Grand Shamshir I',5.0,'None',0.0,6,25.0,0,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (336,0.0,0.0,170,2,0,0,0,'Dragon',42.0,0.0,'Redwing Claymore I',0.0,'None',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','GreatSword',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (337,0.0,4.0,190,0,0,0,0,'Blast',45.0,18.0,'King Teostra Blade',10.0,'None',0.0,7,35.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','GreatSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (338,10.0,2.0,210,3,0,0,0,'Thunder',26.0,20.0,'Great Demon Rod',15.0,'None',0.0,7,15.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','GreatSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (339,0.0,16.0,190,2,1,1,0,'Poison',66.0,18.0,'Foreboding Shamshir',8.0,'None',0.0,7,12.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (340,10.0,6.0,190,1,0,0,0,'Ice',45.0,8.0,'Daora''s Decimator',18.0,'None',0.0,7,18.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','GreatSword',2.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (341,0.0,12.0,190,0,0,0,0,'Thunder',50.0,8.0,'Abyssal Storm Cleaver',3.0,'None',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','GreatSword',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (342,0.0,25.0,210,0,0,0,0,'Dragon',15.0,12.0,'Abyssal Galeblade',5.0,'None',0.0,7,5.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','GreatSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (343,0.0,8.0,200,1,1,0,0,'Thunder',38.0,19.0,'Despot''s Blackstorm',9.0,'None',0.0,6,14.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','GreatSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (344,15.0,8.0,190,1,0,0,0,'Water',30.0,10.0,'Akanesasu',18.0,'None',0.0,6,18.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (345,0.0,5.0,200,0,0,0,0,'None',0.0,10.0,'Rampage Cleaver V',15.0,'None',0.0,6,10.0,0,NULL,'Any','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (346,0.0,6.0,190,0,0,0,0,'None',0.0,4.0,'Rampage Cleaver IV',15.0,'None',0.0,6,11.0,0,NULL,'Any','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (347,0.0,4.0,180,0,0,0,0,'None',0.0,5.0,'Rampage Cleaver III',15.0,'None',0.0,5,11.0,0,NULL,'Any','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (348,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage Cleaver II',16.0,'None',0.0,5,14.0,0,NULL,'Any','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (349,0.0,0.0,150,0,0,0,0,'None',0.0,4.0,'Rampage Cleaver I',16.0,'None',0.0,4,16.0,0,NULL,'Any','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (350,0.0,0.0,150,3,0,0,0,'Paralysis',45.0,15.0,'Cat''s Curse',14.0,'None',0.0,6,9.0,0,NULL,'Attack Boost IV/Dulling Strike/Buddy Rally','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (351,0.0,0.0,130,2,0,0,0,'Paralysis',40.0,11.0,'Cat''s Soul II',15.0,'None',0.0,5,11.0,0,NULL,'Attack Boost III/Dulling Strike/Buddy Rally','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (352,0.0,0.0,100,2,0,0,0,'Paralysis',36.0,7.0,'Cat''s Soul I',9.0,'None',0.0,4,16.0,0,NULL,'Attack Boost III/Dulling Strike/Buddy Rally','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (353,0.0,0.0,190,2,1,1,0,'Dragon',25.0,16.0,'Dragonslayer Parasol',25.0,'None',0.0,5,18.0,0,NULL,'Defense Boost III/Dragon Boost III/Dragon Exploit','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (354,0.0,0.0,170,1,1,1,0,'Dragon',22.0,5.0,'Ninja Parasol II',26.0,'None',0.0,4,25.0,0,NULL,'Defense Boost III/Dragon Boost II/Dragon Exploit','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (355,0.0,0.0,160,0,0,0,0,'Dragon',20.0,4.0,'Ninja Parasol I',26.0,'None',0.0,3,24.0,0,NULL,'Defense Boost II/Dragon Boost II/Dragon Exploit','GreatSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (356,0.0,7.0,150,0,0,0,0,'Ice',70.0,25.0,'Freezer Speartuna',15.0,'None',0.0,6,11.0,0,NULL,'Attack Boost IV/Element Exploit/Iceblight Exploit','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (357,0.0,3.0,140,0,0,0,0,'Ice',60.0,24.0,'Frozen Speartuna II',10.0,'None',0.0,5,19.0,0,NULL,'Attack Boost III/Element Exploit/Iceblight Exploit','GreatSword',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (358,0.0,0.0,130,0,0,0,0,'Ice',50.0,16.0,'Frozen Speartuna I',10.0,'None',0.0,4,24.0,0,NULL,'Attack Boost III/Element Exploit/Iceblight Exploit','GreatSword',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (359,0.0,0.0,180,3,1,0,20,'Sleep',15.0,11.0,'Soporific Shellblade',20.0,'None',0.0,5,11.0,0,NULL,'Defense Boost III/Sleep Boost II/Anti-Aquatic Species','GreatSword',0.0,31.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (360,0.0,0.0,120,0,0,0,17,'Sleep',10.0,5.0,'Sleepy Shellblade II',21.0,'None',0.0,3,9.0,0,NULL,'Defense Boost II/Sleep Boost I/Anti-Aquatic Species','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (361,0.0,0.0,100,0,0,0,15,'Sleep',8.0,2.0,'Sleepy Shellblade I',11.0,'None',0.0,2,11.0,0,NULL,'Defense Boost I/Sleep Boost I/Anti-Aquatic Species','GreatSword',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (362,0.0,0.0,210,0,0,0,0,'Poison',35.0,5.0,'Roguish Deathcap',6.0,'None',0.0,5,6.0,0,NULL,'Poison Boost I/Dulling Strike/Spiribird Doubled','GreatSword',0.0,41.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (363,0.0,0.0,180,0,0,0,0,'Poison',32.0,2.0,'Wyvern''s Perch II',10.0,'None',0.0,4,6.0,0,NULL,'Poison Boost I/Dulling Strike/Spiribird Doubled','GreatSword',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (364,0.0,0.0,100,0,0,0,0,'Poison',30.0,0.0,'Wyvern''s Perch I',6.0,'None',0.0,2,4.0,0,NULL,'Poison Boost I/Dulling Strike/Spiribird Doubled','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (365,10.0,3.0,180,0,0,0,0,'Blast',15.0,20.0,'Teostra Blade I',5.0,'None',0.0,6,30.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (366,0.0,10.0,210,0,0,0,0,'Poison',28.0,15.0,'Sieglinde',10.0,'None',0.0,6,21.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (367,0.0,5.0,180,0,0,0,0,'Poison',25.0,25.0,'Valkyrie Blade II',15.0,'None',0.0,5,14.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','GreatSword',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (368,0.0,0.0,170,0,0,0,0,'None',0.0,20.0,'Valkyrie Blade I',15.0,'None',0.0,5,14.0,0,NULL,'Attack Boost I/Poison Boost I/Small Monster Exploit','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (369,30.0,0.0,110,0,0,0,0,'None',0.0,30.0,'Hidden Blade I',20.0,'None',0.0,3,12.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (370,0.0,5.0,160,1,1,0,0,'Poison',45.0,20.0,'Poison Serpentblade',5.0,'None',0.0,5,35.0,0,NULL,'Attack Boost IV/Poison Boost I/Dulling Strike','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (371,0.0,0.0,100,0,0,0,0,'Poison',42.0,15.0,'Deadly Serpentblade II',10.0,'None',0.0,3,15.0,0,NULL,'Attack Boost III/Poison Boost I/Dulling Strike','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (372,0.0,0.0,90,0,0,0,0,'Poison',40.0,5.0,'Deadly Serpentblade I',17.0,'None',0.0,2,10.0,0,NULL,'Attack Boost II/Poison Boost I/Dulling Strike','GreatSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (373,15.0,5.0,150,2,1,0,0,'None',0.0,20.0,'Snapper Blade',25.0,'None',0.0,4,12.5,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (374,12.0,0.0,80,0,0,0,0,'None',0.0,7.0,'Izuchi Blade II',20.0,'None',0.0,1,6.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (375,10.0,0.0,69,0,0,0,0,'None',0.0,0.0,'Izuchi Blade I',20.0,'None',0.0,1,7.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','GreatSword',0.0,27.5,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (376,0.0,5.0,140,2,0,0,0,'Thunder',40.0,20.0,'Khezu Shock Blade',10.0,'None',0.0,4,25.0,0,NULL,'Attack Boost IV/Thunder Boost II/Thunderblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (377,0.0,0.0,110,0,0,0,0,'Thunder',35.0,10.0,'Khezu Shock Sword II',20.0,'None',0.0,3,20.0,0,NULL,'Attack Boost III/Thunder Boost I/Thunderblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (378,0.0,0.0,90,0,0,0,0,'Thunder',30.0,10.0,'Khezu Shock Sword I',15.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (379,-15.0,15.0,210,1,0,0,0,'None',0.0,35.0,'Tigrex Great Sword',10.0,'None',0.0,6,12.5,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (380,-20.0,10.0,200,1,0,0,0,'None',0.0,25.0,'Tiger Jawblade II',10.0,'None',0.0,6,12.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (381,-20.0,3.0,150,0,0,0,0,'None',0.0,25.0,'Tiger Jawblade I',5.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (382,-20.0,1.0,200,0,0,0,0,'None',0.0,15.0,'Carapace Blade',10.0,'None',0.0,5,15.0,0,NULL,'Affinity Boost II/Defense Boost II/Brutal Strike','GreatSword',0.0,55.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (383,-20.0,0.0,130,0,0,0,0,'None',0.0,10.0,'Carapace Sword II',15.0,'None',0.0,2,12.0,0,NULL,'Affinity Boost I/Defense Boost II/Brutal Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (384,-20.0,0.0,120,0,0,0,0,'None',0.0,5.0,'Carapace Sword I',15.0,'None',0.0,2,12.0,0,NULL,'Affinity Boost I/Defense Boost I/Brutal Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (385,0.0,0.0,180,1,1,1,0,'None',0.0,10.0,'Colossal Axeblade',30.0,'None',0.0,4,30.0,0,NULL,'Defense Boost III/Dulling Strike/Defense Grinder I','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (386,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Axeblade II',20.0,'None',0.0,3,20.0,0,NULL,'Defense Boost II/Dulling Strike/Defense Grinder I','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (387,0.0,0.0,120,0,0,0,0,'None',0.0,1.0,'Axeblade I',20.0,'None',0.0,2,25.0,0,NULL,'Defense Boost II/Dulling Strike/Defense Grinder I','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (388,10.0,10.0,160,1,0,0,0,'Water',25.0,10.0,'Hanayako Yohino II',30.0,'None',0.0,5,30.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (389,10.0,0.0,110,0,0,0,0,'Water',20.0,10.0,'Hanayako Yohino I',15.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (390,-15.0,10.0,230,2,0,0,0,'Ice',20.0,10.0,'Abominable Great Sword',10.0,'None',0.0,6,25.0,0,NULL,'Affinity Boost I/Ice Boost III/Brutal Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (391,-15.0,5.0,200,2,0,0,0,'Ice',17.0,10.0,'Gossblade II',10.0,'None',0.0,5,25.0,0,NULL,'Affinity Boost I/Ice Boost II/Brutal Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (392,-15.0,0.0,170,0,0,0,0,'Ice',15.0,10.0,'Gossblade I',10.0,'None',0.0,3,25.0,0,NULL,'Affinity Boost I/Ice Boost I/Brutal Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (393,0.0,15.0,190,2,1,0,0,'None',0.0,15.0,'Kamura Ninja Cleaver',25.0,'None',0.0,5,10.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (394,0.0,10.0,150,2,0,0,0,'None',0.0,10.0,'Kamura Cleaver V',25.0,'None',0.0,4,15.0,0,NULL,'Affinity Boost II/Defense Boost II/Master Rider','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (395,0.0,5.0,140,0,0,0,0,'None',0.0,5.0,'Kamura Cleaver IV',25.0,'None',0.0,3,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (396,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Kamura Cleaver III',20.0,'None',0.0,2,20.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (397,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Cleaver II',20.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (398,30.0,15.0,160,2,0,0,0,'None',0.0,30.0,'Hidden Blade II',10.0,'None',0.0,5,27.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (399,35.0,15.0,180,2,0,0,0,'None',0.0,25.0,'Dark of Night',10.0,'None',0.0,6,18.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (400,0.0,0.0,90,0,0,0,0,'Sleep',16.0,8.0,'Frilled Blade I',15.0,'None',0.0,2,12.0,0,NULL,'Attack Boost I/Sleep Boost I/Dulling Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (401,0.0,0.0,120,1,1,0,0,'Sleep',19.0,10.0,'Frilled Blade II',17.0,'None',0.0,4,10.0,0,NULL,'Attack Boost II/Sleep Boost I/Dulling Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (402,0.0,5.0,200,0,0,0,0,'None',0.0,20.0,'Blade of Talos',15.0,'None',0.0,5,21.0,0,NULL,'Affinity Boost III/Defense Boost II/Silkbind Boost','GreatSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (403,0.0,5.0,180,0,0,0,0,'None',0.0,10.0,'Golem Blade I',15.0,'None',0.0,4,25.0,0,NULL,'Affinity Boost II/Defense Boost II/Silkbind Boost','GreatSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (404,0.0,0.0,180,1,1,0,0,'Dragon',30.0,10.0,'Great Wyvern Fang',11.0,'None',0.0,5,21.0,0,NULL,'Attack Boost IV/Dragon Boost I/Dulling Strike','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (405,0.0,0.0,150,0,0,0,0,'Dragon',27.0,5.0,'Wyvern Fang I',7.0,'None',0.0,3,25.0,0,NULL,'Attack Boost III/Dragon Boost I/Dulling Strike','GreatSword',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (406,0.0,0.0,130,0,0,0,0,'None',0.0,0.0,'Giant Jawblade',20.0,'None',0.0,2,21.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','GreatSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (407,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Jawblade I',10.0,'None',0.0,2,24.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (408,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Slasher',16.0,'None',0.0,1,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (409,0.0,0.0,90,0,0,0,9,'None',0.0,0.0,'Bone Blade I',25.0,'None',0.0,1,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (410,0.0,0.0,160,2,0,0,20,'Water',24.0,15.0,'Tetranadon Cutter',21.0,'None',0.0,4,9.0,0,NULL,'Defense Boost I/Water Boost III/Dulling Strike','GreatSword',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (411,0.0,0.0,130,0,0,0,15,'Water',20.0,7.0,'Tetranadon Edge II',20.0,'None',0.0,3,7.0,0,NULL,'Defense Boost I/Water Boost II/Dulling Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (412,0.0,0.0,110,0,0,0,10,'Water',18.0,5.0,'Tetranadon Edge I',13.0,'None',0.0,2,7.0,0,NULL,'Defense Boost I/Water Boost I/Dulling Strike','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (413,0.0,4.0,160,2,0,0,0,'Fire',27.0,36.0,'Daybreak Cleaver',15.0,'None',0.0,4,7.0,0,NULL,'Attack Boost II/Fire Boost II/Fireblight Eploit','GreatSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (414,0.0,0.0,130,0,0,0,0,'Fire',23.0,22.0,'Aknosom Blade II',15.0,'None',0.0,3,7.0,0,NULL,'Attack Boost II/Fire Boost I/Fireblight Eploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (415,0.0,0.0,100,0,0,0,0,'Fire',20.0,10.0,'Aknosom Blade I',15.0,'None',0.0,2,7.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Eploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (416,0.0,0.0,180,2,0,0,0,'Dragon',45.0,0.0,'Reddnaught Claymore',0.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','GreatSword',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (417,35.0,13.0,160,2,0,0,0,'Ice',38.0,30.0,'Paladire',20.0,'None',0.0,5,13.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (418,30.0,0.0,100,0,0,0,0,'Ice',30.0,20.0,'Icicle Fang I',15.0,'None',0.0,2,13.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (419,0.0,10.0,170,2,1,0,0,'Poison',36.0,25.0,'Datura Cleaver',17.0,'None',0.0,5,15.0,0,NULL,'Attack Boost III/Defense Boost I/Poison Boost II','GreatSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (420,0.0,0.0,130,0,0,0,0,'Poison',30.0,15.0,'Pukei Edge II',25.0,'None',0.0,3,15.0,0,NULL,'Any','GreatSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (421,0.0,0.0,100,0,0,0,0,'Poison',24.0,10.0,'Pukei Edge I',20.0,'None',0.0,2,15.0,0,NULL,'Any','GreatSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (422,0.0,3.0,160,2,1,0,20,'Fire',45.0,7.0,'Crimson Goat',16.0,'None',0.0,5,13.0,0,NULL,'Attack Boost IV/Defense Boost II/Defense Grinder II','GreatSword',0.0,43.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (423,0.0,0.0,130,0,0,0,15,'Fire',42.0,8.0,'Barbaroi Blade II',13.0,'None',0.0,3,15.0,0,NULL,'Attack Boost III/Defense Boost II/Defense Grinder I','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (424,0.0,0.0,100,0,0,0,10,'Fire',40.0,5.0,'Barbaroi Blade I',10.0,'None',0.0,2,19.0,0,NULL,'Attack Boost III/Defense Boost II/Defense Grinder I','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (425,0.0,5.0,180,1,1,0,0,'Poison',40.0,20.0,'Chrome Quietus',10.0,'None',0.0,5,21.0,0,NULL,'Attack Boost III/Poison Boost I/Silkbind Boost','GreatSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (426,0.0,0.0,160,1,1,0,0,'Poison',35.0,20.0,'Chrome Razor I',20.0,'None',0.0,4,15.0,0,NULL,'Attack Boost II/Poison Boost I/Silkbind Boost','GreatSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (427,0.0,0.0,140,0,0,0,0,'None',0.0,15.0,'Buster Blade',17.0,'None',0.0,3,19.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (428,0.0,0.0,110,0,0,0,0,'None',0.0,5.0,'Buster Sword I',17.0,'None',0.0,2,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','GreatSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (429,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Steel Sword',20.0,'None',0.0,1,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (430,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Iron Sword I',20.0,'None',0.0,1,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','GreatSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (431,0.0,0.0,160,2,1,0,0,'Sleep',22.0,25.0,'Illusory Frilled Blade',25.0,'None',0.0,5,13.0,0,NULL,'Attack Boost III/Sleep Boost I/Dulling Strike','GreatSword',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (432,30.0,5.0,120,0,0,0,0,'Ice',34.0,30.0,'Icicle Fang II',20.0,'None',0.0,3,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','GreatSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (433,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Cleaver S',15.0,'None',0.0,7,10.0,0,NULL,'Any','GreatSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (434,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Glintblades I',20.0,'None',0.0,1,10.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (435,-10.0,0.0,210,0,0,0,0,'Blast',15.0,20.0,'Bazelhawk Rookslayer',15.0,'None',0.0,7,15.0,0,NULL,'Defense Boost II/Blast Boost III/Brutal Strike','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (436,-10.0,4.0,200,0,0,0,0,'Blast',12.0,15.0,'Rookslayer Handaxes II',25.0,'None',0.0,6,12.0,0,NULL,'Defense Boost I/Blast Boost II/Brutal Strike','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (437,-10.0,0.0,190,0,0,0,0,'Blast',10.0,20.0,'Rookslayer Handaxes I',20.0,'None',0.0,6,12.0,0,NULL,'Defense Boost I/Blast Boost II/Brutal Strike','DualBlades',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (438,0.0,10.0,160,0,0,0,0,'Thunder',30.0,10.0,'Thunderbolt Blades I',5.0,'None',0.0,6,5.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','DualBlades',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (439,0.0,30.0,200,0,0,0,0,'Dragon',8.0,10.0,'Azure Elder Blades II',5.0,'None',0.0,6,5.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (440,0.0,25.0,170,0,0,0,0,'Dragon',6.0,10.0,'Azure Elder Blades I',5.0,'None',0.0,5,5.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (441,-20.0,2.0,200,2,0,0,0,'Thunder',18.0,25.0,'Suzuka Takamaru II',5.0,'None',0.0,6,15.0,0,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','DualBlades',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (442,-20.0,0.0,190,0,0,0,0,'Thunder',16.0,20.0,'Suzuka Takamaru I',10.0,'None',0.0,5,15.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (443,0.0,10.0,200,2,1,0,0,'Blast',20.0,20.0,'Sinister Famineblades',2.0,'None',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (444,0.0,0.0,140,0,0,0,0,'Blast',15.0,20.0,'Sinister Blades II',5.0,'None',0.0,3,40.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (445,0.0,0.0,130,0,0,0,0,'Blast',13.0,20.0,'Sinister Blades I',5.0,'None',0.0,3,35.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (446,0.0,2.0,160,1,1,0,0,'Ice',22.0,20.0,'Snow Sisters',10.0,'None',0.0,4,15.0,0,NULL,'Attack Boost II/Ice Boost II/Dulling Strike','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (447,0.0,0.0,110,0,0,0,0,'Ice',18.0,10.0,'Snow Slicers II',20.0,'None',0.0,3,20.0,0,NULL,'Attack Boost I/Ice Boost II/Small Monster Exploit','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (448,0.0,0.0,80,0,0,0,0,'Ice',15.0,10.0,'Snow Slicers I',15.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Ice Boost I/Small Monster Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (449,0.0,0.0,180,2,1,0,0,'Sleep',15.0,20.0,'Illusory Frilled Claw',20.0,'None',0.0,5,10.0,0,NULL,'Attack Boost III/Sleep Boost I/Dulling Strike','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (450,0.0,0.0,140,1,1,0,0,'Sleep',12.0,10.0,'Frilled Claw II',15.0,'None',0.0,4,10.0,0,NULL,'Attack Boost II/Sleep Boost I/Dulling Strike','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (451,0.0,0.0,80,0,0,0,0,'Sleep',10.0,5.0,'Frilled Claw I',10.0,'None',0.0,2,10.0,0,NULL,'Attack Boost I/Sleep Boost I/Dulling Strike','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (452,0.0,5.0,160,2,1,1,0,'Water',25.0,20.0,'Double Droth',5.0,'None',0.0,5,20.0,0,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (453,0.0,0.0,150,2,1,1,0,'Water',22.0,20.0,'Ludroth Pair II',10.0,'None',0.0,4,15.0,0,NULL,'Attack Boost II/Water Boost II/Waterblight Exploit','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (454,0.0,0.0,90,0,0,0,0,'Water',15.0,5.0,'Ludroth Pair I',15.0,'None',0.0,2,10.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (455,-10.0,0.0,160,1,1,0,0,'Fire',30.0,20.0,'Infernal Furies',15.0,'None',0.0,5,20.0,0,NULL,'Attack Boost III/Affinity Boost I/Dulling Strike','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (456,-10.0,0.0,130,0,0,0,0,'Fire',23.0,15.0,'Blazeblades II',10.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Dulling Strike','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (457,-10.0,0.0,70,0,0,0,0,'Fire',20.0,10.0,'Blazeblades I',10.0,'None',0.0,2,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Dulling Strike','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (458,10.0,12.0,190,1,1,0,0,'Thunder',18.0,12.0,'Shockblades',20.0,'None',0.0,6,20.0,0,NULL,'Attack Boost II/Affinity Boost III/Thunder Boost III','DualBlades',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (459,10.0,10.0,180,1,1,0,0,'Thunder',15.0,10.0,'Kadachi Twinblades II',20.0,'None',0.0,5,25.0,0,NULL,'Attack Boost I/Affinity Boost II/Thunder Boost II','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (460,10.0,0.0,100,0,0,0,0,'Thunder',12.0,15.0,'Kadachi Twinblades I',20.0,'None',0.0,2,10.0,0,NULL,'Attack Boost I/Affinity Boost I/Thunder Boost II','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (461,-10.0,5.0,220,0,0,0,0,'Water',12.0,10.0,'Jyura Pulverizers',25.0,'None',0.0,6,30.0,0,NULL,'Affinity Boost II/Water Boost II/Brutal Strike','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (462,-10.0,5.0,200,0,0,0,0,'Water',10.0,10.0,'Jyura Duo II',15.0,'None',0.0,5,25.0,0,NULL,'Affinity Boost I/Water Boost II/Brutal Strike','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (463,-10.0,2.0,190,0,0,0,0,'Water',8.0,10.0,'Jyura Duo I',17.0,'None',0.0,5,25.0,0,NULL,'Affinity Boost I/Water Boost I/Brutal Strike','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (464,0.0,5.0,160,2,0,0,0,'Ice',29.0,10.0,'Icesteel Fang I',20.0,'None',0.0,6,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (465,10.0,5.0,170,2,0,0,0,'Blast',24.0,10.0,'Twin Nails I',15.0,'None',0.0,6,15.0,0,NULL,'Attack Boost II/Blast Boost II/Teostra Soul','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (466,0.0,5.0,180,2,1,1,0,'Poison',35.0,15.0,'Rogue Flames I',15.0,'None',0.0,6,10.0,0,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','DualBlades',0.0,32.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (467,-10.0,2.0,150,2,0,0,0,'Paralysis',5.0,10.0,'Felyne Claws I',10.0,'None',0.0,4,25.0,0,NULL,'Attack Boost II/Hellion Mode/Buddy Rally','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (468,0.0,4.0,190,2,0,0,0,'Poison',40.0,15.0,'Dual Chameleos',10.0,'None',0.0,7,14.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','DualBlades',2.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (469,10.0,8.0,180,2,0,0,0,'Blast',36.0,5.0,'Fire and Ice',15.0,'None',0.0,7,20.0,0,NULL,'Attack Boost III/Blast Boost II/Teostra Soul','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (470,0.0,5.0,170,2,0,0,0,'Ice',32.0,6.0,'Daora''s Hook',14.0,'None',0.0,7,16.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','DualBlades',2.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (471,0.0,12.0,170,0,0,0,0,'Thunder',33.0,8.0,'Abyssal Storm Blades',3.0,'None',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','DualBlades',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (472,0.0,20.0,210,0,0,0,0,'Dragon',10.0,15.0,'Abyssal Gale Blades',3.0,'None',0.0,7,3.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','DualBlades',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (473,-20.0,3.0,220,3,0,0,0,'Thunder',20.0,20.0,'Suzuka Otakemaru',8.0,'None',0.0,7,18.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (474,0.0,0.0,160,2,0,0,0,'Dragon',32.0,0.0,'Redwing Blades I',0.0,'None',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','DualBlades',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (475,15.0,5.0,200,0,0,0,0,'Water',18.0,15.0,'Evening Dusk',5.0,'None',0.0,6,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (476,0.0,5.0,200,0,0,0,0,'None',0.0,10.0,'Rampage Twinblades V',15.0,'None',0.0,6,10.0,0,NULL,'Any','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (477,0.0,8.0,190,0,0,0,0,'None',0.0,8.0,'Rampage Twinblades IV',16.0,'None',0.0,6,12.0,0,NULL,'Any','DualBlades',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (478,0.0,5.0,180,0,0,0,0,'None',0.0,9.0,'Rampage Twinblades III',16.0,'None',0.0,5,12.0,0,NULL,'Any','DualBlades',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (479,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage Twinblades II',16.0,'None',0.0,5,14.0,0,NULL,'Any','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (480,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Rampage Twinblades I',17.0,'None',0.0,4,17.0,0,NULL,'Any','DualBlades',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (481,0.0,0.0,210,2,1,1,0,'Sleep',8.0,15.0,'Perfected Dango',10.0,'None',0.0,6,30.0,0,NULL,'Attack Boost IV/Dulling Strike/Spiribird Doubled','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (482,-15.0,0.0,250,0,0,0,16,'None',0.0,20.0,'Diablos Mashers',10.0,'None',0.0,6,30.0,0,NULL,'Affinity Boost III/Defense Boost II/Dulling Strike','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (483,0.0,0.0,190,2,1,1,0,'Sleep',5.0,15.0,'Stealth Dango II',5.0,'None',0.0,5,25.0,0,NULL,'Attack Boost III/Dulling Strike/Spiribird Doubled','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (484,15.0,10.0,180,0,0,0,0,'Dragon',24.0,5.0,'Fortis Gran',20.0,'None',0.0,6,25.0,0,NULL,'Attack Boost IV/Master Rider/Dragon Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (485,12.0,5.0,160,0,0,0,0,'Dragon',22.0,5.0,'Altair II',20.0,'None',0.0,5,25.0,0,NULL,'Attack Boost III/Master Rider/Dragon Exploit','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (486,10.0,5.0,130,0,0,0,0,'Dragon',13.0,5.0,'Altair I',15.0,'None',0.0,3,25.0,0,NULL,'Attack Boost II/Master Rider/Dragon Exploit','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (487,0.0,10.0,190,0,0,0,0,'Water',15.0,10.0,'Holy Sabers',20.0,'None',0.0,5,10.0,0,NULL,'Attack Boost III/Water Boost III/Anti-Aerial Species','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (488,0.0,5.0,160,2,0,0,0,'Water',13.0,15.0,'Sworn Rapiers II',15.0,'None',0.0,4,10.0,0,NULL,'Attack Boost II/Water Boost II/Anti-Aerial Species','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (489,0.0,0.0,150,0,0,0,0,'Water',13.0,10.0,'Sworn Rapiers I',20.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Water Boost II/Anti-Aerial Species','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (490,0.0,5.0,190,1,0,0,0,'Dragon',18.0,25.0,'Ro Waga',15.0,'None',0.0,6,10.0,0,NULL,'Attack Boost III/Dragon Boost III/Dragon Exploit','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (491,0.0,2.0,150,1,0,0,0,'Dragon',15.0,15.0,'Qornu Waga II',5.0,'None',0.0,4,5.0,0,NULL,'Attack Boost II/Dragon Boost II/Dragon Exploit','DualBlades',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (492,0.0,0.0,130,0,0,0,0,'Dragon',12.0,10.0,'Qornu Waga I',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost I/Dragon Boost II/Dragon Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (493,0.0,7.0,180,2,1,0,0,'Paralysis',19.0,3.0,'Rain of Gore',30.0,'None',0.0,6,25.0,0,NULL,'Attack Boost II/Affiinity Boost/Paralysis Boost I','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (494,0.0,5.0,160,2,1,0,0,'Paralysis',15.0,5.0,'Rainy Jelly II',25.0,'None',0.0,5,15.0,0,NULL,'Attack Boost I/Affiinity Boost/Paralysis Boost I','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (495,0.0,2.0,110,0,0,0,0,'Paralysis',10.0,5.0,'Rainy Jelly I',25.0,'None',0.0,3,20.0,0,NULL,'Attack Boost I/Affiinity Boost I/Paralysis Boost I','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (496,-10.0,2.0,190,2,0,0,0,'Paralysis',10.0,20.0,'Raging Claws',10.0,'None',0.0,6,30.0,0,NULL,'Attack Boost III/Hellion Mode/Buddy Rally','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (497,-10.0,2.0,180,2,0,0,0,'Paralysis',8.0,15.0,'Felyne Claws II',10.0,'None',0.0,5,30.0,0,NULL,'Attack Boost II/Hellion Mode/Buddy Rally','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (498,0.0,0.0,130,0,0,0,0,'Sleep',3.0,10.0,'Stealth Dango I',5.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Dulling Strike/Spiribird Doubled','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (499,0.0,0.0,170,2,0,0,0,'Dragon',35.0,0.0,'Reddnaught Dragon Wing',0.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','DualBlades',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (500,-15.0,0.0,230,0,0,0,12,'None',0.0,15.0,'Diablos Bashers II',25.0,'None',0.0,6,35.0,0,NULL,'Affinity Boost II/Defense Boost I/Dulling Strike','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (501,0.0,15.0,200,0,0,0,0,'Fire',34.0,22.0,'Wyvern Lovers',11.0,'None',0.0,6,20.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','DualBlades',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (502,-20.0,17.0,230,0,0,0,0,'None',0.0,30.0,'Tigrex Claws',10.0,'None',0.0,6,12.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','DualBlades',6.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (503,-25.0,10.0,220,0,0,0,0,'None',0.0,25.0,'Rex Slicers II',10.0,'None',0.0,6,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (504,-25.0,2.0,160,0,0,0,0,'None',0.0,20.0,'Rex Slicers I',5.0,'None',0.0,3,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (505,0.0,5.0,210,1,0,0,0,'None',0.0,15.0,'Cyclone',20.0,'None',0.0,5,20.0,0,NULL,'Attack Boost III/Defense Boost III/Silk Boost','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (506,0.0,5.0,170,1,0,0,0,'None',0.0,10.0,'Hurricane II',15.0,'None',0.0,4,20.0,0,NULL,'Attack Boost II/Affinity Boost III/Silk Boost','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (507,0.0,0.0,140,0,0,0,0,'None',0.0,15.0,'Hurricane I',15.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Silk Boost','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (508,0.0,0.0,120,0,0,0,0,'None',0.0,10.0,'Dual Daggers',15.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (509,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Matched Slicers II',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (510,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Matched Slicers I',15.0,'None',0.0,1,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (511,10.0,5.0,150,2,1,1,0,'Thunder',28.0,20.0,'Khezu Skards',10.0,'None',0.0,4,10.0,0,NULL,'Attack Boost IV/Thunder Boost II/Paralysis Boost II','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (512,10.0,0.0,100,0,0,0,0,'Thunder',24.0,10.0,'Khezu Daggers II',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost II/Thunder Boost II/Paralysis Boost I','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (513,10.0,0.0,90,0,0,0,0,'Thunder',20.0,10.0,'Khezu Daggers I',15.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Thunder Boost I/Paralysis Boost I','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (514,0.0,5.0,160,2,1,0,0,'Poison',20.0,20.0,'The Kid',10.0,'None',0.0,4,20.0,0,NULL,'Affinity Boost II/Poison Boost II/Buddy Rally','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (515,0.0,0.0,110,0,0,0,0,'Poison',15.0,10.0,'Desperado II',10.0,'None',0.0,2,20.0,0,NULL,'Affinity Boost II/Poison Boost I/Buddy Rally','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (516,0.0,0.0,90,0,0,0,0,'Poison',10.0,5.0,'Desperado I',10.0,'None',0.0,2,15.0,0,NULL,'Affinity Boost I/Poison Boost I/Buddy Rally','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (517,20.0,10.0,180,1,1,0,0,'Ice',20.0,25.0,'Mountain Blizzarioths',15.0,'None',0.0,6,10.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (518,20.0,10.0,160,1,1,0,0,'Ice',18.0,25.0,'Blizzarioths II',5.0,'None',0.0,5,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (519,20.0,0.0,90,0,0,0,0,'Ice',15.0,15.0,'Blizzarioths I',10.0,'None',0.0,2,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (520,0.0,5.0,200,2,0,0,0,'Thunder',25.0,25.0,'Despot''s Blitz',10.0,'None',0.0,6,15.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (521,0.0,5.0,180,0,0,0,0,'Thunder',20.0,20.0,'Usurper''s Fulgur II',5.0,'None',0.0,5,15.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (522,0.0,0.0,120,0,0,0,0,'Thunder',20.0,25.0,'Usurper''s Fulgur I',10.0,'None',0.0,3,15.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (523,0.0,15.0,170,2,1,0,0,'Water',29.0,20.0,'Mud Twister',15.0,'None',0.0,6,15.0,0,NULL,'Attack Boost III/Water Boost II/Element Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (524,0.0,10.0,150,2,1,0,0,'Water',27.0,15.0,'Mud Ripper II',15.0,'None',0.0,6,15.0,0,NULL,'Attack Boost III/Water Boost I/Element Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (525,0.0,0.0,130,0,0,0,0,'Water',22.0,10.0,'Mud Ripper I',10.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Water Boost I/Element Exploit','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (526,0.0,10.0,190,2,1,0,0,'None',0.0,15.0,'Kamura Ninja Blades',20.0,'None',0.0,5,10.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (527,0.0,5.0,150,2,0,0,0,'None',0.0,10.0,'Kamura Glintblades V',20.0,'None',0.0,4,15.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (528,0.0,5.0,140,0,0,0,0,'None',0.0,5.0,'Kamura Glintblades IV',15.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (529,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Kamura Glintblades III',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (530,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Glintblades II',15.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (531,10.0,0.0,120,0,0,0,0,'Water',12.0,15.0,'Morning Dawn I',10.0,'None',0.0,3,15.0,0,NULL,'Any','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (532,10.0,5.0,170,1,0,0,0,'Water',15.0,20.0,'Morning Dawn II',20.0,'None',0.0,5,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (533,0.0,0.0,100,0,0,0,0,'Fire',10.0,10.0,'Schirmscorn I',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (534,0.0,2.0,150,2,0,0,0,'Fire',15.0,15.0,'Schirmscorn II',10.0,'None',0.0,4,10.0,0,NULL,'Attack Boost II/Fire Boost I/Fireblight Exploit','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (535,0.0,10.0,190,0,0,0,0,'Fire',25.0,20.0,'Twin Flames II',5.0,'None',0.0,6,15.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (536,0.0,10.0,180,0,0,0,0,'Fire',22.0,15.0,'Twin Flames I',20.0,'None',0.0,5,20.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (537,0.0,2.0,200,0,0,0,0,'None',0.0,15.0,'Talon Twins',15.0,'None',0.0,5,15.0,0,NULL,'Attack Boost IV/Affinity Boost II/Dulling Strike','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (538,0.0,0.0,180,0,0,0,0,'None',0.0,10.0,'Talon Carvers II',15.0,'None',0.0,4,20.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (539,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Talon Carvers I',20.0,'None',0.0,3,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (540,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Wild Hatchets',10.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (541,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Hatchets II',15.0,'None',0.0,1,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (542,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Hatchets I',20.0,'None',0.0,1,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (543,-15.0,10.0,230,2,1,0,0,'Fire',18.0,10.0,'Gnashing Flammenschild',15.0,'None',0.0,6,30.0,0,NULL,'Affinity Boost II/Fire Boost II/Brutal Strike','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (544,-15.0,5.0,210,2,1,0,0,'Fire',15.0,10.0,'Flammenschild II',20.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (545,-15.0,0.0,140,0,0,0,0,'Fire',10.0,5.0,'Flammenschild I',20.0,'None',0.0,3,25.0,0,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (546,0.0,5.0,220,2,2,0,0,'None',0.0,20.0,'Ashigara Axes',15.0,'None',0.0,6,15.0,0,NULL,'Attack Boost III/Defense Boost II/Dulling Strike','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (547,0.0,0.0,210,2,0,0,0,'None',0.0,25.0,'Cerulean Axes II',10.0,'None',0.0,5,10.0,0,NULL,'Attack Boost II/Defense Boost II/Dulling Strike','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (548,0.0,0.0,180,2,0,0,0,'None',0.0,20.0,'Cerulean Axes I',10.0,'None',0.0,4,5.0,0,NULL,'Attack Boost II/Defense Boost I/Dulling Strike','DualBlades',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (549,-15.0,0.0,170,0,0,0,10,'None',0.0,10.0,'Diablos Bashers I',15.0,'None',0.0,3,25.0,0,NULL,'Affinity Boost I/Defense Boost I/Dulling Strike','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (550,0.0,10.0,170,2,0,0,0,'None',0.0,10.0,'Dual Cleavers',15.0,'None',0.0,5,20.0,0,NULL,'Affinity Boost II/Thunder Boost II/Small Monster Exploit','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (551,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Dual Hatchets I',15.0,'None',0.0,1,20.0,0,NULL,'Affinity Boost I/Thunder Boost I/Small Monster Exploit','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (552,0.0,2.0,190,1,1,0,0,'Thunder',13.0,25.0,'Guillotines',15.0,'None',0.0,5,10.0,0,NULL,'Affinity Boost II/Thunder Boost II/Thunderblight Exploit','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (553,0.0,0.0,160,1,1,0,0,'Thunder',10.0,20.0,'Twin Chainsaws II',10.0,'None',0.0,4,10.0,0,NULL,'Affinity Boost I/Thunder Boost II/Thunderblight Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (554,0.0,0.0,100,0,0,0,0,'Thunder',8.0,10.0,'Twin Chainsaws I',15.0,'None',0.0,2,15.0,0,NULL,'Affinity Boost I/Thunder Boost I/Thunderblight Exploit','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (555,40.0,16.0,180,2,0,0,0,'None',0.0,22.0,'Night Wings',10.0,'None',0.0,6,17.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','DualBlades',10.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (556,40.0,10.0,180,2,0,0,0,'None',0.0,25.0,'Hidden Gemini II',5.0,'None',0.0,5,10.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','DualBlades',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (557,40.0,0.0,110,0,0,0,0,'None',0.0,25.0,'Hidden Gemini I',15.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (558,0.0,0.0,220,2,0,0,0,'Ice',25.0,25.0,'Gelid Soul',10.0,'None',0.0,6,15.0,0,NULL,'Defense Boost II/Ice Boost III/Dulling Strike','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (559,0.0,0.0,170,2,0,0,0,'Ice',18.0,5.0,'Gelid Mind II',20.0,'None',0.0,4,20.0,0,NULL,'Defense Boost I/Ice Boost II/Dulling Strike','DualBlades',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (560,0.0,0.0,150,0,0,0,0,'Ice',18.0,10.0,'Gelid Mind I',20.0,'None',0.0,3,20.0,0,NULL,'Defense Boost I/Ice Boost I/Dulling Strike','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (561,20.0,5.0,160,1,1,1,0,'None',0.0,10.0,'Kulu''s Lasher',20.0,'None',0.0,4,15.0,0,NULL,'Attack Boost II/Affinity Boost III/Spiribird Doubled','DualBlades',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (562,15.0,0.0,110,0,0,0,0,'None',0.0,15.0,'Kulu''s Peck II',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Spiribird Doubled','DualBlades',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (563,15.0,0.0,100,0,0,0,0,'None',0.0,10.0,'Kulu''s Peck I',20.0,'None',0.0,2,20.0,0,NULL,'Attack Boost I/Affinity Boost II/Spiribird Doubled','DualBlades',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (564,0.0,5.0,190,2,0,0,0,'Fire',25.0,15.0,'Daybreak Daggers',10.0,'None',0.0,5,10.0,0,NULL,'Attack Boost II/Fire Boost II/Fireblight Exploit','DualBlades',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (565,0.0,0.0,100,0,0,0,0,'None',0.0,10.0,'Dual Hatchets II',15.0,'None',0.0,2,15.0,0,NULL,'Affinity Boost II/Thunder Boost I/Small Monster Exploit','DualBlades',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (566,0.0,5.0,210,0,0,0,0,'None',0.0,12.0,'Rampage Twinblades S',15.0,'None',0.0,7,10.0,0,NULL,'Any','DualBlades',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (567,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Blade I',19.0,'None',0.0,1,10.0,0,NULL,'Attack Boost II/Defense Boost I','LongSword',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (568,-10.0,3.0,190,0,0,0,0,'Poison',29.0,5.0,'Scythe of Menace II',9.0,'None',0.0,5,7.0,0,NULL,'Attack Boost I/Poison Boost I/Brutal Strike','LongSword',0.0,36.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (569,-10.0,4.0,170,0,0,0,0,'Poison',25.0,10.0,'Scythe of Menace I',8.0,'None',0.0,5,7.0,0,NULL,'Attack Boost I/Poison Boost I/Brutal Strike','LongSword',0.0,36.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (570,-10.0,0.0,220,1,1,1,0,'None',0.0,14.0,'Tormentor',18.0,'None',0.0,5,23.0,0,NULL,'Affinity Boost II/Defense Boost III/Dulling Strike','LongSword',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (571,-15.0,0.0,180,1,1,0,0,'None',0.0,12.0,'Dark Scythe I',17.0,'None',0.0,4,23.0,0,NULL,'Affinity Boost I/Defense Boost II/Dulling Strike','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (572,15.0,10.0,140,2,1,0,0,'None',0.0,8.0,'Gale Scimitar',10.0,'None',0.0,4,16.0,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','LongSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (573,15.0,0.0,100,0,0,0,0,'None',0.0,8.0,'Wind Thief Scimitar II',11.0,'None',0.0,2,19.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','LongSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (574,10.0,0.0,70,0,0,0,0,'None',0.0,7.0,'Wind Thief Scimitar I',11.0,'None',0.0,1,18.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','LongSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (575,0.0,0.0,170,2,0,0,0,'None',0.0,28.0,'Arzuros Strikequill',8.0,'None',0.0,4,8.0,0,NULL,'Attack Boost III/Defense Boost II/Dulling Strike','LongSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (576,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Arzuros Naginata II',8.0,'None',0.0,2,7.0,0,NULL,'Attack Boost II/Defense Boost I/Smaill Monster Exploit','LongSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (577,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Arzuros Naginata I',10.0,'None',0.0,1,10.0,0,NULL,'Attack Boost I/Defense Boost I/Smaill Monster Exploit','LongSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (578,0.0,4.0,160,1,1,2,0,'Water',0.0,22.0,'Douser Bardiche',9.0,'None',0.0,5,8.0,0,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','LongSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (579,0.0,0.0,100,0,0,0,0,'Water',14.0,6.0,'Drowning Shaft II',14.0,'None',0.0,2,14.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (580,0.0,0.0,90,0,0,0,0,'Water',14.0,4.0,'Drowning Shaft I',15.0,'None',0.0,2,11.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','LongSword',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (581,0.0,0.0,190,1,0,0,0,'Sleep',19.0,20.0,'Illusory Frilled Slash',20.0,'None',0.0,5,10.0,0,NULL,'Attack Boost III/Sleep Boost I/Dulling Strike','LongSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (582,0.0,0.0,120,0,0,0,0,'Sleep',15.0,5.0,'Frilled Slah II',14.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Sleep Boost I/Dulling Strike','LongSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (583,0.0,0.0,100,0,0,0,0,'Sleep',12.0,0.0,'Frilled Slah I',27.0,'None',0.0,2,10.0,0,NULL,'Attack Boost I/Sleep Boost I/Dulling Strike','LongSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (584,0.0,0.0,200,3,0,0,15,'None',0.0,5.0,'Antecka Rack',3.0,'None',0.0,6,55.0,0,NULL,'Attack Boost II/Spiribird Doubled/Master Rider','LongSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (585,0.0,1.0,80,0,0,0,0,'Paralysis',9.0,3.0,'Ananta Blade I',7.0,'None',0.0,1,21.0,0,NULL,'Affinity Boost I/Paralysis Boost I/Buddy Rally','LongSword',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (586,0.0,0.0,90,0,0,0,0,'Paralysis',12.0,8.0,'Ananta Blade II',4.0,'None',0.0,2,20.0,0,NULL,'Affinity Boost II/Paralysis Boost I/Buddy Rally','LongSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (587,0.0,0.0,150,1,0,0,0,'Paralysis',17.0,12.0,'Shadow Slasher',15.0,'None',0.0,4,22.0,0,NULL,'Affinity Boost II/Paralysis Boost II/Buddy Rally','LongSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (588,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Scythe I',5.0,'None',0.0,1,35.0,0,NULL,'Attack Boost I/Defense Boost I','LongSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (589,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Scythe II',4.0,'None',0.0,1,26.0,0,NULL,'Attack Boost I/Defense Boost I','LongSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (590,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Bone Reaper',4.0,'None',0.0,2,22.0,0,NULL,'Attack Boost I/Defense Boost II','LongSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (591,-10.0,10.0,210,0,0,0,0,'Poison',34.0,10.0,'Big Menacing Scythe',10.0,'None',0.0,6,10.0,0,NULL,'Attack Boost I/Poison Boost II/Brutal Strike','LongSword',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (592,10.0,0.0,100,0,0,0,0,'Thunder',19.0,8.0,'Spark Slicer I',6.0,'None',0.0,2,30.0,0,NULL,'Attack Boost I/Thunder Boost II','LongSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (593,15.0,9.0,180,1,0,0,0,'Thunder',24.0,6.0,'Shocking Slicer',23.0,'None',0.0,5,35.0,0,NULL,'Attack Boost II/Affinity Boost III/Thunder Boost III','LongSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (594,-10.0,0.0,190,0,0,0,0,'Water',14.0,10.0,'Jyura Saber I',18.0,'None',0.0,5,20.0,0,NULL,'Affinity Boost I/Water Boost I/Brutal Strike','LongSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (595,-10.0,5.0,200,0,0,0,0,'Water',15.0,8.0,'Jyura Saber II',18.0,'None',0.0,5,20.0,0,NULL,'Affinity Boost I/Water Boost II/Brutal Strike','LongSword',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (596,-10.0,7.0,220,0,0,0,0,'Water',16.0,9.0,'Jyura Reaver',21.0,'None',0.0,6,22.0,0,NULL,'Affinity Boost II/Water Boost II/Brutal Strike','LongSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (597,0.0,0.0,170,1,0,0,5,'None',0.0,0.0,'Anteka Blade I',11.0,'None',0.0,4,28.0,0,NULL,'Attack Boost I/Spiribird Doubled/Master Rider','LongSword',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (598,0.0,0.0,190,2,0,0,10,'None',0.0,3.0,'Anteka Blade II',5.0,'None',0.0,5,38.0,0,NULL,'Attack Boost I/Spiribird Doubled/Master Rider','LongSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (599,10.0,0.0,140,0,0,0,0,'Thunder',21.0,10.0,'Spark Slicer II',14.0,'None',0.0,3,25.0,0,NULL,'Attack Boost II/Thunder Boost II','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (600,0.0,0.0,150,1,1,0,0,'Poison',28.0,17.0,'Poison Barb',15.0,'None',0.0,4,20.0,0,NULL,'Affinity Boost II/Poison Boost II/Buddy Rally','LongSword',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (601,0.0,0.0,130,0,0,0,0,'Blast',13.0,15.0,'Sinister Long Sword I',5.0,'None',0.0,3,36.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','LongSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (602,0.0,0.0,200,2,1,0,0,'Blast',23.0,8.0,'Sinister Shade Sword',5.0,'None',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (603,15.0,8.0,220,2,1,1,10,'None',0.0,16.0,'Phantom Mirage',23.0,'None',0.0,7,22.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','LongSword',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (604,0.0,8.0,200,0,0,0,0,'Blast',41.0,10.0,'Imperial Shimmer',18.0,'None',0.0,7,18.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','LongSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (605,0.0,6.0,190,1,0,0,0,'Ice',45.0,8.0,'Daora''s Raid',18.0,'None',0.0,7,18.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','LongSword',2.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (606,-10.0,8.0,220,1,0,0,0,'Blast',17.0,14.0,'Bazel Varga Rookslayer',18.0,'None',0.0,7,18.0,0,NULL,'Defense Boost II/Blast Boost III/Brutal Strike','LongSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (607,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Blade S',15.0,'None',0.0,7,10.0,0,NULL,'Any','LongSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (608,40.0,12.0,190,3,0,0,0,'Fire',15.0,17.0,'Kamura''s Inheritance',16.0,'None',0.0,7,15.0,0,NULL,'Attack Boost IV/Anti-Aerial Species/Anti-Aquatic Species','LongSword',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (609,-10.0,2.0,220,3,0,0,0,'Thunder',15.0,20.0,'Great Demon Halberd',15.0,'None',0.0,7,15.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (610,0.0,12.0,190,0,0,0,0,'Thunder',42.0,8.0,'Abyssal Storm Sword',3.0,'None',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','LongSword',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (611,0.0,25.0,200,0,0,0,0,'Dragon',13.0,12.0,'Abyssal Gale Sword',5.0,'None',0.0,7,5.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (612,15.0,8.0,210,0,0,0,0,'Water',22.0,10.0,'Tamonowo',18.0,'None',0.0,6,18.0,0,NULL,'Attack Boost III/Attack Boost II/Water Boost II','LongSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (613,0.0,8.0,200,0,0,0,0,'None',0.0,12.0,'Rampage Blade V',20.0,'None',0.0,6,12.0,0,NULL,'Any','LongSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (614,0.0,5.0,190,0,0,0,0,'None',0.0,5.0,'Rampage Blade IV',15.0,'None',0.0,6,10.0,0,NULL,'Any','LongSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (615,0.0,3.0,180,0,0,0,0,'None',0.0,5.0,'Rampage Blade III',15.0,'None',0.0,5,10.0,0,NULL,'Any','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (616,0.0,0.0,170,0,0,0,0,'None',0.0,5.0,'Rampage Blade II',15.0,'None',0.0,5,15.0,0,NULL,'Any','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (617,0.0,0.0,150,0,0,0,0,'None',0.0,3.0,'Rampage Blade I',15.0,'None',0.0,4,15.0,0,NULL,'Any','LongSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (618,10.0,4.0,180,3,0,0,0,'Fire',10.0,15.0,'Hand-Me-Down Sword II',14.0,'None',0.0,5,14.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Anti-Aquatic Species','LongSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (619,10.0,0.0,120,0,0,0,0,'Fire',7.0,5.0,'Hand-Me-Down Sword I',14.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','LongSword',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (620,-10.0,0.0,190,0,0,0,0,'Thunder',10.0,17.0,'Demon Halberd I',15.0,'None',0.0,5,15.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','LongSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (621,-10.0,0.0,200,3,0,0,0,'Thunder',12.0,23.0,'Demon Halberd II',17.0,'None',0.0,6,15.0,0,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (622,0.0,0.0,180,0,0,0,0,'Dragon',10.0,20.0,'Azure Elder Long sword I',3.0,'None',0.0,5,8.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','LongSword',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (623,0.0,0.0,190,0,0,0,0,'Dragon',12.0,25.0,'Azure Elder Long sword II',13.0,'None',0.0,6,7.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','LongSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (624,0.0,0.0,180,0,0,0,0,'Thunder',38.0,3.0,'Thunderbolt Long Sword I',46.0,'None',0.0,6,8.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','LongSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (625,-10.0,5.0,200,0,0,0,0,'Blast',13.0,20.0,'Rookslayer Saber I
',13.0,'None',0.0,6,16.0,0,NULL,'Defesnse Boost I/Blast Boost II/Brutal Strike','LongSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (626,0.0,0.0,150,0,0,0,0,'Blast',16.0,17.0,'Sinister Long Sword II',5.0,'None',0.0,3,37.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','LongSword',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (627,-10.0,5.0,210,2,0,0,0,'Blast',15.0,18.0,'Rookslayer Saber II',20.0,'None',0.0,6,25.0,0,NULL,'Defesnse Boost I/Blast Boost II/Brutal Strike','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (628,0.0,10.0,190,0,0,0,0,'Blast',35.0,15.0,'Imperial Saber I',20.0,'None',0.0,6,25.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (629,15.0,8.0,210,2,1,1,10,'None',0.0,15.0,'Mirage Finsword I',20.0,'None',0.0,6,25.0,0,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','LongSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (630,0.0,0.0,100,0,0,0,0,'Dragon',20.0,5.0,'Cawscythe I',10.0,'None',0.0,2,13.0,0,NULL,'Any','LongSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (631,0.0,0.0,140,0,0,0,0,'Dragon',21.0,14.0,'Cawscythe II',17.0,'None',0.0,3,10.0,0,NULL,'Attack Boost III/Dragon Boost I/Dragon Exploit','LongSword',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (632,0.0,4.0,160,2,2,0,0,'Dragon',25.0,14.0,'Cawscythe III',19.0,'None',0.0,5,19.0,0,NULL,'Attack Boost III/Dragon Boost II/Dragon Exploit','LongSword',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (633,0.0,5.0,180,2,2,0,0,'Dragon',27.0,11.0,'Squawkscythe',20.0,'None',0.0,6,22.0,0,NULL,'Attack Boost IV/Dragon Boost II/Dragon Exploit','LongSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (634,0.0,10.0,180,1,0,0,0,'Ice',43.0,10.0,'Icesteel Blade I',20.0,'None',0.0,6,25.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (635,0.0,0.0,180,2,0,0,0,'Dragon',39.0,0.0,'Reddnaught Blade',0.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','LongSword',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (636,0.0,0.0,110,0,0,0,0,'Poison',23.0,9.0,'Wroggi Sword II',14.0,'None',0.0,3,20.0,0,NULL,'Affinity Boost II/Poison Boost I/Buddy Rally','LongSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (637,35.0,10.0,160,1,1,0,0,'Ice',27.0,20.0,'Bastizan Edge',15.0,'None',0.0,5,10.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','LongSword',3.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (638,0.0,4.0,170,1,0,0,0,'None',0.0,10.0,'Keen Edge II',20.0,'None',0.0,4,23.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','LongSword',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (639,0.0,0.0,140,0,0,0,0,'None',0.0,11.0,'Keen Edge I',16.0,'None',0.0,3,21.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','LongSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (640,0.0,0.0,120,0,0,0,0,'None',0.0,7.0,'Iron Gospel',16.0,'None',0.0,2,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','LongSword',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (641,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Iron Katana II',13.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Defense Boost II','LongSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (642,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Iron Katana I',16.0,'None',0.0,1,18.0,0,NULL,'Attack Boost I/Defense Boost II','LongSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (643,0.0,13.0,180,2,1,0,0,'Water',48.0,21.0,'Doom Bringer Blade',14.0,'None',0.0,6,14.0,0,NULL,'Attack Boost III/Water Boost I/Element Exploit','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (644,0.0,8.0,160,2,1,0,0,'Water',41.0,13.0,'Almudron Blade II',14.0,'None',0.0,6,14.0,0,NULL,'Attack Boost III/Water Boost I/Element Exploit','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (645,0.0,0.0,120,0,0,0,0,'Water',33.0,11.0,'Almudron Blade I',11.0,'None',0.0,3,12.0,0,NULL,'Attack Boost II/Water Boost I/Element Exploit','LongSword',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (646,0.0,0.0,180,1,0,0,20,'Fire',22.0,11.0,'Titanic Makra',18.0,'None',0.0,5,26.0,0,NULL,'Defense Boost II/Fire Boost III/Dulling Strike','LongSword',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (647,0.0,0.0,150,0,0,0,20,'Fire',18.0,4.0,'Gigant Makra II',23.0,'None',0.0,3,26.0,0,NULL,'Defense Boost I/Fire Boost II/Dulling Strike','LongSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (648,0.0,0.0,110,0,0,0,20,'Fire',12.0,0.0,'Gigant Makra I',18.0,'None',0.0,2,23.0,0,NULL,'Defense Boost I/Fire Boost I/Dulling Strike','LongSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (649,-20.0,3.0,200,0,0,0,0,'None',0.0,20.0,'Castellum Long Sword',12.0,'None',0.0,5,14.0,0,NULL,'Affinity Boost II/Defense Boost II/Brutal Strike','LongSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (650,-20.0,0.0,150,0,0,0,0,'None',0.0,8.0,'Castello Saif II',13.0,'None',0.0,3,16.0,0,NULL,'Affinity Boost I/Defense Boost II/Brutal Strike','LongSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (651,-20.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Castello Saif I',13.0,'None',0.0,2,14.0,0,NULL,'Affinity Boost I/Defense Boost I/Brutal Strike','LongSword',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (652,10.0,11.0,140,2,1,1,0,'None',0.0,19.0,'Imperial Sword',11.0,'None',0.0,4,10.0,0,NULL,'Affinity Boost III/Defense Boost III/Silkbind Boost','LongSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (653,5.0,0.0,100,0,0,0,0,'None',0.0,15.0,'Guardian Sword II',18.0,'None',0.0,2,13.0,0,NULL,'Affinity Boost II/Defense Boost II/Silkbind Boost','LongSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (654,5.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Guardian Sword I',18.0,'None',0.0,1,21.0,0,NULL,'Affinity Boost II/Defense Boost II/Silkbind Boost','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (655,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Blade II',19.0,'None',0.0,1,13.0,0,NULL,'Attack Boost II/Defense Boost I','LongSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (656,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Kamura Blade III',14.0,'None',0.0,2,12.0,0,NULL,'Attack Boost II/Defense Boost II','LongSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (657,0.0,4.0,140,0,0,0,0,'None',0.0,6.0,'Kamura Blade IV',14.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','LongSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (658,0.0,5.0,150,2,0,0,0,'None',0.0,7.0,'Kamura Blade V',17.0,'None',0.0,4,12.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','LongSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (659,0.0,9.0,190,2,1,0,0,'None',0.0,11.0,'Kamura Ninja Blade',18.0,'None',0.0,5,8.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','LongSword',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (660,0.0,0.0,120,0,0,0,0,'Thunder',16.0,11.0,'Usurper Boltslicer I',16.0,'None',0.0,3,19.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','LongSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (661,0.0,8.0,180,1,0,0,0,'None',0.0,10.0,'Julienne Blade',21.0,'None',0.0,5,21.0,0,NULL,'Attack Boost III/Defense Bost/Silkbind Boost','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (662,0.0,7.0,180,0,0,0,0,'Thunder',3.0,16.0,'Usurper Boltslicer II',7.0,'None',0.0,5,14.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','LongSword',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (663,0.0,0.0,100,0,0,0,0,'Fire',13.0,9.0,'Aknosom Sabre I',11.0,'None',0.0,2,7.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (664,0.0,4.0,160,2,0,0,0,'Fire',19.0,7.0,'Aknosom Sabre II',11.0,'None',0.0,4,7.0,0,NULL,'Attack Boost II/Fire Boost I/Fireblight Exploit','LongSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (665,0.0,5.0,170,2,0,0,0,'Fire',26.0,18.0,'Daybreak Blade',11.0,'None',0.0,5,7.0,0,NULL,'Attack Boost II/Fire Boost II/Fireblight Exploit','LongSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (666,-10.0,0.0,100,0,0,0,0,'Ice',10.0,0.0,'Ivory Rabbit I',17.0,'None',0.0,1,17.0,0,NULL,'Attack Boost I/Ice Boost I/Small Monster Exploit','LongSword',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (667,-10.0,0.0,110,0,0,0,0,'Ice',12.0,6.0,'Ivory Rabbit II',14.0,'None',0.0,2,16.0,0,NULL,'Attack Boost I/Ice Boost II/Small Monster Exploit','LongSword',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (668,-10.0,0.0,180,2,1,0,0,'Ice',15.0,15.0,'Iced Rabbit',7.0,'None',0.0,4,13.0,0,NULL,'Attack Boost II/Ice Boost II/Dulling Strike','LongSword',0.0,34.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (669,0.0,8.0,200,1,1,0,0,'Thunder',34.0,19.0,'Despot Boltbreaker',9.0,'None',0.0,6,14.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','LongSword',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (670,0.0,2.0,80,0,0,0,0,'Poison',19.0,4.0,'Wroggi Sword I',8.0,'None',0.0,2,20.0,0,NULL,'Affinity Boost I/Poison Boost I/Buddy Rally','LongSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (671,-20.0,2.0,160,0,0,0,0,'None',0.0,21.0,'Tigrine Edge I',7.0,'None',0.0,3,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','LongSword',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (672,-20.0,10.0,230,0,0,0,0,'None',0.0,30.0,'Tigrine Need',10.0,'None',0.0,6,15.0,0,NULL,'Attack Boost II/Affinity Boost III/Brutal Strike','LongSword',5.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (673,30.0,4.0,120,0,0,0,0,'Ice',19.0,23.0,'Bastine Edge II',14.0,'None',0.0,3,7.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','LongSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (674,30.0,0.0,90,0,0,0,0,'Ice',15.0,13.0,'Bastine Edge I',10.0,'None',0.0,2,8.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','LongSword',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (675,-20.0,4.0,230,2,1,0,0,'Fire',24.0,14.0,'Fervid Flammenschwert',20.0,'None',0.0,6,24.0,0,NULL,'Affinity Boost II/Fire Boost III/Brutal Strike','LongSword',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (676,-20.0,0.0,210,2,1,0,0,'Fire',20.0,13.0,'Flammenschwert II',18.0,'None',0.0,5,23.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','LongSword',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (677,-20.0,0.0,140,0,0,0,0,'Fire',11.0,7.0,'Flammenschwert I',18.0,'None',0.0,3,23.0,0,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','LongSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (678,0.0,0.0,230,2,0,0,0,'None',0.0,10.0,'Gnash Katana',28.0,'None',0.0,6,35.0,0,NULL,'Attack Boost IV/Affinity Boost II/Dulling Strike','LongSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (679,0.0,0.0,200,0,0,0,0,'None',0.0,11.0,'Canine Katana II',26.0,'None',0.0,5,30.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','LongSword',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (680,0.0,0.0,180,0,0,0,0,'None',0.0,8.0,'Canine Katana I',16.0,'None',0.0,4,19.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','LongSword',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (681,0.0,0.0,130,0,0,0,0,'None',0.0,0.0,'Serrated Maw',21.0,'None',0.0,2,21.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','LongSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (682,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Serrated Jaw II',16.0,'None',0.0,1,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','LongSword',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (683,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Serrated Jaw I',21.0,'None',0.0,1,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','LongSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (684,0.0,10.0,210,0,0,0,0,'Fire',36.0,20.0,'Wyvern Blade Maple',2.0,'None',0.0,6,50.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','LongSword',0.0,2.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (685,0.0,0.0,200,0,0,0,0,'Fire',32.0,5.0,'Wyvern Blade Blood II',3.0,'None',0.0,6,45.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','LongSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (686,0.0,0.0,190,0,0,0,0,'Fire',25.0,4.0,'Wyvern Blade Blood I',3.0,'None',0.0,5,40.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','LongSword',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (687,0.0,4.0,200,1,0,0,0,'Poison',22.0,16.0,'Wyvern Blade Holly',21.0,'None',0.0,5,23.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','LongSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (688,0.0,4.0,170,0,0,0,0,'Poison',20.0,13.0,'Wyvern Blade Verde II',19.0,'None',0.0,5,19.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (689,0.0,0.0,90,0,0,0,0,'Poison',18.0,8.0,'Wyvern Blade Verde I',19.0,'None',0.0,2,19.0,0,NULL,'Attack Boost I/Poison Boost I/Small Monster Exploit','LongSword',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (690,10.0,0.0,120,0,0,0,0,'Water',16.0,9.0,'Kakaru Kumo Naki I',10.0,'None',0.0,3,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','LongSword',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (691,10.0,5.0,190,0,0,0,0,'Water',19.0,4.0,'Kakaru Kumo Naki II',23.0,'None',0.0,5,25.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','LongSword',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (692,30.0,0.0,120,0,0,0,0,'None',0.0,23.0,'Hidden Saber I',17.0,'None',0.0,3,12.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','LongSword',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (693,35.0,11.0,160,2,0,0,0,'None',0.0,27.0,'Hidden Saber II',16.0,'None',0.0,5,15.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','LongSword',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (694,40.0,18.0,180,2,0,0,0,'None',0.0,21.0,'Deepest Night',11.0,'None',0.0,6,18.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','LongSword',7.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (695,0.0,0.0,80,0,0,0,0,'Thunder',18.0,9.0,'Eager Cleaver I',11.0,'None',0.0,2,12.0,0,NULL,'Thunder Boost I/Dulling Strike/Thunderblight Exploit','LongSword',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (696,-20.0,6.0,220,0,0,0,0,'None',0.0,22.0,'Tigrine Edge II',9.0,'None',0.0,6,12.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','LongSword',0.0,32.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (697,0.0,0.0,160,1,1,0,0,'Thunder',24.0,16.0,'Eager Cleaver II',9.0,'None',0.0,4,9.0,0,NULL,'Thunder Boos/Dulling Strike/Thunderblight Exploit','LongSword',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (698,10.0,0.0,100,0,0,0,0,'None',0.0,10.0,'Kulu Katana I',11.0,'None',0.0,2,16.0,0,NULL,'Attack Boost II/Spiribird Doubled','LongSword',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (699,15.0,0.0,130,0,0,0,0,'None',0.0,11.0,'Kulu Katana II',15.0,'None',0.0,3,19.0,0,NULL,'Attack Boost II/Affinity Boost II/Spiribird Doubled','LongSword',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (700,20.0,2.0,160,1,1,1,0,'None',0.0,12.0,'Kulu Slicer',19.0,'None',0.0,4,19.0,0,NULL,'Attack Boost II/Affinity Boost III/Spiribird Doubled','LongSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (701,0.0,4.0,160,0,0,0,0,'Ice',18.0,10.0,'Chillblade I',14.0,'None',0.0,4,14.0,0,NULL,'Attack Boost I/Ice Boost I/Silkbind Boost','LongSword',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (702,0.0,5.0,180,0,0,0,0,'Ice',20.0,10.0,'Chillblade II',16.0,'None',0.0,5,19.0,0,NULL,'Attack Boost I/Ice Boost II/Silkbind Boost','LongSword',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (703,0.0,9.0,210,0,0,0,0,'Ice',27.0,9.0,'Rimeblossom',17.0,'None',0.0,6,17.0,0,NULL,'Attack Boost II/Ice Boost II/Silkbind Boost','LongSword',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (704,0.0,0.0,180,1,1,0,0,'Thunder',27.0,22.0,'Devil Slicer',11.0,'None',0.0,5,9.0,0,NULL,'Thunder Boost II/Dulling Strike/Thunderblight Exploit','LongSword',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (705,0.0,0.0,170,2,0,0,0,'Dragon',35.0,0.0,'Redwing Long Sword I',0.0,'None',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','LongSword',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (706,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Hammer I',25.0,'None',0.0,1,10.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','Hammer',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (707,0.0,0.0,130,0,0,0,0,'Blast',15.0,18.0,'Sinister Hammer I',4.0,'None',0.0,3,53.0,0,NULL,'Attack Boost I/Blast Boost I/Magnamalo Soul','Hammer',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (708,-5.0,0.0,200,1,0,0,10,'None',0.0,15.0,'Barroth Hammer',7.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost II/Defense Boost II/Dulling Strike','Hammer',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (709,-10.0,0.0,150,0,0,0,8,'None',0.0,4.0,'Carapace Hammer II',14.0,'None',0.0,3,14.0,0,NULL,'Affinity Boost I/Defense Boost I/Dulling Strike','Hammer',0.0,47.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (710,-10.0,0.0,120,0,0,0,5,'None',0.0,0.0,'Carapace Hammer I',14.0,'None',0.0,2,11.0,0,NULL,'Affinity Boost I/Defense Boost I/Dulling Strike','Hammer',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (711,45.0,14.0,180,2,0,0,0,'None',0.0,22.0,'Night Eternal',13.0,'None',0.0,6,17.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','Hammer',5.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (712,40.0,12.0,170,2,0,0,0,'None',0.0,25.0,'Hidden Breaker II',6.0,'None',0.0,5,24.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','Hammer',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (713,40.0,0.0,130,0,0,0,0,'None',0.0,24.0,'Hidden Breaker I',17.0,'None',0.0,3,11.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','Hammer',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (714,15.0,4.0,160,2,1,0,0,'None',0.0,17.0,'Snapper Hammer',19.0,'None',0.0,4,6.0,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','Hammer',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (715,12.0,0.0,90,0,0,0,0,'None',0.0,7.0,'Izuchi Hammer II',15.0,'None',0.0,1,6.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (716,0.0,0.0,70,0,0,0,0,'None',0.0,0.0,'Izuchi Hammer I',18.0,'None',0.0,1,6.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','Hammer',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (717,0.0,4.0,170,2,1,1,0,'Water',31.0,14.0,'Ludroth Dousehammer',9.0,'None',0.0,5,14.0,0,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','Hammer',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (718,0.0,0.0,100,0,0,0,0,'Water',31.0,10.0,'Droth Splashhammer II',14.0,'None',0.0,2,11.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','Hammer',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (719,0.0,0.0,100,0,0,0,0,'Water',25.0,7.0,'Droth Splashhammer I',10.0,'None',0.0,2,9.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','Hammer',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (720,10.0,2.0,170,0,0,0,0,'Poison',16.0,14.0,'Catastrophic Portent',15.0,'None',0.0,4,30.0,0,NULL,'Attack Boost III/Poison Boost II/Dulling Strike','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (721,5.0,0.0,120,0,0,0,0,'Poison',14.0,9.0,'Calamitous Portent II',11.0,'None',0.0,3,29.0,0,NULL,'Attack Boost III/Poison Boost I/Dulling Strike','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (722,5.0,0.0,110,0,0,0,0,'Poison',12.0,4.0,'Calamitous Portent I',14.0,'None',0.0,2,21.0,0,NULL,'Attack Boost II/Poison Boost I/Dulling Strike','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (723,0.0,9.0,210,1,1,0,0,'Thunder',33.0,24.0,'Despot''s Crackle',9.0,'None',0.0,6,16.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','Hammer',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (724,0.0,0.0,180,2,1,0,0,'Poison',47.0,28.0,'Pukei Hammer II',16.0,'None',0.0,5,19.0,0,NULL,'Attack Boost III/Defense Boost II/Poison Boost II','Hammer',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (725,0.0,9.0,190,2,1,0,0,'Poison',54.0,18.0,'Datura Club',28.0,'None',0.0,6,19.0,0,NULL,'Attack Boost IV/Defense Boost III/Poison Boost II','Hammer',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (726,0.0,0.0,120,0,0,0,15,'None',0.0,4.0,'Basarios Blow I',33.0,'None',0.0,2,9.0,0,NULL,'Defense Boost I/Attack Boost II/Dulling Strike','Hammer',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (727,0.0,0.0,160,0,0,0,15,'None',0.0,9.0,'Basarios Blow II',31.0,'None',0.0,3,9.0,0,NULL,'Defense Boost I/Attack Boost III/Dulling Strike','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (728,0.0,3.0,190,1,0,0,20,'None',0.0,13.0,'Basarios Bash',31.0,'None',0.0,5,9.0,0,NULL,'Defense Boost I/Attack Boost III/Dulling Strike','Hammer',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (729,5.0,4.0,190,0,0,0,0,'Fire',27.0,17.0,'Red Bludgeon I',3.0,'None',0.0,5,56.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','Hammer',0.0,2.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (730,0.0,0.0,140,0,0,0,0,'Blast',18.0,21.0,'Sinister Hammer II',5.0,'None',0.0,3,40.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','Hammer',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (731,5.0,8.0,200,0,0,0,0,'Fire',31.0,16.0,'Red Bludgeon II',2.0,'None',0.0,6,54.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','Hammer',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (732,-15.0,0.0,170,0,0,0,0,'Ice',13.0,9.0,'Yeti Hammer I',6.0,'None',0.0,3,24.0,0,NULL,'Affinity Boost I/Ice Boost I/Brutal Strike','Hammer',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (733,-15.0,5.0,190,2,0,0,0,'Ice',15.0,10.0,'Yet Hammer II',6.0,'None',0.0,5,24.0,0,NULL,'Affinity Boost I/Ice Boost II/Brutal Strike','Hammer',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (734,-15.0,6.0,220,2,0,0,0,'Ice',17.0,10.0,'Yeti Hammer III',6.0,'None',0.0,6,24.0,0,NULL,'Affinity Boost I/Ice Boost II/Brutal Strike','Hammer',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (735,-15.0,6.0,230,2,0,0,0,'Ice',20.0,14.0,'Abominable Hammer',6.0,'None',0.0,6,24.0,0,NULL,'Affinity Boost I/Ice Boost III/Brutal Strike','Hammer',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (736,0.0,0.0,120,0,0,0,0,'Thunder',25.0,14.0,'Usurper''s Thunder I',9.0,'None',0.0,3,16.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','Hammer',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (737,0.0,7.0,190,1,1,0,0,'Thunder',28.0,21.0,'Usurper''s Thunder II',9.0,'None',0.0,5,16.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','Hammer',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (738,5.0,10.0,210,0,0,0,0,'Fire',34.0,16.0,'Huracan Hammer',2.0,'None',0.0,6,55.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','Hammer',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (739,0.0,9.0,200,2,1,0,0,'Blast',25.0,21.0,'Sinister Shade Hammer',2.0,'None',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','Hammer',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (740,-30.0,0.0,200,1,1,1,0,'None',0.0,0.0,'Egg Hammer I',24.0,'None',0.0,4,11.0,0,NULL,'Dragon Exploit/Anti-Aerial Species/Anti-Aquatic Species','Hammer',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (741,-30.0,0.0,240,1,1,1,0,'None',0.0,0.0,'Egg Hammer II',24.0,'None',0.0,5,11.0,0,NULL,'Dragon Exploit/Anti-Aerial Species/Anti-Aquatic Species','Hammer',0.0,36.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (742,0.0,5.0,190,2,1,0,0,'Fire',14.0,20.0,'Jack-''o-lantern King',24.0,'None',0.0,5,19.0,0,NULL,'Defense Boost III/Master Rider/Spiribird Doubled','Hammer',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (743,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Rampage Hammer I',16.0,'None',0.0,4,16.0,0,NULL,'Any','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (744,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage Hammer II',16.0,'None',0.0,5,14.0,0,NULL,'Any','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (745,0.0,4.0,190,0,0,0,0,'None',0.0,7.0,'Rampage Hammer III',15.0,'None',0.0,5,11.0,0,NULL,'Any','Hammer',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (746,0.0,5.0,190,0,0,0,0,'None',0.0,20.0,'Rampage Hammer IV',24.0,'None',0.0,6,19.0,0,NULL,'Any','Hammer',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (747,0.0,7.0,200,0,0,0,0,'None',0.0,12.0,'Rampage Hammer V',17.0,'None',0.0,6,12.0,0,NULL,'Any','Hammer',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (748,0.0,0.0,150,0,0,0,0,'Fire',11.0,12.0,'Pumpking II',24.0,'None',0.0,3,18.0,0,NULL,'Defense Boost II/Master Rider/Spiribird Doubled','Hammer',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (749,0.0,0.0,170,2,0,0,0,'Dragon',40.0,0.0,'Redwing Drill I',0.0,'None',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','Hammer',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (750,0.0,12.0,200,0,0,0,0,'Thunder',49.0,8.0,'Abyssal Storm Mauler',3.0,'None',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','Hammer',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (751,10.0,6.0,190,1,0,0,0,'Ice',42.0,8.0,'Daora''s Colossus',18.0,'None',0.0,7,18.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','Hammer',2.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (752,-25.0,5.0,240,0,0,0,15,'None',0.0,15.0,'Diablos Tail',0.0,'None',0.0,7,10.0,0,NULL,'Affinity Boost III/Defense Boost II/Brutal Strike','Hammer',0.0,2.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (753,0.0,10.0,200,1,0,0,0,'Poison',32.0,20.0,'Diamalto''s Dream',5.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','Hammer',2.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (754,-10.0,0.0,230,3,0,0,0,'Thunder',16.0,25.0,'Mane Malice Rajang',12.0,'None',0.0,7,12.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (755,5.0,10.0,190,1,1,0,0,'Blast',46.0,15.0,'Teostra Cratergouger',4.0,'None',0.0,7,30.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','Hammer',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (756,0.0,25.0,210,0,0,0,0,'Dragon',17.0,12.0,'Abyssal Gale Mauler',5.0,'None',0.0,7,5.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','Hammer',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (757,0.0,0.0,160,1,0,0,0,'Poison',40.0,20.0,'Pukei Hammer I',16.0,'None',0.0,5,14.0,0,NULL,'Attack Boost III/Defense Boost II/Poison Boost II','Hammer',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (758,0.0,0.0,120,0,0,0,0,'Fire',8.0,9.0,'Pumpking I',25.0,'None',0.0,2,19.0,0,NULL,'Defense Boost II/Master Rider/Spiribird Doubled','Hammer',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (759,0.0,0.0,170,2,2,0,8,'Dragon',29.0,19.0,'Graceful Death III',23.0,'None',0.0,5,4.0,0,NULL,'Attack Boost III/Dragon Boost II/Dragon Exploit','Hammer',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (760,-30.0,0.0,260,1,1,1,0,'None',0.0,0.0,'Gargwa Hammer',24.0,'None',0.0,6,11.0,0,NULL,'Dragon Exploit/Anti-Aerial Species/Anti-Aquatic Species','Hammer',0.0,47.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (761,-20.0,0.0,190,0,0,0,0,'Thunder',11.0,19.0,'Mane Malice I',4.0,'None',0.0,5,11.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','Hammer',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (762,-15.0,0.0,220,3,0,0,0,'Thunder',13.0,24.0,'Mane Malice II',18.0,'None',0.0,6,11.0,0,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','Hammer',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (763,0.0,23.0,180,0,0,0,0,'Dragon',15.0,10.0,'Azure Elder Hammer I',4.0,'None',0.0,5,4.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','Hammer',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (764,0.0,25.0,200,0,0,0,0,'Dragon',16.0,10.0,'Azure Elder Hammer II',4.0,'None',0.0,6,4.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','Hammer',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (765,0.0,7.0,190,0,0,0,0,'Thunder',47.0,9.0,'Thunderbolt Hammer I',4.0,'None',0.0,6,4.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','Hammer',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (766,0.0,2.0,180,2,2,0,10,'Dragon',34.0,24.0,'Yadora Morte',4.0,'None',0.0,6,46.0,0,NULL,'Attack Boost IV/Dragon Boost II/Dragon Exploit','Hammer',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (767,10.0,10.0,180,1,0,0,0,'Ice',36.0,22.0,'Icesteel Hammer I',10.0,'None',0.0,6,16.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','Hammer',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (768,0.0,11.0,190,1,0,0,0,'Poison',28.0,23.0,'Genie''s Expanse I',6.0,'None',0.0,6,25.0,0,NULL,'Attack Boost II/Defense Boost II/Chameleos Soul','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (769,0.0,0.0,110,0,0,0,0,'Sleep',30.0,15.0,'Teddybear I',5.0,'None',0.0,3,11.0,0,NULL,'Affinity Boost II/Defense Boost II/Silkbind Boost','Hammer',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (770,0.0,9.0,120,2,0,0,0,'Sleep',34.0,14.0,'Teddybear II',4.0,'None',0.0,4,10.0,0,NULL,'Affinity Boost II/Defense Boost II/Silkbind Boost','Hammer',0.0,33.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (771,0.0,9.0,130,2,0,0,0,'Sleep',38.0,15.0,'Sleepy Bear',4.0,'None',0.0,5,10.0,0,NULL,'Affinity Boost IV/Defense Boost III/Silkbind Boost','Hammer',9.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (772,0.0,0.0,110,0,0,0,3,'Dragon',18.0,14.0,'Graceful Death I',16.0,'None',0.0,2,11.0,0,NULL,'Attack Boost II/Dragon Boost I/Dragon Exploit','Hammer',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (773,0.0,0.0,140,0,0,0,5,'Dragon',18.0,15.0,'Graceful Death II',16.0,'None',0.0,3,6.0,0,NULL,'Attack Boost III/Dragon Boost I/Dragon Exploit','Hammer',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (774,5.0,10.0,180,1,1,0,0,'Blast',40.0,22.0,'Teostra Cratermaker I',4.0,'None',0.0,6,36.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','Hammer',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (775,0.0,0.0,180,2,0,0,0,'Dragon',43.0,0.0,'Reddnaught Hammer',0.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','Hammer',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (776,0.0,0.0,230,2,0,0,0,'None',0.0,37.0,'Atlas Hammer',16.0,'None',0.0,6,19.0,0,NULL,'Defense Boost III/Master Rider/Spiribird Doubled','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (777,0.0,0.0,160,0,0,0,0,'None',0.0,18.0,'Cyclo-Hammer I',16.0,'None',0.0,3,19.0,0,NULL,'Defense Boost II/Master Rider/Spiribird Doubled','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (778,0.0,4.0,180,1,1,1,5,'Thunder',37.0,13.0,'Great Nova II',11.0,'None',0.0,5,24.0,0,NULL,'Defense Boost III/Dragon Exploit/Element Exploit','Hammer',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (779,0.0,2.0,160,1,1,1,5,'Thunder',35.0,14.0,'Great Nova I',8.0,'None',0.0,5,24.0,0,NULL,'Defense Boost III/Dragon Exploit/Element Exploit','Hammer',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (780,0.0,10.0,180,1,0,0,0,'None',0.0,11.0,'War Basher',12.0,'None',0.0,5,11.0,0,NULL,'Attack Boost III/Defense Boost III/Silkbind Boost','Hammer',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (781,0.0,4.0,160,1,0,0,0,'None',0.0,11.0,'War Stamp I',19.0,'None',0.0,4,16.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (782,0.0,0.0,140,0,0,0,0,'None',0.0,13.0,'War Mace',16.0,'None',0.0,3,21.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','Hammer',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (783,0.0,0.0,110,0,0,0,0,'None',0.0,2.0,'War Hammer I',14.0,'None',0.0,2,14.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','Hammer',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (784,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Iron Devil',14.0,'None',0.0,1,16.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','Hammer',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (785,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Iron Hammer I',15.0,'None',0.0,1,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (786,0.0,4.0,160,1,1,1,10,'Fire',50.0,11.0,'Deadeye Revolver',21.0,'None',0.0,5,24.0,0,NULL,'Attack Boost IV/Fireblight Exploit/Small Monster Exploit','Hammer',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (787,0.0,0.0,150,1,1,1,8,'Fire',45.0,10.0,'Gun Hammer II',20.0,'None',0.0,4,20.0,0,NULL,'Attack Boost III/Fireblight Exploit/Small Monster Exploit','Hammer',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (788,0.0,0.0,90,0,0,0,4,'Fire',37.0,2.0,'Gun Hammer I',12.0,'None',0.0,2,18.0,0,NULL,'Attack Boost II/Fireblight Exploit/Small Monster Exploit','Hammer',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (789,0.0,0.0,140,1,1,1,0,'Poison',36.0,10.0,'Dirty Hammer',10.0,'None',0.0,4,24.0,0,NULL,'Affinity Boost II/Poison Boost II/Buddy Rally','Hammer',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (790,0.0,0.0,130,0,0,0,0,'Poison',31.0,8.0,'Wroggi Hammer II',9.0,'None',0.0,3,20.0,0,NULL,'Affinity Boost II/Poison Boost I/Buddy Rally','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (791,0.0,0.0,90,0,0,0,0,'Poison',27.0,5.0,'Wroggi Hammer I',10.0,'None',0.0,2,20.0,0,NULL,'Affinity Boost I/Poison Boost I/Buddy Rally','Hammer',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (792,0.0,5.0,190,3,0,0,0,'None',0.0,10.0,'Great Pronged Hammer',43.0,'None',0.0,6,7.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Silkbind Boost','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (793,0.0,5.0,180,3,0,0,0,'None',0.0,10.0,'Five-Pronged Hammer II',38.0,'None',0.0,5,7.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Silkbind Boost','Hammer',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (794,0.0,0.0,120,0,0,0,0,'None',0.0,10.0,'Five-Pronged Hammer I',30.0,'None',0.0,2,5.0,0,NULL,'Attack Boost I/Anti-Aerial Species/Silkbind Boost','Hammer',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (795,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Hammer II',15.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','Hammer',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (796,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Kamura Hammer III',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (797,0.0,2.0,140,0,0,0,0,'None',0.0,5.0,'Kamura Hammer IV',15.0,'None',0.0,3,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (798,0.0,5.0,150,2,0,0,0,'None',0.0,10.0,'Kamura Hammer V',15.0,'None',0.0,4,15.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (799,0.0,10.0,190,2,1,0,0,'None',0.0,15.0,'Kamura Ninja Hammer',20.0,'None',0.0,5,10.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','Hammer',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (800,15.0,0.0,120,0,0,0,0,'Water',21.0,10.0,'Purity Hammer I',10.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost I','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (801,0.0,7.0,200,1,1,1,5,'Thunder',37.0,16.0,'Super Nova',13.0,'None',0.0,6,24.0,0,NULL,'Defense Boost III/Dragon Exploit/Element Exploit','Hammer',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (802,15.0,5.0,170,1,0,0,0,'Water',26.0,5.0,'Purity Hammer II',25.0,'None',0.0,5,25.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (803,0.0,0.0,90,0,0,0,0,'Paralysis',23.0,10.0,'Binding Bludgeon I',10.0,'None',0.0,2,35.0,0,NULL,'Attack Boost II/Defense Boost II/Dulling Strike','Hammer',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (804,0.0,0.0,160,1,0,0,0,'Paralysis',27.0,15.0,'Binding Bludgeon II',10.0,'None',0.0,5,35.0,0,NULL,'Attack Boost III/Defense Boost II/Dulling Strike','Hammer',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (805,0.0,5.0,170,1,0,0,0,'Paralysis',30.0,15.0,'Armored Gogue',12.0,'None',0.0,5,38.0,0,NULL,'Attack Boost IV/Defense Boost III/Dulling Strike','Hammer',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (806,0.0,0.0,130,0,0,0,0,'Water',40.0,13.0,'Almudron Hammer I',13.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Water Boost I/Element Exploit','Hammer',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (807,0.0,5.0,140,2,1,0,0,'Water',48.0,15.0,'Almudron Hammer II',14.0,'None',0.0,4,14.0,0,NULL,'Attack Boost II/Water Boost I/Element Exploit','Hammer',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (808,0.0,10.0,190,2,1,0,0,'Water',51.0,15.0,'Doom Bringer Hammer',13.0,'None',0.0,6,13.0,0,NULL,'Attack Boost III/Water Boost II/Element Exploit','Hammer',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (809,20.0,15.0,200,1,0,0,0,'Water',31.0,10.0,'Sinter Hammer',15.0,'None',0.0,6,25.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (810,-20.0,3.0,150,0,0,0,0,'None',0.0,21.0,'Striped Striker I',8.0,'None',0.0,3,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','Hammer',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (811,-20.0,9.0,210,0,0,0,0,'None',0.0,24.0,'Striped Striker II',8.0,'None',0.0,6,11.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','Hammer',0.0,31.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (812,-20.0,12.0,220,0,0,0,0,'None',0.0,30.0,'Tigrex Hammer',9.0,'None',0.0,6,12.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','Hammer',5.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (813,0.0,0.0,80,0,0,0,0,'Thunder',42.0,7.0,'Bag o'' Horrors I',14.0,'None',0.0,2,16.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','Hammer',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (814,0.0,0.0,90,0,0,0,0,'Thunder',43.0,9.0,'Bag o'' Horrors II',14.0,'None',0.0,2,24.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (815,0.0,5.0,140,2,0,0,0,'Thunder',46.0,16.0,'Bag o'' Thunder',9.0,'None',0.0,4,24.0,0,NULL,'Attack Boost IV/Thunder Boost II/Thunderblight Exploit','Hammer',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (816,0.0,0.0,90,0,0,0,0,'Ice',20.0,0.0,'Frozen Core I',13.0,'None',0.0,1,20.0,0,NULL,'Defense Boost II/Ice Boost I/Buddy Rally','Hammer',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (817,0.0,0.0,100,0,0,0,0,'Ice',22.0,4.0,'Frozen Core II',12.0,'None',0.0,2,16.0,0,NULL,'Defense Boost II/Ice Boost I/Buddy Rally','Hammer',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (818,0.0,4.0,150,2,1,1,0,'Ice',32.0,11.0,'Cocytus',14.0,'None',0.0,4,24.0,0,NULL,'Defense Boost/Element Exploit/Buddy Rally','Hammer',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (819,0.0,0.0,180,1,1,0,0,'Sleep',26.0,27.0,'Illusory Frilled Blow',23.0,'None',0.0,5,11.0,0,NULL,'Attack Boost III/Sleep Boost I/Dulling Strike','Hammer',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (820,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Hammer I',23.0,'None',0.0,1,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (821,0.0,0.0,130,0,0,0,0,'None',0.0,0.0,'Hard Bone Hammer',21.0,'None',0.0,2,21.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','Hammer',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (822,0.0,0.0,150,0,0,0,0,'None',0.0,0.0,'Bone Bludgeon I',16.0,'None',0.0,3,24.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','Hammer',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (823,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Bone Bludgeon II',15.0,'None',0.0,4,19.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','Hammer',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (824,0.0,0.0,190,0,0,0,0,'None',0.0,16.0,'Heavy Bone Bludgeon',16.0,'None',0.0,5,19.0,0,NULL,'Attack Boost IV/Affinity Boost II/Dulling Strike','Hammer',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (825,-25.0,3.0,220,0,0,0,0,'None',0.0,24.0,'Diablos Hammer I',39.0,'None',0.0,6,11.0,0,NULL,'Affinity Boost II/Defense Boost I/Brutal Strike','Hammer',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (826,-25.0,5.0,230,0,0,0,10,'None',0.0,25.0,'Diablos Hammer II',40.0,'None',0.0,6,12.0,0,NULL,'Affinity Boost II/Defemse Boost II/Brutal Strike','Hammer',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (827,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Hammer II',16.0,'None',0.0,1,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','Hammer',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (828,0.0,0.0,220,2,0,0,0,'None',0.0,23.0,'Cyclo-Hammer II',16.0,'None',0.0,5,19.0,0,NULL,'Defense Boost III/Master Rider/Spiribird Doubled','Hammer',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (829,0.0,0.0,120,0,0,0,0,'Sleep',21.0,13.0,'Frilled Blow II',9.0,'None',0.0,3,8.0,0,NULL,'Attack Boost II/Sleep Boost I/Dulling Strike','Hammer',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (830,0.0,0.0,180,0,0,0,0,'None',0.0,15.0,'Barbearic Hammer',7.0,'None',0.0,4,30.0,0,NULL,'Attack Boost III/Defense Boost II/Small Monster Exploit','Hammer',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (831,-20.0,0.0,140,0,0,0,0,'Fire',17.0,8.0,'Flaming Fury I',17.0,'None',0.0,3,28.0,0,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','Hammer',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (832,-20.0,2.0,210,2,1,0,0,'Fire',20.0,8.0,'Flaming Fury II',23.0,'None',0.0,5,28.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','Hammer',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (833,-20.0,5.0,230,2,1,0,0,'Fire',22.0,13.0,'Phoenix Fury',29.0,'None',0.0,6,30.0,0,NULL,'Affinity Boost II/Fire Boost III/Brutal Strike','Hammer',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (834,30.0,0.0,90,0,0,0,0,'Ice',21.0,16.0,'Glacial Bash I',14.0,'None',0.0,2,11.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','Hammer',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (835,30.0,0.0,100,0,0,0,0,'Ice',23.0,0.0,'Glacial Bash II',17.0,'None',0.0,3,11.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','Hammer',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (836,35.0,14.0,160,1,1,0,0,'Ice',27.0,22.0,'Glacial Crunch',18.0,'None',0.0,5,10.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','Hammer',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (837,0.0,0.0,90,0,0,0,0,'Sleep',18.0,9.0,'Frilled Blow I',16.0,'None',0.0,2,11.0,0,NULL,'Attack Boost II/Sleep Boost I/Dulling Strike','Hammer',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (838,10.0,0.0,100,0,0,0,0,'None',0.0,9.0,'Kulu Bludgeon I',12.0,'None',0.0,2,16.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Spiribird Doubled','Hammer',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (839,20.0,3.0,160,1,1,1,0,'None',0.0,14.0,'Kulu Crusher',19.0,'None',0.0,4,19.0,0,NULL,'Affinity Boost III/Small Monster Exploit/Spiribird Doubled','Hammer',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (840,0.0,0.0,160,1,1,0,0,'Paralysis',10.0,10.0,'Devil Masher I',5.0,'None',0.0,4,6.0,0,NULL,'Affinity Boost III/Paralysis Boost I/Anti-Aquatic Species','Hammer',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (841,0.0,0.0,180,1,1,0,0,'Paralysis',14.0,15.0,'Devil Masher II',4.0,'None',0.0,5,4.0,0,NULL,'Affinity Boost III/Paralysis Boost II/Anti-Aquatic Species','Hammer',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (842,0.0,0.0,220,1,1,0,0,'Paralysis',17.0,24.0,'Iron Devil''s Soul',6.0,'None',0.0,6,6.0,0,NULL,'Affinity Boost III/Paralysis Boost II/Anti-Aquatic Species','Hammer',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (843,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Unbearable Hammer I',8.0,'None',0.0,1,32.0,0,NULL,'Attack Boost I/Defense Boost II/Small Monster Exploit','Hammer',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (844,0.0,0.0,130,0,0,0,0,'None',0.0,0.0,'Unbearable Hammer II',10.0,'None',0.0,2,25.0,0,NULL,'Attack Boost II/Defense Boost II/Small Monster Exploit','Hammer',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (845,10.0,0.0,110,0,0,0,0,'None',0.0,13.0,'Kulu Bludgeon II',16.0,'None',0.0,2,19.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Spiribird Doubled','Hammer',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (846,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Hammer S',15.0,'None',0.0,7,10.0,0,NULL,'Any','Hammer',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (847,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Spear I',20.0,'None',0.0,1,10.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (848,0.0,0.0,130,0,0,0,0,'Blast',10.0,15.0,'Sinister Spear I',5.0,'None',0.0,3,40.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (849,0.0,5.0,180,2,0,0,0,'Sleep',29.0,15.0,'Great Azure',5.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost III/Sleep Boost II/Buddy Rally','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (850,0.0,5.0,140,2,0,0,0,'Sleep',24.0,10.0,'Azure Crest III',15.0,'None',0.0,4,25.0,0,NULL,'Affinity Boost II/Sleep Boost II/Buddy Rally','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (851,0.0,0.0,100,0,0,0,0,'Sleep',14.0,15.0,'Azure Crest II',15.0,'None',0.0,3,25.0,0,NULL,'Affinity Boost II/Sleep Boost I/Buddy Rally','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (852,0.0,0.0,70,0,0,0,0,'Sleep',9.0,5.0,'Azure Crest I',10.0,'None',0.0,1,20.0,0,NULL,'Affinty Boost I/Sleep Boost I/Buddy Rally','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (853,0.0,10.0,200,1,1,0,0,'Thunder',29.0,25.0,'Despot''s Cacophony',10.0,'None',0.0,6,15.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (854,0.0,10.0,190,1,1,0,0,'Thunder',21.0,25.0,'Usurper''s Coming II',10.0,'None',0.0,5,15.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (855,0.0,0.0,120,0,0,0,0,'Thunder',17.0,20.0,'Usurper''s Coming I',10.0,'None',0.0,3,15.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (856,25.0,5.0,160,1,1,1,0,'None',0.0,15.0,'Kulu Skewer',15.0,'None',0.0,5,25.0,0,NULL,'Affinity Boost II/Master Rider/Spiribird Doubled','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (857,15.0,0.0,110,0,0,0,0,'None',0.0,10.0,'Kulu Spear II',10.0,'None',0.0,2,10.0,0,NULL,'Affinity Boost II/Master Rider/Spiribird Doubled','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (858,15.0,0.0,100,0,0,0,0,'None',0.0,5.0,'Kulu Spear I',15.0,'None',0.0,2,15.0,0,NULL,'Affinity Boost II/Master Rider/Spiribird Doubled','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (859,-30.0,10.0,250,0,0,0,0,'None',0.0,30.0,'Diablos Spear',15.0,'None',0.0,6,10.0,0,NULL,'Affinity Boost III/Defense Boost II/Brutal Strike','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (860,-30.0,5.0,240,0,0,0,0,'None',0.0,30.0,'Diablos Lance II',15.0,'None',0.0,6,25.0,0,NULL,'Affinity Boost II/Defense Boost I/Brutal Strike','Lance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (861,-30.0,0.0,170,0,0,0,0,'None',0.0,25.0,'Diablos Lance I',10.0,'None',0.0,3,15.0,0,NULL,'Affinity Boost I/Defense Boost I/Brutal Strike','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (862,-10.0,0.0,190,3,0,0,10,'None',0.0,15.0,'Rhenoshasta',20.0,'None',0.0,5,25.0,0,NULL,'Defense Boost II/Brutal Strike/Small Monster Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (863,-10.0,0.0,180,3,0,0,10,'None',0.0,15.0,'Ploshasta II',10.0,'None',0.0,4,25.0,0,NULL,'Defense Boost II/Brutal Strike/Small Monster Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (864,-10.0,0.0,110,0,0,0,10,'None',0.0,5.0,'Ploshasta I',5.0,'None',0.0,2,25.0,0,NULL,'Defense Boost I/Brutal Strike/Small Monster Exploit','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (865,0.0,5.0,160,2,1,1,0,'Water',31.0,15.0,'Spiral Splash',20.0,'None',0.0,5,10.0,0,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (866,0.0,0.0,130,0,0,0,0,'Water',25.0,10.0,'Spiral Lance II',20.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Water Boost II/Waterblight Exploit','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (867,0.0,0.0,90,0,0,0,0,'Water',16.0,10.0,'Spiral Lance I',15.0,'None',0.0,2,10.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (868,0.0,5.0,180,1,0,0,0,'Fire',34.0,25.0,'Red Tail II',20.0,'None',0.0,5,15.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (869,0.0,8.0,190,1,0,0,0,'Fire',37.0,29.0,'Spear of Prominence',10.0,'None',0.0,6,14.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','Lance',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (870,0.0,0.0,100,0,0,0,0,'Fire',29.0,10.0,'Red Tail I',10.0,'None',0.0,3,15.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (871,0.0,5.0,190,2,1,0,0,'Poison',27.0,25.0,'Datura Spear',15.0,'None',0.0,6,15.0,0,NULL,'Attack Boost III/Defense Boost II/Poison Boost II','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (872,0.0,5.0,170,2,1,0,0,'Poison',24.0,20.0,'Pukei Spear II',15.0,'None',0.0,5,15.0,0,NULL,'Attack Boost III/Defense Boost I/Poison Boost II','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (873,0.0,0.0,110,0,0,0,0,'Poison',16.0,10.0,'Pukei Spear I',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost II/Defense Boost I/Poison Boost I','Lance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (874,40.0,15.0,170,2,1,0,0,'Ice',26.0,25.0,'Sabertooth',17.0,'None',0.0,6,12.0,0,NULL,'Attack Boost IV/Affinity Boost III/Iceblight Exploit','Lance',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (875,35.0,10.0,160,2,1,0,0,'Ice',24.0,25.0,'Tusk Lance II',15.0,'None',0.0,5,10.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (876,30.0,0.0,80,0,0,0,0,'Ice',15.0,15.0,'Tusk Lance I',15.0,'None',0.0,2,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (877,0.0,0.0,140,0,0,0,0,'Blast',13.0,20.0,'Sinister Spear II',5.0,'None',0.0,3,40.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','Lance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (878,0.0,10.0,200,2,1,0,0,'Blast',19.0,20.0,'Sinister Shadespear',2.0,'None',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','Lance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (879,0.0,0.0,190,0,0,0,0,'Thunder',5.0,20.0,'Demon Lance I',5.0,'None',0.0,5,10.0,0,NULL,'Attack Boost I/Thunder Boost I/Dulling Strike','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (880,0.0,0.0,210,3,0,0,0,'Thunder',7.0,20.0,'Demon Lance II',10.0,'None',0.0,6,5.0,0,NULL,'Attack Boost I/Thunder Boost II/Dulling Strike','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (881,0.0,5.0,200,0,0,0,0,'Blast',32.0,18.0,'Teostra''s Roar',12.0,'None',0.0,7,30.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','Lance',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (882,-15.0,15.0,230,1,0,0,0,'None',0.0,24.0,'Tigrex Lance',13.0,'None',0.0,7,13.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','Lance',4.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (883,0.0,0.0,220,3,0,0,0,'Thunder',10.0,22.0,'Great Demon Lance',15.0,'None',0.0,7,13.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (884,10.0,6.0,190,1,0,0,0,'Ice',36.0,8.0,'Daora''s Fang',19.0,'None',0.0,7,17.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','Lance',2.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (885,0.0,12.0,190,0,0,0,0,'Thunder',38.0,8.0,'Abyssal Storm Lance',3.0,'None',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','Lance',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (886,0.0,25.0,210,0,0,0,0,'Dragon',11.0,12.0,'Abyssal Gale Lance',5.0,'None',0.0,7,5.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','Lance',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (887,0.0,0.0,170,2,0,0,0,'Dragon',30.0,0.0,'Redwing Spear I',0.0,'None',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','Lance',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (888,0.0,8.0,200,0,0,0,0,'None',0.0,12.0,'Rampage Spear V',18.0,'None',0.0,6,12.0,0,NULL,'Any','Lance',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (889,0.0,10.0,190,0,0,0,0,'None',0.0,5.0,'Rampage Spear IV',15.0,'None',0.0,6,10.0,0,NULL,'Any','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (890,0.0,5.0,180,0,0,0,0,'None',0.0,10.0,'Rampage Spear III',15.0,'None',0.0,5,10.0,0,NULL,'Any','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (891,0.0,0.0,170,0,0,0,0,'None',0.0,9.0,'Rampage Spear II',14.0,'None',0.0,5,14.0,0,NULL,'Any','Lance',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (892,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Rampage Spear I',15.0,'None',0.0,4,15.0,0,NULL,'Any','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (893,0.0,0.0,160,1,1,1,0,'Sleep',20.0,15.0,'Classy Fragrance',15.0,'None',0.0,5,20.0,0,NULL,'Attack Boost III/Sleep Boost III/Anti-Aquatic Species','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (894,0.0,0.0,140,0,0,0,0,'Sleep',17.0,10.0,'Fragrance II',10.0,'None',0.0,3,25.0,0,NULL,'Attack Boost II/Sleep Boost II/Anti-Aquatic Species','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (895,-15.0,10.0,220,1,0,0,0,'None',0.0,25.0,'Tiger Stinger II',10.0,'None',0.0,6,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','Lance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (896,0.0,0.0,90,0,0,0,0,'Sleep',13.0,5.0,'Fragrance I',2.0,'None',0.0,2,28.0,0,NULL,'Attack Boost I/Sleep Boost I/Anti-Aquatic Species','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (897,0.0,0.0,160,3,0,0,10,'Poison',25.0,15.0,'Alacrantze III',20.0,'None',0.0,4,25.0,0,NULL,'Defense Boost II/Poison Boost I/Silkbind Boost','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (898,0.0,0.0,130,0,0,0,10,'Poison',22.0,10.0,'Alacrantze II',20.0,'None',0.0,3,15.0,0,NULL,'Defense Boost II/Poison Boost I/Silkbind Boost','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (899,0.0,0.0,90,0,0,0,0,'Poison',18.0,10.0,'Alacrantze I',20.0,'None',0.0,2,5.0,0,NULL,'Defense Boost I/Poison Boost I/Silkbind Boost','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (900,0.0,0.0,190,0,0,0,0,'Paralysis',18.0,20.0,'Mighty Plegis',5.0,'None',0.0,5,5.0,0,NULL,'Paralysis Boost I/Dulling Strike/Spiribird Double','Lance',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (901,0.0,0.0,150,0,0,0,0,'Paralysis',15.0,5.0,'Plegis Needle II',10.0,'None',0.0,3,10.0,0,NULL,'Paralysis Boost I/Dulling Strike/Spiribird Doubled','Lance',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (902,0.0,0.0,100,0,0,0,0,'Paralysis',10.0,0.0,'Plegis Needle I',10.0,'None',0.0,2,10.0,0,NULL,'Paralysis Boost I/Dulling Strike/Spiribird Doubled','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (903,0.0,5.0,190,0,0,0,0,'Blast',27.0,25.0,'Teostra''s Howl I',5.0,'None',0.0,6,35.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (904,10.0,10.0,180,1,0,0,0,'Ice',30.0,22.0,'Icesteel Spear I',10.0,'None',0.0,6,16.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','Lance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (905,-10.0,10.0,220,1,0,0,0,'Blast',15.0,16.0,'Bazel Myniad Lance',18.0,'None',0.0,7,20.0,0,NULL,'Defense Boost II/Blast Boost III/Brutal Strike','Lance',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (906,-10.0,8.0,210,1,0,0,0,'Blast',12.0,18.0,'Rookslayer Lance II',18.0,'None',0.0,6,20.0,0,NULL,'Defense Boost I/Blast Boost II/Brutal Strike','Lance',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (907,-10.0,6.0,200,1,0,0,0,'Blast',10.0,22.0,'Rookslayer Lance I',15.0,'None',0.0,6,18.0,0,NULL,'Defense Boost I/Blast Boost II/Brutal Strike','Lance',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (908,0.0,10.0,180,0,0,0,0,'Thunder',33.0,10.0,'Thunderbolt Spear I',5.0,'None',0.0,6,5.0,0,NULL,'Attack Boost II/Anti-Aerial/Species','Lance',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (909,0.0,25.0,190,0,0,0,0,'Dragon',9.0,10.0,'Azure Elder Spear II',5.0,'None',0.0,6,5.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (910,0.0,20.0,170,0,0,0,0,'Dragon',6.0,10.0,'Azure Elder Spear I',5.0,'None',0.0,5,5.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','Lance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (911,0.0,5.0,170,3,0,0,10,'Poison',29.0,10.0,'Scorpion Lance',35.0,'None',0.0,5,20.0,0,NULL,'Defense Boost III/Poison Boost I/Silkbind Boost','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (912,-20.0,5.0,210,0,0,0,0,'None',0.0,15.0,'Tiger Stinger I',5.0,'None',0.0,6,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','Lance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (913,0.0,0.0,200,0,0,0,0,'None',0.0,15.0,'Barbarian Fang',15.0,'None',0.0,5,20.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (914,0.0,0.0,180,0,0,0,0,'None',0.0,10.0,'Barbarian Tusk I',15.0,'None',0.0,4,20.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (915,0.0,5.0,160,3,0,0,15,'None',0.0,10.0,'Babel Spear I',15.0,'None',0.0,4,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Dragon Exploit','Lance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (916,0.0,5.0,190,1,0,0,0,'None',0.0,10.0,'Rampart',20.0,'None',0.0,5,20.0,0,NULL,'Attack Boost III/Affinity Boost III/Silkbind Boost','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (917,0.0,5.0,170,1,0,0,0,'None',0.0,20.0,'Paladin Lance II',20.0,'None',0.0,4,25.0,0,NULL,'Attack Boost II/Affinity Boost III/Silkbind Boost','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (918,0.0,0.0,140,0,0,0,0,'None',0.0,10.0,'Paladin Lance I',15.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Silkbind Boost','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (919,0.0,0.0,120,0,0,0,0,'None',0.0,10.0,'Millennial Lance',20.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (920,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Iron Lance II',15.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (921,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Iron Lance I',15.0,'None',0.0,1,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (922,0.0,5.0,150,0,0,0,0,'Ice',29.0,10.0,'Razortooth Spear',15.0,'None',0.0,4,30.0,0,NULL,'Defense Boost III/Master Rider/Element Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (923,0.0,0.0,110,0,0,0,0,'Ice',22.0,10.0,'Sharktooth Spear II',15.0,'None',0.0,3,25.0,0,NULL,'Defense Boost II/Master Rider/Small Monster Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (924,0.0,0.0,80,0,0,0,0,'Ice',17.0,5.0,'Sharktooth Spear I',15.0,'None',0.0,1,15.0,0,NULL,'Defense Boost I/Master Rider/Small Monster Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (925,15.0,10.0,140,2,1,0,0,'None',0.0,10.0,'Gale Lance',10.0,'None',0.0,4,20.0,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','Lance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (926,15.0,0.0,100,0,0,0,0,'None',0.0,15.0,'Wind Thief Lance II',10.0,'None',0.0,2,20.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','Lance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (927,10.0,0.0,70,0,0,0,0,'None',0.0,10.0,'Wind Thief Lance I',10.0,'None',0.0,1,20.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (928,0.0,0.0,200,2,0,0,20,'Water',18.0,25.0,'Croaker',20.0,'None',0.0,5,10.0,0,NULL,'Defense Boost II/Water Boost III/Dulling Strike','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (929,0.0,5.0,190,3,0,0,15,'None',0.0,15.0,'Babel Spear II',10.0,'None',0.0,5,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Dragon Exploit','Lance',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (930,0.0,0.0,160,2,0,0,10,'Water',16.0,15.0,'Distension II',20.0,'None',0.0,4,10.0,0,NULL,'Defense Boost I/Water Boost III/Dulling Strike','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (931,10.0,0.0,130,2,1,1,0,'Poison',41.0,15.0,'Devta Serpentblade',15.0,'None',0.0,4,15.0,0,NULL,'Attack Boost III/Poison Boost I/Dulling Strike','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (932,10.0,0.0,100,0,0,0,0,'Poison',31.0,10.0,'Naag Serpentblade II',10.0,'None',0.0,3,15.0,0,NULL,'Attack Boost III/Poison Boost I/Dulling Strike','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (933,5.0,0.0,80,0,0,0,0,'Poison',26.0,10.0,'Naag Serpentblade I',15.0,'None',0.0,2,10.0,0,NULL,'Attack Boost II/Poison Boost I/Dulling Strike','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (934,15.0,15.0,180,1,0,0,0,'Water28',0.0,5.0,'Kimi Ga Kiru',25.0,'None',0.0,6,25.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (935,10.0,10.0,160,1,0,0,0,'Water20',0.0,10.0,'Hana Mo Hana Nare II',25.0,'None',0.0,5,25.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (936,10.0,0.0,120,0,0,0,0,'Water14',0.0,15.0,'Hana Mo Hana Nare I',10.0,'None',0.0,3,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (937,-15.0,5.0,230,2,0,0,0,'Ice',14.0,10.0,'Abominable Lance',5.0,'None',0.0,6,25.0,0,NULL,'Affinity Boost I/Ice Boost III/Brutal Strike','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (938,-15.0,5.0,200,2,0,0,0,'Ice',12.0,10.0,'Goss Lance II',5.0,'None',0.0,5,25.0,0,NULL,'Affinity Boost I/Ice Boost II/Brutal Strike','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (939,-15.0,0.0,170,0,0,0,0,'Ice',10.0,10.0,'Goss Lance I',5.0,'None',0.0,3,25.0,0,NULL,'Affinity Boost I/Ice Boost I/Brutal Strike','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (940,0.0,0.0,190,2,1,0,0,'None',0.0,10.0,'Kamura Ninja Spear',5.0,'None',0.0,5,25.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (941,0.0,10.0,150,2,0,0,0,'None',0.0,10.0,'Kamura Spear V',20.0,'None',0.0,4,15.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (942,0.0,5.0,140,0,0,0,0,'None',0.0,10.0,'Kamura Spear IV',15.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (943,0.0,0.0,90,0,0,0,0,'None',0.0,10.0,'Kamura Spear III',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (944,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Spear II',15.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (945,0.0,0.0,110,0,0,0,10,'Water',12.0,5.0,'Distension I',20.0,'None',0.0,2,5.0,0,NULL,'Defense Boost I/Water Boost I/Dulling Strike','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (946,0.0,0.0,180,2,0,0,0,'Dragon',35.0,0.0,'Reddnaught Spear',0.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','Lance',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (947,0.0,12.0,200,3,0,0,20,'None',0.0,22.0,'Elder Babel Spear',7.0,'None',0.0,6,7.0,0,NULL,'Attack Boost IV/Defense Boost III/Dragon Exploit','Lance',0.0,43.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (948,-15.0,0.0,210,1,0,0,0,'Poison',20.0,15.0,'Venom Lance II',25.0,'None',0.0,6,20.0,0,NULL,'Defense Boost III/Poison Boost I/Dulling Strike','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (949,0.0,0.0,150,0,0,0,0,'None',0.0,3.0,'Longtusk Spear',15.0,'None',0.0,3,22.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (950,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Longhorn Spear I',10.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (951,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Hard Bone Lance',15.0,'None',0.0,1,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (952,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Lance I',20.0,'None',0.0,1,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (953,-10.0,0.0,190,1,1,1,0,'Fire',17.0,10.0,'Heatstinger',5.0,'None',0.0,5,40.0,0,NULL,'Affinity Boost IV/Defense Boost III/Dulling Strike','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (954,-10.0,0.0,160,0,0,0,0,'Fire',12.0,10.0,'Heat Lance II',5.0,'None',0.0,3,35.0,0,NULL,'Affinity Boost III/Defense Boost II/Dulling Strike','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (955,-10.0,0.0,90,0,0,0,0,'Fire',9.0,5.0,'Heat Lance I',5.0,'None',0.0,1,25.0,0,NULL,'Affinity Boost II/Defense Boost I/Dulling Strike','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (956,0.0,5.0,160,2,1,0,0,'Paralysis',27.0,20.0,'Volvi Sweep',10.0,'None',0.0,5,25.0,0,NULL,'Attack Boost IV/Defense Boost II/Dulling Strike','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (957,0.0,0.0,140,2,1,0,0,'Paralysis',23.0,20.0,'Volvi Stroke II',10.0,'None',0.0,4,25.0,0,NULL,'Attack Boost III/Defense Boost II/Dulling Strike','Lance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (958,0.0,0.0,90,0,0,0,0,'Paralysis',19.0,5.0,'Volvi Stroke I',5.0,'None',0.0,2,25.0,0,NULL,'Attack Boost III/Defense Boost I/Dulling Strike','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (959,10.0,2.0,210,2,1,1,0,'Thunder',15.0,38.0,'Gigadrill Lance',15.0,'None',0.0,6,10.0,0,NULL,'Affinity Boost IV/Defense Boost III/Element Exploit','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (960,10.0,0.0,170,2,1,1,0,'Thunder',11.0,30.0,'Drill Lance II',15.0,'None',0.0,5,20.0,0,NULL,'Affinity Boost III/Defense Boost II/Element Exploit','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (961,10.0,0.0,160,1,1,1,0,'Thunder',8.0,15.0,'Drill Lance I',15.0,'None',0.0,4,20.0,0,NULL,'Affinity Boost II/Defense Boost II/Element Exploit','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (962,-20.0,3.0,200,1,1,0,0,'None',0.0,12.0,'Barroth Carver',10.0,'None',0.0,5,15.0,0,NULL,'Affinity Boost II/Defense Boost II/Brutal Strike','Lance',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (963,-15.0,0.0,190,1,0,0,0,'Poison',14.0,10.0,'Venom Lance I',20.0,'None',0.0,5,20.0,0,NULL,'Defense Boost II/Poison Boost I/Dulling Strike','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (964,-20.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Rugged Lance II',10.0,'None',0.0,3,15.0,0,NULL,'Attack Boost I/Defense Boost II/Brutal Strike','Lance',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (965,0.0,5.0,210,2,0,0,0,'Fire',24.0,15.0,'Dawnbreaker Lance',10.0,'None',0.0,6,10.0,0,NULL,'Attack Boost II/Fire Boost III/Fireblight Exploit','Lance',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (966,0.0,2.0,150,2,0,0,0,'Fire',19.0,13.0,'Aknosom Lance III',10.0,'None',0.0,4,10.0,0,NULL,'Attack Boost II/Fire Boost II/Fireblight Exploit','Lance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (967,0.0,0.0,110,0,0,0,0,'Fire',14.0,15.0,'Aknosom Lance II',10.0,'None',0.0,2,10.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','Lance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (968,0.0,0.0,100,0,0,0,0,'Fire',11.0,10.0,'Aknosom Lance I',10.0,'None',0.0,2,5.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (969,15.0,10.0,190,1,0,0,0,'Thunder',20.0,10.0,'Shockspear',20.0,'None',0.0,6,35.0,0,NULL,'Attack Boost II/Affinity Boost III/Thunderblight Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (970,15.0,5.0,180,1,0,0,0,'Thunder',18.0,10.0,'Kadachi Lance II',15.0,'None',0.0,5,30.0,0,NULL,'Attack Boost II/Affinity Boost III/Thunderblight Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (971,10.0,0.0,100,0,0,0,0,'Thunder',13.0,10.0,'Kadachi Lance I',5.0,'None',0.0,2,30.0,0,NULL,'Attack Boost I/Affinity Boost I/Thunderblight Exploit','Lance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (972,0.0,5.0,210,1,1,0,15,'Dragon',15.0,20.0,'Roaring Wyvern',20.0,'None',0.0,6,15.0,0,NULL,'Affinity Boost IV/Defense Boost III/Element Exploit','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (973,0.0,0.0,180,1,1,0,10,'Dragon',15.0,15.0,'Growling Wyvern II',20.0,'None',0.0,5,15.0,0,NULL,'Affinity Boost III/Defense Boost II/Element Exploit','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (974,0.0,0.0,120,0,0,0,10,'Dragon',15.0,10.0,'Growling Wyvern I',20.0,'None',0.0,3,20.0,0,NULL,'Affinity Boost II/Defense Boost II/Element Exploit','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (975,35.0,17.0,180,2,0,0,0,'None',0.0,22.0,'Night Rains Black',10.0,'None',0.0,6,16.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','Lance',8.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (976,30.0,10.0,160,2,0,0,0,'None',0.0,25.0,'Hidden Stinger II',5.0,'None',0.0,5,25.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','Lance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (977,30.0,0.0,110,0,0,0,0,'None',0.0,25.0,'Hidden Stinger I',15.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (978,-15.0,0.0,220,1,0,0,0,'Poison',23.0,20.0,'Basarios Venom Spear',20.0,'None',0.0,6,25.0,0,NULL,'Defense Boost III/Poison Boost II/Dulling Strike','Lance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (979,-20.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Rugged Lance I',15.0,'None',0.0,2,15.0,0,NULL,'Attack Boost I/Defense Boost I/Brutal Strike','Lance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (980,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Spear S',15.0,'None',0.0,7,10.0,0,NULL,'Any','Lance',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (981,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Gunlance I',20.0,'Normal',0.0,1,11.0,1,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','GunLance',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (982,0.0,0.0,130,0,0,0,0,'Paralysis',18.0,16.0,'Fiore Nulo Green II',5.0,'Normal',0.0,3,34.0,2,NULL,'Affinity Boost II/Paralysis Boost I/Anti-Aerial Species','GunLance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (983,0.0,0.0,80,0,0,0,0,'Paralysis',12.0,10.0,'Fiore Nulo Green I',7.0,'Normal',0.0,1,24.0,1,NULL,'Affinity Boost I/Paralysis Boost I/Anti-Aerial Species','GunLance',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (984,0.0,10.0,180,3,0,0,0,'Ice',20.0,20.0,'Fiore Unu White',5.0,'Normal',0.0,5,34.0,4,NULL,'Defense Boost III/Element Exploit/Silkbind Boost','GunLance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (985,0.0,2.0,130,0,0,0,0,'Ice',17.0,15.0,'Fiore Nulo White II',5.0,'Normal',0.0,3,34.0,3,NULL,'Defense Boost II/Element Exploit/Silkbind Boost','GunLance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (986,0.0,0.0,90,0,0,0,0,'Ice',15.0,11.0,'Fiore Nulo White I',4.0,'Normal',0.0,2,24.0,2,NULL,'Defense Boost I/Element Exploit/Silkbind Boost','GunLance',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (987,0.0,15.0,200,3,1,0,0,'Dragon',26.0,20.0,'Fiore Unu Black',4.0,'Normal',0.0,6,38.0,4,NULL,'Affinity Boost III/Defense Boost III/Element Exploit','GunLance',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (988,0.0,10.0,180,3,1,0,0,'Dragon',23.0,20.0,'Fiore Nulo Black II',4.0,'Normal',0.0,5,33.0,3,NULL,'Affinity Boost II/Defense Boost III/Element Exploit','GunLance',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (989,0.0,7.0,150,3,1,0,0,'Dragon',21.0,19.0,'Fiore Nulo Black I',7.0,'Normal',0.0,4,35.0,3,NULL,'Affinity Boost II/Defense Boost II/Element Exploit','GunLance',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (990,25.0,20.0,180,2,1,1,0,'Fire',27.0,5.0,'Arknalance',5.0,'Normal',0.0,7,55.0,5,NULL,'Attack Boost IV/Fire Boost II/Silkbind Boost','GunLance',4.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (991,25.0,10.0,160,2,1,1,0,'Fire',25.0,5.0,'Rakna Gunlance II',10.0,'Normal',0.0,6,45.0,4,NULL,'Attack Boost III/Fire Boost II/Silkbind Boost','GunLance',2.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (992,25.0,14.0,150,2,1,1,0,'Fire',22.0,6.0,'Rakna Gunlance I',10.0,'Normal',0.0,6,45.0,3,NULL,'Attack Boost III/Fire Boost I/Silkbind Boost','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (993,0.0,10.0,150,2,1,1,0,'None',0.0,12.0,'Fiore Unu',7.0,'Normal',0.0,4,35.0,3,NULL,'Attack Boost III/Dragon Exploit/Master Rider','GunLance',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (994,0.0,3.0,110,0,0,0,0,'None',0.0,15.0,'Fiore Nulo II',4.0,'Normal ',0.0,2,33.0,2,NULL,'Attack Boost II/Defense Boost I/Master Rider','GunLance',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (995,0.0,0.0,80,0,0,0,0,'None',0.0,1.0,'Fiore Nulo I',11.0,'Normal',0.0,1,24.0,1,NULL,'Attack Boost I/Affinity Boost I/Master Rider','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (996,0.0,0.0,140,1,1,1,0,'Paralysis',19.0,5.0,'Fiore Unu Green',7.0,'Normal',0.0,4,34.0,3,NULL,'Affinity Boost III/Paralysis Boost II/Anti-Aerial Species','GunLance',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (997,0.0,6.0,180,2,1,1,15,'Water',37.0,12.0,'Ludroth Shellbreaker',15.0,'Normal',0.0,6,14.0,4,NULL,'Attack Boost III/Water Boost III/Waterblight Exploit','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (998,0.0,5.0,140,1,1,1,10,'Water',33.0,10.0,'Ludroth Harpoon II',15.0,'Normal',0.0,4,14.0,3,NULL,'Attack Boost II/Water Boost II/Waterblight Exploit','GunLance',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (999,0.0,0.0,80,0,0,0,10,'Water',24.0,10.0,'Ludroth Harpoon I',15.0,'Normal',0.0,2,11.0,2,NULL,'Attack Boost I/Water Boost I/Waterblight Exploit','GunLance',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1000,0.0,6.0,210,2,0,0,0,'Ice',29.0,26.0,'Lagomberatrix',20.0,'Wide',0.0,6,14.0,4,NULL,'Attack Boost III/Ice Boost III/Small Monster Exploit','GunLance',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1001,0.0,2.0,150,2,0,0,0,'Ice',27.0,24.0,'Lagomberator III',20.0,'Wide',0.0,4,14.0,3,NULL,'Attack Boost II/Ice Boost II/Small Monster Exploit','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1002,0.0,0.0,120,0,0,0,0,'Ice',25.0,13.0,'Lagomberator II',20.0,'Wide',0.0,3,14.0,2,NULL,'Attack Boost I/Ice Boost II/Small Monster Exploit','GunLance',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1003,0.0,0.0,80,0,0,0,0,'Ice',23.0,4.0,'Lagomberator I',16.0,'Wide',0.0,1,14.0,1,NULL,'Attack Boost I/Ice Boost I/Small Monster Exploit','GunLance',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1004,-15.0,10.0,230,1,0,0,0,'None',0.0,28.0,'Tigrex Gunlance',15.0,'Wide',0.0,6,15.0,4,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','GunLance',2.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1005,-15.0,10.0,220,1,0,0,0,'None',0.0,24.0,'Tiger Blast II',6.0,'Wide',0.0,6,11.0,4,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','GunLance',0.0,31.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1006,-20.0,3.0,150,0,0,0,0,'None',0.0,20.0,'Tiger Blast I',6.0,'Wide',0.0,3,16.0,2,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1007,-20.0,3.0,200,0,0,0,20,'None',0.0,12.0,'Rugged Loader',10.0,'Long',0.0,5,14.0,4,NULL,'Affinity Boost II/Defense Boost II/Brutal Strike','GunLance',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1008,-20.0,0.0,140,0,0,0,15,'None',0.0,2.0,'Barroth Loader II',20.0,'Long',0.0,2,11.0,2,NULL,'Affinity Boost I/Defense Boost II/Brutal Strike','GunLance',0.0,32.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1009,-20.0,0.0,130,0,0,0,15,'None',0.0,0.0,'Barroth Loader I',15.0,'Long',0.0,2,11.0,2,NULL,'Affinity Boost I/Defense Boost I/Brutal Strike','GunLance',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1010,-15.0,0.0,230,2,1,0,0,'Fire',24.0,25.0,'Barbarous Firelance',15.0,'Wide',0.0,6,42.0,4,NULL,'Affinity Boost II/Fire Boost III/Brutal Strike','GunLance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1011,-15.0,0.0,210,2,1,0,0,'Fire',21.0,16.0,'Flaming Gunlance III',15.0,'Wide',0.0,5,35.0,3,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1012,0.0,5.0,160,2,1,0,15,'Water',35.0,12.0,'Ludroth Harpoon III',15.0,'Normal',0.0,5,14.0,3,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','GunLance',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1013,-20.0,0.0,160,0,0,0,0,'Fire',17.0,12.0,'Flaming Gunlance II',16.0,'Wide',0.0,3,24.0,3,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','GunLance',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1014,0.0,0.0,130,0,0,0,0,'Blast',25.0,20.0,'Sinister Gunlance I',4.0,'Long',0.0,3,38.0,2,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1015,0.0,10.0,200,2,1,0,0,'Blast',33.0,20.0,'Sinister Shadowshot',2.0,'Long',0.0,6,45.0,4,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','GunLance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1016,0.0,0.0,170,2,0,0,0,'Dragon',35.0,0.0,'Redwing Gunlance I',0.0,'Long',0.0,6,30.0,4,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','GunLance',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1017,0.0,8.0,230,3,0,0,0,'Poison',31.0,18.0,'Venomous Attar',15.0,'Long',0.0,7,15.0,3,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','GunLance',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1018,0.0,6.0,170,1,0,0,0,'Ice',44.0,8.0,'Daora''s Brigia',18.0,'Long',0.0,7,18.0,5,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','GunLance',2.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1019,0.0,12.0,190,0,0,0,0,'Thunder',41.0,8.0,'Abyssal Storm Gunlance',3.0,'Normal',0.0,7,2.0,4,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','GunLance',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1020,0.0,25.0,210,0,0,0,0,'Dragon',15.0,12.0,'Abyssal Gale Gunlance',5.0,'Wide',0.0,7,5.0,4,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','GunLance',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1021,-10.0,0.0,220,3,0,0,0,'Thunder',20.0,20.0,'Great Demon Gunlance',4.0,'Wide',0.0,7,10.0,7,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','GunLance',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1022,0.0,5.0,200,0,0,0,0,'None',0.0,10.0,'Rampage Gunlance V',15.0,'Normal',0.0,6,10.0,2,NULL,'Any','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1023,0.0,7.0,190,0,0,0,0,'None',0.0,7.0,'Rampage Gunlance IV',20.0,'Normal',0.0,6,11.0,2,NULL,'Any','GunLance',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1024,0.0,5.0,180,0,0,0,0,'None',0.0,7.0,'Rampage Gunlance III',15.0,'Normal',0.0,5,11.0,2,NULL,'Any','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1025,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage Gunlance II',16.0,'Normal',0.0,5,14.0,2,NULL,'Any','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1026,0.0,0.0,150,0,0,0,0,'None',0.0,4.0,'Rampage Gunlance I',16.0,'Normal',0.0,4,16.0,2,NULL,'Any','GunLance',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1027,0.0,0.0,190,3,0,0,20,'Sleep',20.0,11.0,'Soporific Shellgun',21.0,'Wide',0.0,5,14.0,3,NULL,'Defense Boost III/Sleep Boost II/Anti-Aquatic Species','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1028,0.0,0.0,130,0,0,0,15,'Sleep',17.0,6.0,'Sleepy Shellgun II',20.0,'Wide',0.0,3,11.0,2,NULL,'Defense Boost II/Sleep Boost I/Anti-Aquatic Species','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1029,0.0,0.0,100,0,0,0,15,'Sleep',13.0,0.0,'Sleepy Shellgun I',14.0,'Wide',0.0,2,11.0,2,NULL,'Defense Boost I/Sleep Boost I/Anti-Aquatic Species','GunLance',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1030,0.0,0.0,140,0,0,0,0,'Blast',29.0,22.0,'Sinister Gunlance II',5.0,'Long',0.0,3,40.0,2,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','GunLance',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1031,0.0,0.0,180,1,0,0,0,'None',0.0,19.0,'Mighty Cornpopper',15.0,'Wide',0.0,6,11.0,5,NULL,'Affinity Boost III/Anti-Aquatic Species/Spiribird Doubled','GunLance',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1032,0.0,0.0,160,1,0,0,0,'None',0.0,16.0,'Cornpopper I',9.0,'Wide',0.0,5,11.0,4,NULL,'Wyrmstake Boost/Anti-Aquatic Species/Spiribird Doubled','GunLance',0.0,34.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1033,0.0,11.0,180,1,0,0,10,'None',0.0,18.0,'Howlitzer',28.0,'Long',0.0,5,19.0,5,NULL,'Affinity Boost III/Defense Boost III/Buddy Rally','GunLance',5.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1034,0.0,2.0,140,0,0,0,5,'None',0.0,19.0,'Canyne Cannon II',27.0,'Long',0.0,3,19.0,3,NULL,'Defense Boost III/Wyrmstake Boost/Buddy Rally','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1035,0.0,0.0,130,0,0,0,5,'None',0.0,16.0,'Canyne Cannon I',24.0,'Long',0.0,3,16.0,2,NULL,'Defense Boost II/Wyrmstake Boost','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1036,0.0,10.0,220,3,0,0,0,'Poison',27.0,15.0,'Venomous Cologne I',15.0,'Long',0.0,6,10.0,3,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','GunLance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1037,0.0,9.0,160,1,0,0,0,'Ice',42.0,8.0,'Icesteel Gunlance I',15.0,'Long',0.0,6,20.0,5,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1038,-10.0,5.0,220,0,0,0,0,'Blast',15.0,15.0,'Bazel Destroyer',25.0,'Wide',0.0,6,12.0,4,NULL,'Defense Boost II/Blast Boost III/Wyrmstake Boost','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1039,-10.0,3.0,210,0,0,0,0,'Blast',14.0,17.0,'Bazel Bluster II',25.0,'Wide',0.0,6,12.0,3,NULL,'Defense Boost I/Blast Boost II/Wyrmstake Boost','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1040,-10.0,0.0,190,0,0,0,0,'Blast',12.0,23.0,'Bazel Buster I',22.0,'Wide',0.0,6,15.0,2,NULL,'Defense Boost I/Blast Boost II/Wyrmstake Boost','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1041,0.0,7.0,180,0,0,0,0,'Thunder',35.0,10.0,'Thunderbolt Gunlance I',5.0,'Normal',0.0,6,5.0,4,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','GunLance',0.0,46.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1042,0.0,26.0,200,0,0,0,0,'Dragon',13.0,11.0,'Azure Elder Gunlance II',4.0,'Wide',0.0,6,4.0,4,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','GunLance',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1043,0.0,25.0,180,0,0,0,0,'Dragon',11.0,10.0,'Azure Elder Gunlance I',4.0,'Wide',0.0,5,4.0,3,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','GunLance',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1044,-10.0,0.0,210,3,0,0,0,'Thunder',18.0,20.0,'Demon Gunlance II',5.0,'Wide',0.0,6,9.0,4,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','GunLance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1045,-10.0,0.0,200,0,0,0,0,'Thunder',16.0,20.0,'Demon Gunlance I',5.0,'Wide',0.0,5,10.0,3,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','GunLance',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1046,0.0,0.0,170,1,0,0,0,'None',0.0,19.0,'Cornpopper II',15.0,'Wide',0.0,5,11.0,4,NULL,'Wyrmstake Boost/Anti-Aquatic Species/Spiribird Doubled','GunLance',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1047,-20.0,0.0,140,0,0,0,0,'Fire',15.0,7.0,'Flaming Gunlance I',21.0,'Wide',0.0,3,24.0,2,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','GunLance',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1048,40.0,15.0,180,2,0,0,0,'None',0.0,25.0,'Fading Night',18.0,'Long',0.0,6,12.0,4,NULL,'Attack Boost III/Affinity Boost II/Master Rider','GunLance',5.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1049,40.0,15.0,170,2,0,0,0,'None',0.0,24.0,'Hidden Gunlance II',20.0,'Long',0.0,6,11.0,4,NULL,'Attack Boost III/Affinity Boost I/Master Rider','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1050,10.0,6.0,150,2,1,1,0,'None',0.0,11.0,'General''s Arbalance I',16.0,'Wide',0.0,4,19.0,3,NULL,'Attack Boost III/Dragon Exploit/Wyrmstake Boost','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1051,0.0,6.0,190,1,0,0,0,'None',0.0,12.0,'Imperial Guardlance',20.0,'Normal',0.0,5,20.0,4,NULL,'Attack Boost III/Defense Boost III/Silkbind Boost','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1052,0.0,4.0,160,1,0,0,0,'None',0.0,11.0,'Striker''s Ggunlance II',20.0,'Normal',0.0,4,20.0,3,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1053,0.0,0.0,130,0,0,0,0,'None',0.0,12.0,'Striker''s Ggunlance I',15.0,'Normal',0.0,3,21.0,2,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1054,0.0,0.0,120,0,0,0,0,'None',0.0,10.0,'Eizenlitter',20.0,'Normal',0.0,2,19.0,2,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','GunLance',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1055,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Iron Gunlance II',14.0,'Normal',0.0,1,16.0,1,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1056,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Iron Gunlance I',16.0,'Normal',0.0,1,19.0,1,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','GunLance',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1057,40.0,13.0,190,1,1,0,0,'Ice',26.0,20.0,'Ambermarch',15.0,'Wide',0.0,6,10.0,4,NULL,'Attack Boost IV/Affinity Boost III/Iceblight Exploit','GunLance',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1058,35.0,11.0,160,1,1,0,0,'Ice',24.0,25.0,'Twinfang II',15.0,'Wide',0.0,5,11.0,4,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1059,30.0,0.0,80,0,0,0,0,'Ice',22.0,17.0,'Twinfang I',15.0,'Wide',0.0,2,11.0,2,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','GunLance',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1060,0.0,6.0,210,1,1,0,0,'Thunder',32.0,11.0,'Despot''s Phlogiston',21.0,'Normal',0.0,6,14.0,4,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','GunLance',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1061,0.0,8.0,180,1,1,0,0,'Thunder',30.0,12.0,'Usurper''s Roar II',15.0,'Normal',0.0,5,14.0,3,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1062,0.0,0.0,120,0,0,0,0,'Thunder',28.0,11.0,'Usurper''s Roar I',16.0,'Normal',0.0,3,19.0,2,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','GunLance',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1063,0.0,6.0,190,3,0,0,0,'Water',18.0,12.0,'Sand Blaster Gunlance',25.0,'Wide',0.0,5,6.0,2,NULL,'Affinity Boost III/Defense Boost II/Small Monster Exploit','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1064,10.0,9.0,170,2,1,1,0,'None',0.0,14.0,'General''s Arbalance II',16.0,'Wide',0.0,5,14.0,3,NULL,'Attack Boost III/Dragon Exploit/Wyrmstake Boost','GunLance',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1065,0.0,0.0,110,0,0,0,0,'Water',14.0,6.0,'Delex Harpoon II',26.0,'Wide',0.0,2,9.0,2,NULL,'Affinity Boost II/Defense Boost I/Small Monster Exploit','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1066,0.0,5.0,210,0,0,0,0,'Fire',37.0,25.0,'Crimson Rook',20.0,'Long',0.0,6,15.0,4,NULL,'Attack Boost III/Fire Boost I/Element Exploit','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1067,0.0,4.0,200,0,0,0,0,'Fire',35.0,25.0,'Red Rook II',19.0,'Long',0.0,6,16.0,4,NULL,'Attack Boost II/Fire Boost I/Element Exploit','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1068,0.0,3.0,190,0,0,0,0,'Fire',33.0,24.0,'Red Rook I',19.0,'Long',0.0,5,16.0,3,NULL,'Attack Boost II/Fire Boost I/Element Exploit','GunLance',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1069,0.0,4.0,200,0,0,0,0,'Poison',26.0,34.0,'Ortlinde',6.0,'Normal',0.0,6,19.0,5,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','GunLance',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1070,0.0,0.0,180,0,0,0,0,'Poison',21.0,31.0,'Princess Panoply II',6.0,'Normal',0.0,5,19.0,4,NULL,'Attack Boost I/Poison Boost I/Small Monster Exploit','GunLance',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1071,0.0,0.0,100,0,0,0,0,'Poison',18.0,17.0,'Princess Panoply I',7.0,'Normal',0.0,2,18.0,2,NULL,'Attack Boost I/Poison Boost I/Small Monster Exploit','GunLance',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1072,15.0,5.0,210,1,0,0,0,'Water',24.0,20.0,'Mizumori',15.0,'Long',0.0,6,20.0,4,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1073,10.0,6.0,190,1,0,0,0,'Water',15.0,20.0,'Ukiyo no Yamiwo II',19.0,'Long',0.0,5,21.0,4,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','GunLance',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1074,10.0,0.0,120,0,0,0,0,'Water',15.0,15.0,'Ukiyo no Yamiwo I',10.0,'Long',0.0,3,20.0,2,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','GunLance',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1075,0.0,11.0,190,2,1,0,0,'None',0.0,15.0,'Kamura Ninja Gunlance',21.0,'Normal',0.0,5,9.0,4,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1076,0.0,6.0,150,2,0,0,0,'None',0.0,9.0,'Kamura Gunlance V',20.0,'Normal',0.0,4,14.0,3,NULL,'Affinity Boost III/Defense Boost II/Master Rider','GunLance',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1077,0.0,4.0,140,0,0,0,0,'None',0.0,5.0,'Kamura Gunlance IV',15.0,'Normal',0.0,3,11.0,2,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1078,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Kamura Gunlance III',16.0,'Normal',0.0,2,14.0,2,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','GunLance',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1079,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Gunlance II',16.0,'Normal',0.0,1,14.0,1,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1080,0.0,0.0,100,0,0,0,0,'Water',12.0,5.0,'Delex Harpoon I',19.0,'Wide',0.0,2,11.0,1,NULL,'Affinity Boost I/Defense Boost I/Small Monster Exploit','GunLance',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1081,10.0,0.0,210,2,1,1,0,'None',0.0,10.0,'Admiralls Arbalance',15.0,'Wide',0.0,6,20.0,4,NULL,'Attack Boost IV/Dragon Exploit/Wyrmstake Boost','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1082,0.0,2.0,160,1,1,0,0,'Poison',34.0,16.0,'Pukei Gunlance I',16.0,'Wide',0.0,5,14.0,3,NULL,'Attack Boost III/Defense Boost I/Poison Boost II','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1083,0.0,5.0,170,2,1,0,0,'Poison',30.0,21.0,'Pukei Gunlance II',16.0,'Wide',0.0,5,24.0,4,NULL,'Attack Boost III/Defense Boost II/Poison Boost II','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1084,40.0,11.0,160,2,0,0,0,'None',0.0,20.0,'Hidden Gunlance I',15.0,'Long',0.0,5,11.0,3,NULL,'Attack Boost III/Affinity Boost I/Master Rider','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1085,0.0,0.0,200,0,0,0,0,'None',0.0,16.0,'Behemoth Gunlance',16.0,'Long',0.0,5,19.0,4,NULL,'Attack Boost IV/Affinity Boost II/Dulling Strike','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1086,0.0,0.0,180,0,0,0,0,'None',0.0,10.0,'Golem Gunlance II',16.0,'Long',0.0,4,19.0,3,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1087,0.0,0.0,150,0,0,0,0,'None',0.0,4.0,'Golem Gunlance I',20.0,'Long',0.0,3,24.0,2,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1088,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Wyvern Bone Gunlance',10.0,'Long',0.0,2,20.0,2,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','GunLance',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1089,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Gunlance II',16.0,'Long',0.0,1,19.0,1,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','GunLance',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1090,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Gunlance I',20.0,'Long',0.0,1,16.0,1,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1091,20.0,5.0,200,2,0,0,0,'Thunder',27.0,22.0,'Mythic Kadachi Striker',20.0,'Long',0.0,6,25.0,4,NULL,'Attack Boost III/Affinity Boost III/Thunder Boost III','GunLance',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1092,15.0,4.0,180,2,0,0,0,'Thunder',24.0,18.0,'Kadachi Striker II',20.0,'Long ',0.0,5,24.0,3,NULL,'Attack Boost II/Affinity Boost III/Thunder Boost III','GunLance',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1093,15.0,0.0,100,0,0,0,0,'Thunder',19.0,10.0,'Kadachi Striker I',12.0,'Long',0.0,2,28.0,2,NULL,'Attack Boost I/Affinity Boost I/Thunder Boost II','GunLance',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1094,0.0,6.0,180,1,1,0,0,'Sleep',27.0,15.0,'Lullabyte Sleeplance',20.0,'Long',0.0,5,20.0,4,NULL,'Affinity Boost III/Sleep Boost II/Buddy Rally','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1095,0.0,0.0,140,1,1,0,0,'Sleep',25.0,16.0,'Baggi Gunlance III',16.0,'Long',0.0,4,24.0,3,NULL,'Affinity Boost II/Sleep Boost I/Buddy Rally','GunLance',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1096,0.0,0.0,100,0,0,0,0,'Sleep',22.0,10.0,'Baggi Gunlance II',15.0,'Long',0.0,2,24.0,2,NULL,'Affinity Boost II/Sleep Boost I/Buddy Rally','GunLance',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1097,0.0,0.0,80,0,0,0,0,'Sleep',20.0,4.0,'Baggi Gunlance I',6.0,'Long',0.0,1,24.0,1,NULL,'Affinity Boost I/Sleep Boost I/Buddy Rally','GunLance',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1098,-1.0,5.0,180,2,0,0,0,'Paralysis',28.0,20.0,'Shatter God',12.0,'Long',0.0,6,37.0,4,NULL,'Attack Boost IV/Defense Boost III/Dulling Strike','GunLance',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1099,-10.0,0.0,160,2,0,0,0,'Paralysis',26.0,16.0,'Shattershot II',10.0,'Long',0.0,5,33.0,3,NULL,'Attack Boost IV/Defense Boost II/Dulling Strike','GunLance',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1100,-10.0,0.0,100,0,0,0,0,'Paralysis',24.0,6.0,'Shattershot I',10.0,'Long',0.0,2,30.0,2,NULL,'Attack Boost III/Defense Boost I/Dulling Strike','GunLance',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1101,0.0,7.0,190,1,2,0,0,'Poison',45.0,20.0,'Datura Gunlance',15.0,'Wide',0.0,6,15.0,4,NULL,'Attack Boost IV/Defense Boost III/Poison Boost III','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1102,-10.0,0.0,160,0,0,0,10,'None',0.0,17.0,'Diablos Gunlance I',15.0,'Wide',0.0,3,14.0,3,NULL,'Affinity Boost I/Defense Boost I/Dulling Strike','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1103,-10.0,0.0,240,0,0,0,10,'None',0.0,24.0,'Diablos Gunlance II',19.0,'Wide',0.0,6,21.0,3,NULL,'Affinity Boost II/Defense Boost I/Dulling Strike','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1104,-10.0,0.0,250,0,0,0,10,'None',0.0,34.0,'Diablos Cannon',14.0,'Wide',0.0,6,21.0,4,NULL,'Affinity Boost III/Defense Boost II/Dulling Strike','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1105,0.0,0.0,100,0,0,0,0,'Fire',20.0,10.0,'Aknosom Gunlance I',11.0,'Normal',0.0,2,6.0,2,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1106,0.0,0.0,90,0,0,0,0,'Fire',20.0,12.0,'Aknosom Gunlance II',15.0,'Normal',0.0,2,9.0,2,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1107,0.0,0.0,180,2,0,0,0,'Dragon',38.0,0.0,'Reddnaught Gunlance',0.0,'Long',0.0,7,15.0,4,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','GunLance',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1108,0.0,5.0,150,2,0,0,0,'Fire',27.0,15.0,'Aknosom Gunlance III',15.0,'Normal',0.0,4,11.0,3,NULL,'Attack Boost II/Fire Boost II/Fireblight Exploit','GunLance',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1109,0.0,0.0,120,0,0,0,0,'Water',40.0,12.0,'Almudron Gunlance I',12.0,'Wide',0.0,3,11.0,2,NULL,'Attack Boost II/Water Boost I/Element Exploit','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1110,0.0,9.0,160,2,1,0,0,'Water',20.0,15.0,'Almudron Gunlance II',15.0,'Wide',0.0,6,14.0,4,NULL,'Attack Boost III/Water Boost I/Element Exploit','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1111,0.0,10.0,170,1,2,0,0,'Water',46.0,20.0,'Doombringer Gunlance',10.0,'Wide',0.0,6,10.0,5,NULL,'Attack Boost III/Water Boost II/Element Exploit','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1112,10.0,0.0,100,0,0,0,0,'Thunder',13.0,6.0,'Full Voltage I',21.0,'Long',0.0,2,9.0,1,NULL,'Attack Boost I/Thunder Boost I/Thunderblight Exploit','GunLance',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1113,10.0,0.0,150,0,0,0,0,'Thunder',15.0,10.0,'Full Voltage II',25.0,'Long',0.0,3,9.0,2,NULL,'Attack Boost III/Thunder Boost I/Thunderblight Exploit','GunLance',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1114,0.0,6.0,170,2,0,0,0,'Thunder',17.0,10.0,'High Volt Gunlance',25.0,'Long',0.0,4,9.0,3,NULL,'Attack Boost IV/Thunder Boost II/Thunderblight Exploit','GunLance',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1115,0.0,6.0,170,2,0,0,0,'Fire',29.0,14.0,'Dawnbreaker Gunlance',15.0,'Normal',0.0,5,11.0,4,NULL,'Attack Boost II/Fire Boost II/Fireblight Exploit','GunLance',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1116,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Gunlance S',15.0,'Normal',0.0,7,10.0,2,NULL,'Any','GunLance',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1117,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Chorus I',20.0,'None',0.0,1,10.0,0,'Defense Up
 Attack Up
 Health Recovery (S)','Attack Boost I/Affinity Boost II/Defense Boost I','HuntingHorn',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1118,0.0,25.0,190,0,0,0,0,'Dragon',11.0,10.0,'Azure Elder Horn II',4.0,'None',0.0,6,4.0,0,' Stamina Use Reduced
 Divine Protection
 Sonic Barrier','Dragon Boost III/Anti-Aerial Species/Ibushi Soul','HuntingHorn',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1119,0.0,24.0,180,0,0,0,0,'Dragon',9.0,10.0,'Azure Elder Horn I',4.0,'None',0.0,5,4.0,0,' Stamina Use Reduced
 Divine Protection
 Sonic Barrier','Dragon Boost III/Anti-Aerial Species/Defense Boost I','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1120,-10.0,2.0,190,3,0,0,0,'Thunder',17.0,20.0,'Denden Daiko II',11.0,'None',0.0,6,6.0,0,' Attack and Defense Up
 Environment Damage Negated
 Tremors Negated','Thunder Boost I/Dulling Strike/Maximum Volume','HuntingHorn',0.0,43.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1121,-10.0,0.0,170,0,0,0,0,'Thunder',15.0,20.0,'Denden Daiko I',10.0,'None',0.0,5,6.0,0,' Attack and Defense Up
 Environment Damage Negated
 Tremors Negated','Thunder Boost I/Dulling Strike/Maximum Volume','HuntingHorn',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1122,0.0,10.0,180,2,1,0,0,'Blast',23.0,20.0,'Sinister Shadestrum',2.0,'None',0.0,6,45.0,0,' Sonic Barrier
 Attack and Defense Up
 Health Regeneration','Attack Boost III/Blast Boost II/Magnamalo Soul','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1123,0.0,0.0,140,0,0,0,0,'Blast',16.0,20.0,'Sinister Strum II',5.0,'None',0.0,3,40.0,0,' Sonic Barrier
 Attack and Defense Up
 Health Regeneration','Attack Boost III/Blast Boost I/Magnamalo Soul','HuntingHorn',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1124,0.0,0.0,120,0,0,0,0,'Blast',13.0,20.0,'Sinister Strum I',4.0,'None',0.0,3,37.0,0,' Sonic Barrier
 Attack and Defense Up
 Health Regeneration','Attack Boost II/Blast Boost I/Magnamalo Soul','HuntingHorn',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1125,0.0,9.0,170,2,1,1,0,'Ice',13.0,19.0,'Vicello Unu White',4.0,'None',0.0,5,33.0,0,' Health Regeneration
 Stamina Use Reduced
 Sonic Wave','Attack Boost IV/Ice Boost III/Silkbind Boost','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1126,0.0,0.0,120,0,0,0,0,'Ice',10.0,18.0,'Vicello Nulo White II',5.0,'None',0.0,3,30.0,0,' Health Regeneration
 Stamina Use Reduced
 Sonic Wave','Attack Boost III/Ice Boost II/Silkbind Boost','HuntingHorn',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1127,0.0,0.0,80,0,0,0,0,'Ice',8.0,6.0,'Vicello Nulo White I',2.0,'None',0.0,1,33.0,0,' Health Regeneration
 Stamina Use Reduced
 Sonic Wave','Attack Boost II/Ice Boost I/Silkbind Boost','HuntingHorn',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1128,0.0,11.0,170,1,1,1,0,'Paralysis',21.0,20.0,'Vicello Unu Green',10.0,'None',0.0,6,35.0,0,' Defense Up
 Tremors Negated
 Health Recovery (S)','Attack Boost IV/Paralysis Boost I/Silkbind Boost','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1129,0.0,9.0,150,1,1,1,0,'Paralysis',18.0,18.0,'Vicello Nulo Green II',4.0,'None',0.0,5,33.0,0,' Defense Up
 Tremors Negated
 Health Recovery (S)','Attack Boost III/Paralysis Boost I/Silkbind Boost','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1130,0.0,0.0,100,0,0,0,0,'Paralysis',15.0,6.0,'Vicello Nulo Green I',10.0,'None',0.0,2,35.0,0,' Defense Up
 Tremors Negated
 Health Recovery (S)','Attack Boost II/Paralysis Boost I/Silkbind Boost','HuntingHorn',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1131,0.0,15.0,190,3,1,0,0,'Dragon',20.0,20.0,'Vicello Uno Black',4.0,'None',0.0,6,37.0,0,' Health Recovery (S)
 Stamina Use Reduced
 Earplugs (L)','Attack Boost IV/Dragon Boost III/Silkbind Boost','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1132,0.0,8.0,170,3,1,0,0,'Dragon',17.0,17.0,'Vicello Nulo Black II',4.0,'None',0.0,5,33.0,0,' Health Recovery (S)
 Stamina Use Reduced
 Earplugs (L)','Attack Boost III/Dragon Boost III/Silkbind Boost','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1133,0.0,6.0,150,3,1,0,0,'Dragon',15.0,15.0,'Vicello Nulo Black I',6.0,'None',0.0,4,35.0,0,' Health Recovery (S)
 Stamina Use Reduced
 Earplugs (L)','Attack Boost III/Dragon Boost II/Silkbind Boost','HuntingHorn',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1134,0.0,0.0,120,0,0,0,0,'None',0.0,17.0,'Vicello Unu',5.0,'None',0.0,3,30.0,0,' Health Recovery (S)
 Stamina Use Reduced
 Earplugs (S)','Attack Boost III/Affinity Boost II/Silkbind Boost','HuntingHorn',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1135,0.0,0.0,80,0,0,0,0,'None',0.0,9.0,'Vicello Nulo II',5.0,'None',0.0,1,25.0,0,' Health Recovery (S)
 Stamina Use Reduced
 Earplugs (S)','Attack Boost II/Affinity Boost II/Silkbind Boost','HuntingHorn',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1136,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Vicello Nulo I',5.0,'None',0.0,1,25.0,0,' Health Recovery (S)
 Stamina Use Reduced
 Earplugs (S)','Attack Boost II/Affinity Boost I/Silkbind Boost','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1137,0.0,4.0,130,2,0,0,0,'Thunder',32.0,15.0,'Khezu Flute',9.0,'None',0.0,4,14.0,0,' Earplugs (S)
 Health Regeneration
 Elemental Attack Boost','Attack Boost II/Thunder Boost I/Thunderblight Exploit','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1138,0.0,0.0,100,0,0,0,0,'Thunder',24.0,10.0,'Khezu Horn II',9.0,'None',0.0,2,11.0,0,' Earplugs (S)
 Health Regeneration
 Elemental Attack Boost','Attack Boost III/Thunder Boost I/Thunderblight Exploit','HuntingHorn',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1139,0.0,0.0,90,0,0,0,0,'Thunder',20.0,4.0,'Khezu Horn I',6.0,'None',0.0,2,9.0,0,' Earplugs (S)
 Health Regeneration
 Elemental Attack Boost','Attack Boost II/Thunder Boost I/Thunderblight Exploit','HuntingHorn',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1140,25.0,6.0,150,1,1,1,0,'None',0.0,22.0,'Kulu Grosso',14.0,'None',0.0,4,16.0,0,' Defense Up
 Stamina Recovery Up
 Stun Negated','Attack Boost II/Affinity Boost III/Spiribird Doubled','HuntingHorn',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1141,15.0,0.0,110,0,0,0,0,'None',0.0,15.0,'Kulu Mosso II',16.0,'None',0.0,3,15.0,0,' Defense Up
 Stamina Recovery Up
 Stun Negated','Attack Boost I/Affinity Boost II/Spiribird Doubled','HuntingHorn',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1142,15.0,0.0,90,0,0,0,0,'None',0.0,10.0,'Kulu Mosso I',14.0,'None',0.0,2,14.0,0,' Defense Up
 Stamina Recovery Up
 Stun Negated','Attack Boost I/Affinity Boost II/Spiribird Doubled','HuntingHorn',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1143,0.0,9.0,190,1,0,0,0,'Fire',35.0,22.0,'Rathalos Feroce',16.0,'None',0.0,6,16.0,0,' Elemental Attack Boost
 Sonic Wave
 Stamina Recovery Up','Attack Boost III/Fire Boost I/Element Exploit','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1144,0.0,4.0,170,1,0,0,0,'Fire',32.0,21.0,'Flame Feroce II',21.0,'None',0.0,5,16.0,0,' Elemental Attack Boost
 Sonic Wave
 Stamina Recovery Up','Attack Boost II/Fire Boost I/Element Exploit','HuntingHorn',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1145,0.0,0.0,110,0,0,0,0,'Fire',25.0,10.0,'Flame Feroce I',19.0,'None',0.0,3,11.0,0,' Elemental Attack Boost
 Sonic Wave
 Stamina Recovery Up','Attack Boost II/Fire Boost I/Element Exploit','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1146,-5.0,2.0,230,0,0,0,0,'None',0.0,14.0,'Wild Grunt',21.0,'None',0.0,6,19.0,0,'Divine Protection
 Knockacks Negated
 Stun Negated','Defense Boost III/Dulling Strike/Maximum Volume','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1147,0.0,7.0,180,0,0,0,0,'Thunder',34.0,10.0,'Thunderbolt Horn I',4.0,'None',0.0,6,4.0,0,' Stun Negated
 Health Recovery (L)
 Health Regeneration','Attack Boost II/Anti-Aerial Species/Narwa Soul','HuntingHorn',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1148,-10.0,0.0,190,0,0,0,0,'Blast',15.0,23.0,'Rookslayer Drum I',22.0,'None',0.0,6,15.0,0,'Earplugs (S)
 Attack Up
 Health Recovery (L)','Defense Boost I/Blast Boost II/Maximum Volume','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1149,-10.0,3.0,200,0,0,0,0,'Blast',16.0,20.0,'Rookslayer Drum II',26.0,'None',0.0,6,15.0,0,'Earplugs (S)
 Attack Up
 Health Recovery (L)','Defense Boost I/Blast Boost II/Maximum Volume','HuntingHorn',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1150,-10.0,5.0,220,0,0,0,0,'Blast',18.0,20.0,'Bazelreid Rookslayer',26.0,'None',0.0,7,15.0,0,'Earplugs (S)
 Attack Up
 Health Recovery (L)','Defense Boost II/Blast Boost III/Maximum Volume','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1151,0.0,8.0,200,0,0,0,0,'Blast',42.0,25.0,'Teostra''s Orphee',18.0,'None',0.0,7,16.0,0,' Health Regeneration
 Health Recovery (S) + Antidote
 Attack and Defense Up','Attack Boost III/Fireblight Exploit/Teostra Soul','HuntingHorn',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1152,-15.0,2.0,240,0,0,0,0,'None',0.0,20.0,'Duo Risoluto',14.0,'None',0.0,7,16.0,0,'Defense Up
 Stamina Use Reduced
 Earplugs (L)','Affinity Boost III/Defense Boost II/Brutal Strike','HuntingHorn',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1153,-10.0,2.0,210,3,0,0,0,'Thunder',20.0,15.0,'Denden Doomsounder',10.0,'None',0.0,7,7.0,0,' Attack and Defense Up
 Environment Damage Negated
 Tremors Negated','Thunder Boost II/Dulling Strike/Maximum Volume','HuntingHorn',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1154,10.0,6.0,180,1,0,0,0,'Ice',35.0,8.0,'Daora''s Baphophone',18.0,'None',0.0,7,14.0,0,' Environment Damage Negated
 Stamina Use Reduced
 Sharpness Loss Reduced','Attack Boost III/Affinity Boost III/Kushala Daora Soul','HuntingHorn',2.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1155,0.0,8.0,180,2,1,1,0,'Poison',40.0,10.0,'Cursed Ocarina',5.0,'None',0.0,7,35.0,0,' Earplugs (L)
 Wind Pressure Negated
 Elemental Attack Boost','Attack Boost III/Defense Boost III/Chameleos Soul','HuntingHorn',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1156,0.0,12.0,190,0,0,0,0,'Thunder',41.0,8.0,'Abyssal Storm Horn',3.0,'None',0.0,7,2.0,0,' Stun Negated
 Health Recovery (L)
 Health Regeneration','Attack Boost III/Anti-Aerial Species/Narwa Soul','HuntingHorn',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1157,0.0,25.0,200,0,0,0,0,'Dragon',14.0,12.0,'Abyssal Gale Horn',5.0,'None',0.0,7,5.0,0,' Stamina Use Reduced
 Divine Protection
 Sonic Barrier','Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','HuntingHorn',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1158,0.0,0.0,150,2,0,0,0,'Dragon',32.0,0.0,'Redwing Flute I',0.0,'None',0.0,6,30.0,0,' Elemental Attack Boost
 Attack and Affinity Up
 Sonic Wave','Attack Boost III/Wyvern Exploit/Valstrax Soul','HuntingHorn',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1159,15.0,5.0,190,1,0,0,0,'Water',28.0,20.0,'Summoning Bell',8.0,'None',0.0,6,15.0,0,' Health Recovery (S)
 Blight Negated
 Stamina Use Reduced','Attack Boost II/Affinity Boost II/Element Exploit','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1160,0.0,7.0,200,0,0,0,0,'None',0.0,12.0,'Rampage Agitato V',17.0,'None',0.0,6,12.0,0,' Earplugs (S)
 Health Recovery (S)
 Sonic Wave','Any','HuntingHorn',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1161,0.0,6.0,190,0,0,0,0,'None',0.0,6.0,'Rampage Agitato IV',15.0,'None',0.0,6,10.0,0,' Earplugs (S)
 Health Recovery (S)
 Sonic Wave','Any','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1162,0.0,4.0,180,0,0,0,0,'None',0.0,6.0,'Rampage Agitato III',15.0,'None',0.0,5,10.0,0,' Earplugs (S)
 Health Recovery (S)
 Sonic Wave','Any','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1163,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage Agitato II',15.0,'None',0.0,5,14.0,0,' Earplugs (S)
 Health Recovery (S)
 Sonic Wave','Any','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1164,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Rampage Agitato I',20.0,'None',0.0,4,20.0,0,' Earplugs (S)
 Health Recovery (S)
 Sonic Wave','Any','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1165,-5.0,2.0,190,0,0,0,0,'None',0.0,10.0,'Bull Grunt II',19.0,'None',0.0,5,16.0,0,'Divine Protection
 Knockacks Negated
 Stun Negated','Defense Boost II/Dulling Strike/Maximum Volume','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1166,0.0,2.0,170,3,0,0,0,'Blast',15.0,30.0,'Bombadgy''s Cry',15.0,'None',0.0,5,20.0,0,' Wind Pressure Negated
 Health Regeneration
 Sonic Barrier','Defense Boost I/Blast Boost I/Dulling Strike','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1167,0.0,0.0,140,0,0,0,0,'Blast',10.0,4.0,'Grass Flute I',15.0,'None',0.0,3,20.0,0,' Wind Pressure Negated
 Health Regeneration
 Sonic Barrier','Defense Boost I/Blast Boost I/Dulling Strike','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1168,0.0,5.0,180,2,0,0,10,'Paralysis',15.0,23.0,'Webbed Cornupion',11.0,'None',0.0,5,9.0,0,' Health Recovery (S) + Antidote
 Defense Up
 Affinity Up','Defense Boost II/Paralysis Boost I/Silkbind Boost','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1169,0.0,0.0,150,0,0,0,10,'Paralysis',12.0,20.0,'Cornupion II',6.0,'None',0.0,3,9.0,0,' Health Recovery (S) + Antidote
 Defense Up
 Affinity Up','Defense Boost II/Paralysis Boost I/Silkbind Boost','HuntingHorn',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1170,0.0,0.0,130,0,0,0,10,'Paralysis',10.0,15.0,'Cornupion I',9.0,'None',0.0,3,11.0,0,' Health Recovery (S) + Antidote
 Defense Up
 Affinity Up','Defense Boost I/Paralysis Boost I/Silkbind Boost','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1171,0.0,2.0,180,3,0,0,0,'Ice',20.0,30.0,'Magia Charmbell',14.0,'None',0.0,6,11.0,0,' Health Recovery (S)
 Sonic Barrier
 Health Recovery (S) + Antidote','Ice Boost III/Dulling Strike/Silkbing Boost','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1172,0.0,0.0,170,3,0,0,0,'Ice',16.0,19.0,'Magia Charm III',14.0,'None',0.0,4,11.0,0,' Health Recovery (S)
 Sonic Barrier
 Health Recovery (S) + Antidote','Ice Boost I/Dulling Strike/Silkbind Boost','HuntingHorn',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1173,0.0,0.0,150,0,0,0,0,'Ice',14.0,6.0,'Magia Charm II',14.0,'None',0.0,3,10.0,0,' Health Recovery (S)
 Sonic Barrier
 Health Recovery (S) + Antidote','Ice Boost I/Dulling Strike/Silkbind Boost','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1174,0.0,0.0,100,0,0,0,0,'Ice',12.0,2.0,'Magia Charm I',6.0,'None',0.0,2,10.0,0,' Health Recovery (S)
 Sonic Barrier
 Health Recovery (S) + Antidote','Ice Boost I/Dulling Strike/Silkbind Boost','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1175,0.0,0.0,150,0,0,0,0,'Poison',35.0,19.0,'Toxic Fungasax',16.0,'None',0.0,4,6.0,0,' Stamina Use Reduced
 Health Recovery (S)
 Defense Up','Attack Boost III/Dulling Strike/Spiribird Doubled','HuntingHorn',0.0,34.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1176,0.0,0.0,130,0,0,0,0,'Poison',32.0,7.0,'Poison Fungasax II',15.0,'None',0.0,3,9.0,0,' Stamina Use Reduced
 Health Recovery (S)
 Defense Up','Attack Boost II/Dulling Strike/Spiribird Doubled','HuntingHorn',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1177,0.0,0.0,90,0,0,0,0,'Poison',30.0,0.0,'Poison Fungasax I',14.0,'None',0.0,2,9.0,0,' Stamina Use Reduced
 Health Recovery (S)
 Defense Up','Attack Boost II/Dulling Strike/Spiribird Doubled','HuntingHorn',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1178,0.0,5.0,160,2,1,1,0,'Poison',37.0,17.0,'Blessed Ocarina I',6.0,'None',0.0,6,42.0,0,' Earplugs (L)
 Wind Pressure Negated
 Elemental Attack Boost','Attack Boost II/Defense Boost III/Chameleos Soul','HuntingHorn',2.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1179,0.0,3.0,190,0,0,0,0,'Blast',40.0,32.0,'Teostra''s Tiple I',17.0,'None',0.0,6,15.0,0,' Health Regeneration
 Health Recovery (S) + Antidote
 Attsack and Defense Up','Attack Boost II/Fireblight Exploit/Teostra Soul','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1180,10.0,10.0,170,1,0,0,0,'Ice',32.0,16.0,'Daora''s Taus I',14.0,'None',0.0,6,12.0,0,' Environment Damage Negated
 Stamina Use Reduced
Sharpness Loss Reduced','Attack Boost II/Affinity Boost II/Kushala Daora Soul','HuntingHorn',0.0,33.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1181,0.0,0.0,150,2,0,0,0,'Blast',12.0,20.0,'Grass Flute II',15.0,'None',0.0,4,20.0,0,' Wind Pressure Negated
 Health Regeneration
 Sonic Barrier','Defense Boost II/Blast Boost II/Dulling Strike','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1182,0.0,0.0,160,2,0,0,0,'Dragon',37.0,0.0,'Reddnaught Ritmico',0.0,'None',0.0,7,15.0,0,' Environment Attack Boost
 Attack and Affinity Up
 Sonic Wave','Attack Boost III/Wyvern Exploit/Valstrax Soul','HuntingHorn',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1183,-5.0,2.0,180,0,0,0,0,'None',0.0,4.0,'Bull Grunt I',23.0,'None',0.0,4,15.0,0,'Divine Protection
 Knockacks Negated
 Stun Negated','Defense Boost I/Dulling Strike/Maximum Volume','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1184,-15.0,0.0,220,0,0,0,0,'None',0.0,24.0,'Duo Horn I',20.0,'None',0.0,6,20.0,0,' Defense Up
 Stamina Use Reduced
 Earplugs (L)','Affinity Boost II/Defense Boost I/Brutal Strike','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1185,0.0,0.0,70,0,0,0,0,'None',0.0,0.0,'Iron Horn I',16.0,'None',0.0,1,19.0,0,' Sonic Wave
 Stamina Recovery Up
 Defense Up','Attack Boost I/Affinity Boost I/Defense Boost II','HuntingHorn',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1186,0.0,0.0,180,2,1,0,0,'Sleep',19.0,20.0,'Illusory Flute',20.0,'None',0.0,5,10.0,0,' Attack Up
 Earplugs (S)
 Defense Up','Attack Boost III/Sleep Boost I/Dulling Strike','HuntingHorn',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1187,0.0,0.0,130,0,0,0,0,'Sleep',15.0,7.0,'Frilled Flute II',11.0,'None',0.0,3,9.0,0,' Attack Up
 Earplugs (S)
 Defense Up','Attack Boost I/Sleep Boost I/Dulling Strike','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1188,0.0,0.0,90,0,0,0,0,'Sleep',12.0,7.0,'Frilled Flute I',15.0,'None',0.0,2,10.0,0,' Attack Up
 Earplugs (S)
 Defense Up','Attack Boost I/Sleep Boost I/Dulling Strike','HuntingHorn',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1189,20.0,10.0,170,2,1,0,0,'Ice',20.0,25.0,'Algiguiro',16.0,'None',0.0,6,10.0,0,' Stamina Recovery Up
 Health Recovery (S)
 Affinity Up','Attack Boost IV/Affinity Boost II/Iceblight Exploit','HuntingHorn',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1190,20.0,0.0,150,2,0,0,0,'Ice',18.0,10.0,'Bariguiro II',6.0,'None',0.0,5,10.0,0,' Stamina Recovery Up
 Health Recovery (S)
 Affinity Up','Attack Boost III/Affinity Boost II/Iceblight Exploit','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1191,20.0,0.0,90,0,0,0,0,'Ice',15.0,15.0,'Bariguiro I',16.0,'None',0.0,2,10.0,0,' Stamina Recovery Up
 Health Recovery (S)
 Affinity Up','Attack Boost II/Affinity Boost II/Iceblight Exploit','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1192,-20.0,7.0,210,0,0,0,0,'None',0.0,30.0,'Tigrex Horn',13.0,'None',0.0,6,12.0,0,'Earplus (S)
 Attack Up
 Sonic Wave','Attack Boost II/Affinity Boost III/Maximum Volume','HuntingHorn',7.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1193,-20.0,6.0,200,0,0,0,0,'None',0.0,24.0,'Striped Dragonga II',10.0,'None',0.0,6,11.0,0,'Earplus (S)
 Attack Up
 Sonic Wave','Attack Boost II/Affinity Boost II/Maximum Volume','HuntingHorn',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1194,-20.0,2.0,140,0,0,0,0,'None',0.0,20.0,'Striped Dragonga I',6.0,'None',0.0,3,15.0,0,'Earplus (S)
 Attack Up
 Sonic Wave','Attack Boost II/Affinity Boost I/Maximum Volume','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1195,0.0,0.0,160,2,0,0,0,'None',0.0,20.0,'Zurogong Secundo',10.0,'None',0.0,4,5.0,0,' Attack Up
 Defense Up
 Sonic Barrier','Attack Boost III/Defense Boost II/Small Monster Exploit','HuntingHorn',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1196,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Zurogong Primo II',6.0,'None',0.0,2,33.0,0,' Attack Up
 Defense Up
 Sonic Barrier','Attack Boost II/Defense Boost I/Small Monster Exploit','HuntingHorn',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1197,0.0,0.0,90,0,0,0,0,'None',0.0,6.0,'Zurogong Primo I',4.0,'None',0.0,1,33.0,0,' Attack Up
 Defense Up
 Sonic Barrier','Attack Boost I/Defense Boost I/Small Monster Exploit','HuntingHorn',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1198,0.0,6.0,180,1,1,0,0,'Thunder',28.0,24.0,'Despot''s Thunderclap',10.0,'None',0.0,6,14.0,0,' Stun Negated
 Attack Up
 Knockbacks Negated','Attack Boost II/Thunder Boost II/Anti-aquatic Species','HuntingHorn',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1199,0.0,5.0,160,0,0,0,0,'Thunder',24.0,20.0,'Usurper''s Growl II',6.0,'None',0.0,5,14.0,0,' Stun Negated
 Attack Up
 Knockbacks Negated','Attack Boost II/Thunder Boost I/Anti-aquatic Species','HuntingHorn',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1200,0.0,0.0,110,0,0,0,0,'Thunder',20.0,23.0,'Usurper''s Growl I',10.0,'None',0.0,3,15.0,0,' Stun Negated
 Attack Up
 Knockbacks Negated','Attack Boost I/Thunder Boost I/Anti-aquatic Species','HuntingHorn',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1201,0.0,0.0,170,2,0,0,20,'Fire',15.0,15.0,'Gigant Rock',7.0,'None',0.0,5,4.0,0,' Tremors Negated
 Sonic Barrier
 Stamina Use Reduced','Defense Boost II/Fire Boost III/Dulling Strike','HuntingHorn',0.0,42.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1202,0.0,0.0,150,0,0,0,15,'Fire',12.0,10.0,'Basarios Rock Mk.II',2.0,'None',0.0,3,5.0,0,' Tremors Negated
 Sonic Barrier
 Stamina Use Reduced','Defense Boost I/Fire Boost II/Dulling Strike','HuntingHorn',0.0,43.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1203,0.0,0.0,110,0,0,0,15,'Fire',10.0,6.0,'Basarios Rock I',5.0,'None',0.0,2,5.0,0,' Tremors Negated
 Sonic Barrier
 Stamina Use Reduced','Defense Boost I/Fire Boost I/Dulling Strike','HuntingHorn',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1204,30.0,10.0,180,2,1,1,0,'Fire',29.0,7.0,'Araknahorn',7.0,'None',0.0,7,47.0,0,'Blight Negated
 Elemental Attack Boost
 Knockbacks Negated','Attack Boost IV/Fire Boost II/Silkbind Boost','HuntingHorn',4.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1205,30.0,10.0,140,2,1,1,0,'Fire',26.0,5.0,'Sublime Bell II',10.0,'None',0.0,6,45.0,0,' Blight Negated
 Elemental Attack Boost
 Knockbacks Negated','Attack Boost III/Fire Boost II/Silkbind Boost','HuntingHorn',2.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1206,30.0,10.0,130,2,1,1,0,'Fire',24.0,5.0,'Sublime Bell I',10.0,'None',0.0,6,45.0,0,' Blight Negated
 Elemental Attack Boost
 Knockbacks Negated','Attack Boost III/Fire Boost I/Silkbind Boost','HuntingHorn',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1207,10.0,6.0,170,1,0,0,0,'Water',24.0,18.0,'Poetic Bell II',20.0,'None',0.0,5,14.0,0,' Health Recovery (S)
 Blight Negated
 Stamina Use Reduced','Attack Boost II/Affinity Boost II/Element Exploit','HuntingHorn',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1208,10.0,0.0,120,0,0,0,0,'Water',20.0,15.0,'Poetic Bell I',9.0,'None',0.0,3,13.0,0,' Health Recovery (S)
 Blight Negated
 Stamina Use Reduced','Attack Boost II/Affinity Boost I/Water Boost I','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1209,0.0,10.0,180,2,1,0,0,'None',0.0,15.0,'Kamura Ninja Horn',20.0,'None',0.0,5,9.0,0,'Defense Up
 Attack Up
 Health Recovery (S) + Antidote','Affinity Boost IV/Defense Boost II/Master Rider','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1210,0.0,6.0,150,2,0,0,0,'None',0.0,10.0,'Kamura Chorus V',19.0,'None',0.0,4,14.0,0,'Defense Up
 Attack Up
 Health Recovery (S) + Antidote','Attack Boost II/Affinity Boost II/Master Rider','HuntingHorn',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1211,0.0,3.0,130,0,0,0,0,'None',0.0,5.0,'Kamura Chorus IV',20.0,'None',0.0,3,14.0,0,'Defense Up
 Attack Up
 Health Recovery (S)','Attack Boost II/Affinity Boost II/Defense Boost II','HuntingHorn',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1212,0.0,0.0,90,0,0,0,0,'None',0.0,4.0,'Kamura Chorus III',16.0,'None',0.0,2,15.0,0,'Defense Up
 Attack Up
 Health Recovery (S)','Attack Boost I/Affinity Boost II/Defense Boost II','HuntingHorn',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1213,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Chorus II',16.0,'None',0.0,1,14.0,0,'Defense Up
 Attack Up
 Health Recovery (S)','Attack Boost I/Affinity Boost II/Defense Boost I','HuntingHorn',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1214,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Wind Horn',14.0,'None',0.0,1,16.0,0,' Sonic Wave
 Stamina Recovery Up
 Defense Up','Attack Boost I/Affinity Boost I/Defense Boost II','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1215,0.0,0.0,100,0,0,0,0,'None',0.0,4.0,'Metal Bagpipe I',15.0,'None',0.0,2,14.0,0,' Sonic Wave
 Stamina Recovery Up
 Defense Up','Attack Boost II/Affinity Boost I/Defense Boost II','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1216,0.0,0.0,150,0,0,0,0,'None',0.0,13.0,'Great Bagpipe',14.0,'None',0.0,3,16.0,0,' Sonic Wave
 Stamina Recovery Up
 Defense Up','Attack Boost II/Affinity Boost I/Defense Boost II','HuntingHorn',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1217,0.0,4.0,160,1,0,0,12,'None',0.0,11.0,'Heavy Bagpipe I',21.0,'None',0.0,4,24.0,0,' Sonic Wave
 Stamina Recovery Up
 Defense Up','Attack Boost II/Affinity Boost III/Silkbind Boost','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1218,0.0,0.0,210,0,0,0,0,'None',0.0,14.0,'Native''s Horn',29.0,'None',0.0,5,35.0,0,' Environment Damage Negated
 Divine Protection
 Attack Up','Attack Boost IV/Affinity Boost II/Dulling Strike','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1219,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Hunter''s Horn I',16.0,'None',0.0,4,19.0,0,' Environment Damage Negated
 Divine Protection
 Attack Up','Attack Boost III/Affinity Boost II/Dulling Strike','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1220,0.0,0.0,140,0,0,0,0,'None',0.0,2.0,'Hardened Bone Horn',16.0,'None',0.0,3,24.0,0,' Environment Damage Negated
 Defense Up
 Attack Up','Attack Boost II/Affinity Boost II/Defense Boost I','HuntingHorn',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1221,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Bone Horn II',16.0,'None',0.0,1,19.0,0,' Environment Damage Negated
 Defense Up
 Attack Up','Attack Boost II/Affinity Boost I/Defense Boost I','HuntingHorn',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1222,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Horn I',21.0,'None',0.0,1,16.0,0,' Environment Damage Negated
 Defense Up
 Attack Up','Attack Boost II/Affinity Boost I/Defense Boost I','HuntingHorn',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1223,0.0,6.0,160,2,1,1,0,'Water',35.0,20.0,'Droth Roar',16.0,'None',0.0,5,14.0,0,' Blight Negated
 Defense Up
 Sonic Wave','Attack Boost III/Water Boost II/Waterblight Exploit','HuntingHorn',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1224,0.0,0.0,90,0,0,0,0,'Water',32.0,10.0,'Droth Drone II',14.0,'None',0.0,2,14.0,0,' Blight Negated
 Defense Up
 Sonic Wave','Attack Boost/Water Boost I/Waterblight Exploit','HuntingHorn',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1225,0.0,0.0,80,0,0,0,0,'Water',30.0,10.0,'Droth Drone I',10.0,'None',0.0,2,10.0,0,' Blight Negated
 Defense Up
 Sonic Wave','Attack Boost /Water Boost I/Waterblight Exploit','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1226,10.0,10.0,150,2,1,0,0,'None',0.0,18.0,'Gale Horn',16.0,'None',0.0,4,19.0,0,' Stamina Recovery Up
 Affinity Up
 Health Recovery (S)','Affinity Boost III/Small Monster Exploit/Buddy Rally','HuntingHorn',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1227,10.0,0.0,90,0,0,0,0,'None',0.0,11.0,'Wind Thief Horn II',11.0,'None',0.0,2,19.0,0,' Stamina Recovery Up
 Affinity Up
 Health Recovery (S)','Affinity Boost II/Small Monster Exploit/Buddy Rally','HuntingHorn',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1228,10.0,0.0,80,0,0,0,0,'None',0.0,5.0,'Wind Thief Horn I',11.0,'None',0.0,1,15.0,0,' Stamina Recovery Up
 Affinity Up
 Health Recovery (S)','Affinity Boost I/Small Monster Exploit/Buddy Rally','HuntingHorn',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1229,0.0,0.0,210,2,0,0,20,'Water',18.0,21.0,'Amphibia Allargando',21.0,'None',0.0,6,9.0,0,' Health Recovery (S)
 Attack Up
 Tremors Negated','Defense Boost I/Water Boost III/Dulling Strike','HuntingHorn',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1230,0.0,0.0,160,2,0,0,10,'Water',16.0,14.0,'Frog Flute II',21.0,'None',0.0,4,9.0,0,' Health Recovery (S)
 Attack Up
 Tremors Negated','Defense Boost I/Water Boost I/Dulling Strike','HuntingHorn',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1231,0.0,0.0,100,0,0,0,10,'Water',12.0,4.0,'Frog Flute I',16.0,'None',0.0,2,6.0,0,' Health Recovery (S)
 Attack Up
 Tremors Negated','Defense Boost I/Water Boost I/Dulling Strike','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1232,-15.0,0.0,230,0,0,0,0,'None',0.0,27.0,'Duo Horn II',14.0,'None',0.0,6,20.0,0,' Defense Up
 Stamina Use Reduced
 Earplugs (L)','Affinity Boost II/Defense Boost II/Brutal Strike','HuntingHorn',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1233,-30.0,0.0,200,0,0,0,10,'None',0.0,20.0,'Sandcrier',16.0,'None',0.0,5,14.0,0,' Defense Up
 Sonic Wave
 Stamina Use Reduced','Affinity Boost II/Defense Boost II/Brutal Strike','HuntingHorn',0.0,31.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1234,-30.0,0.0,120,0,0,0,8,'None',0.0,0.0,'Sandpipe I',14.0,'None',0.0,2,14.0,0,' Defense Up
 Sonic Wave
 Stamina Use Reduced','Affinity Boost I/Defense Boost I/Brutal Strike','HuntingHorn',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1235,0.0,4.0,170,1,0,0,0,'Fire',22.0,20.0,'Queen Chordmaker',14.0,'None',0.0,5,9.0,0,'Defense Up
 Stamina Use Reduced
 Divine Protection','Attack Boost I/Fire Boost I/Small Monster Exploit','HuntingHorn',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1236,0.0,0.0,120,0,0,0,0,'Fire',18.0,15.0,'Valkyrie Chordmaker II',12.0,'None',0.0,3,8.0,0,'Defense Up
 Stamina Use Reduced
 Divine Protection','Attack Boost II/Fire Boost I/Small Monster Exploit','HuntingHorn',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1237,0.0,0.0,100,0,0,0,0,'Fire',16.0,11.0,'Valkyrie Chordmaker I',11.0,'None',0.0,2,11.0,0,'Defense Up
 Stamina Use Reduced
 Divine Protection','Attack Boost I/Fire Boost I/Small Monster Exploit','HuntingHorn',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1238,-15.0,4.0,210,2,1,0,0,'Fire',22.0,15.0,'Forte Flammenkornett',28.0,'None',0.0,6,28.0,0,' Stamina Recovery Up
 Health Recovery (S)
 Attack Up','Affinity Boost II/Fire Boost III/Brutal Strike','HuntingHorn',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1239,-15.0,0.0,200,2,1,0,0,'Fire',20.0,19.0,'Flammenkornett II',30.0,'None',0.0,6,30.0,0,' Stamina Recovery Up
 Health Recovery (S)
 Attack Up','Affinity Boost I/Fire Boost II/Brutal Strike','HuntingHorn',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1240,-15.0,0.0,190,2,1,0,0,'Fire',18.0,14.0,'Flammenkornett I',27.0,'None',0.0,5,33.0,0,' Stamina Recovery Up
 Health Recovery (S)
 Attack Up','Affinity Boost I/Fire Boost I/Brutal Strike','HuntingHorn',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1241,0.0,7.0,190,2,1,0,0,'Poison',27.0,25.0,'Datura Lurr',14.0,'None',0.0,6,14.0,0,' Elemental Attack Boost
Stamina Recovery Up
 Health Regeneration','Attack Boost III/Defense Boost I/Poison Boost I','HuntingHorn',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1242,0.0,4.0,170,2,1,0,0,'Poison',24.0,21.0,'Pukei Bagpipe II',14.0,'None',0.0,5,9.0,0,' Elemental Attack Boost
Stamina Recovery Up
 Health Regeneration','Attack Boost III/Defense Boost I/Poison Boost I','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1243,0.0,0.0,100,0,0,0,0,'Poison',18.0,12.0,'Pukei Bagpipe I',16.0,'None',0.0,2,14.0,0,' Elemental Attack Boost
Stamina Recovery Up
 Health Regeneration','Attack Boost II/Defense Boost I/Poison Boost I','HuntingHorn',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1244,40.0,17.0,170,2,0,0,0,'None',0.0,22.0,'Cry in the Night',9.0,'None',0.0,6,16.0,0,' Stamina Recovery Up
 Attack Up
 Affinity Up','Attack Boost III/Affinity Boost II/Master Rider','HuntingHorn',7.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1245,40.0,15.0,160,2,0,0,0,'None',0.0,20.0,'Hidden Harmonic II',9.0,'None',0.0,6,16.0,0,' Stamina Recovery Up
 Attack Up
 Affinity Up','Attack Boost III/Affinity Boost I/Master Rider','HuntingHorn',5.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1246,40.0,10.0,140,2,0,0,0,'None',0.0,24.0,'Hidden Harmonic I',6.0,'None',0.0,5,24.0,0,' Stamina Recovery Up
 Attack Up
 Affinity Up','Attack Boost II/Affinity Boost I/Master Rider','HuntingHorn',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1247,0.0,6.0,180,1,0,0,15,'None',0.0,10.0,'Fortissimo',22.0,'None',0.0,5,20.0,0,' Sonic Wave
 Stamina Recovery Up
 Defense Up','Attack Boost III/Affinity Boost III/Silkbind Boost','HuntingHorn',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1248,-30.0,0.0,150,0,0,0,8,'None',0.0,9.0,'Sandpipe II',16.0,'None',0.0,3,16.0,0,' Defense Up
 Sonic Wave
 Stamina Use Reduced','Affinity Boost I/Defense Boost II/Brutal Strike','HuntingHorn',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1249,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Agitato S',15.0,'None',0.0,7,10.0,0,' Earplugs (S)
 Health Recovery (S)
 Sonic Wave','Any','HuntingHorn',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1250,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Iron Axe I',20.0,'Power Phial',0.0,1,11.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','SwitchAxe',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1251,0.0,10.0,200,2,1,0,0,'Blast',23.0,21.0,'Sinister Shadowslice',2.0,'Power Phial',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','SwitchAxe',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1252,0.0,0.0,140,0,0,0,0,'Blast',20.0,20.0,'Sinister Axe II',5.0,'Power Phial',0.0,3,40.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','SwitchAxe',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1253,0.0,0.0,130,0,0,0,0,'Blast',17.0,19.0,'Sinister Axe I',4.0,'Power Phial',0.0,3,37.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','SwitchAxe',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1254,0.0,7.0,180,2,1,0,0,'Ice',20.0,24.0,'Longear Weiss',7.0,'Element Phial',0.0,5,8.0,0,NULL,'Attack Boost II/Ice Boost II/Coating Switch Boost','SwitchAxe',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1255,0.0,2.0,160,2,1,0,0,'Ice',17.0,24.0,'Longear Axe III',7.0,'Element Phial',0.0,4,13.0,0,NULL,'Attack Boost II/Ice Boost II/Small Monster Exploit','SwitchAxe',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1256,0.0,0.0,130,0,0,0,0,'Ice',15.0,9.0,'Longear Axe II',11.0,'Element Phial',0.0,3,16.0,0,NULL,'Attack Boost I/Ice Boost II/Small Monster Exploit','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1257,0.0,0.0,90,0,0,0,0,'Ice',12.0,4.0,'Longear Axe I',14.0,'Element Phial',0.0,1,16.0,0,NULL,'Attack Boost I/Ice Boost I/Small Monster Exploit','SwitchAxe',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1258,0.0,10.0,200,1,1,0,0,'Thunder',32.0,19.0,'Despot''s Cloudburst',9.0,'Power Phial',0.0,6,15.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-aquatic Species','SwitchAxe',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1259,0.0,4.0,180,0,0,0,0,'Thunder',28.0,13.0,'Usurper''s Downpour II',10.0,'Power Phial',0.0,4,15.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-aquatic Species','SwitchAxe',0.0,38.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1260,0.0,0.0,110,0,0,0,0,'Thunder',25.0,12.0,'Usurper''s Downpour I',9.0,'Power Phial',0.0,3,16.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-aquatic Species','SwitchAxe',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1261,0.0,5.0,160,2,1,1,0,'Water',33.0,15.0,'Splish Splax',17.0,'Element Phial',0.0,5,11.0,0,NULL,'Attack Boost /Water Boost II/Waterblight Exploit','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1262,0.0,0.0,100,0,0,0,0,'Water',26.0,11.0,'Ludroth Axe II',19.0,'Element Phial',0.0,2,10.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','SwitchAxe',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1263,0.0,0.0,90,0,0,0,0,'Water',18.0,9.0,'Ludroth Axe I',16.0,'Element Phial',0.0,2,9.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','SwitchAxe',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1264,0.0,11.0,200,0,0,0,0,'Paralysis',16.0,14.0,'Vermilingua',21.0,'Element Phial',0.0,6,40.0,0,NULL,'Attack Boost IV/Defense Boost II/Dulling Strike','SwitchAxe',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1265,0.0,0.0,180,0,0,0,0,'Paralysis',13.0,15.0,'Binding Roller III',10.0,'Element Phial',0.0,5,35.0,0,NULL,'Attack Boost III/Defense Boost I/Dulling Strike','SwitchAxe',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1266,0.0,0.0,130,0,0,0,0,'Paralysis',11.0,10.0,'Binding Roller II',8.0,'Element Phial',0.0,3,37.0,0,NULL,'Attack Boost III/Defense Boost I/Dulling Strike','SwitchAxe',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1267,0.0,0.0,110,0,0,0,0,'Paralysis',10.0,6.0,'Binding Roller I',9.0,'Element Phial',0.0,2,33.0,0,NULL,'Attack Boost III/Defense Boost I/Dulling Strike','SwitchAxe',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1268,-20.0,2.0,220,2,1,0,0,'Fire',17.0,12.0,'Flammenbeil II',30.0,'Element Phial',0.0,6,30.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','SwitchAxe',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1269,-20.0,5.0,230,2,1,0,0,'Fire',20.0,12.0,'Gnashing Flammenbeil',30.0,'Element Phial',0.0,7,30.0,0,NULL,'Affinity Boost II/Fire Boost III/Brutal Strike','SwitchAxe',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1270,-20.0,3.0,160,0,0,0,0,'None',0.0,21.0,'Rex Slasher I',8.0,'Exhaust Phial
Exhaust 17',0.0,3,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','SwitchAxe',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1271,-20.0,6.0,210,0,0,0,0,'None',0.0,25.0,'Rex Slasher II',10.0,'Exhaust Phial
Exhaust 20',0.0,6,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','SwitchAxe',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1272,-20.0,9.0,220,0,0,0,0,'None',0.0,29.0,'Rex Gnasher',9.0,'Exhaust Phial
Exhaust 24',0.0,6,14.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','SwitchAxe',9.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1273,-15.0,0.0,220,1,0,0,15,'None',0.0,25.0,'Axe Semper Tyrannis I',38.0,'Exhaust Phial
Exhaust 12',0.0,6,10.0,0,NULL,'Affinity Boost I/Defense Boost I/Dulling Strike','SwitchAxe',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1274,10.0,0.0,180,0,0,0,0,'Thunder',16.0,20.0,'Undying Axe I',4.0,'Element Phial',0.0,5,11.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','SwitchAxe',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1275,-15.0,0.0,230,1,0,0,15,'None',0.0,28.0,'Axe Semper Tyrannis II',39.0,'Exhaust Phial
Exhaust 14',0.0,6,11.0,0,NULL,'Affinity Boost II/Defense Boost I/Dulling Strike','SwitchAxe',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1276,0.0,0.0,90,0,0,0,0,'Poison',27.0,13.0,'Venom Hatchet I',16.0,'Power Phial',0.0,2,14.0,0,NULL,'Attack Boost II/Poison Boost I/Dulling Strike','SwitchAxe',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1277,0.0,0.0,110,0,0,0,0,'Poison',34.0,15.0,'Venom Hatchet II',14.0,'Power Phial',0.0,3,14.0,0,NULL,'Attack Boost III/Poison Boost I/Dulling Strike','SwitchAxe',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1278,0.0,6.0,140,2,0,0,0,'Poison',40.0,16.0,'Mortal Serpent',15.0,'Power Phial',0.0,4,16.0,0,NULL,'Attack Boost IV/Poison Boost I/Coating Switch Boost','SwitchAxe',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1279,40.0,0.0,100,0,0,0,0,'None',0.0,24.0,'Hidden Axe I',16.0,'Poison Phial
Poison 12',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost I/Boost Equipped Coating','SwitchAxe',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1280,40.0,12.0,160,2,0,0,0,'None',0.0,24.0,'Hidden Axe II',16.0,'Poison Phial
Poison 15',0.0,5,10.0,0,NULL,'Attack Boost III/Affinity Boost I/Boost Equipped Coating','SwitchAxe',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1281,40.0,14.0,180,2,0,0,0,'None',0.0,25.0,'Night''s Crescent',16.0,'Poison Phial
Poison 17',0.0,6,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Boost Equipped Coating','SwitchAxe',9.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1282,-15.0,0.0,240,1,0,0,15,'None',0.0,32.0,'Grand Chaos',40.0,'Exhaust Phial
Exhaust 16',0.0,7,12.0,0,NULL,'Affinity Boost III/Defense Boost II/Dulling Strike','SwitchAxe',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1283,-20.0,0.0,210,2,1,0,0,'Fire',14.0,12.0,'Flammenbeil I',29.0,'Element Phial',0.0,5,33.0,0,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','SwitchAxe',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1284,15.0,0.0,210,3,0,0,0,'Thunder',20.0,25.0,'Undying Axe II',11.0,'Element Phial',0.0,6,11.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','SwitchAxe',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1285,0.0,25.0,200,0,0,0,0,'Dragon',11.0,11.0,'Azure Elder Axe II',4.0,'Power Phial',0.0,6,4.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','SwitchAxe',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1286,0.0,8.0,210,2,0,0,0,'Blast',36.0,10.0,'Teostra''s Castle',18.0,'Element Phial',0.0,7,18.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','SwitchAxe',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1287,15.0,0.0,220,3,0,0,0,'Thunder',22.0,22.0,'Undying Light',14.0,'Element Phial',0.0,7,14.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','SwitchAxe',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1288,0.0,7.0,190,1,0,0,0,'Ice',41.0,9.0,'Daora''s Janah',15.0,'Power Phial',0.0,7,17.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','SwitchAxe',2.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1289,0.0,18.0,190,2,1,0,0,'Poison',28.0,20.0,'Balor''s Mirage',8.0,'Power Phial',0.0,7,14.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','SwitchAxe',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1290,0.0,12.0,190,0,0,0,0,'Thunder',43.0,8.0,'Abyssal Storm Axe',3.0,'Element Phial',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','SwitchAxe',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1291,0.0,25.0,210,0,0,0,0,'Dragon',14.0,12.0,'Abyssal Gale Axe',5.0,'Power Phial',0.0,7,5.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','SwitchAxe',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1292,0.0,0.0,160,2,0,0,0,'Dragon',32.0,0.0,'Redwing Switch Axe I',0.0,'Element Phial',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','SwitchAxe',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1293,0.0,0.0,200,0,0,0,0,'None',0.0,13.0,'Rampage Slicer V',18.0,'Power Phial',0.0,6,12.0,0,NULL,'Any','SwitchAxe',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1294,0.0,7.0,190,0,0,0,0,'None',0.0,7.0,'Rampage Slicer IV',15.0,'Power Phial',0.0,6,10.0,0,NULL,'Any','SwitchAxe',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1295,0.0,3.0,180,0,0,0,0,'None',0.0,6.0,'Rampage Slicer III',15.0,'Power Phial',0.0,5,10.0,0,NULL,'Any','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1296,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage Slicer II',16.0,'Power Phial',0.0,5,14.0,0,NULL,'Any','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1297,0.0,0.0,150,0,0,0,0,'None',0.0,4.0,'Rampage Slicer I',15.0,'Power Phial',0.0,4,15.0,0,NULL,'Any','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1298,0.0,0.0,170,2,0,0,20,'Sleep',0.0,10.0,'Schale Batis',20.0,'Power Phial',0.0,5,15.0,0,NULL,'Defense Boost III/Sleep Boost II/Anti-Aquatic Species','SwitchAxe',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1299,0.0,0.0,120,0,0,0,15,'Sleep',15.0,5.0,'Sleepy Shellslice II',20.0,'Power Phial',0.0,3,10.0,0,NULL,'Defense Boost II/Sleep Boost I/Anti-Aquatic Species','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1300,0.0,0.0,90,0,0,0,15,'Sleep',14.0,0.0,'Sleepy Shellslice I',15.0,'Power Phial',0.0,2,10.0,0,NULL,'Defense Boost I/Sleep Boost I/Anti-Aquatic Species','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1301,0.0,5.0,190,2,2,0,0,'Dragon',24.0,30.0,'Hellish Edge',4.0,'Element Phial',0.0,5,37.0,0,NULL,'Attack Boost IV/Dragon Boost II/Dragon Exploit','SwitchAxe',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1302,0.0,0.0,140,0,0,0,0,'Dragon',20.0,15.0,'Infernal Axe II',5.0,'Element Phial',0.0,3,35.0,0,NULL,'Attack Boost II/Dragon Boost I/Dragon Exploit','SwitchAxe',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1303,0.0,6.0,180,0,0,0,0,'Thunder',35.0,10.0,'Thunderbolt Axe I',4.0,'Element Phial',0.0,6,4.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','SwitchAxe',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1304,-15.0,0.0,200,0,0,0,0,'Blast',13.0,14.0,'Rookslayer Axe I',13.0,'Power Phial',0.0,6,11.0,0,NULL,'Defense Boost I/Blast Boost II/Brutal Strike','SwitchAxe',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1305,-15.0,6.0,210,0,0,0,0,'Blast',15.0,15.0,'Rookslayer Axe II',22.0,'Power Phial',0.0,6,20.0,0,NULL,'Defense Boost I/Blast Boost II/Brutal Strike','SwitchAxe',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1306,-15.0,10.0,220,0,0,0,0,'Blast',17.0,15.0,'Bazelrush Rookslayer',20.0,'Power Phial',0.0,7,22.0,0,NULL,'Defense Boost II/Blast Boost II/Brutal Strike','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1307,0.0,10.0,180,0,0,0,0,'Ice',39.0,12.0,'Daora''s Farasa I',20.0,'Power Phial',0.0,6,25.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1308,0.0,5.0,190,2,0,0,0,'Blast',31.0,15.0,'Teostra''s Arx I',22.0,'Element Phial',0.0,6,25.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1309,0.0,23.0,180,0,0,0,0,'Dragon',9.0,9.0,'Azure Elder Axe I',4.0,'Power Phial',0.0,5,4.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','SwitchAxe',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1310,0.0,17.0,180,3,1,0,0,'Poison',24.0,22.0,'Waxglare Wand I',7.0,'Power Phial',0.0,6,19.0,0,NULL,'Attack Boost II/Defense Boost II/Chameleos Soul','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1311,0.0,4.0,160,2,1,0,0,'None',0.0,6.0,'Origami Axe II',20.0,'Dragon Phial
Dragon 13',0.0,4,25.0,0,NULL,'Attack Boost II/Affinity Boost II/Coating Switch Boost','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1312,0.0,4.0,170,2,1,0,0,'None',0.0,6.0,'Petal Cloud',21.0,'Dragon Phial
Dragon 17',0.0,5,29.0,0,NULL,'Attack Boost II/Affinity Boost IV/Coating Switch Boost','SwitchAxe',4.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1313,0.0,0.0,140,1,1,0,0,'Paralysis',23.0,19.0,'Grim Cat I',20.0,'Power Phial',0.0,4,10.0,0,NULL,'Attack Boost I/Affinity Boost I/Paralysis Boost I','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1314,0.0,0.0,170,1,1,0,0,'Paralysis',25.0,27.0,'Grim Cat II',20.0,'Power Phial',0.0,5,10.0,0,NULL,'Attack Boost I/Affinity Boost II/Paralysis Boost I','SwitchAxe',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1315,0.0,3.0,180,1,1,0,0,'Paralysis',27.0,27.0,'Grimmige Katze',20.0,'Power Phial',0.0,6,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Paralysis Boost I','SwitchAxe',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1316,0.0,0.0,100,0,0,0,0,'Dragon',18.0,10.0,'Infernal Axe I',7.0,'Element Phial',0.0,2,35.0,0,NULL,'Attack Boost II/Dragon Boost I/Dragon Exploit','SwitchAxe',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1317,0.0,3.0,150,0,0,0,0,'None',0.0,6.0,'Origami Axe I',16.0,'Dragon Phial
Dragon 13',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Coating Switch Boost','SwitchAxe',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1318,0.0,0.0,180,2,0,0,0,'Dragon',37.0,0.0,'Reddnaught Dunat',0.0,'Element Phial',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','SwitchAxe',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1319,0.0,0.0,200,0,0,0,0,'None',0.0,15.0,'Maximal Gasher',16.0,'Power Phial',0.0,5,19.0,0,NULL,'Attack Boost IV/Affinity Boost II/Dulling Strike','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1320,0.0,0.0,140,0,0,0,0,'None',0.0,3.0,'Power Gasher I',16.0,'Power Phial',0.0,3,24.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','SwitchAxe',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1321,0.0,0.0,110,0,0,0,0,'None',0.0,9.0,'Improved Steel Axe',16.0,'Paralysis Phial
Paralysis 14',0.0,2,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','SwitchAxe',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1322,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Proto Iron Axe II',14.0,'Paralysis Phial
Paralysis 12',0.0,1,16.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','SwitchAxe',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1323,0.0,0.0,70,0,0,0,0,'None',0.0,0.0,'Proto Iron Axe I',16.0,'Paralysis Phial
Paralysis 10',0.0,1,19.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','SwitchAxe',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1324,30.0,12.0,190,2,0,0,0,'Ice',29.0,24.0,'Amber Hoarfrost',15.0,'Element Phial',0.0,6,10.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','SwitchAxe',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1325,30.0,3.0,170,2,0,0,0,'Ice',26.0,16.0,'Amber Slash III',10.0,'Element Phial',0.0,5,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','SwitchAxe',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1326,25.0,4.0,120,0,0,0,0,'Ice',23.0,16.0,'Amber Slash II',11.0,'Element Phial',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1327,20.0,0.0,80,0,0,0,0,'Ice',19.0,15.0,'Amber Slash I',11.0,'Element Phial',0.0,2,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1328,0.0,0.0,180,2,0,0,0,'None',0.0,15.0,'Arzuros Revelax',10.0,'Poison Phial
Poison 29',0.0,4,25.0,0,NULL,'Attack Boost III/Defense Boost II/Small Monster Exploit','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1329,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Arzuros Axe II',11.0,'Poison Phial
Poison 23',0.0,2,19.0,0,NULL,'Attack Boost I/Defense Boost I/Small Monster Exploit','SwitchAxe',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1330,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Arzuros Axe I',14.0,'Poison Phial
Poison 23',0.0,1,20.0,0,NULL,'Attack Boost I/Defense Boost I/Small Monster Exploit','SwitchAxe',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1331,0.0,7.0,140,1,1,0,0,'Thunder',32.0,10.0,'Khezu Cleaver',16.0,'Elemental Phial',0.0,4,20.0,0,NULL,'Attack Boost IV/Thunder Boost II/Thunderblight Exploit','SwitchAxe',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1332,0.0,0.0,100,0,0,0,0,'Thunder',26.0,11.0,'Khezu Axe II',16.0,'Elemental Phial',0.0,2,20.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','SwitchAxe',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1333,0.0,0.0,80,0,0,0,0,'Thunder',23.0,8.0,'Khezu Axe I',13.0,'Elemental Phial',0.0,2,15.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','SwitchAxe',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1334,0.0,7.0,180,1,1,0,0,'Water',15.0,12.0,'Delex Cleaver',30.0,'Power Phial',0.0,5,6.0,0,NULL,'Attack Boost I/Water Boost II/Master Rider','SwitchAxe',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1335,0.0,0.0,150,0,0,0,0,'Water',11.0,12.0,'Delex Sail II',24.0,'Power Phial',0.0,3,6.0,0,NULL,'Attack Boost I/Water Boost II/Master Rider','SwitchAxe',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1336,0.0,0.0,100,0,0,0,0,'Water',11.0,7.0,'Delex Sail I',20.0,'Power Phial',0.0,2,6.0,0,NULL,'Attack Boost I/Water Boost II/Master Rider','SwitchAxe',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1337,0.0,8.0,200,3,0,0,0,'None',0.0,10.0,'Axe of Wisdom',35.0,'Dragon Phial
Dragon 25',0.0,6,6.0,0,NULL,'Attack Boost II/Boost Equipped Coating/Silkbind Boost','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1338,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Iron Axe II',15.0,'Power Phial',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','SwitchAxe',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1339,0.0,0.0,90,0,0,0,0,'None',0.0,6.0,'Kamura Iron Axe III',16.0,'Power Phial',0.0,2,14.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1340,0.0,4.0,140,0,0,0,0,'None',0.0,6.0,'Kamura Iron Axe IV',15.0,'Power Phial',0.0,3,12.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','SwitchAxe',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1341,0.0,7.0,150,2,0,0,0,'None',0.0,9.0,'Kamura Iron Axe V',17.0,'Power Phial',0.0,4,15.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1342,0.0,11.0,190,2,1,0,0,'None',0.0,14.0,'Kamura Ninja Axe',21.0,'Power Phial',0.0,5,9.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','SwitchAxe',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1343,10.0,0.0,110,0,0,0,0,'Water',19.0,14.0,'Fond Farewell I',13.0,'Power Phial',0.0,3,11.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','SwitchAxe',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1344,0.0,0.0,150,0,0,0,0,'None',0.0,11.0,'Elite Switch Axe I',15.0,'Paralysis Phial
Paralysis 17',0.0,3,19.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbing Boost','SwitchAxe',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1345,10.0,6.0,170,1,0,0,0,'Water',19.0,15.0,'Fond Farewell II',22.0,'Power Phial',0.0,5,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','SwitchAxe',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1346,0.0,0.0,120,0,0,0,0,'Fire',19.0,10.0,'Rath Flamesplitter I',23.0,'Power Phial',0.0,3,19.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','SwitchAxe',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1347,0.0,0.0,140,0,0,0,0,'Fire',22.0,11.0,'Rath Flamesplitter II',20.0,'Power Phial',0.0,3,20.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','SwitchAxe',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1348,0.0,2.0,190,1,1,0,0,'Fire',25.0,15.0,'Rath Flamesplitter III',28.0,'Power Phial',0.0,5,23.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','SwitchAxe',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1349,0.0,7.0,210,1,1,0,0,'Fire',30.0,22.0,'Rath Blaze Splitter',25.0,'Power Phial',0.0,6,25.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','SwitchAxe',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1350,0.0,0.0,120,0,0,0,0,'None',0.0,9.0,'Wheel Axe I',34.0,'Dragon Phial
Dragon 20',0.0,2,6.0,0,NULL,'Attack Boost I/Boost Equipped Coating/Silkbind Boost','SwitchAxe',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1351,0.0,6.0,180,3,0,0,0,'None',0.0,10.0,'Wheel Axe II',35.0,'Dragon Phial
Dragon 23',0.0,5,4.0,0,NULL,'Attack Boost II/Boost Equipped Coating/Silkbind Boost','SwitchAxe',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1352,15.0,15.0,180,1,0,0,0,'Water',29.0,15.0,'Parting Slice',20.0,'Power Phial',0.0,6,20.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','SwitchAxe',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1353,0.0,0.0,180,0,0,0,0,'None',0.0,10.0,'Power Gasher II',16.0,'Power Phial',0.0,4,14.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','SwitchAxe',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1354,0.0,4.0,160,1,0,0,0,'None',0.0,11.0,'Elite Switch Axe II',15.0,'Paralysis Phial
Paralysis 18',0.0,4,19.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbing Boost','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1355,-15.0,0.0,190,0,0,0,0,'Water',17.0,10.0,'Limus Os I',19.0,'Element Phial',0.0,5,24.0,0,NULL,'Affinity Boost I/Water Boost I/Brutal Strike','SwitchAxe',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1356,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Daidalos Axe',9.0,'Power Phial',0.0,2,24.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','SwitchAxe',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1357,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Bone Axe II',16.0,'Power Phial',0.0,1,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','SwitchAxe',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1358,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Bone Axe I',20.0,'Power Phial',0.0,1,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','SwitchAxe',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1359,0.0,4.0,170,1,1,0,0,'Sleep',22.0,14.0,'Dewdrop Dream',21.0,'Element Phial',0.0,5,24.0,0,NULL,'Affinity Boost III/Sleep Boost II/Buddy Rally','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1360,0.0,0.0,140,1,1,0,0,'Sleep',20.0,15.0,'Snowfall Axe III',16.0,'Element Phial',0.0,4,24.0,0,NULL,'Affinity Boost II/Sleep Boost II/Buddy Rally','SwitchAxe',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1361,0.0,0.0,90,0,0,0,0,'Sleep',16.0,10.0,'Snowfall Axe II',14.0,'Element Phial',0.0,2,24.0,0,NULL,'Affinity Boost II/Sleep Boost I/Buddy Rally','SwitchAxe',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1362,0.0,0.0,80,0,0,0,0,'Sleep',13.0,5.0,'Snowfall Axe I',10.0,'Element Phial',0.0,1,23.0,0,NULL,'Affinity Boost I/Sleep Boost I/Buddy Rally','SwitchAxe',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1363,-20.0,2.0,200,0,0,0,0,'None',0.0,25.0,'Blitzkrieg',10.0,'Paralysis Phial
Paralysis 15',0.0,5,14.0,0,NULL,'Affinity Boost II/Defense Boost II/Brutal Strike','SwitchAxe',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1364,-20.0,0.0,150,0,0,0,0,'None',0.0,10.0,'Assault Axe II',14.0,'Paralysis Phial
Paralysis 11',0.0,3,15.0,0,NULL,'Affinity Boost I/Defense Boost II/Brutal Strike','SwitchAxe',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1365,-20.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Assault Axe I',14.0,'Paralysis Phial
Paralysis 9',0.0,2,14.0,0,NULL,'Affinity Boost I/Defense Boost I/Brutal Strike','SwitchAxe',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1366,0.0,6.0,170,2,0,0,0,'Fire',26.0,15.0,'Daybreak Silvaris',11.0,'Power Phial',0.0,5,6.0,0,NULL,'Attack Boost II/Fire Boost II/Fireblight Exploit','SwitchAxe',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1367,0.0,5.0,160,2,0,0,0,'Fire',21.0,15.0,'Axenosom III',14.0,'Power Phial',0.0,4,9.0,0,NULL,'Attack Boost II/Fire Boost I/Fireblight Exploit','SwitchAxe',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1368,0.0,0.0,110,0,0,0,0,'Fire',18.0,9.0,'Axenosom II',14.0,'Power Phial',0.0,2,9.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','SwitchAxe',0.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1369,0.0,0.0,100,0,0,0,0,'Fire',13.0,6.0,'Axenosom I',15.0,'Power Phial',0.0,2,6.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1370,0.0,9.0,180,2,1,0,0,'Water',42.0,13.0,'Doom Bringer Axe',14.0,'Element Phial',0.0,6,14.0,0,NULL,'Attack Boost III/Water Boost II/Element Exploit','SwitchAxe',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1371,0.0,5.0,140,2,1,0,0,'Water',36.0,15.0,'Almudron Axe II',14.0,'Element Phial',0.0,4,14.0,0,NULL,'Attack Boost III/Water Boost I/Element Exploit','SwitchAxe',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1372,0.0,0.0,130,0,0,0,0,'Water',31.0,10.0,'Almudron Axe I',11.0,'Element Phial',0.0,3,11.0,0,NULL,'Attack Boost II/Water Boost I/Element Exploit','SwitchAxe',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1373,-15.0,0.0,210,0,0,0,0,'Water',21.0,16.0,'Limus Os II',24.0,'Element Phial',0.0,5,24.0,0,NULL,'Affinity Boost I/Water Boost II/Brutal Strike','SwitchAxe',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1374,-15.0,0.0,230,0,0,0,0,'Water',25.0,20.0,'Luto Ascia',24.0,'Element Phial',0.0,6,24.0,0,NULL,'Affinity Boost II/Water Boost II/Brutal Strike','SwitchAxe',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1375,0.0,0.0,170,0,0,0,0,'Poison',19.0,20.0,'Dragonmaiden Axe I',15.0,'Element Phial',0.0,5,14.0,0,NULL,'Attack Boost I/Poison Boost I/Small Monster Exploit','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1376,0.0,5.0,190,0,0,0,0,'Poison',22.0,26.0,'Dragonmaiden Axe II',15.0,'Element Phial',0.0,5,14.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','SwitchAxe',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1377,0.0,9.0,210,0,0,0,0,'Poison',25.0,16.0,'Grior''s Landmaker',10.0,'Elemental Phial',0.0,6,20.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','SwitchAxe',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1378,0.0,7.0,150,1,1,1,10,'None',0.0,9.0,'General''s Strongaxe I',19.0,'Exhaust Phial
Exhaust 25',0.0,4,19.0,0,NULL,'Affinity Boost I/Boost Equipped Coating/Silkbing Boost','SwitchAxe',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1379,0.0,6.0,200,1,0,0,0,'None',0.0,10.0,'Czar Switch Axe',20.0,'Paralysis Phial
Paralysis 22',0.0,5,24.0,0,NULL,'Attack Boost III/Defense Boost III/Silkbing Boost','SwitchAxe',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1380,0.0,9.0,170,1,1,1,10,'None',0.0,11.0,'General''s Strongaxe II',15.0,'Exhaust Phial
Exhaust 28',0.0,5,16.0,0,NULL,'Affinity Boost II/Boost Equipped Coating/Silkbing Boost','SwitchAxe',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1381,0.0,0.0,120,0,0,0,10,'Thunder',15.0,9.0,'The Shredder I',21.0,'Power Phial',0.0,3,9.0,0,NULL,'Attack Boost I/Thunder Boost I/Master Rider','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1382,0.0,0.0,140,0,0,0,10,'Thunder',18.0,11.0,'The Shredder II',16.0,'Power Phial',0.0,3,11.0,0,NULL,'Attack Boost I/Thunder Boost II/Master Rider','SwitchAxe',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1383,0.0,5.0,170,1,0,0,10,'Thunder',18.0,15.0,'The Power Shredder',19.0,'Power Phial',0.0,5,14.0,0,NULL,'Attack Boost II/Thunder Boost III/Master Rider','SwitchAxe',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1384,5.0,4.0,150,3,0,0,5,'Dragon',19.0,11.0,'Ash Drache I',19.0,'Power Phial',0.0,4,19.0,0,NULL,'Affinity Boost I/Defense Boost I/Dragon Boost I','SwitchAxe',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1385,5.0,9.0,170,3,0,0,5,'Dragon',21.0,11.0,'Ash Drache II',19.0,'Power Phial',0.0,5,14.0,0,NULL,'Affinity Boost I/Defense Boost I/Dragon Boost I','SwitchAxe',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1386,5.0,15.0,200,3,0,0,5,'Dragon',22.0,15.0,'Fall Drache',20.0,'Power Phial',0.0,6,14.0,0,NULL,'Affinity Boost III/Defense Boost II/Dragon Boost II','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1387,0.0,15.0,210,1,1,1,10,'None',0.0,15.0,'Conqueress',20.0,'Exhaust Phial
Exhaust 30',0.0,6,20.0,0,NULL,'Affinity Boost III/Boost Equipped Coating/Silkbing Boost','SwitchAxe',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1388,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Slicer S',15.0,'Power Phial',0.0,7,10.0,0,NULL,'Any','SwitchAxe',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1389,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura C. Blade I',20.0,'Impact Phial',0.0,1,10.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1390,0.0,30.0,180,0,0,0,0,'Dragon',6.0,10.0,'Azure Elder Blade I',5.0,'Impact Phial',0.0,5,5.0,0,NULL,'Dragon Boost III/Anti Aerial Species/Defense Boost I','ChargeBlade',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1391,0.0,0.0,230,0,0,0,0,'Thunder',14.0,20.0,'Undying Blade II',10.0,'Impact Phial',0.0,6,5.0,0,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','ChargeBlade',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1392,0.0,0.0,190,0,0,0,0,'Thunder',10.0,20.0,'Undying Blade I',5.0,'Impact Phial',0.0,5,11.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','ChargeBlade',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1393,0.0,9.0,200,2,1,0,0,'Blast',26.0,19.0,'Sinister Shade Axe',2.0,'Impact Phial',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','ChargeBlade',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1394,0.0,0.0,140,0,0,0,0,'Blast',23.0,20.0,'Sinister Slasher II',5.0,'Impact Phial',0.0,3,40.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','ChargeBlade',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1395,0.0,0.0,130,0,0,0,0,'Blast',20.0,17.0,'Sinister Slasher I',5.0,'Impact Phial',0.0,3,38.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1396,0.0,10.0,200,1,0,0,0,'Paralysis',19.0,15.0,'Rotaxion',15.0,'Impact Phial',0.0,6,25.0,0,NULL,'Attack Boost IV/Defense Boost II/Defense Grinder I','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1397,0.0,5.0,170,1,0,0,0,'Paralysis',17.0,15.0,'Rough Roller II',10.0,'Impact Phial',0.0,5,25.0,0,NULL,'Attack Boost III/Defense Boost II/Defense Grinder I','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1398,0.0,0.0,100,0,0,0,0,'Paralysis',15.0,10.0,'Rough Roller I',10.0,'Impact Phial',0.0,2,25.0,0,NULL,'Attack Boost III/Defense Boost I/Defense Grinder I','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1399,-30.0,5.0,230,0,0,0,10,'None',0.0,25.0,'Diablos Strongarm II',40.0,'Impact Phial',0.0,6,10.0,0,NULL,'Affinity Boost II/Defense Boost I/Dulling Strike','ChargeBlade',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1400,-30.0,2.0,220,0,0,0,10,'None',0.0,25.0,'Diablos Strongarm I',40.0,'Impact Phial',0.0,6,10.0,0,NULL,'Affinity Boost I/Defense Boost I/Dulling Strike','ChargeBlade',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1401,-20.0,0.0,210,0,0,0,0,'None',0.0,15.0,'Rugged Anchor',14.0,'Impact Phial',0.0,5,14.0,0,NULL,'Affinity Boost II/Defense Boost II/Brutal Strike','ChargeBlade',0.0,37.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1402,0.0,26.0,190,0,0,0,0,'Dragon',9.0,12.0,'Azure Elder Blade II',5.0,'Impact Phial',0.0,6,5.0,0,NULL,'Dragon Boost III/Anti Aerial Species/Ibushi Soul','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1403,-20.0,0.0,170,0,0,0,0,'None',0.0,5.0,'Barroth Anchor II',14.0,'Impact Phial',0.0,3,14.0,0,NULL,'Affinity Boost I/Defense Boost II/Brutal Strike','ChargeBlade',0.0,37.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1404,-5.0,0.0,200,2,1,1,0,'Dragon',36.0,13.0,'Dragonsong',7.0,'Element Phial',0.0,6,40.0,0,NULL,'Attack Boost III/Dragon Boost II/Element Exploit','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1405,-10.0,0.0,180,2,1,0,0,'Dragon',24.0,12.0,'Dragon Veil II',11.0,'Element Phial',0.0,5,38.0,0,NULL,'Attack Boost II/Dragon Boost I/Element Exploit','ChargeBlade',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1406,-10.0,0.0,170,2,0,0,0,'Dragon',12.0,10.0,'Dragon Veil I',15.0,'Element Phial',0.0,4,35.0,0,NULL,'Attack Boost I/Dragon Boost I/Element Exploit','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1407,-10.0,2.0,210,1,0,0,0,'Poison',14.0,15.0,'Infected Veil',15.0,'Impact Phial',0.0,5,40.0,0,NULL,'Affinity Boost II/Poison Boost II/Dulling Strike','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1408,-10.0,0.0,170,0,0,0,0,'Poison',11.0,10.0,'Poisonous Veil II',15.0,'Impact Phial',0.0,4,35.0,0,NULL,'Affinity Boost I/Poison Boost II/Dulling Strike','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1409,-10.0,0.0,110,0,0,0,0,'Poison',8.0,8.0,'Poisonous Veil I',7.0,'Impact Phial',0.0,2,25.0,0,NULL,'Affinity Boost I/Poison Boost I/Dulling Strike','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1410,0.0,0.0,180,2,1,0,0,'Sleep',18.0,20.0,'Illusory Frilled Wail',12.0,'Impact Phial',0.0,5,15.0,0,NULL,'Attack Boost III/Sleep Boost I/Dulling Strike','ChargeBlade',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1411,0.0,0.0,130,0,0,0,0,'Sleep',15.0,12.0,'Bellowing Blow II',12.0,'Impact Phial',0.0,3,15.0,0,NULL,'Attack Boost II/Sleep Boost I/Dulling Strike','ChargeBlade',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1412,0.0,0.0,90,0,0,0,0,'Sleep',12.0,8.0,'Bellowing Blow I',16.0,'Impact Phial',0.0,2,20.0,0,NULL,'Attack Boost I/Sleep Boost I/Dulling Strike','ChargeBlade',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1413,0.0,10.0,210,2,0,0,0,'Fire',27.0,10.0,'Bardichion Blade',10.0,'Impact Phial',0.0,6,10.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1414,0.0,5.0,190,1,0,0,0,'Fire',26.0,15.0,'Axelion Blade II',15.0,'Impact Phial',0.0,5,20.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','ChargeBlade',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1415,0.0,0.0,120,0,0,0,0,'Fire',24.0,10.0,'Axelion Blade I',25.0,'Impact Phial',0.0,3,5.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1416,-20.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Barroth Anchor I',14.0,'Impact Phial',0.0,2,11.0,0,NULL,'Affinity Boost I/Defense Boost I/Brutal Strike','ChargeBlade',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1417,-10.0,11.0,230,1,1,1,0,'Water',12.0,8.0,'Clutch of the Deep',30.0,'Element Phial',0.0,6,30.0,0,NULL,'Affinity Boost II/Water Boost II/Brutal Strike','ChargeBlade',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1418,0.0,7.0,180,0,0,0,0,'Thunder',34.0,10.0,'Thunderbolt Sawtooth I',4.0,'Element Phial',0.0,6,4.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','ChargeBlade',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1419,0.0,5.0,180,0,0,0,0,'Blast',38.0,17.0,'Teostra''s Striker I',4.0,'Impact Phial',0.0,6,32.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1420,0.0,5.0,210,0,0,0,0,'None',0.0,12.0,'Rampage C.Blade S',15.0,'Impact Phial',0.0,7,10.0,0,NULL,'Any','ChargeBlade',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1421,0.0,0.0,240,0,0,0,0,'Thunder',16.0,22.0,'Ikaji Immortal',14.0,'Impact Phial',0.0,7,10.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','ChargeBlade',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1422,0.0,10.0,190,3,0,0,0,'Poison',39.0,10.0,'Etherward',15.0,'Impact Phial',0.0,7,7.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1423,10.0,6.0,190,0,0,0,0,'Ice',36.0,5.0,'Daora''s Thwartoise',16.0,'Impact Phial',0.0,7,14.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','ChargeBlade',2.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1424,-30.0,8.0,240,3,0,0,20,'None',0.0,20.0,'Cera Strongarm',25.0,'Impact Phial',0.0,7,10.0,0,NULL,'Affinity Boost III/Defense Boost II/Defense Grinder II','ChargeBlade',0.0,2.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1425,0.0,12.0,190,0,0,0,0,'Thunder',38.0,8.0,'Abyssal Storm Ward',3.0,'Elemental Phial',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','ChargeBlade',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1426,0.0,20.0,200,0,0,0,0,'Dragon',17.0,15.0,'Abyssal Gale Ward',3.0,'Impact Phial',0.0,7,3.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','ChargeBlade',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1427,0.0,0.0,170,2,0,0,0,'Dragon',30.0,0.0,'Redwing Edge I',0.0,'Elemental Phial',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','ChargeBlade',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1428,0.0,5.0,200,0,0,0,0,'None',0.0,10.0,'Rampage C. Blade V',15.0,'Impact Phial',0.0,6,10.0,0,NULL,'Any','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1429,0.0,8.0,190,0,0,0,0,'None',0.0,7.0,'Rampage C. Blade IV',16.0,'Impact Phial',0.0,6,11.0,0,NULL,'Any','ChargeBlade',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1430,0.0,5.0,180,0,0,0,0,'None',0.0,8.0,'Rampage C. Blade III',16.0,'Impact Phial',0.0,5,11.0,0,NULL,'Any','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1431,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage C. Blade II',16.0,'Impact Phial',0.0,5,14.0,0,NULL,'Any','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1432,10.0,10.0,180,0,0,0,0,'Ice',30.0,20.0,'Daora''s Casca I',10.0,'Impact Phial',0.0,6,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1433,0.0,0.0,150,0,0,0,0,'None',0.0,6.0,'Rampage C. Blade I',17.0,'Impact Phial',0.0,4,16.0,0,NULL,'Any','ChargeBlade',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1434,0.0,0.0,140,0,0,0,0,'Water',22.0,11.0,'Vaik Veil II',21.0,'Element Phial',0.0,3,11.0,0,NULL,'Defense Boost II/Water Boost II/Dulling Strike','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1435,0.0,0.0,100,0,0,0,0,'Water',17.0,7.0,'Vaik Veil I',20.0,'Element Phial',0.0,2,14.0,0,NULL,'Defense Boost I/Water Boost II/Dulling Strike','ChargeBlade',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1436,15.0,15.0,180,1,0,0,0,'Dragon',22.0,20.0,'Maxilla Edge',35.0,'Impact Phial',0.0,5,6.0,0,NULL,'Attack Boost III/Dragon Boost III/Dragon Exploit','ChargeBlade',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1437,10.0,2.0,130,0,0,0,0,'Dragon',17.0,16.0,'Mandible Blade II',25.0,'Impact Phial',0.0,3,6.0,0,NULL,'Attack Boost II/Dragon Boost II/Dragon Exploit','ChargeBlade',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1438,10.0,0.0,120,0,0,0,0,'Dragon',14.0,15.0,'Mandible Blade I',20.0,'Impact Phial',0.0,3,10.0,0,NULL,'Attack Boost I/Dragon Boost II/Dragon Exploit','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1439,0.0,5.0,140,1,1,1,0,'Paralysis',28.0,10.0,'Felyne Fancy',25.0,'Impact Phial',0.0,4,20.0,0,NULL,'Attack Boost II/Affinity Boost III/Paralysis Boost I','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1440,0.0,0.0,130,0,0,0,0,'Paralysis',24.0,8.0,'Cuddly Cat II',25.0,'Impact Phial',0.0,3,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Paralysis Boost I','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1441,0.0,0.0,80,0,0,0,0,'Paralysis',20.0,2.0,'Cuddly Cat I',25.0,'Impact Phial',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost I/Paralysis Boost I','ChargeBlade',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1442,0.0,0.0,210,3,0,0,20,'None',0.0,8.0,'Pounder of Rice',12.0,'Impact Phial',0.0,5,38.0,0,NULL,'Attack Boost II/Defense Boost III/Defense Grinder II','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1443,0.0,0.0,200,2,0,0,15,'None',0.0,2.0,'Ricebane II',15.0,'Impact Phial',0.0,4,38.0,0,NULL,'Attack Boost I/Defense Boost II/Defense Grinder II','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1444,0.0,0.0,160,0,0,0,15,'None',0.0,0.0,'Ricebane I',15.0,'Impact Phial',0.0,3,27.0,0,NULL,'Attack Boost I/Defense Boost I/Defense Grinder I','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1445,0.0,10.0,180,3,0,0,0,'Poison',33.0,15.0,'Arcane Draw I',16.0,'Impact Phial',0.0,6,8.0,0,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','ChargeBlade',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1446,0.0,5.0,150,3,1,0,0,'Water',27.0,12.0,'Shieldraad',25.0,'Element Phial',0.0,4,14.0,0,NULL,'Defense Boost II/Water Boost III/Dulling Strike','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1447,0.0,0.0,180,2,0,0,0,'Dragon',35.0,0.0,'Skaltecore',0.0,'Elemental Phial',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','ChargeBlade',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1448,-10.0,5.0,190,1,1,1,0,'Water',11.0,10.0,'Jyura Silt II',25.0,'Element Phial',0.0,6,25.0,0,NULL,'Affinity Boost I/Water Boost II/Brutal Strike','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1449,0.0,0.0,200,0,0,0,0,'None',0.0,15.0,'Bonesilt Veil',15.0,'Impact Phial',0.0,5,20.0,0,NULL,'Attack Boost IV/Affinity Boost II/Dulling Strike','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1450,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Hyperguard I',16.0,'Impact Phial',0.0,1,20.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1451,-20.0,7.0,230,2,0,0,0,'Ice',13.0,10.0,'Stunning Axe',9.0,'Impact Phial',0.0,6,21.0,0,NULL,'Affinity Boost I/Ice Boost III/Brutal Strike','ChargeBlade',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1452,-20.0,5.0,190,2,0,0,0,'Ice',11.0,10.0,'Surprise Axe II',9.0,'Impact Phial',0.0,5,21.0,0,NULL,'Affinity Boost I/Ice Boost II/Brutal Strike','ChargeBlade',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1453,-20.0,0.0,160,0,0,0,0,'Ice',9.0,10.0,'Surprise Axe I',7.0,'Impact Phial',0.0,3,21.0,0,NULL,'Affinity Boost I/Ice Boost I/Brutal Strike','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1454,0.0,6.0,200,1,0,0,20,'Poison',29.0,19.0,'Titan''s Vise',33.0,'Impact Phial',0.0,6,2.0,0,NULL,'Defense Boost II/Poison Boost III/Silkbind Boost','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1455,0.0,4.0,140,1,0,0,20,'Poison',25.0,21.0,'Giga Grips III',33.0,'Impact Phial',0.0,5,2.0,0,NULL,'Defense Boost II/Poison Boost II/Silkbind Boost','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1456,0.0,0.0,140,0,0,0,15,'Poison',23.0,13.0,'Giga Grips II',33.0,'Impact Phial',0.0,3,5.0,0,NULL,'Defense Boost I/Poison Boost II/Dulling Strike','ChargeBlade',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1457,0.0,0.0,100,0,0,0,15,'Poison',22.0,8.0,'Giga Grips I',35.0,'Impact Phial',0.0,2,8.0,0,NULL,'Defense Boost I/Poison Boost I/Dulling Strike','ChargeBlade',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1458,0.0,0.0,210,1,1,0,20,'Water',18.0,32.0,'Spinning Takedown',20.0,'Impact Phial',0.0,5,8.0,0,NULL,'Defense Boost I/Water Boost III/Dulling Strike','ChargeBlade',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1459,0.0,0.0,170,1,1,0,10,'Water',15.0,12.0,'Shovedown Blade II',20.0,'Impact Phial',0.0,4,8.0,0,NULL,'Defense Boost I/Water Boost II/Dulling Strike','ChargeBlade',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1460,0.0,0.0,100,0,0,0,10,'Water',13.0,7.0,'Shovedown Blade I',20.0,'Impact Phial',0.0,2,8.0,0,NULL,'Defense Boost I/Water Boost I/Dulling Strike','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1461,0.0,10.0,210,2,0,0,0,'Thunder',26.0,25.0,'Despot''s Thundergale',10.0,'Element Phial',0.0,6,15.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','ChargeBlade',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1462,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Hyperguard II',13.0,'Impact Phial',0.0,1,16.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','ChargeBlade',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1463,0.0,8.0,190,0,0,0,0,'Thunder',23.0,20.0,'Usurper''s Lightning II',10.0,'Element Phial',0.0,5,15.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','ChargeBlade',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1464,25.0,15.0,170,1,1,1,0,'Ice',26.0,20.0,'Paladire Charge Blade',15.0,'Element Phial',0.0,5,10.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1465,25.0,10.0,130,1,1,0,0,'Ice',22.0,20.0,'Weissritter III',10.0,'Element Phial',0.0,4,10.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','ChargeBlade',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1466,20.0,2.0,110,0,0,0,0,'Ice',19.0,15.0,'Weissritter II',10.0,'Element Phial',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','ChargeBlade',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1467,20.0,0.0,90,0,0,0,0,'Ice',17.0,15.0,'Weissritter I',15.0,'Element Phial',0.0,2,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1468,0.0,5.0,170,1,1,0,0,'Fire',30.0,30.0,'Dear Lutemia',25.0,'Element Phial',0.0,5,2.0,0,NULL,'Attack Boost II/Fire Boost II/Small Monster Exploit','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1469,0.0,2.0,150,1,0,0,0,'Fire',26.0,25.0,'Dear Lutemis II',25.0,'Element Phial',0.0,4,5.0,0,NULL,'Attack Boost II/Fire Boost I/Small Monster Exploit','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1470,0.0,0.0,100,0,0,0,0,'Fire',22.0,10.0,'Dear Lutemis I',20.0,'Element Phial',0.0,2,5.0,0,NULL,'Attack Boost I/Fire Boost I/Small Monster Exploit','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1471,0.0,10.0,150,2,1,0,0,'None',0.0,15.0,'Kamura Ninja C. Blade',20.0,'Impact Phial',0.0,5,10.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1472,0.0,5.0,150,2,0,0,0,'None',0.0,10.0,'Kamura C. Blade V',20.0,'Impact Phial',0.0,4,15.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1473,0.0,5.0,140,0,0,0,0,'None',0.0,5.0,'Kamura C. Blade IV',15.0,'Impact Phial',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1474,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Kamura C. Blade III',15.0,'Impact Phial',0.0,2,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1475,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura C. Blade II',15.0,'Impact Phial',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1476,0.0,0.0,120,0,0,0,0,'Thunder',20.0,10.0,'Usurper''s Lightning I',10.0,'Element Phial',0.0,3,15.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','ChargeBlade',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1477,-10.0,5.0,190,1,1,1,0,'Water',10.0,10.0,'Jyura Silt I',20.0,'Element Phial',0.0,5,20.0,0,NULL,'Affinity Boost I/Water Boost I/Brutal Strike','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1478,0.0,0.0,120,0,0,0,0,'None',0.0,7.0,'Regas Hyper',18.0,'Impact Phial',0.0,2,18.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1479,0.0,5.0,170,0,0,0,0,'None',0.0,12.0,'Elite Blade II',20.0,'Impact Phial',0.0,4,21.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1480,0.0,0.0,180,0,0,0,0,'None',0.0,10.0,'Bone Blade II',15.0,'Impact Phial',0.0,4,20.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1481,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Bone Blade I Charge Blade',20.0,'Impact Phial',0.0,3,15.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1482,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Hard Bone Strongarm',10.0,'Impact Phial',0.0,2,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1483,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Sgrongarm II',15.0,'Impact Phial',0.0,1,20.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1484,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Sgrongarm I',20.0,'Impact Phial',0.0,1,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1485,40.0,21.0,190,2,0,0,0,'None',0.0,21.0,'Scream in the Night',11.0,'Impact Phial',0.0,6,16.0,0,NULL,'Attack Boost III/Affinity Boost II/Defense Grinder II','ChargeBlade',5.0,26.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1486,35.0,10.0,180,2,0,0,0,'None',0.0,26.0,'Hidden Arsenal II',16.0,'Impact Phial',0.0,5,16.0,0,NULL,'Attack Boost III/Affinity Boost I/Defense Grinder I','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1487,30.0,0.0,120,0,0,0,0,'None',0.0,30.0,'Hidden Arsenal I',15.0,'Impact Phial',0.0,3,12.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Grinder I','ChargeBlade',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1488,15.0,11.0,140,2,1,0,0,'None',0.0,11.0,'Gale Sickle',11.0,'Impact Phial',0.0,4,25.0,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1489,15.0,0.0,90,0,0,0,0,'None',0.0,12.0,'Wind Thief Sickle II',9.0,'Impact Phial',0.0,2,15.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','ChargeBlade',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1490,10.0,0.0,70,0,0,0,0,'None',0.0,9.0,'Wind Thief Sickle I',9.0,'Impact Phial',0.0,1,15.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1491,15.0,9.0,180,1,1,0,0,'Thunder',20.0,7.0,'Kadachi Otenta',18.0,'Impact Phial',0.0,5,28.0,0,NULL,'Attack Boost II/Affinity Boost III/Thunder Boost III','ChargeBlade',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1492,0.0,0.0,140,0,0,0,0,'None',0.0,11.0,'Elite Blade I',15.0,'Impact Phial',0.0,3,21.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','ChargeBlade',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1493,15.0,0.0,140,0,0,0,0,'Thunder',18.0,13.0,'Kadachi Slasher II',10.0,'Impact Phial',0.0,3,25.0,0,NULL,'Attack Boost I/Affinity Boost II/Thunder Boost II','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1494,15.0,8.0,170,1,0,0,0,'Water',24.0,11.0,'Mizuniya Drill II',20.0,'Impact Phial',0.0,5,25.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','ChargeBlade',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1495,10.0,0.0,110,0,0,0,0,'Water',21.0,15.0,'Mizuniya Drill I',10.0,'Impact Phial',0.0,3,27.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','ChargeBlade',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1496,-15.0,12.0,220,1,0,0,0,'None',0.0,31.0,'Tigrex Blade',10.0,'Impact Phial',0.0,6,12.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','ChargeBlade',5.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1497,-15.0,8.0,160,1,0,0,0,'None',0.0,25.0,'Tigrex Divide II',10.0,'Impact Phial',0.0,6,12.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','ChargeBlade',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1498,-20.0,2.0,160,0,0,0,0,'None',0.0,24.0,'Tigrex Divide I',7.0,'Impact Phial',0.0,3,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','ChargeBlade',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1499,30.0,10.0,170,3,1,1,0,'Fire',34.0,10.0,'Araknablade',10.0,'Elemental Phial',0.0,7,10.0,0,NULL,'Attack Boost IV/Fire Boost II/Silkbind Boost','ChargeBlade',10.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1500,25.0,8.0,160,3,1,1,0,'Fire',31.0,8.0,'Biting Edge II',12.0,'Elemental Phial',0.0,6,47.0,0,NULL,'Attack Boost III/Fire Boost II/Silkbind Boost','ChargeBlade',2.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1501,25.0,10.0,150,3,1,1,0,'Fire',29.0,8.0,'Biting Edge I',10.0,'Elemental Phial',0.0,6,47.0,0,NULL,'Attack Boost III/Fire Boost I/Silkbind Boost','ChargeBlade',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1502,20.0,8.0,170,3,0,0,0,'Thunder',37.0,14.0,'Die Walküre',17.0,'Elemental Phial',0.0,6,23.0,0,NULL,'Attack Boost III/Thunder Boost I/Thunderblight Exploit','ChargeBlade',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1503,20.0,7.0,160,3,0,0,0,'Thunder',33.0,13.0,'K. Captain''s Blade II',15.0,'Elemental Phial',0.0,5,23.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','ChargeBlade',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1504,15.0,2.0,150,0,0,0,0,'Thunder',29.0,12.0,'K. Captain''s Blade I',15.0,'Elemental Phial',0.0,4,25.0,0,NULL,'Attack Boost I/Thunder Boost I/Thunderblight Exploit','ChargeBlade',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1505,0.0,8.0,190,0,0,0,0,'None',0.0,12.0,'Kaiser Blade',20.0,'Impact Phial',0.0,5,21.0,0,NULL,'Attack Boost III/Defense Boost III/Silkbind Boost','ChargeBlade',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1506,10.0,0.0,100,0,0,0,0,'Thunder',15.0,10.0,'Kadachi Slasher I',8.0,'Impact Phial',0.0,2,30.0,0,NULL,'Attack Boost I/Affinity Boost I/Thunder Boost II','ChargeBlade',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1507,0.0,6.0,190,0,0,0,0,'Blast',43.0,15.0,'Teostra''s Nova',5.0,'Impact Phial',0.0,7,35.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','ChargeBlade',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1508,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Glaive I',20.0,'1',0.0,1,10.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','InsectGlaive',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1509,0.0,9.0,170,1,1,1,0,'Paralysis',20.0,9.0,'Rielle Unu Green',9.0,'7',0.0,6,38.0,0,NULL,'Attack Boost III/Paralysis Boost I/SilkBind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1510,0.0,5.0,130,1,1,1,0,'Paralysis',18.0,13.0,'Rielle Nulo Green II',9.0,'6',0.0,5,35.0,0,NULL,'Attack Boost II/Paralysis Boost I/SilkBind Boost','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1511,0.0,0.0,100,0,0,0,0,'Paralysis',15.0,12.0,'Rielle Nulo Green I',5.0,'4',0.0,2,28.0,0,NULL,'Attack Boost II/Paralysis Boost I/SilkBind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1512,0.0,9.0,170,3,1,0,0,'Ice',18.0,9.0,'Rielle Unu White',9.0,'8',0.0,6,38.0,0,NULL,'Attack Boost IV/Ice Boost III/Silkbind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1513,0.0,7.0,160,3,1,0,0,'Ice',16.0,4.0,'Rielle Nulo White II',5.0,'6',0.0,5,35.0,0,NULL,'Attack Boost III/Ice Boost II/Silkbind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1514,0.0,0.0,120,0,0,0,0,'Ice',12.0,20.0,'Rielle Nulo White I',5.0,'4',0.0,3,28.0,0,NULL,'Attack Boost III/Ice Boost II/Silkbind Boost','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1515,0.0,9.0,180,3,1,0,0,'Dragon',20.0,9.0,'Rielle Nerissimo',9.0,'8',0.0,6,38.0,0,NULL,'Attack Boost IV/Dragon Boost III/Silkbind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1516,0.0,7.0,160,3,1,0,0,'Dragon',17.0,14.0,'Rielle Nulo Black II',9.0,'6',0.0,5,35.0,0,NULL,'Attack Boost III/Dragon Boost II/Silkbind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1517,0.0,5.0,140,3,1,0,0,'Dragon',15.0,14.0,'Rielle Nulo Black I',9.0,'5',0.0,4,35.0,0,NULL,'Attack Boost III/Dragon Boost II/Silkbind Boost','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1518,0.0,10.0,180,3,1,0,0,'Fire',20.0,10.0,'Rielle Vermiglio',9.0,'8',0.0,6,38.0,0,NULL,'Attack Boost IV/Fire Boost III/Silkbind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1519,0.0,7.0,160,3,1,0,0,'Fire',16.0,14.0,'Rielle Nulo Red II',9.0,'6',0.0,5,35.0,0,NULL,'Attack Boost III/Fire Boost II/Silkbind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1520,0.0,5.0,150,3,1,0,0,'Fire',14.0,14.0,'Rielle Nulo Red I',9.0,'5',0.0,4,35.0,0,NULL,'Attack Boost III/Fire Boost II/Silkbind Boost','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1521,0.0,0.0,140,0,0,0,0,'None',0.0,20.0,'Rielle Unu',5.0,'4',0.0,3,28.0,0,NULL,'Attack Boost III/Affinity Boost II/Silkbind Boost','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1522,0.0,0.0,130,0,0,0,0,'Blast',13.0,19.0,'Sinister Staff I',5.0,'3',0.0,3,38.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','InsectGlaive',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1523,0.0,0.0,100,0,0,0,0,'None',0.0,13.0,'Rielle Nulo II',5.0,'4',0.0,2,35.0,0,NULL,'Attack Boost II/Affinity Boost I/Silkbind Boost','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1524,0.0,11.0,160,2,1,1,0,'None',0.0,9.0,'Hortadent Brada',19.0,'5',0.0,4,14.0,0,NULL,'Attack Boost IV/Kinsect Level Boost/Small Monster Exploit','InsectGlaive',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1525,0.0,0.0,100,0,0,0,0,'None',0.0,7.0,'Hortadent II',14.0,'4',0.0,2,14.0,0,NULL,'Attack Boost III/Kinsect Level Boost/Small Monster Exploit','InsectGlaive',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1526,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Hortadent I',19.0,'3',0.0,1,16.0,0,NULL,'Attack Boost II/Kinsect Level Boost/Small Monster Exploit','InsectGlaive',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1527,0.0,7.0,200,1,1,0,0,'Thunder',25.0,24.0,'Despot''s Twinbolt',9.0,'8',0.0,6,16.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','InsectGlaive',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1528,0.0,5.0,190,1,1,0,0,'Thunder',23.0,23.0,'Royal Bolt Scepter II',9.0,'8',0.0,5,16.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','InsectGlaive',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1529,0.0,0.0,120,0,0,0,0,'Thunder',20.0,12.0,'Royal Bolt Scepter I',9.0,'3',0.0,3,16.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','InsectGlaive',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1530,0.0,6.0,160,2,1,1,0,'Water',33.0,20.0,'Bloom Royale',5.0,'5',0.0,5,20.0,0,NULL,'Attack Boost III/Water Boost II/ Waterblight Exploit','InsectGlaive',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1531,0.0,0.0,130,0,0,0,0,'Water',25.0,11.0,'Royal Bloom II',16.0,'3',0.0,3,14.0,0,NULL,'Attack Boost II/Water Boost I/ Waterblight Exploit','InsectGlaive',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1532,0.0,0.0,80,0,0,0,0,'Water',20.0,8.0,'Royal Bloom I',14.0,'2',0.0,2,11.0,0,NULL,'Attack Boost II/Water Boost I/ Waterblight Exploit','InsectGlaive',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1533,15.0,9.0,190,1,1,1,0,'Ice',25.0,24.0,'Fenrir Storm',17.0,'6',0.0,6,11.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1534,15.0,8.0,160,1,1,1,0,'Ice',22.0,25.0,'Amber Piton II',9.0,'5',0.0,5,11.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','InsectGlaive',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1535,15.0,0.0,90,0,0,0,0,'Ice',16.0,16.0,'Amber Piton I',12.0,'2',0.0,2,11.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1536,0.0,0.0,170,2,1,0,0,'Poison',30.0,14.0,'Datura Pike',19.0,'5',0.0,5,21.0,0,NULL,'Attack Boost III/Dulling Strike/Poison Boost II','InsectGlaive',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1537,0.0,0.0,80,0,0,0,0,'None',0.0,12.0,'Rielle Nulo I',5.0,'3',0.0,2,28.0,0,NULL,'Attack Boost II/Affinity Boost I/Silkbind Boost','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1538,0.0,0.0,140,0,0,0,0,'Blast',15.0,21.0,'Sinister Staff II',5.0,'3',0.0,3,40.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1539,0.0,9.0,200,2,1,0,0,'Blast',20.0,20.0,'Sinister Shadowstaff',2.0,'7',0.0,6,45.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1540,-20.0,0.0,180,0,0,0,0,'Thunder',18.0,18.0,'Metal Mauler I',10.0,'4',0.0,5,14.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','InsectGlaive',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1541,-10.0,5.0,230,0,0,0,0,'None',0.0,8.0,'Tyrant Rod',5.0,'6',0.0,7,35.0,0,NULL,'Attack Boost III/Defense Boost II/Kinsect Level Boost','InsectGlaive',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1542,-20.0,3.0,220,3,0,0,0,'Thunder',22.0,20.0,'Metalmangler',8.0,'6',0.0,7,20.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','InsectGlaive',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1543,0.0,5.0,190,2,1,1,0,'Poison',38.0,20.0,'Hazy Caster',25.0,'6',0.0,7,5.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','InsectGlaive',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1544,0.0,8.0,180,1,0,0,0,'Ice',36.0,10.0,'Daora''s Tethidine',20.0,'7',0.0,7,10.0,0,NULL,'Attack Boost III/Ice Boost II/Kushala Daora Soul','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1545,0.0,12.0,180,0,0,0,0,'Thunder',38.0,8.0,'Abyssal Storm Glaive',3.0,'8',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','InsectGlaive',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1546,0.0,25.0,210,0,0,0,0,'Dragon',14.0,12.0,'Abyssal Gale Glaive',5.0,'6',0.0,7,5.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1547,0.0,0.0,160,2,0,0,0,'Dragon',35.0,0.0,'Redwing Glaive',0.0,'5',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','InsectGlaive',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1548,15.0,10.0,190,2,1,0,0,'Water',20.0,12.0,'Curved Naganagi',14.0,'7',0.0,6,20.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','InsectGlaive',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1549,0.0,7.0,200,0,0,0,0,'None',0.0,10.0,'Rampage Glaive V',17.0,'3 ',0.0,6,12.0,0,NULL,'Any','InsectGlaive',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1550,0.0,8.0,190,0,0,0,0,'None',0.0,7.0,'Rampage Glaive IV',16.0,'3',0.0,6,11.0,0,NULL,'Any','InsectGlaive',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1551,0.0,5.0,180,0,0,0,0,'None',0.0,8.0,'Rampage Glaive III',16.0,'3',0.0,5,11.0,0,NULL,'Any','InsectGlaive',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1552,0.0,0.0,170,0,0,0,0,'None',0.0,10.0,'Rampage Glaive II',16.0,'3',0.0,5,14.0,0,NULL,'Any','InsectGlaive',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1553,0.0,0.0,150,0,0,0,0,'None',0.0,22.0,'Rampage Glaive I',16.0,'3',0.0,4,16.0,0,NULL,'Any','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1554,-10.0,5.0,220,3,0,0,0,'Water',10.0,14.0,'Watercolor Glaive',14.0,'6',0.0,6,9.0,0,NULL,'Water Boost IV/Dulling Strike/Master Rider','InsectGlaive',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1555,-10.0,0.0,210,3,0,0,0,'Water',9.0,9.0,'Brush Glaive II',19.0,'5',0.0,6,14.0,0,NULL,'Water Boost III/Dulling Strike/Master Rider','InsectGlaive',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1556,-10.0,0.0,200,3,0,0,0,'Water',8.0,8.0,'Brush Glaive I',16.0,'4',0.0,5,14.0,0,NULL,'Water Boost II/Dulling Strike/Master Rider','InsectGlaive',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1557,0.0,4.0,190,1,1,1,5,'Blast',33.0,17.0,'Magia Crescent',15.0,'8',0.0,6,30.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1558,0.0,2.0,150,1,1,1,5,'Blast',29.0,13.0,'Magia Pitareen III',12.0,'5',0.0,5,28.0,0,NULL,'Attack Boost IV/Defense Boost II/Silkbind Boost','InsectGlaive',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1559,0.0,0.0,100,0,0,0,5,'Blast',25.0,2.0,'Magia Pitareen II',9.0,'4',0.0,3,28.0,0,NULL,'Attack Boost III/Defense Boost I/Silkbind Boost','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1560,0.0,0.0,70,0,0,0,5,'Blast',20.0,0.0,'Magia Pitareen I',8.0,'3',0.0,2,27.0,0,NULL,'Attack Boost II/Defense Boost I/Silkbind Boost','InsectGlaive',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1561,0.0,0.0,210,2,2,0,20,'Dragon',24.0,23.0,'Garamorse',24.0,'7',0.0,5,21.0,0,NULL,'Attack Boost III/Dragon Boost II/Dragon Exploit','InsectGlaive',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1562,0.0,0.0,160,2,2,0,15,'Dragon',20.0,16.0,'Deathport Staff II',24.0,'5',0.0,4,21.0,0,NULL,'Attack Boost II/Dragon Boost II/Dragon Exploit','InsectGlaive',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1563,0.0,0.0,100,0,0,0,15,'Dragon',16.0,7.0,'Deathport Staff I',16.0,'4',0.0,2,14.0,0,NULL,'Attack Boost II/Dragon Boost I/Dragon Exploit','InsectGlaive',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1564,0.0,4.0,180,2,1,1,0,'Poison',35.0,25.0,'Caster''s Rod I',31.0,'6',0.0,6,15.0,0,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','InsectGlaive',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1565,0.0,7.0,170,1,0,0,0,'Ice',34.0,15.0,'Daora''s Entom I',25.0,'6',0.0,6,12.0,0,NULL,'Attack Boost II/Ice Boost I/Kushala Daora Soul','InsectGlaive',0.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1566,0.0,6.0,170,0,0,0,0,'Thunder',36.0,9.0,'Thunderbolt Glaive I',5.0,'7',0.0,6,5.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','InsectGlaive',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1567,0.0,25.0,200,0,0,0,0,'Dragon',12.0,12.0,'Azure Elder Glaive II',5.0,'5',0.0,6,5.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','InsectGlaive',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1568,0.0,25.0,180,0,0,0,0,'Dragon',10.0,10.0,'Azure Elder Glaive I',5.0,'4',0.0,5,5.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','InsectGlaive',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1569,-20.0,2.0,200,3,0,0,0,'Thunder',20.0,22.0,'Metal Mauler II',7.0,'5',0.0,6,14.0,0,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','InsectGlaive',0.0,35.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1570,0.0,0.0,150,2,1,0,0,'Poison',27.0,9.0,'Pukei Rod II',19.0,'4',0.0,4,26.0,0,NULL,'Attack Boost III/Dulling Strike/Poison Boost I','InsectGlaive',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1571,0.0,0.0,170,2,0,0,0,'Dragon',38.0,0.0,'Reddnaught Shuma',0.0,'5',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','InsectGlaive',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1572,0.0,0.0,100,0,0,0,0,'Poison',24.0,5.0,'Pukei Rod I',16.0,'3',0.0,2,26.0,0,NULL,'Attack Boost II/Dulling Strike/Poison Boost I','InsectGlaive',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1573,-20.0,5.0,210,2,0,0,0,'Ice',12.0,10.0,'Gossglaive II',9.0,'4',0.0,6,21.0,0,NULL,'Affinity Boost I/Ice Boost II/Brutal Strike','InsectGlaive',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1574,0.0,7.0,190,1,0,0,0,'Fire',30.0,25.0,'Firedance Rathmaul',1.0,'7',0.0,6,25.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','InsectGlaive',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1575,0.0,5.0,180,1,0,0,0,'Fire',27.0,22.0,'Rathmaul II',7.0,'6',0.0,6,14.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','InsectGlaive',0.0,32.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1576,0.0,2.0,180,1,0,0,0,'Fire',25.0,23.0,'Rathmaul I',19.0,'4',0.0,5,16.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1577,0.0,8.0,210,1,0,0,0,'None',0.0,12.0,'Hiten Blade',19.0,'5',0.0,5,21.0,0,NULL,'Attack Boost III/Defense Boost III/Silkbind Boost','InsectGlaive',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1578,0.0,5.0,170,1,0,0,0,'None',0.0,11.0,'Iron Bayonet II',19.0,'3',0.0,4,21.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','InsectGlaive',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1579,0.0,0.0,140,0,0,0,0,'None',0.0,15.0,'Iron Bayonet I',17.0,'2',0.0,3,21.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1580,0.0,0.0,120,0,0,0,0,'None',0.0,10.0,'Steel Blade',19.0,'2',0.0,2,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','InsectGlaive',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1581,0.0,0.0,100,0,0,0,0,'None',0.0,4.0,'Iron Blade II',14.0,'1',0.0,1,16.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','InsectGlaive',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1582,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Iron Blade I',15.0,'1',0.0,1,18.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','InsectGlaive',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1583,0.0,0.0,210,0,0,0,20,'Water',14.0,25.0,'Leapfrog',20.0,'7',0.0,6,8.0,0,NULL,'Defense Boost I/Water Boost III/Dulling Strike','InsectGlaive',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1584,0.0,0.0,160,0,0,0,20,'Water',12.0,15.0,'Leaping Glaive II',20.0,'4',0.0,4,8.0,0,NULL,'Defense Boost I/Water Boost II/Dulling Strike','InsectGlaive',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1585,0.0,0.0,100,0,0,0,10,'Water',10.0,7.0,'Leaping Glaive I',17.0,'2',0.0,2,7.0,0,NULL,'Defense Boost I/Water Boost I/Dulling Strike','InsectGlaive',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1586,-10.0,13.0,220,1,0,0,0,'None',0.0,30.0,'Tigerclaw Glaive',9.0,'6',0.0,6,11.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','InsectGlaive',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1587,0.0,2.0,150,2,0,0,0,'Thunder',25.0,19.0,'Bolt Chamber I',15.0,'3',0.0,4,15.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','InsectGlaive',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1588,-15.0,7.0,210,0,0,0,0,'None',0.0,25.0,'Tigrex Kaina II',10.0,'5',0.0,6,11.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','InsectGlaive',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1589,0.0,0.0,190,1,1,0,0,'Sleep',15.0,20.0,'Illusory Frilled Jab',20.0,'6',0.0,5,11.0,0,NULL,'Attack Boost III/Sleep Boost I/Dulling Strike','InsectGlaive',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1590,0.0,0.0,120,0,0,0,0,'Sleep',12.0,10.0,'Frilled Jab II',13.0,'3',0.0,3,8.0,0,NULL,'Attack Boost I/Sleep Boost I/Dulling Strike','InsectGlaive',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1591,0.0,0.0,110,0,0,0,0,'Sleep',10.0,7.0,'Frilled Jab I',12.0,'2',0.0,2,12.0,0,NULL,'Attack Boost I/Sleep Boost I/Dulling Strike','InsectGlaive',0.0,29.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1592,10.0,7.0,170,1,0,0,0,'Water',16.0,11.0,'Fox Halberd II',20.0,'5',0.0,5,25.0,0,NULL,'Attack Boost II/Affinity II/Water Boost II','InsectGlaive',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1593,10.0,0.0,120,0,0,0,0,'Water',12.0,16.0,'Fox Halberd I',9.0,'2',0.0,3,26.0,0,NULL,'Attack Boost II/Affinity I/Water Boost I','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1594,40.0,16.0,190,2,0,0,0,'None',0.0,21.0,'Evening Calm',10.0,'7',0.0,6,17.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','InsectGlaive',8.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1595,40.0,12.0,170,2,0,0,0,'None',0.0,25.0,'Hidden Scythe II',6.0,'5',0.0,5,24.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','InsectGlaive',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1596,40.0,0.0,100,0,0,0,0,'None',0.0,25.0,'Hidden Scythe I',17.0,'2',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1597,0.0,11.0,190,2,1,0,0,'None',0.0,15.0,'Kamura Ninja Glaive',20.0,'6',0.0,5,9.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','InsectGlaive',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1598,0.0,8.0,150,2,0,0,0,'None',0.0,10.0,'Kamura Glaive V',17.0,'4',0.0,4,15.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1599,0.0,5.0,140,0,0,0,0,'None',0.0,8.0,'Kamura Glaive IV',15.0,'3',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1600,0.0,0.0,90,0,0,0,0,'None',0.0,8.0,'Kamura Glaive III',15.0,'2',0.0,2,13.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1601,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Glaive II',15.0,'1',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','InsectGlaive',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1602,-15.0,2.0,160,0,0,0,0,'None',0.0,24.0,'Tigrex Kaina I',7.0,'2',0.0,3,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','InsectGlaive',0.0,24.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1603,0.0,5.0,160,2,0,0,0,'Thunder',29.0,19.0,'Bolt Chamber II',16.0,'4',0.0,5,14.0,0,NULL,'Attack Boost III/Thunder Boost I/Thunderblight Exploit','InsectGlaive',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1604,0.0,6.0,180,2,0,0,0,'Thunder',33.0,25.0,'Full Bolt Chamber',16.0,'6',0.0,6,15.0,0,NULL,'Attack Boost IV/Thunder Boost II/Thunderblight Exploit','InsectGlaive',0.0,21.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1605,0.0,0.0,110,0,0,0,0,'Poison',19.0,12.0,'Princess Regalia I',19.0,'2',0.0,2,6.0,0,NULL,'Attack Boost I/Poison Boost I/Small Monster Exploit','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1606,-20.0,0.0,160,0,0,0,0,'Ice',10.0,10.0,'Gossglaive I',7.0,'2',0.0,3,21.0,0,NULL,'Affinity Boost I/Ice Boost I/Brutal Strike','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1607,-15.0,8.0,220,2,1,0,0,'Fire',18.0,12.0,'Gnashing Flammenkaefer',14.0,'7',0.0,6,30.0,0,NULL,'Affinity Boost II/Fire Boost III/Brutal Strike','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1608,-15.0,5.0,210,2,1,0,0,'Fire',15.0,9.0,'Flammenkaefer II',16.0,'6',0.0,5,33.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','InsectGlaive',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1609,-15.0,0.0,140,0,0,0,0,'Fire',12.0,5.0,'Flammenkaefer I',20.0,'2',0.0,3,23.0,0,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','InsectGlaive',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1610,-10.0,5.0,210,0,0,0,0,'None',0.0,9.0,'Diablos Rod II',7.0,'5',0.0,6,43.0,0,NULL,'Attack Boost II/Defense Boost II/Kinsect Level Boost','InsectGlaive',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1611,-10.0,5.0,200,0,0,0,0,'None',0.0,12.0,'Diablos Rod I',7.0,'4',0.0,6,43.0,0,NULL,'Attack Boost II/Defense Boost I/Kinsect Level Boost','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1612,0.0,7.0,170,3,0,0,0,'Paralysis',25.0,5.0,'Highest of Glaives',10.0,'7',0.0,6,18.0,0,NULL,'Attack Boost IV/Silkbind Boost/Anti-Aerial Species','InsectGlaive',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1613,0.0,5.0,150,3,0,0,0,'Paralysis',22.0,7.0,'Sky-High Glaive II',10.0,'5',0.0,5,18.0,0,NULL,'Attack Boost III/Silkbind Boost/Anti-Aerial Species','InsectGlaive',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1614,0.0,2.0,130,2,0,0,0,'Paralysis',20.0,7.0,'Sky-High Glaive I',14.0,'4',0.0,4,19.0,0,NULL,'Attack Boost III/Silkbind Boost/Anti-Aerial Species','InsectGlaive',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1615,0.0,5.0,220,0,0,0,0,'None',0.0,16.0,'Sturdy Glaive Redux',16.0,'7',0.0,5,19.0,0,NULL,'Attack Boost IV/Affinity Boost II/Dulling Strike','InsectGlaive',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1616,0.0,0.0,180,0,0,0,0,'None',0.0,10.0,'Sturdy Glaive II',16.0,'5',0.0,4,19.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','InsectGlaive',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1617,0.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Sturdy Glaive I',16.0,'4',0.0,3,24.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','InsectGlaive',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1618,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Aerial Glaive',8.0,'3',0.0,2,24.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','InsectGlaive',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1619,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Staff II',15.0,'2',0.0,1,19.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','InsectGlaive',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1620,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Staff I',20.0,'2',0.0,1,16.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','InsectGlaive',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1621,0.0,8.0,170,1,1,0,0,'Ice',26.0,20.0,'Lagombavarice',9.0,'5',0.0,5,14.0,0,NULL,'Attack Boost II/Ice Boost II/Dulling Strike','InsectGlaive',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1622,0.0,2.0,150,1,1,0,0,'Ice',23.0,20.0,'Lagombaglaive II',10.0,'4',0.0,4,15.0,0,NULL,'Attack Boost I/Ice Boost II/Dulling Strike','InsectGlaive',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1623,0.0,0.0,80,0,0,0,0,'Ice',15.0,2.0,'Lagombaglaive I',12.0,'2',0.0,1,19.0,0,NULL,'Attack Boost I/Ice Boost II/Small Monster Exploit','InsectGlaive',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1624,10.0,12.0,170,1,0,0,0,'Thunder',22.0,7.0,'Shocking Pike',20.0,'6',0.0,5,24.0,0,NULL,'Attack Boost II/Affinity Boost II/Thunder Boost III','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1625,10.0,0.0,140,0,0,0,0,'Thunder',15.0,13.0,'Kadachi Glaive II',5.0,'3',0.0,3,30.0,0,NULL,'Attack Boost I/Affinity Boost II/Thunder Boost II','InsectGlaive',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1626,10.0,0.0,100,0,0,0,0,'Thunder',12.0,9.0,'Kadachi Glaive I',7.0,'3',0.0,2,30.0,0,NULL,'Attack Boost I/Affinity Boost I/Thunder Boost II','InsectGlaive',0.0,11.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1627,10.0,7.0,150,1,1,1,0,'None',0.0,12.0,'Kulu Pike',18.0,'4',0.0,4,14.0,0,NULL,'Affinity Boost III/Kinsect Level Boost/Spiribird Doubled','InsectGlaive',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1628,10.0,0.0,140,0,0,0,0,'None',0.0,10.0,'Kulu Glaive II',14.0,'3',0.0,3,14.0,0,NULL,'Affinity Boost II/Kinsect Level Boost/Spiribird Doubled','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1629,10.0,0.0,100,0,0,0,0,'None',0.0,7.0,'Kulu Glaive I',20.0,'3',0.0,2,15.0,0,NULL,'Affinity Boost II/Kinsect Level Boost/Spiribird Doubled','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1630,0.0,5.0,150,2,0,0,0,'Fire',22.0,13.0,'Daybreak Glaive',12.0,'4',0.0,4,11.0,0,NULL,'Attack Boost II/Fire Boost II/Fire Blight Exploit','InsectGlaive',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1631,0.0,0.0,110,0,0,0,0,'Fire',15.0,12.0,'Aknosom Pike II',14.0,'3',0.0,2,11.0,0,NULL,'Attack Boost II/Fire Boost I/Fireblight Exploit','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1632,0.0,0.0,100,0,0,0,0,'Fire',12.0,10.0,'Aknosom Pike I',14.0,'2',0.0,2,14.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1633,0.0,10.0,210,0,0,0,0,'Poison',25.0,30.0,'Queen Regalia',20.0,'6',0.0,6,7.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','InsectGlaive',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1634,0.0,5.0,180,0,0,0,0,'Poison',23.0,20.0,'Princess Regalia II',20.0,'5',0.0,5,2.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit
','InsectGlaive',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1635,-20.0,7.0,230,2,0,0,0,'Ice',15.0,8.0,'Abominable Glaive',9.0,'5',0.0,6,21.0,0,NULL,'Affinity Boost II/Ice Boost III/Brutal Strike','InsectGlaive',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1636,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Glaive S',15.0,'3',0.0,7,10.0,0,NULL,'Any','InsectGlaive',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1637,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Iron Bow I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1638,10.0,0.0,160,0,0,0,0,'Thunder',27.0,0.0,'Arko Nulo Yellow II',0.0,'Close-range Coating/Para Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Thunder Boost II/Thunderblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1639,15.0,0.0,180,2,0,0,0,'Thunder',29.0,0.0,'Arko Unu Yellow',0.0,'Close-range Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Thunder Boost II/Thunderblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1640,10.0,0.0,90,0,0,0,0,'Fire',22.0,0.0,'Arko Nulo Red I',0.0,'Close-range Coating/Para Coating',0.0,2,0.0,0,NULL,'Attack Boost I/Fire Boost I/Fireblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1641,15.0,0.0,130,0,0,0,0,'Fire',26.0,0.0,'Arko Nulo Red II',0.0,'Close-range Coating/Para Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Fire Boost I/Fireblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1642,20.0,0.0,140,2,1,0,0,'Fire',28.0,0.0,'Arko Unu Red',0.0,'Close-range Coating/Para Coating',0.0,4,0.0,0,NULL,'Attack Boost II/Fire Boost II/Fireblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1643,5.0,0.0,80,0,0,0,0,'Ice',20.0,0.0,'Arko Nulo White I',0.0,'Close-range Coating/Para Coating',0.0,1,0.0,0,NULL,'Attack Boost I/Ice Boost I/Iceblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1644,10.0,0.0,140,0,0,0,0,'Thunder',23.0,0.0,'Arko Nulo Yellow I',0.0,'Close-range Coating/Para Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1645,5.0,0.0,140,0,0,0,0,'Ice',24.0,0.0,'Arko Nulo White II',0.0,'Close-range Coating/Para Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Ice Boost I/Iceblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1646,0.0,0.0,130,0,0,0,0,'Blast',14.0,0.0,'Sinister Bow I',0.0,'Close-range Coating/Power Coating/Blast Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1647,0.0,0.0,140,0,0,0,0,'Blast',16.0,0.0,'Sinister Bow II',0.0,'Close-range Coating/Power Coating/Blast Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1648,0.0,0.0,200,2,1,0,0,'Blast',19.0,0.0,'Sinister Soulpiercer',0.0,'Close-range Coating/Power Coating/Blast Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1649,0.0,0.0,150,0,0,0,0,'None',0.0,0.0,'Kelbi Stingshot I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost I/Lasting Arch Shot/Paralysis Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1650,0.0,0.0,160,2,2,0,0,'None',0.0,0.0,'Kelbi Stingshot II',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Exhaust Coating',0.0,4,0.0,0,NULL,'Attack Boost I/Lasting Arch Shot/Paralysis Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1651,0.0,0.0,190,2,2,0,0,'None',0.0,0.0,'Kelbi Strongshot',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Lasting Arc Shot/Paralysis Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1652,10.0,0.0,160,1,1,0,0,'Ice',26.0,0.0,'Arko Unu White',0.0,'Close-range Coating/Para Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Ice Boost II/Iceblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1653,0.0,0.0,190,3,0,0,0,'Thunder',9.0,0.0,'Beast Thunderbow I',0.0,'Close-range Coating/Power Coating',0.0,5,0.0,0,NULL,'Affinity Boost I/Thunder Boost I/Master Rider','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1654,20.0,0.0,200,1,1,1,0,'Dragon',24.0,0.0,'Arko Nulu Black',0.0,'Close-range Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Dragon Boost II/Dragon Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1655,15.0,0.0,160,1,1,1,0,'Dragon',19.0,0.0,'Arko Nulo Black I',0.0,'Close-range Coating/Para Coating',0.0,4,0.0,0,NULL,'Attack Boost II/Dragon Boost I/Dragon Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1656,0.0,0.0,180,1,1,0,0,'None',0.0,0.0,'Venomtongue Strike',0.0,'Close-range Coating/Poison Coating/Para Coating/Blast Coating',0.0,5,0.0,0,NULL,'Attack Boost III/Defense Boost II/Paralysis Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1657,-20.0,0.0,140,0,0,0,0,'Fire',5.0,0.0,'Flammenbogen I',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Affinity Boost I/Fire Boost I/Brutal Strike','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1658,-20.0,0.0,220,2,1,0,0,'Fire',7.0,0.0,'Flammenbongen II',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1659,-20.0,0.0,240,2,1,0,0,'Fire',9.0,0.0,'Flaming Rage Bow',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Affinity Boost II/Fire Boost III/Brutal Strike','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1660,0.0,0.0,90,0,0,0,0,'Water',20.0,0.0,'Spongia Bow I',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,2,0.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1661,0.0,0.0,140,0,0,0,0,'Water',22.0,0.0,'Spongia Bow II',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1662,15.0,0.0,170,1,1,1,0,'Dragon',21.0,0.0,'Arko Nulo Black II',0.0,'Close-range Coating/Para Coating',0.0,4,0.0,0,NULL,'Attack Boost II/Dragon Boost II/Dragon Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1663,0.0,0.0,170,3,0,0,0,'Water',24.0,0.0,'Spongia Bow III',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Water Boost II/Waterblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1664,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Baggi Bow I',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,1,0.0,0,NULL,'Affinity Boost I/Poison Coating Boost/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1665,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Baggi Bow II',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,2,0.0,0,NULL,'Affinity Boost xII/Poison Coating Boost/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1666,0.0,0.0,160,2,0,0,0,'None',0.0,0.0,'Hypnoshot',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,4,0.0,0,NULL,'Affinity Boost II/Poison Coating Boost/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1667,5.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Arko Nulo I',0.0,'Close-range Coating/Para Coating',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1668,5.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Arko Nulo II',0.0,'Close-range Coating/Para Coating',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1669,10.0,0.0,140,0,0,0,0,'None',0.0,0.0,'Arko Unu',0.0,'Close-range Coating/Para Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1670,0.0,0.0,200,3,0,0,0,'Water',26.0,0.0,'Porifero Bow',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1671,0.0,0.0,210,3,0,0,0,'Thunder',10.0,0.0,'Beast Thunderbow II',0.0,'Close-range Coating/Power Coating',0.0,6,0.0,0,NULL,'Affinity Boost I/Thunder Boost I/Master Rider','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1672,0.0,0.0,200,0,0,0,0,'Dragon',10.0,0.0,'Azure Elder Bow I',0.0,'Close-range Coating/Power Coating/Poison Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1673,0.0,0.0,210,0,0,0,0,'Dragon',13.0,0.0,'Azure Elder Bow II',0.0,'Close-range Coating/Power Coating/Poison Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1674,0.0,0.0,150,0,0,0,0,'None',0.0,0.0,'Rampage Bow I',0.0,'Close-range Coating',0.0,4,0.0,0,NULL,'Any','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1675,0.0,0.0,170,0,0,0,0,'None',0.0,0.0,'Rampage Bow II',0.0,'Close-range Coating',0.0,5,0.0,0,NULL,'Any','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1676,0.0,0.0,180,0,0,0,0,'None',0.0,0.0,'Rampage Bow III',0.0,'Close-range Coating',0.0,5,0.0,0,NULL,'Any','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1677,0.0,0.0,190,0,0,0,0,'None',0.0,0.0,'Rampage Bow IV',0.0,'Close-range Coating',0.0,6,0.0,0,NULL,'Any','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1678,0.0,0.0,200,0,0,0,0,'None',0.0,0.0,'Rampage Bow V',0.0,'Close-range Coating',0.0,6,0.0,0,NULL,'Any','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1679,0.0,0.0,220,0,0,0,0,'Dragon',15.0,0.0,'Abyssal Gale Bow',0.0,'Close-range Coating/Power Coating/Poison Coating/Exhaust Coating',0.0,7,0.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1680,20.0,0.0,190,0,0,0,25,'None',0.0,0.0,'Arachnid Silversting',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating',0.0,5,0.0,0,NULL,'Defense Boost III/Poison Coating Boost/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1681,0.0,0.0,190,0,0,0,0,'Thunder',35.0,0.0,'Abyssal Storm Bow',0.0,'Close-range Coating/Para Coating/Sleep Coating/Blast Coating',0.0,7,0.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1682,0.0,0.0,190,0,0,0,0,'Blast',31.0,0.0,'Bow of Light & Courage',0.0,'Close-range Coating/Power Coating/Sleep Coating',0.0,7,0.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1683,15.0,0.0,180,1,0,0,0,'Ice',37.0,0.0,'Daora''s Sagittarii',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,7,0.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1684,0.0,0.0,230,3,0,0,0,'None',0.0,0.0,'Demon''s Guidance',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,7,0.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1685,0.0,0.0,210,0,0,0,0,'None',0.0,0.0,'Rampage Bow S',0.0,'Close-range Coating',0.0,7,0.0,0,NULL,'Any','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1686,0.0,0.0,180,2,0,0,0,'Dragon',39.0,0.0,'Reddnaught Dragon Arc',0.0,'Close-range Coating/Power Coating',0.0,7,0.0,0,NULL,'Affinity Boost III/Wyvern Exploit/Valstrax Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1687,-20.0,0.0,250,1,0,0,15,'None',0.0,0.0,'Tyrant Bow',0.0,'Close-range Coating/Exhaust Coating',0.0,7,0.0,0,NULL,'Affinity Boost III/Defense Boost II/Lasting Arc Shot','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1688,0.0,0.0,220,3,0,0,0,'Thunder',11.0,0.0,'Beastking Thunderbow',0.0,'Close-range Coating/Power Coating',0.0,7,0.0,0,NULL,'Affinity Boost II/Thunder Boost II/Master Rider','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1689,20.0,0.0,150,0,0,0,25,'None',0.0,0.0,'Arachnid Bow II',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating',0.0,4,0.0,0,NULL,'Defense Boost II/Poison Coating Boost/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1690,20.0,0.0,90,0,0,0,25,'None',0.0,0.0,'Arachnid Bow I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating',0.0,2,0.0,0,NULL,'Defense Boost I/Poison Coating Boost/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1691,30.0,0.0,170,2,0,0,0,'None',0.0,0.0,'Frozen Bow',0.0,'Close-range Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Affinity Boost I/Defense Boost I/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1692,0.0,0.0,180,0,0,0,0,'Thunder',30.0,0.0,'Thunderbolt Bow I',0.0,'Close-range Coating/Para Coating/Sleep Coating/Blast Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1693,10.0,0.0,170,1,0,0,0,'Ice',30.0,0.0,'Icesteel Bow I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1694,0.0,0.0,180,0,0,0,0,'Blast',27.0,0.0,'Bow of Hope & Valor I',0.0,'Close-range Coating/Power Coating/Sleep Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1695,0.0,0.0,220,3,0,0,0,'None',0.0,0.0,'Genie''s Grimoire I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1696,0.0,0.0,160,0,0,0,0,'None',0.0,0.0,'Morsel Bowfish I',0.0,'Close-range Coating/Power Coating/Para Coating/Sleep Coating',0.0,4,0.0,0,NULL,'Affinity Boost I/Master Rider/Anti-aquatic Species','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1697,0.0,0.0,180,0,0,0,0,'None',0.0,0.0,'Morsel Bowfish II',0.0,'Close-range Coating/Power Coating/Para Coating/Sleep Coating',0.0,5,0.0,0,NULL,'Affinity Boost II/Master Rider/Anti-aquatic Species','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1698,0.0,0.0,200,0,0,0,0,'None',0.0,0.0,'Ample Bowfish',0.0,'Close-range Coating/Power Coating/Para Coating/Sleep Coating',0.0,6,0.0,0,NULL,'Affinity Boost III/Master Rider/Anti-Aquatic Species','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1699,-15.0,0.0,110,0,0,0,2,'None',0.0,0.0,'Felyne Bow I',0.0,'Close-range Coating/Power Coating/Para Coating',0.0,2,0.0,0,NULL,'Attack Boost I/Brutal Strike/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1700,-15.0,0.0,140,0,0,0,9,'None',0.0,0.0,'Felyne Bow II',0.0,'Close-range Coating/Power Coating/Para Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Brutal Strike/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1701,-15.0,0.0,190,3,1,0,18,'None',0.0,0.0,'Felyne Trickbow',0.0,'Close-range Coating/Power Coating/Para Coating',0.0,5,0.0,0,NULL,'Attack Boost III/Brutal Strike/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1702,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Chaos Bow I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,2,0.0,0,NULL,'Attack Boost I/Lasting Arc Shot/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1703,0.0,0.0,140,0,0,0,0,'None',0.0,0.0,'Chaos Bow II',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost I/Lasting Arc Shot/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1704,0.0,0.0,180,1,1,1,0,'None',0.0,0.0,'Chaotic Rapture',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Lasting Arc Shot/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1705,30.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Ivory Bow I',0.0,'Close-range Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,2,0.0,0,NULL,'Affinity Boost I/Defense Boost I/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1706,30.0,0.0,140,0,0,0,0,'None',0.0,0.0,'Ivory Bow II',0.0,'Close-range Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Affinity Boost I/Defense Boost I/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1707,0.0,0.0,160,1,1,0,0,'None',0.0,0.0,'Pukei Bow II',0.0,'Close-range Coating/Poison Coating/Para Coating/Blast Coating',0.0,4,0.0,0,NULL,'Attack Boost III/Defense Boost I/Paralysis Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1708,10.0,0.0,210,1,0,0,0,'Water',15.0,0.0,'Heaven''s Manna',0.0,'Close-range Coating/Power Coating/Para Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1709,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Pukei Bow I',0.0,'Close-range Coating/Poison Coating/Para Coating/Blast Coating',0.0,2,0.0,0,NULL,'Attack Boost II/Defense Boost I/Paralysis Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1710,0.0,0.0,190,1,0,0,0,'Thunder',18.0,0.0,'Usurper''s Rumble II',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1711,15.0,0.0,180,0,0,0,0,'Thunder',21.0,0.0,'Kadachi Strikebow III',0.0,'Close-range Coating/Power Coating/Para Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Thunder Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1712,15.0,0.0,190,0,0,0,0,'Thunder',23.0,0.0,'Flying Kadachi Striker',0.0,'Close-range Coating/Power Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Affinity Boost III/Thunder Boost III','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1713,20.0,0.0,100,0,0,0,0,'Ice',14.0,0.0,'Ice Crest I',0.0,'Close-range Coating/Power Coating/Sleep Coating/Exhaust Coating',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1714,25.0,0.0,120,0,0,0,0,'Ice',15.0,0.0,'Ice Crest II',0.0,'Close-range Coating/Power Coating/Sleep Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1715,25.0,0.0,180,1,1,0,0,'Ice',17.0,0.0,'Ice Crest III',0.0,'Close-range Coating/Power Coating/Sleep Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1716,30.0,0.0,200,0,0,0,0,'Ice',19.0,0.0,'Edelweiss',0.0,'Close-range Coating/Power Coating/Sleep Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1717,15.0,0.0,150,0,0,0,0,'Thunder',18.0,0.0,'Kadachi Strikebow II',0.0,'Close-range Coating/Power Coating/Para Coating',0.0,3,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Thunder Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1718,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Wroggi Revolver I',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating',0.0,2,0.0,0,NULL,'Affinity Boost I/Lasting Arc Shot/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1719,0.0,0.0,160,1,1,0,0,'None',0.0,0.0,'Hoodwinker''s Revolver',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating',0.0,4,0.0,0,NULL,'Affinity Boost II/Lasting Arc Shot/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1720,0.0,0.0,110,0,0,0,15,'None',0.0,0.0,'Arzuros Bow I',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,1,0.0,0,NULL,'Attack Boost I/Defense Boost I/Small Monster Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1721,0.0,0.0,140,0,0,0,15,'None',0.0,0.0,'Arzuros Bow II',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,2,0.0,0,NULL,'Attack Boost II/Defense Boost I/Small Monster Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1722,0.0,0.0,190,1,0,0,15,'None',0.0,0.0,'Arzuros'' Honeypot',0.0,'Close-range Coating/Power Coating/Exhaust Coating',0.0,4,0.0,0,NULL,'Attack Boost III/Defense Boost II/Lasting Arc Shot','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1723,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Iron Bow I',0.0,'Close-range Coating/Power Coating',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1724,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Iron Bow II',0.0,'Close-range Coating/Power Coating',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1725,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Wroggi Revolver II',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating',0.0,2,0.0,0,NULL,'Affinity Boost II/Lasting Arc Shot/Buddy Rally','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1726,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Steel Bow',0.0,'Close-range Coating/Power Coating',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1727,10.0,0.0,100,0,0,0,0,'Thunder',16.0,0.0,'Kadachi Strikebow I',0.0,'Close-range Coating/Power Coating/Para Coating',0.0,2,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Thunder Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1728,35.0,0.0,190,2,0,0,0,'None',0.0,0.0,'Hidden Bow II',0.0,'Close-range Coating/Poison Coating/Para Coating',0.0,5,0.0,0,NULL,'Attack Boost III/Affinity Boost I/Lasting Arc Shot','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1729,0.0,0.0,70,0,0,0,0,'None',0.0,0.0,'Kamura Iron Bow II',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1730,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Kamura Iron Bow III',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,2,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1731,0.0,0.0,140,0,0,0,0,'None',0.0,0.0,'Kamura Iron Bow IV',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1732,0.0,0.0,160,2,0,0,0,'None',0.0,0.0,'Kamura Iron Bow V',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,4,0.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1733,0.0,0.0,190,2,1,0,0,'None',0.0,0.0,'Kamura Ninja Bow',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1734,20.0,0.0,150,2,1,1,0,'Fire',25.0,0.0,'Weaver of Flame I',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Fire Boost I/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1735,40.0,0.0,210,2,0,0,0,'None',0.0,0.0,'Night Flight',0.0,'Close-range Coating/Poison Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Lasting Arc Shot','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1736,25.0,0.0,160,2,1,1,0,'Fire',29.0,0.0,'Weaver of Flame II',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Fire Boost II/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1737,10.0,0.0,120,0,0,0,0,'Water',11.0,0.0,'Blessed Rain I',0.0,'Close-range Coating/Power Coating/Para Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1738,10.0,0.0,190,1,0,0,0,'Water',13.0,0.0,'Blessed Rain II',0.0,'Close-range Coating/Power Coating/Para Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1739,0.0,0.0,110,0,0,0,5,'None',0.0,0.0,'Dawn Ray Bow I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,2,0.0,0,NULL,'Attack Boost I/Lasting Arc Shot/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1740,0.0,0.0,170,3,0,0,10,'None',0.0,0.0,'Dawn Ray Bow II',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Lasting Arc Shot/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1741,0.0,0.0,180,3,0,0,10,'None',0.0,0.0,'Summit''s Grand Glow',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Lasting Arc Shot/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1742,30.0,0.0,130,0,0,0,0,'None',0.0,0.0,'Hidden Bow I',0.0,'Close-range Coating/Poison Coating/Para Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Lasting Arc Shot','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1743,30.0,0.0,170,2,1,1,0,'Fire',33.0,0.0,'Araknatorch',0.0,'Close-range Coating/Power Coating/Poison Coating/Sleep Coating/Exhaust Coating',0.0,7,0.0,0,NULL,'Attack Boost IV/Fire Boost II/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1744,0.0,0.0,140,0,0,0,0,'None',0.0,0.0,'Hunter''s Stoutbow I',0.0,'Close-range Coating/Power Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1745,0.0,0.0,170,1,0,0,0,'None',0.0,0.0,'Hunter''s Stoutbow II',0.0,'Close-range Coating/Power Coating',0.0,4,0.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1746,0.0,0.0,190,1,0,0,0,'None',0.0,0.0,'Hunter''s Prodbow',0.0,'Close-range Coating/Power Coating',0.0,5,0.0,0,NULL,'Attack Boost III/Defense Boost III/Silkbind Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1747,0.0,0.0,100,0,0,0,0,'Thunder',21.0,0.0,'Khezu Bow II',0.0,'Close-range Coating/Power Coating/Para Coating/Sleep Coating',0.0,2,0.0,0,NULL,'Attack Boost III/Thunder Boost I/Thunderblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1748,0.0,0.0,150,2,0,0,0,'Thunder',24.0,0.0,'Galvanized Core',0.0,'Close-range Coating/Power Coating/Para Coating/Sleep Coating',0.0,4,0.0,0,NULL,'Attack Boost IV/Thunder Boost II/Thunderblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1749,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Gun I',0.0,'Close-range Coating/Poison Coating/Blast Coating/Exhaust Coating',0.0,1,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1750,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Gun II',0.0,'Close-range Coating/Poison Coating/Blast Coating/Exhaust Coating',0.0,1,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1751,0.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Hyper Bone Gun',0.0,'Close-range Coating/Poison Coating/Blast Coating/Exhaust Coating',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1752,0.0,0.0,150,0,0,0,0,'None',0.0,0.0,'Hunter''s Bow I',0.0,'Close-range Coating/Poison Coating/Blast Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Poison Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1753,0.0,0.0,90,0,0,0,0,'Thunder',18.0,0.0,'Khezu Bow I',0.0,'Close-range Coating/Power Coating/Para Coating/Sleep Coating',0.0,2,0.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1754,0.0,0.0,180,0,0,0,0,'None',0.0,0.0,'Hunter''s Bow II',0.0,'Close-range Coating/Poison Coating/Blast Coating/Exhaust Coating',0.0,4,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Poison Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1755,-25.0,0.0,160,0,0,0,0,'None',0.0,0.0,'Tigrex Archer I',0.0,'Close-range Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1756,-25.0,0.0,240,0,0,0,0,'None',0.0,0.0,'Tigrex Archer II',0.0,'Close-range Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1757,-25.0,0.0,250,0,0,0,0,'None',0.0,0.0,'Tigrex Whisker',0.0,'Close-range Coating/Poison Coating/Para Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1758,-20.0,0.0,230,1,0,0,0,'None',0.0,0.0,'Diablos Coilbender I',0.0,'Close-range Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Affinity Boost I/Defense Boost I/Lasting Arc Shot','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1759,-20.0,0.0,240,1,0,0,10,'None',0.0,0.0,'Diablos Coilbender II',0.0,'Close-range Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Affinity Boost II/Defense Boost I/Lasting Arc Shot','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1760,0.0,0.0,120,0,0,0,0,'Thunder',14.0,0.0,'Usurper''s Rumble I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1761,0.0,0.0,200,0,0,0,0,'None',0.0,0.0,'Master Hunter''s Bow',0.0,'Close-range Coating/Poison Coating/Blast Coating/Exhaust Coating',0.0,5,0.0,0,NULL,'Attack Boost IV/Affinity Boost II/Poison Coating Boost','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1762,30.0,0.0,160,1,1,1,0,'None',0.0,0.0,'Kulu Piercer',0.0,'Close-range Coating/Para Coating/Sleep Coating/Blast Coating',0.0,4,0.0,0,NULL,'Attack Boost II/Sleep Coating Boost/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1763,20.0,0.0,130,0,0,0,0,'None',0.0,0.0,'Kulu''s Flight II',0.0,'Close-range Coating/Para Coating/Sleep Coating/Blast Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Sleep Coating Boost/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1764,10.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Kulu''s Flight I',0.0,'Close-range Coating/Para Coating/Sleep Coating/Blast Coating',0.0,2,0.0,0,NULL,'Attack Boost I/Sleep Coating Boost/Spiribird Doubled','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1765,0.0,0.0,180,1,0,0,5,'None',0.0,0.0,'Yekla Arc I',0.0,'Close-range Coating/Power Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Master Rider','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1766,0.0,0.0,200,1,0,0,8,'None',0.0,0.0,'Yekla Arc II',0.0,'Close-range Coating/Power Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Master Rider','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1767,0.0,0.0,220,1,0,0,10,'None',0.0,0.0,'Herald''s Battlebow',0.0,'Close-range Coating/Power Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Affinity Boost III/Master Rider','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1768,0.0,0.0,140,3,0,0,0,'Ice',40.0,0.0,'Crystalline Flower I',0.0,'Close-range Coating/Power Coating',0.0,4,0.0,0,NULL,'Attack Boost II/Ice Boost I/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1769,0.0,0.0,150,3,0,0,0,'Ice',45.0,0.0,'Crystalline Flower II',0.0,'Close-range Coating/Power Coating',0.0,5,0.0,0,NULL,'Attack Boost III/Ice Boost I/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1770,0.0,0.0,190,3,0,0,0,'Ice',50.0,0.0,'Heaven''s Glaze',0.0,'Close-range Coating/Power Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Ice Boost II/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1771,0.0,0.0,140,0,0,0,0,'Water',27.0,0.0,'Mud Shot I',0.0,'Close-range Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Water Boost I/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1772,0.0,0.0,150,2,1,0,0,'Water',29.0,0.0,'Mud Shot II',0.0,'Close-range Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,4,0.0,0,NULL,'Attack Boost III/Water Boost I/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1773,0.0,0.0,170,2,1,0,0,'Water',34.0,0.0,'Hail of Mud',0.0,'Close-range Coating/Sleep Coating/Blast Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Water Boost II/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1774,0.0,0.0,110,0,0,0,0,'Fire',0.0,0.0,'Queen Blaster I',0.0,'Close-range Coating/Poison Coating/Para Coating',0.0,2,0.0,0,NULL,'Attack Boost I/Fire Boost I/Small Monster Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1775,0.0,0.0,150,0,0,0,0,'Fire',15.0,0.0,'Queen Blaster II',0.0,'Close-range Coating/Poison Coating/Para Coating',0.0,3,0.0,0,NULL,'Attack Boost II/Fire Boost I/Small Monster Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1776,0.0,0.0,180,1,0,0,0,'Fire',16.0,0.0,'Queen''s Melody',0.0,'Close-range Coating/Poison Coating/Para Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Fire Boost I/Small Monster Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1777,0.0,0.0,190,1,0,0,0,'Fire',17.0,0.0,'Prominence Bow I',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,5,0.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1778,0.0,0.0,200,1,0,0,0,'Fire',21.0,0.0,'Prominence Bow II',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1779,0.0,0.0,210,1,0,0,0,'Fire',21.0,0.0,'Dark Filament',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Fire Boost I/Element Exploit','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1780,0.0,0.0,210,1,1,0,0,'Thunder',20.0,0.0,'Despot''s Earlybolt',0.0,'Close-range Coating/Power Coating/Poison Coating/Para Coating/Exhaust Coating',0.0,6,0.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1781,0.0,0.0,170,2,0,0,0,'Dragon',36.0,0.0,'Redwing Bow I',0.0,'Close-range Coating/Power Coating',0.0,6,0.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','Bow',0.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (1782,0.0,0.0,50,0,0,0,0,NULL,0.0,0.0,'Kamura L. Bowgun I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1783,0.0,0.0,190,2,1,0,0,NULL,0.0,0.0,'Sinsiter Shadow Bolt',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Cluster Effect I/Magnamalo Soul','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//High//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1784,0.0,0.0,130,0,0,0,0,NULL,0.0,0.0,'Sinister Bowgun II',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost III/Cluster Effect I/Magnamalo Soul','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//High//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1785,0.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Sinister Bowgun I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Cluster Effect I/Magnamalo Soul','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//High//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1786,0.0,0.0,170,3,0,0,10,NULL,0.0,0.0,'Royal Torrent',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost III/Spread Effect II/Waterblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1787,0.0,0.0,110,0,0,0,10,NULL,0.0,0.0,'Royal Launcher II',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Spread Effect I/Waterblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1788,0.0,0.0,100,0,0,0,10,NULL,0.0,0.0,'Royal Launcher I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Spread Effect I/Waterblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1789,-20.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Tigrex Tank II',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//Average//Above Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1790,-20.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Tigrex Tank I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1791,0.0,0.0,190,1,0,0,20,NULL,0.0,0.0,'Grenade Revolver',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Defense Boost II/Cluster Effect I','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1792,0.0,0.0,160,1,0,0,20,NULL,0.0,0.0,'Grenade Launcher III',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1793,0.0,0.0,130,0,0,0,15,NULL,0.0,0.0,'Grenade Launcher II',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1794,0.0,0.0,90,0,0,0,15,NULL,0.0,0.0,'Grenade Launcher I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1795,25.0,0.0,170,1,1,1,0,NULL,0.0,0.0,'Blizzard Volley',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1796,20.0,0.0,150,1,1,1,0,NULL,0.0,0.0,'Blizzard Cannon II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1797,15.0,0.0,80,0,0,0,0,NULL,0.0,0.0,'Blizzard Cannon I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1798,0.0,0.0,190,1,0,0,0,NULL,0.0,0.0,'Rathling Phoenix',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Shrapnel Effect I/Element Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1799,0.0,0.0,180,1,0,0,0,NULL,0.0,0.0,'Rathling Gun II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Shrapnel Effect I/Element Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1800,0.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Rathling Gun I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Shrapnel Effect I/Element Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1801,0.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Comet Bolt',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost II/Defense Boost III/Normal Effect II','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1802,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Wishing Star II',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost I/Defense Boost III/Normal Effect II','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1803,0.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Wishing Star I',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost I/Defense Boost II/Normal Effect I','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1804,10.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Wyvern Chaser',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost IV/Affinity Boost II/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1805,10.0,0.0,150,0,0,0,0,NULL,0.0,0.0,'Yakt Shooter II',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1806,10.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Yakt Shooter I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1807,0.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Cross Blitz',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Affiinity Boost II/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1808,-15.0,0.0,180,3,0,0,0,NULL,0.0,0.0,'Rajang Barrage I',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost I/Brutal Strike/Master Rider','LightBowgun',0.0,0.0,NULL,NULL,'LR Severe//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1809,-15.0,0.0,190,3,0,0,0,NULL,0.0,0.0,'Rajang Barrage II',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost I/Brutal Strike/Master Rider','LightBowgun',0.0,0.0,NULL,NULL,'LR Severe//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1810,0.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Azure Elder Bowgun I',0.0,'None',0.0,5,0.0,0,NULL,'Normal Effect I/Anti-Aerial Species/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Above Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1811,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Azure Elder Bowgun II',0.0,'None',0.0,6,0.0,0,NULL,'Normal Effect II/Anti-Aerial Species/Ibushi Soul','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Above Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1812,5.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Teostra''s Flamebolt',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','LightBowgun',0.0,0.0,NULL,NULL,'L Severe//Average//Average//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1813,-15.0,0.0,210,3,0,0,0,NULL,0.0,0.0,'Ten Thousand Volts',0.0,'None',0.0,7,0.0,0,NULL,'Affinity Boost II/Brutal Strike/Master Rider','LightBowgun',0.0,0.0,NULL,NULL,'LR Severe//Average//Above Avg.//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1814,-20.0,0.0,220,0,0,0,0,NULL,0.0,0.0,'Tigrex Wargun',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//Average//Above Avg.//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1815,10.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Daora''s Hornet',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Low//Average//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1816,20.0,0.0,190,3,1,0,0,NULL,0.0,0.0,'Cursed Lamp',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Defense Boost III/Chameleos Soul','LightBowgun',0.0,0.0,NULL,NULL,'--//Average//Fast//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1817,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Abyssal Storm Bolt',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Some//Above Avg.//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1818,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Abyssal Gale Bolt',0.0,'None',0.0,7,0.0,0,NULL,'Normal Effect II/Anti-Aerial Species/Ibushi Soul','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Fast//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1819,0.0,0.0,160,2,0,0,0,NULL,0.0,0.0,'Redwing Shooter I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','LightBowgun',0.0,0.0,NULL,NULL,'--//Low//Very Fast//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1820,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Rampage L. Bowgun V',0.0,'None',0.0,6,0.0,0,NULL,'Any','LightBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Average//N/A//Wyvernablast');
INSERT INTO "Weapons" VALUES (1821,0.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Rampage L. Bowgun IV',0.0,'None',0.0,6,0.0,0,NULL,'Any','LightBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1822,0.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Rampage L. Bowgun III',0.0,'None',0.0,5,0.0,0,NULL,'Any','LightBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1823,0.0,0.0,150,0,0,0,0,NULL,0.0,0.0,'Rampage L. Bowgun II',0.0,'None',0.0,5,0.0,0,NULL,'Any','LightBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1824,0.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Cross Bowgun II',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1825,0.0,0.0,140,0,0,0,0,NULL,0.0,0.0,'Rampage L. Bowgun I',0.0,'None',0.0,4,0.0,0,NULL,'Any','LightBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1826,0.0,0.0,130,0,0,0,0,NULL,0.0,0.0,'Springnight Shot II',0.0,'None',0.0,3,0.0,0,NULL,'Affinity Boost II/Anti-Aquatic Species/Small Monster Exploit','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Some//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1827,0.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Springnight Shot I',0.0,'None',0.0,3,0.0,0,NULL,'Affinity Boost I/Anti-Aquatic Species/Small Monster Exploit','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Some//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1828,0.0,0.0,170,2,2,0,0,NULL,0.0,0.0,'Watchdog''s Howl',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Master Rider/Buddy Rally','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1829,0.0,0.0,140,2,2,0,0,NULL,0.0,0.0,'Wooden Dog Bowgun II',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost I/Master Rider/Buddy Rally','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1830,0.0,0.0,130,0,0,0,0,NULL,0.0,0.0,'Wooden Dog Bowgun I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost I/Master Rider/Buddy Rally','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1831,20.0,0.0,180,3,1,0,0,NULL,0.0,0.0,'Blessed Lamp I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Defense Boost III/Chameleos Soul','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1832,5.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Teostra''s Dart I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','LightBowgun',0.0,0.0,NULL,NULL,'L Severe//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1833,10.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Icesteel Wasp I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','LightBowgun',0.0,0.0,NULL,NULL,'L Mild//Low //Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1834,-10.0,0.0,210,1,1,0,0,NULL,0.0,0.0,'Bazelfetter Rookslayer',0.0,'None',0.0,7,0.0,0,NULL,'Defense Boost II/Shrapnel Effect II/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Some//Below Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1835,-10.0,0.0,200,1,1,0,0,NULL,0.0,0.0,'Rookslayer Bowgun II',0.0,'None',0.0,6,0.0,0,NULL,'Defense Boost I/Shrapnel Effect I/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Some//Below Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1836,-10.0,0.0,190,1,1,0,0,NULL,0.0,0.0,'Rookslayer Bowgun I',0.0,'None',0.0,6,0.0,0,NULL,'Defense Boost I/Shrapnel Effect I/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Some//Below Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1837,0.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Thunderbolt Bowgun I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Some//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1838,0.0,0.0,160,1,1,1,0,NULL,0.0,0.0,'Springnight Spawn',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost III/Anti-Aquatic Species/Small Monster Exploit','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Some//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1839,0.0,0.0,170,2,0,0,0,NULL,0.0,0.0,'Reddnaught Bowgun',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','LightBowgun',0.0,0.0,NULL,NULL,'--//Low//Very Fast//Arc Shot//Wyvernablast');
INSERT INTO "Weapons" VALUES (1840,0.0,0.0,80,0,0,0,0,NULL,0.0,0.0,'Cross Bowgun I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1841,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Valkyrie Fire II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Pierce Effect I/Small Monster Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1842,0.0,0.0,180,1,1,0,15,NULL,0.0,0.0,'Barro Blaster',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost I/Defense Boost II/Pierce Effect I','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Slow//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1843,0.0,0.0,130,0,0,0,10,NULL,0.0,0.0,'Barro Barrel II',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost I/Defense Boost II/Pierce Effect I','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Slow//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1844,0.0,0.0,100,0,0,0,10,NULL,0.0,0.0,'Barro Barrel I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Defense Boost I/Pierce Effect I','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Slow//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1845,0.0,0.0,140,2,1,1,0,NULL,0.0,0.0,'Bullet Rain (Viper)',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost IV/Affinity Boost III/Defense Boost II','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1846,0.0,0.0,130,0,0,0,0,NULL,0.0,0.0,'Shotgun (Viper) III',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1847,0.0,0.0,80,0,0,0,0,NULL,0.0,0.0,'Shotgun (Viper) II',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1848,0.0,0.0,70,0,0,0,0,NULL,0.0,0.0,'Shotgun (Viper) I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1849,0.0,0.0,160,1,1,0,0,NULL,0.0,0.0,'Khezu Hypo',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost IV/Spread Effect II/Thunderblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1850,0.0,0.0,140,1,1,0,0,NULL,0.0,0.0,'Khezu Syringe III',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost III/Spread Effect II/Thunderblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1851,0.0,0.0,90,0,0,0,0,NULL,0.0,0.0,'Khezu Syringe II',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost III/Spread Effect I/Thunderblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1852,0.0,0.0,80,0,0,0,0,NULL,0.0,0.0,'Khezu Syringe I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Spread Effect I/Thunderblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1853,0.0,0.0,180,3,0,0,0,NULL,0.0,0.0,'Great Lotus Bowgun',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Shrapnel Effect II/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Some//Below Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1854,0.0,0.0,170,3,0,0,0,NULL,0.0,0.0,'Lotus Bowgun II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Shrapnel Effect I/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Some//Below Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1855,0.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Lotus Bowgun I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Shrapnel Effect I/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Some//Below Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1856,35.0,0.0,180,2,1,1,0,NULL,0.0,0.0,'Araknabolt',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Spread Effect II/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Fast//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1857,30.0,0.0,170,2,1,1,0,NULL,0.0,0.0,'Lumier Bowgun II',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Spread Effect II/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1858,30.0,0.0,160,2,1,1,0,NULL,0.0,0.0,'Lumier Bowgun I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Spread Effect II/Silkbind Boost','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1859,40.0,0.0,180,2,0,0,0,NULL,0.0,0.0,'Night Owl',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','LightBowgun',0.0,0.0,NULL,NULL,'None//Avergage//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1860,35.0,0.0,160,2,0,0,0,NULL,0.0,0.0,'Hidden Eye II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','LightBowgun',0.0,0.0,NULL,NULL,'None//Avergage//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1861,35.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Hidden Eye I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','LightBowgun',0.0,0.0,NULL,NULL,'None//Avergage//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1862,0.0,0.0,170,2,1,0,0,NULL,0.0,0.0,'Kamura Ninja L. Bowgun',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1863,0.0,0.0,150,2,0,0,0,NULL,0.0,0.0,'Kamura L. Bowgun V',0.0,'None',0.0,4,0.0,0,NULL,'Affinity Boost III/Defense Boost II/Master Rider','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1864,0.0,0.0,130,0,0,0,0,NULL,0.0,0.0,'Kamura L. Bowgun IV',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1865,0.0,0.0,90,0,0,0,0,NULL,0.0,0.0,'Kamura L. Bowgun III',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1866,0.0,0.0,60,0,0,0,0,NULL,0.0,0.0,'Kamura L. Bowgun II',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1867,-15.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Gossgun I',0.0,'None',0.0,3,0.0,0,NULL,'Affinity Boost I/Pierce Effect I/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Low//Very Slow//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1868,-15.0,0.0,170,2,0,0,0,NULL,0.0,0.0,'Gossgun II',0.0,'None',0.0,4,0.0,0,NULL,'Affinity Boost I/Pierce Effect I/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'LR Severe//Low//Very Slow//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1869,-15.0,0.0,190,2,0,0,0,NULL,0.0,0.0,'Gossgun III',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost I/Pierce Effect II/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'LR Severe//Low//Very Slow//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1870,-15.0,0.0,220,2,0,0,0,NULL,0.0,0.0,'Abominable Bowgun',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost I/Pierce Effect II/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'LR Severe//Low//Very Slow//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1871,0.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Valkyrie Fire I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Pierce Effect I/Small Monster Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1872,-30.0,0.0,230,2,1,0,0,NULL,0.0,0.0,'Furious Flammenkanone',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost II/Cluster Effect I/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1873,-30.0,0.0,220,2,1,0,0,NULL,0.0,0.0,'Flammenkanone II',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost I/Cluster Effect I/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1874,-30.0,0.0,200,2,1,0,0,NULL,0.0,0.0,'Flammenkanone I',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost I/Cluster Effect I/Brutal Strike','LightBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1875,15.0,0.0,160,2,1,0,0,NULL,0.0,0.0,'Gale Bowgun',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1876,15.0,0.0,140,2,1,0,0,NULL,0.0,0.0,'Wind Thief L. Bowgun III',0.0,'None',0.0,4,0.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1877,10.0,0.0,80,0,0,0,0,NULL,0.0,0.0,'Wind Thief L. Bowgun II',0.0,'None',0.0,2,0.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1878,10.0,0.0,70,0,0,0,0,NULL,0.0,0.0,'Wind Thief L. Bowgun I',0.0,'None',0.0,1,0.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1879,10.0,0.0,170,1,0,0,0,NULL,0.0,0.0,'Nifl Mist',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Sticky Effect I','LightBowgun',0.0,0.0,NULL,NULL,'None//Low//Above Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1880,10.0,0.0,160,1,0,0,0,NULL,0.0,0.0,'Desolate Mist II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Sticky Effect I','LightBowgun',0.0,0.0,NULL,NULL,'None//Low//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1881,10.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Desolate Mist I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Sticky Effect I','LightBowgun',0.0,0.0,NULL,NULL,'None//Low//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1882,0.0,0.0,190,2,0,0,0,NULL,0.0,0.0,'Uroktor Vortex',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost II/Pierce Effect I/Fireblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Average//Below Avg.//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1883,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Valkyrie Blaze',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Pierce Effect I/Small Monster Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernblast');
INSERT INTO "Weapons" VALUES (1884,0.0,0.0,150,0,0,0,0,NULL,0.0,0.0,'Scale Tornado II',0.0,'None',0.0,3,0.0,0,NULL,'Affinity Boost I/Pierce Effect I/Fireblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1885,0.0,0.0,180,2,1,0,0,NULL,0.0,0.0,'Doom Bringer Bowgun',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Normal Effect II/Element Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1886,0.0,0.0,150,2,1,0,0,NULL,0.0,0.0,'Almudron Bowgun II',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost II/Normal Effect II/Element Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1887,0.0,0.0,140,0,0,0,0,NULL,0.0,0.0,'Almudron Bowgun I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Normal Effect II/Element Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1888,10.0,0.0,190,2,0,0,0,NULL,0.0,0.0,'Despot''s Wildfire',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Pierce Effect II/Anti-Aquatic','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1889,10.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Usurper''s Crime II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Anti-Aquatic Species','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1890,10.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Usurper''s Crime I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Anti-Aquatic Species','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1891,0.0,0.0,170,1,0,0,0,NULL,0.0,0.0,'Jaeger Prime',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost III/Defense Boost III/Dragon Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1892,0.0,0.0,150,1,0,0,0,NULL,0.0,0.0,'Jaeger II',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost II/Defense Boost III/Dragon Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1893,0.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Jaeger I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Defense Boost II/Dragon Exploit','LightBowgun',0.0,0.0,NULL,NULL,'None//Some//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1894,0.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Sniper Shot',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1895,0.0,0.0,90,0,0,0,0,NULL,0.0,0.0,'Hunter''s Rifle II',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1896,0.0,0.0,70,0,0,0,0,NULL,0.0,0.0,'Hunter''s Rifle I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','LightBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1897,0.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Scale Tornado I',0.0,'None',0.0,2,0.0,0,NULL,'Affinity Boost I/Pierce Effect I/Fireblight Exploit','LightBowgun',0.0,0.0,NULL,NULL,'R Mild//Average//Below Avg.//N/A//Wyvernblast');
INSERT INTO "Weapons" VALUES (1898,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Rampage L.Bowgun S',0.0,'None',0.0,7,0.0,0,NULL,'Any','LightBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Average//N/A//Wyvernablast');
INSERT INTO "Weapons" VALUES (1899,0.0,0.0,60,0,0,0,0,NULL,0.0,0.0,'Kamura H. Bowgun I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1900,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Cendrillon',0.0,'None',0.0,5,0.0,0,NULL,'Pierce Effect II/Spread Effect I/Shrapnel Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1901,0.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Carrozza Bazooka II',0.0,'None',0.0,3,0.0,0,NULL,'Pierce Effect I/Spread Effect I/Shrapnel Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1902,0.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Carrozza Bazooka I',0.0,'None',0.0,2,0.0,0,NULL,'Pierce Effect I/Spread Effect I/Shrapnel Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1903,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Thunderbolt Cannon I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Mild//Some//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1904,0.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Azure Elder Cannon II',0.0,'None',0.0,6,0.0,0,NULL,'Pierce Effect I/Anti-Aerial Species/Defense Boost I','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Above Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1905,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Azure Elder Cannon I',0.0,'None',0.0,5,0.0,0,NULL,'Pierce Effect I/Anti-Aerial Species/Defense Boost I','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Above Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1906,-20.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Rajang Shooter II',0.0,'None',0.0,6,0.0,0,NULL,'Normal Effect I/Sticky Effect I/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Severe//Average//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1907,-20.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Rajang Shooter I',0.0,'None',0.0,5,0.0,0,NULL,'Normal Effect I/Sticky Effect I/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Severe//Average//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1908,0.0,0.0,220,0,0,0,0,NULL,0.0,0.0,'Sinister Dreadvolley',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Cluster Effect II/Magnamalo Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'R Mild//High//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1909,0.0,0.0,150,0,0,0,0,NULL,0.0,0.0,'Sinister Volley II',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Cluster Effect I/Magnamalo Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'R Mild//High//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1910,0.0,0.0,130,0,0,0,0,NULL,0.0,0.0,'Sinister Volley I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Cluster Effect I/Magnamalo Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'R Mild//High//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1911,0.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Spheniscine Ruler',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost II/Pierce Effect I/Normal Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1912,0.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Journey Jelly I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Defense Boost I/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'R. Mild//Average//Above Avg.//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1913,0.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Spheniscine Slayer II',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Pierce Effect I/Small Monster Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1914,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Bishaten''s Grace',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost III/Shrapnel Effect II/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild//Some//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1915,0.0,0.0,150,0,0,0,0,NULL,0.0,0.0,'Highpriest Bowgun II',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Shrapnel Effect I/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild//Some//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1916,0.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Highpriest Bowgun I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Shrapnel Effect I/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild//Some//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1917,30.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Baleful Night',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1918,30.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Hidden Gambit II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1919,30.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Hidden Gambit I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1920,0.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Cyclecaster',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost III/Normal Effect II/Spread Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1921,0.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Rapidcaster II',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Normal Effect II/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1922,0.0,0.0,90,0,0,0,0,NULL,0.0,0.0,'Rapidcaster I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Normal Effect I/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1923,10.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Kadachi Raijodo',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost III/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1924,10.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Kadachi Cannon II',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1925,10.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Kadachi Cannon I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1926,0.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Spheniscine Slayer I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Pierce Effect I/Small Monster Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1927,-30.0,0.0,240,0,0,0,0,NULL,0.0,0.0,'Dual Threat II',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost III/Defense Boost II/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Sever//Average//Slow//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1928,0.0,0.0,170,0,0,0,10,NULL,0.0,0.0,'Journey Jelly II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Defense Boost II/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'R. Mild//Average//Above Avg.//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1929,0.0,0.0,160,0,0,0,20,NULL,0.0,0.0,'Ladybug Cannon I',0.0,'None',0.0,5,0.0,0,NULL,'Defense Boost I/Pierce Effect I/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Slow//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1930,0.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Rampage H. Bowgun S',0.0,'None',0.0,7,0.0,0,NULL,'Any','HeavyBowgun',0.0,0.0,NULL,NULL,'L Severe//Average//Average//--//Wyvernheart');
INSERT INTO "Weapons" VALUES (1931,-20.0,0.0,230,3,0,0,0,NULL,0.0,0.0,'Rajang''s Rage',0.0,'None',0.0,7,0.0,0,NULL,'Normal Effect II/Sticky Effect II/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Severe//Average//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1932,0.0,0.0,210,2,0,0,0,NULL,0.0,0.0,'Diabolica',0.0,'None',0.0,7,0.0,0,NULL,'Normal Effect II/Wyvern Exploit/Valstrax Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Low//Very Fast//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1933,10.0,0.0,220,1,0,0,0,NULL,0.0,0.0,'Daora Grande',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'L Mild//Average//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1934,0.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Abyssal Storm Barrage',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Mild//Some//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1935,0.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Abyssal Gale Barrage',0.0,'None',0.0,7,0.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Fast//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1936,0.0,0.0,200,2,0,0,0,NULL,0.0,0.0,'Redwing Cannon I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'--//Low//Very Fast//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1937,-10.0,0.0,240,0,0,0,0,NULL,0.0,0.0,'Tigrex Skull',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Sticky Effect I/Cluster Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Average//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1938,10.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Mountainous Roar',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Fast//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1939,20.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Thorn Cannon',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Very Fast//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1940,-20.0,0.0,230,0,0,0,0,NULL,0.0,0.0,'Gnashing Flammenkanone',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost II/Cluster Effect I/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'L Severe//High//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1941,40.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Araknamortar',0.0,'None',0.0,7,0.0,0,NULL,'Attack Boost IV/Pierce Effect I/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1942,0.0,0.0,190,0,0,0,10,NULL,0.0,0.0,'Guiding Light',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Defense Boost II/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'R. Mild//Average//Above Avg.//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1943,-30.0,0.0,250,0,0,0,0,NULL,0.0,0.0,'Diablazooka',0.0,'None',0.0,7,0.0,0,NULL,'Affinity Boost III/Defense Boost II/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'L Severe//Average//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1944,5.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Teostra''s Artillery I',0.0,'None',0.0,6,0.0,0,NULL,'Sticky Effect I/Fireblight Exploit/Teostra Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1945,30.0,0.0,210,2,1,1,0,NULL,0.0,0.0,'Kamaeleon I',0.0,'None',0.0,6,0.0,0,NULL,'Defense Boost II/Spread Effect I/Chameleos Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1946,0.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Rampage H. Bowgun V',0.0,'None',0.0,6,0.0,0,NULL,'Any','HeavyBowgun',0.0,0.0,NULL,NULL,'L Severe//Average//Average//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1947,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Rampage H. Bowgun IV',0.0,'None',0.0,6,0.0,0,NULL,'Any','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Severe//Average//Below Avg.//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1948,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Rampage H. Bowgun III',0.0,'None',0.0,5,0.0,0,NULL,'Any','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Severe//Average//Below Avg.//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1949,0.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Rampage H. Bowgun II',0.0,'None',0.0,5,0.0,0,NULL,'Any','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Severe//Average//Below Avg.//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1950,0.0,0.0,150,0,0,0,0,NULL,0.0,0.0,'Rampage H. Bowgun I',0.0,'None',0.0,4,0.0,0,NULL,'Any','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Severe//Average//Below Avg.//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1951,0.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Felyne Cannon',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Spread Effect II/Cluster Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Below Avg.//Level Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1952,0.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Felyne Bowgun II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Spread Effect II/Cluster Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Below Avg.//Level Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1953,0.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Felyne Bowgun I',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost I/Spread Effect I/Cluster Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Below Avg.//Level Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1954,0.0,0.0,200,0,0,0,20,NULL,0.0,0.0,'Ladybug Morta',0.0,'None',0.0,6,0.0,0,NULL,'Defense Boost I/Pierce Effect I/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Slow//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1955,0.0,0.0,180,0,0,0,20,NULL,0.0,0.0,'Ladybug Cannon II',0.0,'None',0.0,5,0.0,0,NULL,'Defense Boost I/Pierce Effect II/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Slow//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1956,10.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Daora''s Delphinidae',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost II/Pierce Effect I/Kushala Daora Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'L Mild//Average//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1957,-30.0,0.0,220,0,0,0,0,NULL,0.0,0.0,'Dual Threat I',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost II/Defense Boost I/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Sever//Average//Slow//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1958,0.0,0.0,200,0,0,0,10,NULL,0.0,0.0,'Anteka Blaster',0.0,'None',0.0,6,0.0,0,NULL,'Defense Boost II/Pierce Effect I/Spread Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1959,0.0,0.0,180,0,0,0,10,NULL,0.0,0.0,'Anteka Burst II',0.0,'None',0.0,5,0.0,0,NULL,'Defense Boost II/Pierce Effect I/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1960,0.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Iron Assault II',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Average//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1961,0.0,0.0,80,0,0,0,0,NULL,0.0,0.0,'Iron Assault I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1962,10.0,0.0,220,0,0,0,0,NULL,0.0,0.0,'Despot''s Paroxysm',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Anti-Aquatic Species','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1963,10.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Usurper''s Tremor II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Anti-Aquatic Species','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1964,10.0,0.0,140,0,0,0,0,NULL,0.0,0.0,'Usurper''s Tremor I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost I/Affinity Boost I/Anti-Aquatic Species','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1965,0.0,0.0,170,0,0,0,15,NULL,0.0,0.0,'Arzuros Fishergun',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost II/Defense Boost II/Small Monster Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1966,0.0,0.0,120,0,0,0,15,NULL,0.0,0.0,'Arzuros Gun II',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Defense Boost I/Small Monster Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1967,0.0,0.0,100,0,0,0,15,NULL,0.0,0.0,'Arzuros Gun I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Defense Boost I/Small Monster Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1968,20.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Guerrera Cannon II',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1969,20.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Guerrera Cannon I',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost/Iceblight Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Fast//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1970,0.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Queen''s Farflier',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Spread Effect II/Small Monster Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1971,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Queen''s Longfire II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Spread Effect I/Small Monster Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1972,0.0,0.0,140,0,0,0,0,NULL,0.0,0.0,'Steel Assault',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Average//N/A//Wyvernheart');
INSERT INTO "Weapons" VALUES (1973,0.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Queen''s Longfire I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Spread Effect I/Small Monster Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1974,0.0,0.0,180,0,0,0,17,NULL,0.0,0.0,'Reversal Shot III',0.0,'None',0.0,5,0.0,0,NULL,'Defense Boost II/Cluster Effect I/Waterblight Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'R Mild//High//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1975,0.0,0.0,170,0,0,0,15,NULL,0.0,0.0,'Reversal Shot II',0.0,'None',0.0,4,0.0,0,NULL,'Defense Boost II/Cluster Effect I/Waterblight Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'R Mild//High//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1976,0.0,0.0,110,0,0,0,10,NULL,0.0,0.0,'Reversal Shot I',0.0,'None',0.0,2,0.0,0,NULL,'Defense Boost I/Cluster Effect I/Waterblight Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'R Mild//High//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1977,10.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Cirrus Blaster II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1978,10.0,0.0,130,0,0,0,0,NULL,0.0,0.0,'Cirrus Blaster I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1979,-10.0,0.0,230,0,0,0,0,NULL,0.0,0.0,'Tigrex Howl II',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Sticky Effect I/Cluster Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'R. Severe//Average//Below Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1980,-10.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Tigrex Howl I',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Sticky Effect I/Cluster Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'R Severe//Average //Below Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1981,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Kamura Ninja H. Bowgun',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1982,0.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Kamura H. Bowgun V',0.0,'None',0.0,4,0.0,0,NULL,'Affinity Boost II/Defense Boost II/Master Rider','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1983,0.0,0.0,140,0,0,0,0,NULL,0.0,0.0,'Kamura H. Bowgun IV',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1984,0.0,0.0,100,0,0,0,0,NULL,0.0,0.0,'Kamura H. Bowgun III',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1985,0.0,0.0,70,0,0,0,0,NULL,0.0,0.0,'Kamura H. Bowgun II',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1986,0.0,0.0,220,0,0,0,20,NULL,0.0,0.0,'Reversal Barrage',0.0,'None',0.0,6,0.0,0,NULL,'Defense Boost II/Cluster Effect II/Waterblight Exploit','HeavyBowgun',0.0,0.0,NULL,NULL,'R Mild//High//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1987,0.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Striker''s Bowgun I',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1988,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Striker''s Bowgun II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1989,0.0,0.0,230,0,0,0,0,NULL,0.0,0.0,'Elite Bowgun',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1990,0.0,0.0,150,0,0,0,10,NULL,0.0,0.0,'Anteka Burst I',0.0,'None',0.0,3,0.0,0,NULL,'Defense Boost I/Pierce Effect I/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (1991,0.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Venomhail',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Affinity Boost I/Spread Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1992,0.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Pukei Launcher II',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost III/Affinity Boost I/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1993,0.0,0.0,190,0,0,0,0,NULL,0.0,0.0,'Pukei Launcher I',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Spread Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1994,0.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Bone Buster',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1995,0.0,0.0,120,0,0,0,0,NULL,0.0,0.0,'Bone Shooter II',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1996,0.0,0.0,90,0,0,0,0,NULL,0.0,0.0,'Bone Shooter I',0.0,'None',0.0,1,0.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//High//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1997,40.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Fulgent Shot II',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Pierce Effect I/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1998,40.0,0.0,170,0,0,0,0,NULL,0.0,0.0,'Fulgent Shot I',0.0,'None',0.0,6,0.0,0,NULL,'Attack Boost III/Pierce Effect I/Silkbind Boost','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Some//Above Avg.//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (1999,10.0,0.0,180,0,0,0,0,NULL,0.0,0.0,'Gale Crossbow',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost IV/Small Monster Exploit/Buddy Rally','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2000,10.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Wind Thief Crossbow III',0.0,'None',0.0,4,0.0,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2001,10.0,0.0,90,0,0,0,0,NULL,0.0,0.0,'Wind Thief Crossbow II',0.0,'None',0.0,2,0.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2002,10.0,0.0,80,0,0,0,0,NULL,0.0,0.0,'Wind Thief Crossbow I',0.0,'None',0.0,1,0.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Above Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2003,0.0,0.0,200,0,0,0,20,NULL,0.0,0.0,'Rebound Shot',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost II/Defense Boost II/Normal Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild//Average//Below Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2004,0.0,0.0,160,0,0,0,20,NULL,0.0,0.0,'Carom Shot II',0.0,'None',0.0,3,0.0,0,NULL,'Attack Boost II/Defense Boost II/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild//Average//Below Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2005,0.0,0.0,130,0,0,0,20,NULL,0.0,0.0,'Carom Shot I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Defense Boost I/Normal Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild //Average//Below Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2006,0.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Marino Cannon',0.0,'None',0.0,5,0.0,0,NULL,'Normal Effect II/Spread Effect II/Shrapnel Effect II','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild//Average//Below Avg.//Level Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2007,0.0,0.0,90,0,0,0,0,NULL,0.0,0.0,'Marino Burst II',0.0,'None',0.0,3,0.0,0,NULL,'Normal Effect II/Spread Effect I/Shrapnel Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild//Average//Below Avg.//Level Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2008,0.0,0.0,80,0,0,0,0,NULL,0.0,0.0,'Marino Burst I',0.0,'None',0.0,2,0.0,0,NULL,'Normal Effect I/Spread Effect I/Shrapnel Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Mild//Average//Below Avg.//Level Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2009,0.0,0.0,180,0,0,0,10,NULL,0.0,0.0,'Earth Eater',0.0,'None',0.0,5,0.0,0,NULL,'Defense Boost II/Spread Effect II/Cluster Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2010,0.0,0.0,150,0,0,0,10,NULL,0.0,0.0,'Rock Eater II',0.0,'None',0.0,3,0.0,0,NULL,'Defense Boost II/Spread Effect I/Cluster Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2011,0.0,0.0,110,0,0,0,10,NULL,0.0,0.0,'Rock Eater I',0.0,'None',0.0,2,0.0,0,NULL,'Defense Boost I/Spread Effect I/Cluster Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Average//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2012,0.0,0.0,200,0,0,0,0,NULL,0.0,0.0,'Meteor Cannon',0.0,'None',0.0,5,0.0,0,NULL,'Attack Boost IV/Pierce Effect I/Shrapnel Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2013,0.0,0.0,160,0,0,0,0,NULL,0.0,0.0,'Meteor Bazooka II',0.0,'None',0.0,4,0.0,0,NULL,'Attack Boost III/Pierce Effect I/Shrapnel Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2014,0.0,0.0,110,0,0,0,0,NULL,0.0,0.0,'Meteor Bazooka I',0.0,'None',0.0,2,0.0,0,NULL,'Attack Boost II/Pierce Effect I/Shrapnel Effect I','HeavyBowgun',0.0,0.0,NULL,NULL,'None//Average//Below Avg.//N/A//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2015,-20.0,0.0,220,0,0,0,0,NULL,0.0,0.0,'Flammenkanone II Heavy Bowgun',0.0,'None',0.0,6,0.0,0,NULL,'Affinity Boost I/Cluster Effect I/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Severe//High//Below Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2016,-20.0,0.0,210,0,0,0,0,NULL,0.0,0.0,'Flammenkanone I Heavy Bowgun',0.0,'None',0.0,5,0.0,0,NULL,'Affinity Boost I/Cluster Effect I/Brutal Strike','HeavyBowgun',0.0,0.0,NULL,NULL,'L. Severe//High//Below Avg.//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2017,5.0,0.0,230,0,0,0,0,NULL,0.0,0.0,'Teostra''s Flames',0.0,'None',0.0,7,0.0,0,NULL,'Sticky Effect II/Fireblight Exploit/Teostra Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'R Severe//Average//Average//Arc Shot//Wyvernheart');
INSERT INTO "Weapons" VALUES (2018,0.0,0.0,220,2,1,1,30,NULL,0.0,0.0,'Veiled Kamaeleon',0.0,'None',0.0,7,0.0,0,NULL,'Defense Boost III/Spread Effect II/Chameleos Soul','HeavyBowgun',0.0,0.0,NULL,NULL,'LR Mild//Average//Fast//Arc Shot//Wyvernsnipe');
INSERT INTO "Weapons" VALUES (2019,0.0,0.0,50,0,0,0,0,'None',0.0,0.0,'Kamura Sword I',20.0,'None',0.0,1,10.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','SwordAndShield',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2020,0.0,0.0,100,0,0,0,0,'Paralysis',14.0,7.0,'Secta Nulo Green I',5.0,'None',0.0,2,30.0,0,NULL,'Affinity Boost I/Paralysis Boost I/Anti-Aerial Species','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2021,0.0,10.0,190,3,1,0,0,'Dragon24',0.0,15.0,'Secta Unu Black',4.0,'None',0.0,6,30.0,0,NULL,'Affinity Boost III/Defense Boost III/Element Exploit','SwordAndShield',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2022,0.0,10.0,160,3,1,0,0,'Dragon21',0.0,15.0,'Secta Nulo Black II',3.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost II/Defense Boost III/Element Exploit','SwordAndShield',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2023,0.0,5.0,140,3,1,0,0,'Dragon19',0.0,10.0,'Secta Nulo Black I',5.0,'None',0.0,4,32.0,0,NULL,'Affinity Boost II/Defense Boost II/Element Exploit','SwordAndShield',0.0,3.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2024,0.0,7.0,140,3,1,0,0,'Ice',19.0,10.0,'Secta Unu White',5.0,'None',0.0,4,30.0,0,NULL,'Defense Boost III/Ice Boost IV/Silkbind Boost','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2025,0.0,0.0,110,0,0,0,0,'Ice',17.0,15.0,'Secta Nulo White I',3.0,'None',0.0,3,35.0,0,NULL,'Defense Boost II/Ice Boost II/Silkbind Boost','SwordAndShield',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2026,0.0,0.0,90,0,0,0,0,'None',0.0,12.0,'Secta Unu',5.0,'None',0.0,2,20.0,0,NULL,'Defense Boost I/Affinity Boost I/Small Monster Exploit','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2027,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Secta Nulo I',5.0,'None',0.0,1,20.0,0,NULL,'Defense Boost I/Affinity Boost I/Small Monster Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2028,0.0,0.0,190,1,1,1,10,'Fire',17.0,32.0,'Burly Beak',5.0,'None',0.0,5,5.0,0,NULL,'Defense Boost III/Fireblight Exploit/Dulling Strike','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2029,0.0,0.0,150,0,0,0,8,'Fire',15.0,7.0,'Lava Pick II',5.0,'None',0.0,3,20.0,0,NULL,'Defense Boost II/Fireblight Exploit/Dulling Strike','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2030,0.0,0.0,120,0,0,0,5,'Fire',18.0,0.0,'Lava Pick I',5.0,'None',0.0,2,35.0,0,NULL,'Defense Boost II/Fireblight Exploit/Dulling Strike','SwordAndShield',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2031,15.0,5.0,150,2,1,0,0,'None',0.0,10.0,'Snapper Sickle',15.0,'None',0.0,4,5.0,0,NULL,'Affinity Boost III/Small Monster Exploit/Buddy Rally','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2032,12.0,0.0,80,0,0,0,0,'None',0.0,5.0,'Izuchi Sickle II',15.0,'None',0.0,1,4.0,0,NULL,'Affinity Boost II/Small Monster Exploit/Buddy Rally','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2033,10.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Izuchi Sickle I',15.0,'None',0.0,1,5.0,0,NULL,'Affinity Boost I/Small Monster Exploit/Buddy Rally','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2034,0.0,4.0,160,1,1,1,0,'Paralysis',19.0,12.0,'Secta Unu Green',4.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost III/Paralysis Boost II/Anti-Aerial Species','SwordAndShield',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2035,-15.0,7.0,230,2,0,0,0,'Ice',14.0,12.0,'Chef''s Knife',7.0,'None',0.0,6,25.0,0,NULL,'Affinity Boost I/Ice Boost III/Brutal Strike','SwordAndShield',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2036,-15.0,0.0,170,0,0,0,0,'Ice',10.0,4.0,'Mincing Blade I',5.0,'None',0.0,3,20.0,0,NULL,'Affinity Boost I/Ice Boost I/Brutal Strike','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2037,-20.0,5.0,220,2,1,0,0,'Fire',21.0,10.0,'Gnashing Flammensucher',20.0,'None',0.0,6,25.0,0,NULL,'Affinity Boost III/Fire Boost III/Brutal Strike','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2038,-20.0,4.0,210,3,1,0,0,'Fire',18.0,5.0,'Flammensucher II',25.0,'None',0.0,6,25.0,0,NULL,'Affinity Boost I/Fire Boost III/Brutal Strike','SwordAndShield',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2039,-20.0,3.0,200,2,1,0,0,'Fire',15.0,10.0,'Flammensucher I',20.0,'None',0.0,5,25.0,0,NULL,'Affinity Boost I/Fire Boost II/Brutal Strike','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2040,0.0,2.0,180,1,1,1,25,'None',0.0,12.0,'Cocky Comrades',3.0,'None',0.0,5,30.0,0,NULL,'Defense Boost II/Small Monster Exploit/Spiribird Doubled','SwordAndShield',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2041,0.0,0.0,150,0,0,0,20,'None',0.0,10.0,'Brash Buddies II',5.0,'None',0.0,3,20.0,0,NULL,'Defense Boost II/Small Monster Exploit/Spiribird Doubled','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2042,0.0,0.0,100,0,0,0,20,'None',0.0,0.0,'Brash Buddies I',5.0,'None',0.0,2,20.0,0,NULL,'Defense Boost I/Small Monster Exploit/Spiribird Doubled','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2043,-5.0,10.0,230,0,0,0,0,'None',0.0,25.0,'Spiked Bat',10.0,'None',0.0,6,5.0,0,NULL,'Affinity Boost III/Defense Boost II/Small Monster Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2044,-5.0,5.0,220,0,0,0,0,'None',0.0,25.0,'Studded Club II',15.0,'None',0.0,6,10.0,0,NULL,'Affinity Boost II/Defense Boost II/Small Monster Exploit','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2045,-5.0,0.0,160,0,0,0,0,'None',0.0,20.0,'Studded Club I',5.0,'None',0.0,3,10.0,0,NULL,'Affinity Boost I/Defense Boost II/Small Monster Exploit','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2046,-20.0,3.0,200,1,1,0,0,'None',0.0,7.0,'Barroth Club',7.0,'None',0.0,5,10.0,0,NULL,'Affinity Boost II/Defense Boost II/Brutal Strike','SwordAndShield',0.0,45.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2047,-20.0,0.0,150,0,0,0,0,'None',0.0,5.0,'Carapace Mace II',10.0,'None',0.0,3,10.0,0,NULL,'Affinity Boost I/Defense Boost II/Brutal Strike','SwordAndShield',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2048,-20.0,0.0,120,0,0,0,0,'None',0.0,0.0,'Carapace Mace I',15.0,'None',0.0,2,10.0,0,NULL,'Affinity Boost I/Defense Boost I/Brutal Strike','SwordAndShield',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2049,-25.0,5.0,230,3,0,0,0,'None',0.0,5.0,'Ragdos Tabar',25.0,'None',0.0,6,25.0,0,NULL,'Affinity Boost IV/Burtal Strike/Anti-Aquatic Species','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2050,-15.0,4.0,220,2,0,0,0,'Ice',11.0,5.0,'Mincing Blade II',4.0,'None',0.0,6,20.0,0,NULL,'Affinity Boost I/Ice Boost II/Brutal Strike','SwordAndShield',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2051,0.0,0.0,100,0,0,0,0,'Thunder',15.0,8.0,'Secta Nulo Yellow I',5.0,'None',0.0,2,30.0,0,NULL,'Defense Boost III/Element Exploit/Silkbind Boost','SwordAndShield',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2052,0.0,8.0,170,3,3,0,0,'Thunder',23.0,20.0,'Secta Unu Yellow',4.0,'None',0.0,5,35.0,0,NULL,'Defense Boost II/Element Exploit/Silkbind Boost','SwordAndShield',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2053,0.0,0.0,80,0,0,0,0,'Fire',11.0,4.0,'Secta Nulo Red I',5.0,'None',0.0,1,20.0,0,NULL,'Attack Boost I/Fire Boost I/Small Monster Exploit','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2054,0.0,8.0,190,0,0,0,0,'Blast',39.0,10.0,'Teostra''s Emblem',8.0,'None',0.0,7,30.0,0,NULL,'Attack Boost III/Fireblight Exploit/Teostra Soul','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2055,10.0,10.0,180,1,0,0,0,'Ice',36.0,8.0,'Daora''s Razor',30.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Affinity Boost III/Kushala Daora Soul','SwordAndShield',2.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2056,-10.0,2.0,220,3,0,0,0,'Thunder',19.0,20.0,'Banned Rajang Club',15.0,'None',0.0,7,15.0,0,NULL,'Affinity Boost II/Thunder Boost II/Dulling Strike','SwordAndShield',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2057,0.0,12.0,190,0,0,0,0,'Thunder',35.0,8.0,'Abyssal Storm Shredder',3.0,'None',0.0,7,2.0,0,NULL,'Attack Boost III/Anti-Aerial Species/Narwa Soul','SwordAndShield',0.0,50.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2058,0.0,25.0,210,0,0,0,0,'Dragon15',0.0,12.0,'Abyssal Gale Shredder',5.0,'None',0.0,7,5.0,0,NULL,'Dragon Boost IV/Anti-Aerial Species/Ibushi Soul','SwordAndShield',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2059,0.0,0.0,170,2,0,0,0,'Dragon32',0.0,0.0,'Redwing Swiftblade I',0.0,'None',0.0,6,30.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','SwordAndShield',15.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2060,0.0,10.0,200,0,0,0,0,'None',0.0,15.0,'Rampage Sword V
',20.0,'None',0.0,6,15.0,0,NULL,'Any','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2061,0.0,5.0,190,0,0,0,0,'None',0.0,5.0,'Rampage Sword IV',15.0,'None',0.0,6,8.0,0,NULL,'Any','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2062,0.0,5.0,180,0,0,0,0,'None',0.0,7.0,'Rampage Sword III',15.0,'None',0.0,5,7.0,0,NULL,'Any','SwordAndShield',0.0,19.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2063,0.0,0.0,170,0,0,0,0,'None',0.0,6.0,'Rampage Sword II',15.0,'None',0.0,5,10.0,0,NULL,'Any','SwordAndShield',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2064,0.0,0.0,150,0,0,0,0,'None',0.0,2.0,'Rampage Sword I',15.0,'None',0.0,4,12.0,0,NULL,'Any','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2065,100.0,0.0,200,1,1,1,0,'None',0.0,60.0,'Hi Ninja Sword',5.0,'None',0.0,7,2.0,0,NULL,'Silkbind Boost/Master Rider/Spiribird Doubled','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2066,50.0,0.0,190,1,1,1,0,'None',0.0,45.0,'Ninja Sword I',5.0,'None',0.0,6,2.0,0,NULL,'Silkbind Boost/Master Rider/Spiribird Doubled','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2067,0.0,0.0,130,3,0,0,0,'Paralysis',33.0,15.0,'Catburglar',20.0,'None',0.0,4,10.0,0,NULL,'Attack Boost IV/Master Rider/Buddy Rally','SwordAndShield',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2068,0.0,0.0,100,0,0,0,0,'Paralysis',26.0,0.0,'Catspaw II',20.0,'None',0.0,3,10.0,0,NULL,'Attack Boost III/Master Rider/Buddy Rally','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2069,0.0,0.0,80,0,0,0,0,'Paralysis',15.0,0.0,'Catspaw I',20.0,'None',0.0,1,10.0,0,NULL,'Attack Boost II/Master Rider/Buddy Rally','SwordAndShield',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2070,0.0,0.0,180,3,0,0,20,'Sleep',19.0,10.0,'Waking Nightmare',10.0,'None',0.0,5,5.0,0,NULL,'Defense Boost III/Sleep Boost II/Anti-Aquatic Species','SwordAndShield',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2071,0.0,0.0,90,0,0,0,0,'Fire',13.0,10.0,'Secta Nulo Red II',5.0,'None',0.0,2,25.0,0,NULL,'Attack Boost II/Fire Boost II/Small Monster Exploit','SwordAndShield',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2072,0.0,8.0,140,3,1,0,0,'Fire',19.0,10.0,'Secta Unu Red',5.0,'None',0.0,4,30.0,0,NULL,'Attack Boost III/Fire Boost III/Dragon Exploit','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2073,0.0,5.0,130,0,0,0,0,'Blast',13.0,10.0,'Sinister Sword I',5.0,'None',0.0,3,30.0,0,NULL,'Attack Boost II/Blast Boost I/Magnamalo Soul','SwordAndShield',0.0,4.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2074,0.0,0.0,140,0,0,0,0,'Blast',18.0,17.0,'Sinister Sword II',4.0,'None',0.0,3,35.0,0,NULL,'Attack Boost III/Blast Boost I/Magnamalo Soul','SwordAndShield',0.0,6.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2075,0.0,0.0,200,3,1,0,0,'Blast26',0.0,8.0,'Sinister Shadekeeper',4.0,'None',0.0,6,40.0,0,NULL,'Attack Boost III/Blast Boost II/Magnamalo Soul','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2076,-20.0,0.0,200,0,0,0,0,'Thunder',11.0,15.0,'Rajang Club I',5.0,'None',0.0,5,10.0,0,NULL,'Affinity Boost I/Thunder Boost I/Dulling Strike','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2077,-25.0,0.0,190,2,0,0,0,'None',0.0,5.0,'Bone Tabar II',15.0,'None',0.0,4,20.0,0,NULL,'Affinity Boost III/Brutal Strike/Anti-Aquatic Species','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2078,-15.0,0.0,210,3,0,0,0,'Thunder',17.0,0.0,'Rajang Club II',4.0,'None',0.0,6,3.0,0,NULL,'Affinity Boost I/Thunder Boost II/Dulling Strike','SwordAndShield',0.0,23.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2079,0.0,20.0,190,0,0,0,0,'Dragon12',0.0,5.0,'Azure Elder Sword II',2.0,'None',0.0,6,3.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Ibushi Soul','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2080,0.0,7.0,180,0,0,0,0,'Thunder',33.0,5.0,'Thunderbolt Sword I',3.0,'None',0.0,6,2.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Narwa Soul','SwordAndShield',0.0,40.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2081,5.0,12.0,170,1,0,0,0,'Ice',31.0,18.0,'Icesteel Dagger I
',25.0,'None',0.0,6,18.0,0,NULL,'Attack Boost II/Affinity Boost II/Kushala Daora Soul','SwordAndShield',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2082,0.0,10.0,180,0,0,0,0,'Blast',36.0,15.0,'Teostra''s Spada I',5.0,'None',0.0,6,35.0,0,NULL,'Attack Boost II/Fireblight Exploit/Teostra Soul','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2083,0.0,0.0,100,0,0,0,16,'Sleep',11.0,0.0,'Sleepy Shellsword I',12.0,'None',0.0,2,7.0,0,NULL,'Defense Boost I/Sleep Boost I/Anti-Aquatic Species','SwordAndShield',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2084,0.0,0.0,150,0,0,0,18,'Sleep',15.0,4.0,'Sleepy Shellsword II',15.0,'None',0.0,3,7.0,0,NULL,'Defense Boost II/Sleep Boost I/Anti-Aquatic Species','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2085,0.0,0.0,170,0,0,0,0,'Dragon10',0.0,17.0,'Azure Elder Sword I',5.0,'None',0.0,5,4.0,0,NULL,'Dragon Boost III/Anti-Aerial Species/Defense Boost','SwordAndShield',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2086,-25.0,0.0,160,0,0,0,0,'None',0.0,0.0,'Bone Tabar I',15.0,'None',0.0,3,20.0,0,NULL,'Affinity Boost II/Brutal Strike/Anti-Aquatic Species','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2087,10.0,9.0,220,0,0,0,0,'Poison',28.0,18.0,'Queen Rapier',10.0,'None',0.0,6,23.0,0,NULL,'Attack Boost II/Poison Boost II/Small Monster Exploit','SwordAndShield',0.0,28.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2088,10.0,5.0,210,0,0,0,0,'Poison',24.0,15.0,'Princess Rapier II',5.0,'None',0.0,6,20.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','SwordAndShield',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2089,0.0,0.0,100,0,0,0,0,'None',0.0,0.0,'Hunter''s Knife II',8.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','SwordAndShield',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2090,0.0,0.0,80,0,0,0,0,'None',0.0,0.0,'Hunter''s Knife I',15.0,'None',0.0,1,15.0,0,NULL,'Attack Boost I/Affinity Boost I/Defense Boost II','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2091,0.0,5.0,150,1,1,1,0,'Ice',30.0,14.0,'Hi Frost Edge',10.0,'None',0.0,5,4.0,0,NULL,'Attack Boost III/Dulling Strike/Element Exploit','SwordAndShield',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2092,0.0,0.0,80,0,0,0,0,'Ice',24.0,3.0,'Frost Edge II',15.0,'None',0.0,2,5.0,0,NULL,'Attack Boost I/Dulling Strike/Element Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2093,0.0,0.0,80,0,0,0,0,'Ice',18.0,0.0,'Frost Edge I',20.0,'None',0.0,1,6.0,0,NULL,'Attack Boost I/Dulling Strike/Element Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2094,-15.0,17.0,220,0,0,0,0,'None',0.0,22.0,'Tigrex Sword',12.0,'None',0.0,6,17.0,0,NULL,'Attack Boost III/Affinity Boost II/Brutal Strike','SwordAndShield',10.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2095,-15.0,5.0,210,0,0,0,0,'None',0.0,20.0,'Rex Talon II',8.0,'None',0.0,6,8.0,0,NULL,'Attack Boost II/Affinity Boost II/Brutal Strike','SwordAndShield',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2096,-20.0,2.0,160,0,0,0,0,'None',0.0,15.0,'Rex Talon I',6.0,'None',0.0,3,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Brutal Strike','SwordAndShield',0.0,22.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2097,0.0,3.0,160,0,0,0,0,'Water',27.0,10.0,'Royal Ludroth Claw',7.0,'None',0.0,5,11.0,0,NULL,'Attack Boost III/Water Boost II/Waterblight Exploit','SwordAndShield',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2098,0.0,0.0,100,0,0,0,0,'Water',20.0,8.0,'Royal Claw II',11.0,'None',0.0,2,7.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2099,0.0,0.0,90,0,0,0,0,'Water',18.0,5.0,'Royal Claw I',6.0,'None',0.0,2,7.0,0,NULL,'Attack Boost II/Water Boost I/Waterblight Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2100,0.0,0.0,140,1,1,0,0,'Poison',34.0,12.0,'Dirty Marquis',10.0,'None',0.0,4,25.0,0,NULL,'Affinity Boost II/Poison Boost II/Buddy Rally','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2101,0.0,0.0,110,0,0,0,0,'Poison',23.0,5.0,'Dirty Baron II',7.0,'None',0.0,3,25.0,0,NULL,'Affinity Boost II/Poison Boost I/Buddy Rally','SwordAndShield',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2102,0.0,0.0,90,0,0,0,0,'Poison',17.0,3.0,'Dirty Baron I',7.0,'None',0.0,2,18.0,0,NULL,'Affinity Boost I/Poison Boost I/Buddy Rally','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2103,0.0,9.0,200,1,1,0,0,'Thunder',27.0,18.0,'Despot''s Crookbolt',5.0,'None',0.0,6,15.0,0,NULL,'Attack Boost II/Thunder Boost II/Anti-Aquatic Species','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2104,0.0,6.0,180,1,1,0,0,'Thunder',24.0,15.0,'Usurper''s Firebolt II',5.0,'None',0.0,5,13.0,0,NULL,'Attack Boost II/Thunder Boost I/Anti-Aquatic Species','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2105,0.0,0.0,120,0,0,0,0,'Thunder',15.0,8.0,'Usurper''s Firebolt I',6.0,'None',0.0,3,14.0,0,NULL,'Attack Boost I/Thunder Boost I/Anti-Aquatic Species','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2106,0.0,0.0,60,0,0,0,0,'None',0.0,0.0,'Kamura Sword II',15.0,'None',0.0,1,11.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost I','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2107,0.0,0.0,90,0,0,0,0,'None',0.0,5.0,'Kamura Sword III',15.0,'None',0.0,2,11.0,0,NULL,'Attack Boost I/Affinity Boost II/Defense Boost II','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2108,0.0,4.0,140,0,0,0,0,'None',0.0,4.0,'Kamura Sword IV',14.0,'None',0.0,3,7.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost II','SwordAndShield',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2109,0.0,4.0,150,2,0,0,0,'None',0.0,5.0,'Kamura Sword V',16.0,'None',0.0,4,10.0,0,NULL,'Attack Boost III/Defense Boost II/Master Rider','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2110,0.0,8.0,190,1,2,0,0,'None',0.0,10.0,'Kamura Niuja Sword',20.0,'None',0.0,5,5.0,0,NULL,'Affinity Boost IV/Defense Boost II/Master Rider','SwordAndShield',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2111,30.0,0.0,120,0,0,0,0,'None',0.0,20.0,'Hidden Edge I',15.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Affinity Boost I/Master Rider','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2112,0.0,0.0,110,0,0,0,0,'None',0.0,2.0,'Fighter Sword',10.0,'None',0.0,2,10.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost II','SwordAndShield',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2113,30.0,8.0,170,2,0,0,0,'None',0.0,20.0,'Hidden Edge II',5.0,'None',0.0,5,20.0,0,NULL,'Attack Boost III/Affinity Boost I/Master Rider','SwordAndShield',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2114,15.0,0.0,110,0,0,0,0,'Water',15.0,15.0,'Hana no Nagoriwo I',9.0,'None',0.0,3,22.0,0,NULL,'Attack Boost II/Affinity Boost I/Water Boost I','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2115,15.0,9.0,170,1,0,0,0,'Water',17.0,10.0,'Hana no Nagoriwo II',20.0,'None',0.0,5,22.0,0,NULL,'Attack Boost II/Affinity Boost II/Water Boost II','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2116,15.0,13.0,190,1,0,0,0,'Water',19.0,8.0,'Kurenawi Ougi',15.0,'None',0.0,6,21.0,0,NULL,'Attack Boost III/Affinity Boost II/Water Boost II','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2117,0.0,0.0,120,0,0,0,0,'None',0.0,7.0,'Exorcising Sword I',30.0,'None',0.0,2,4.0,0,NULL,'Attack Boost I/Anti-Aerial Species/Silkbind Boost','SwordAndShield',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2118,0.0,0.0,180,3,0,0,0,'None',0.0,4.0,'Exorcising Sword II',12.0,'None',0.0,5,40.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Silkbind Boost','SwordAndShield',0.0,5.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2119,0.0,8.0,190,3,0,0,0,'None',0.0,5.0,'Shaucha Pureblade',37.0,'None',0.0,6,5.0,0,NULL,'Attack Boost II/Anti-Aerial Species/Silkbind Boost','SwordAndShield',0.0,16.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2120,30.0,12.0,180,2,0,0,0,'None',0.0,16.0,'Flash in the Night',9.0,'None',0.0,6,17.0,0,NULL,'Attack Boost III/Affinity Boost II/Master Rider','SwordAndShield',5.0,27.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2121,0.0,0.0,170,2,0,0,0,'Dragon',32.0,0.0,'Vermilion Orgul',0.0,'None',0.0,7,15.0,0,NULL,'Attack Boost III/Wyvern Exploit/Valstrax Soul','SwordAndShield',20.0,0.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2122,0.0,0.0,140,0,0,0,0,'None',0.0,3.0,'Iron Beater I',10.0,'None',0.0,3,10.0,0,NULL,'Attack Boost II/Defense Boost II/Silkbind Boost','SwordAndShield',0.0,14.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2123,0.0,5.0,200,1,0,0,0,'None',0.0,12.0,'Smithy''s Pride',20.0,'None',0.0,5,15.0,0,NULL,'Attack Boost III/Defense Boost III/Silkbind Boost','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2124,10.0,0.0,180,0,0,0,0,'Poison',14.0,15.0,'Princess Rapier I',15.0,'None',0.0,5,10.0,0,NULL,'Attack Boost II/Poison Boost I/Small Monster Exploit','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2125,0.0,0.0,190,0,0,0,0,'None',0.0,10.0,'Grand Barong',14.0,'None',0.0,5,14.0,0,NULL,'Attack Boost IV/Affinity Boost II/Dulling Strike','SwordAndShield',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2126,0.0,0.0,180,0,0,0,0,'None',0.0,5.0,'Bone Barong II',20.0,'None',0.0,4,22.0,0,NULL,'Attack Boost III/Affinity Boost II/Dulling Strike','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2127,0.0,0.0,150,0,0,0,0,'None',0.0,0.0,'Bone Barong I',15.0,'None',0.0,3,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Dulling Strike','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2128,0.0,0.0,130,0,0,0,0,'None',0.0,0.0,'Chief Kukri',20.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Affinity Boost II/Defense Boost I','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2129,0.0,0.0,110,0,0,0,0,'None',0.0,0.0,'Bone Kukri II',15.0,'None',0.0,1,15.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2130,0.0,0.0,90,0,0,0,0,'None',0.0,0.0,'Bone Kukri I',18.0,'None',0.0,1,12.0,0,NULL,'Attack Boost II/Affinity Boost I/Defense Boost I','SwordAndShield',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2131,0.0,3.0,140,1,1,0,0,'Sleep',26.0,12.0,'Morpheus Knife',10.0,'None',0.0,4,20.0,0,NULL,'Affinity Boost II/Sleep Boost II/Buddy Rally','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2132,0.0,0.0,90,0,0,0,0,'Sleep',23.0,7.0,'Hypnos Knife II',10.0,'None',0.0,2,20.0,0,NULL,'Affinity Boost II/Sleep Boost I/Buddy Rally','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2133,0.0,0.0,80,0,0,0,0,'Sleep',12.0,2.0,'Hypnos Knife I',10.0,'None',0.0,1,15.0,0,NULL,'Affinity Boost I/Sleep Boost I/Buddy Rally','SwordAndShield',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2134,15.0,0.0,140,1,2,0,0,'Thunder',30.0,10.0,'Painful Razor',10.0,'None',0.0,4,20.0,0,NULL,'Attack Boost IV/Thunder Boost II/Thunderblight Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2135,10.0,0.0,100,0,0,0,0,'Thunder',22.0,7.0,'Khezu Razor II',10.0,'None',0.0,2,20.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2136,10.0,0.0,80,0,0,0,0,'Thunder',21.0,2.0,'Khezu Razor I',10.0,'None',0.0,2,15.0,0,NULL,'Attack Boost II/Thunder Boost I/Thunderblight Exploit','SwordAndShield',0.0,8.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2137,0.0,0.0,160,2,0,0,20,'Water',13.0,15.0,'Guard Breaker',14.0,'None',0.0,4,5.0,0,NULL,'Defense Boost I/Water Boost III/Dulling Strike','SwordAndShield',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2138,0.0,0.0,150,0,0,0,10,'Water',11.0,7.0,'Cunning Riposte II',15.0,'None',0.0,3,5.0,0,NULL,'Defense Boost I/Water Boost II/Dulling Strike','SwordAndShield',0.0,25.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2139,0.0,0.0,100,0,0,0,10,'Water',8.0,3.0,'Cunning Riposte I',15.0,'None',0.0,2,5.0,0,NULL,'Defense Boost I/Water Boost I/Dulling Strike','SwordAndShield',0.0,17.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2140,35.0,13.0,160,1,2,0,0,'Ice',20.0,15.0,'Nardebosche',15.0,'None',0.0,5,10.0,0,NULL,'Attack Boost IV/Affinity Boost II/Iceblight Exploit','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2141,0.0,0.0,190,1,0,0,0,'None',0.0,11.0,'Soldier''s Dagger I',10.0,'None',0.0,5,30.0,0,NULL,'Affinity Boost II/Defense Boost III/Dulling Strike','SwordAndShield',0.0,10.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2142,0.0,0.0,200,1,1,0,0,'None',0.0,15.0,'Soldier''s Dagger II',10.0,'None',0.0,5,35.0,0,NULL,'Affinity Boost II/Defense Boost III/Dulling Strike','SwordAndShield',0.0,13.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2143,0.0,0.0,220,1,1,0,0,'None',0.0,15.0,'Commander''s Dagger',10.0,'None',0.0,6,35.0,0,NULL,'Affinity Boost III/Defense Boost III/Dulling Strike','SwordAndShield',0.0,9.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2144,0.0,3.0,140,2,0,0,0,'Water',24.0,10.0,'Odyssey Blade I',20.0,'None',0.0,4,20.0,0,NULL,'Defense Boost II/Dragon Exploit/Element Exploit','SwordAndShield',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2145,0.0,5.0,160,3,0,0,0,'Water',25.0,9.0,'Odyssey Blade II',20.0,'None',0.0,5,20.0,0,NULL,'Defense Boost II/Dragon Exploit/Element Exploit','SwordAndShield',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2146,0.0,8.0,170,3,0,0,0,'Water',33.0,10.0,'Master Odyssey',20.0,'None',0.0,6,20.0,0,NULL,'Defense Boost III/Dragon Exploit/Element Exploit','SwordAndShield',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2147,0.0,4.0,170,1,0,0,0,'None',0.0,7.0,'Iron Beater II',16.0,'None',0.0,4,14.0,0,NULL,'Attack Boost II/Defense Boost III/Silkbind Boost','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2148,0.0,0.0,110,0,0,0,0,'Poison',15.0,7.0,'Pukei Sword I',9.0,'None',0.0,2,25.0,0,NULL,'Attack Boost II/Defense Boost I/Poison Boost I','SwordAndShield',0.0,12.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2149,0.0,5.0,180,1,3,0,0,'Poison',30.0,18.0,'Venomedge',10.0,'None',0.0,6,20.0,0,NULL,'Attack Boost III/Defense Boost II/Poison Boost II','SwordAndShield',0.0,18.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2150,0.0,0.0,120,0,0,0,0,'Fire',18.0,10.0,'Djinn I',20.0,'None',0.0,3,5.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2151,0.0,8.0,190,0,0,0,0,'Fire',23.0,10.0,'Djinn II',15.0,'None',0.0,5,15.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','SwordAndShield',0.0,20.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2152,0.0,15.0,200,0,0,0,0,'Fire',33.0,25.0,'Blazing Falchion',10.0,'None',0.0,6,10.0,0,NULL,'Attack Boost II/Fire Boost I/Element Exploit','SwordAndShield',0.0,30.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2153,30.0,0.0,90,0,0,0,0,'Ice',12.0,15.0,'Icicle Spike I',10.0,'None',0.0,2,5.0,0,NULL,'Attack Boost II/Affinity Boost II/Iceblight Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2154,30.0,3.0,120,0,0,0,0,'Ice',15.0,20.0,'Icicle Spike II',14.0,'None',0.0,3,5.0,0,NULL,'Attack Boost III/Affinity Boost II/Iceblight Exploit','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2155,0.0,5.0,170,1,2,0,0,'Poison',22.0,15.0,'Pukei Sword II',11.0,'None',0.0,5,11.0,0,NULL,'Attack Boost III/Defense Boost I/Poison Boost II','SwordAndShield',0.0,15.0,NULL,NULL,NULL);
INSERT INTO "Weapons" VALUES (2156,0.0,8.0,210,0,0,0,0,'None',0.0,15.0,'Rampage Sword S',15.0,'None',0.0,7,10.0,0,NULL,'Any','SwordAndShield',0.0,7.0,NULL,NULL,NULL);
INSERT INTO "Updates" VALUES (5,'Version 3.0 Update','Armor/Weapon/Skills updated for v3.0','22 June 2021');
INSERT INTO "AspNetUsers" VALUES ('1428653f-87a4-41d2-a7a3-d81441dd80c5','MHBuilderDev','MHBuilderDev','MHBUILDERDEV',NULL,NULL,0,'AQAAAAEAACcQAAAAEDhOpKNWD9l/rF+yy5GQ16joHGTJwARbtzgR2tie3gXx0FMwqAh0TJ1Hw/x8e9KwUQ==','SJXMUPOFVO5QQICZMN4LYTJSBPX3DA3D','2799560f-e831-4283-888c-854fa0b049fd',NULL,0,0,NULL,1,0);
INSERT INTO "Bulletins" VALUES (3,'In the beginning...','Hello everyone! I just want to welcome you to my MH Rise set builder, this is a personal project that I have been working on and I do hope that it helps you create sets to achieve the maximum deeps. There will be updates coming to the site in the future, and feel free to inform me of any bugs or features that you might want to see in the future! 

Happy hunts!','05 July 2021');
CREATE INDEX IF NOT EXISTS "IX_Decorations_SkillId" ON "Decorations" (
	"SkillId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetRoleClaims_RoleId" ON "AspNetRoleClaims" (
	"RoleId"
);
CREATE UNIQUE INDEX IF NOT EXISTS "RoleNameIndex" ON "AspNetRoles" (
	"NormalizedName"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserClaims_UserId" ON "AspNetUserClaims" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserLogins_UserId" ON "AspNetUserLogins" (
	"UserId"
);
CREATE INDEX IF NOT EXISTS "IX_AspNetUserRoles_RoleId" ON "AspNetUserRoles" (
	"RoleId"
);
CREATE INDEX IF NOT EXISTS "EmailIndex" ON "AspNetUsers" (
	"NormalizedEmail"
);
CREATE UNIQUE INDEX IF NOT EXISTS "UserNameIndex" ON "AspNetUsers" (
	"NormalizedUserName"
);
COMMIT;
