//
//  MCRequesterCard.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MCRequesters.h"
#import "Cartao.h"
#define POST_CARD @"http://masterof.azurewebsites.net/api/Card/Add"

@interface MCRequesterCard : MCRequesters

-(void)addCardWithSucessBlock:(Cartao *)card successBlock:(void (^)())successBlock errorBlock:(void (^)(NSError *error))errorBlock;
    
@end
