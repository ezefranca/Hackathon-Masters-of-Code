//
//  Cartao.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSMappedEntity.h"

@interface Cartao : NSObject <DSMappedEntity>

@property(strong, nonatomic) NSString *userID;
@property(strong, nonatomic) NSString *cardNumber;
@property(strong, nonatomic) NSString *cardYear;
@property(strong, nonatomic) NSString *cardMonth;
@property(strong, nonatomic) NSString *cardCvC;

@property(strong, nonatomic) NSString *responseID;
@property(strong, nonatomic) NSString *responseToken;



@end
