//
//  CadastroViewController.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardIO.h"
#import "MCRequesterLogin.h"

@interface CadastroViewController : UIViewController<CardIOPaymentViewControllerDelegate>{
    NSDictionary *cartao;
}
- (IBAction)scanCard:(id)sender;
- (IBAction)cadastrar:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *scanImage;
@property (strong, nonatomic) IBOutlet UIButton *scanButton;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *confirmPassword;

@property (strong, nonatomic) IBOutlet UIView *parteUm;
@property (strong, nonatomic) IBOutlet UITextField *username;

@property (strong, nonatomic) IBOutlet UIView *parteDois;
@end
