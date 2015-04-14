//
//  HistoricoViewController.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "HistoricoViewController.h"

@interface HistoricoViewController ()

@end

@implementation HistoricoViewController

-(void)loadView{
    Invoice *invoice = [[Invoice alloc]init];
    self.postagem = [[NSMutableArray alloc]initWithArray:nil];
    [MCRequesterInvoice.new listInvoiceWithSuccessBlock:invoice successBlock:^(NSArray *results) {
        NSLog(@"Retornou o historico %@", results);
        [_postagem addObjectsFromArray:results];
        [_tableView reloadData];
    } errorBlock:^(NSError *error) {
        NSLog(@"Erro ao carregar o historico %@", error);
    }];
    [super loadView];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{

}

#pragma mark DELEGATE TABLE VIEW
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     if ([_postagem count] > 0)
         return [_postagem count];
     return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"HistoricoCell";
    HistoricoCell *cell = (HistoricoCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (([_postagem count] > 0) && (indexPath.row < [_postagem count])) {
        NSLog(@"%@",[_postagem objectAtIndex:indexPath.row]);
        Produtos *produto = [_postagem objectAtIndex:indexPath.row];
        NSString *img = produto.imagem;
        NSString *imgURL = [img stringByReplacingOccurrencesOfString:@" " withString:@""];
        [cell.imagem sd_setImageWithURL:[NSURL URLWithString:imgURL]
                       placeholderImage:[UIImage imageNamed:@"avatar"]
                                options:SDWebImageRetryFailed];
        cell.titulo.text = produto.nome;
        cell.preco.text = produto.preco;
        cell.quantidade.text = produto.quantidade;

    
    }
    if(!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"HistoricoCell" owner:nil options:nil] firstObject];
        cell.selectionStyle = UITableViewCellSeparatorStyleSingleLine;
        //cell.accessoryView = tableViewAcessory;
        
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
