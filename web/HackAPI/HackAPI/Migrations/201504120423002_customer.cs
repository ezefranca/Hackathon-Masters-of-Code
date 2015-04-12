namespace HackAPI.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class customer : DbMigration
    {
        public override void Up()
        {
            AddColumn("dbo.Cadastroes", "IdMaster", c => c.String());
        }
        
        public override void Down()
        {
            DropColumn("dbo.Cadastroes", "IdMaster");
        }
    }
}
