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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    Invoice *invoice = [[Invoice alloc]init];
    
    invoice.userID = @"3";
    invoice.productID = @"5";
    invoice.cardID = @"11";
    invoice.quantidade = @"1";
    
    [MCRequesterInvoice.new listInvoiceWithSuccessBlock:invoice successBlock:^(NSArray *results) {
        NSLog(@"Retornou o historico");
    } errorBlock:^(NSError *error) {
        NSLog(@"Erro ao carregar o historico %@", error);
    }];
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
