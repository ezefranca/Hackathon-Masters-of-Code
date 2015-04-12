namespace HackAPI.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class invoice : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Pedidoes",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Valor = c.Decimal(nullable: false, precision: 18, scale: 2),
                        Quantidade = c.Int(nullable: false),
                        Cartao_Id = c.Int(),
                        Produto_Id = c.Int(),
                        Usuario_Id = c.Int(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.Cartaos", t => t.Cartao_Id)
                .ForeignKey("dbo.Produtoes", t => t.Produto_Id)
                .ForeignKey("dbo.Cadastroes", t => t.Usuario_Id)
                .Index(t => t.Cartao_Id)
                .Index(t => t.Produto_Id)
                .Index(t => t.Usuario_Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Pedidoes", "Usuario_Id", "dbo.Cadastroes");
            DropForeignKey("dbo.Pedidoes", "Produto_Id", "dbo.Produtoes");
            DropForeignKey("dbo.Pedidoes", "Cartao_Id", "dbo.Cartaos");
            DropIndex("dbo.Pedidoes", new[] { "Usuario_Id" });
            DropIndex("dbo.Pedidoes", new[] { "Produto_Id" });
            DropIndex("dbo.Pedidoes", new[] { "Cartao_Id" });
            DropTable("dbo.Pedidoes");
        }
    }
}
