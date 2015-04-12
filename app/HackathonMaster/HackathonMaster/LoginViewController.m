//
//  LoginViewController.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Cartao *card = [[Cartao alloc]init];
    card.userID = @"3";
    card.cardNumber = @"5105105105105100";
    card.cardYear = @"19";
    card.cardMonth = @"12";
    card.cardCvC = @"123";
    

    
    [MCRequesterCard.new addCardWithSucessBlock:card successBlock:^{
        NSLog(@"ENVIADO");
    } errorBlock:^(NSError *error) {
        NSLog(@"ERROR");
    }];
    
//    {
//    UserId:3,
//    Numero: "5105105105105100",
//    Ano: 19,
//    Mes:12,
//    Cvc:"123"
//    }
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)didClickLogin:(id)sender {
}
- (IBAction)didClickSignIn:(id)sender {
}
@end
