namespace HackAPI.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class removecard : DbMigration
    {
        public override void Up()
        {
            DropForeignKey("dbo.Cartaos", "Dono_Id", "dbo.Cadastroes");
            DropForeignKey("dbo.Pedidoes", "Cartao_Id", "dbo.Cartaos");
            DropIndex("dbo.Cartaos", new[] { "Dono_Id" });
            DropIndex("dbo.Pedidoes", new[] { "Cartao_Id" });
            DropColumn("dbo.Pedidoes", "Cartao_Id");
            DropTable("dbo.Cartaos");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.Cartaos",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Token = c.String(),
                        Dono_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id);
            
            AddColumn("dbo.Pedidoes", "Cartao_Id", c => c.Int());
            CreateIndex("dbo.Pedidoes", "Cartao_Id");
            CreateIndex("dbo.Cartaos", "Dono_Id");
            AddForeignKey("dbo.Pedidoes", "Cartao_Id", "dbo.Cartaos", "Id");
            AddForeignKey("dbo.Cartaos", "Dono_Id", "dbo.Cadastroes", "Id");
        }
    }
}
