//
//  FirstViewController.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "FirstViewController.h"
#import "MCRequesterLogin.h"
#import "LoginUser.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LoginUser* user = [[LoginUser alloc]init];
    
    user.userName = @"rodolfof";
    user.userPass = @"123123";
    

    [MCRequesterLogin.new loginWithSuccessBlock: user
                                   successBlock:^(NSArray *results) {
                                       NSLog(@"SUCESSO NO LOGIN");
                                   } errorBlock:^(NSError *error) {
                                       NSLog(@"ERRO!!!");
                                   }];
    
    user.userName = @"humberto";
    user.userPass = @"123123";
    
    [MCRequesterLogin.new signInWithSucessBlock:user successBlock:^{
        NSLog(@"Cadastrado com sucesso");
    } errorBlock:^(NSError *error) {
        NSLog(@"Erro ao cadastrar %@", error);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
