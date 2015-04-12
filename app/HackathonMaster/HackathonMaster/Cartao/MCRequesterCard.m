//
//  MCRequesterCard.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MCRequesterCard.h"

@implementation MCRequesterCard

-(void)addCardWithSucessBlock:(Cartao *)card successBlock:(void (^)())successBlock errorBlock:(void (^)(NSError *error))errorBlock {
    
    NSDictionary *data = [[NSDictionary alloc]init];
    data = @{ @"UserId": card.userID, @"Numero": card.cardNumber, @"Ano": card.cardYear, @"Mes": card.cardMonth, @"Cvc": card.cardCvC};
    
    [self performRequestWithoutMappingWithParams:data method:MCRequestersMethodPOST path:POST_CARD withSuccesBlock:^(id responseObject) {
        if (successBlock) {
            successBlock();
            NSLog(@"%@", responseObject);
            NSArray * myNewArray = [NSArray arrayWithObjects:responseObject, nil];
            NSLog(@"%@", [myNewArray objectAtIndex:0]);
        }
    } andErrorBlock:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

@end
