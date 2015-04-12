//
//  CadastroViewController.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardIO.h"

@interface CadastroViewController : UIViewController<CardIOPaymentViewControllerDelegate>
- (IBAction)scanCard:(id)sender;

@end
