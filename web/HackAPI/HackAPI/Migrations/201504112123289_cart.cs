namespace HackAPI.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class cart : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Cartaos",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Token = c.String(),
                        Dono_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Cadastroes", t => t.Dono_Id)
                .Index(t => t.Dono_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Cartaos", "Dono_Id", "dbo.Cadastroes");
            DropIndex("dbo.Cartaos", new[] { "Dono_Id" });
            DropTable("dbo.Cartaos");
        }
    }
}
