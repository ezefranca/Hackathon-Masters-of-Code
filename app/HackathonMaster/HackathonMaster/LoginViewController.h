//
//  LoginViewController.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cartao.h"
#import "MCRequesterCard.h"
#import "MCRequesterLogin.h"
#import "LoginUser.h"

@interface LoginViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *loginLabel;
@property (strong, nonatomic) IBOutlet UITextField *passLabel;



- (IBAction)didClickLogin:(id)sender;
- (IBAction)didClickSignIn:(id)sender;

@end
