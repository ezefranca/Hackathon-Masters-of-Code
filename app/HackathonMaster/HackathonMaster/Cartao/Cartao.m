//
//  Cartao.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "Cartao.h"
#import "DSMappedEntity.h"

@implementation Cartao

+ (RKObjectMapping *) mappingForEntity {
    RKObjectMapping *postMapping = [RKObjectMapping mappingForClass:[Cartao class]];
    [postMapping addAttributeMappingsFromDictionary:@{
                                                      @"UserId"  : @"userID",
                                                      @"Numero"  : @"cardNumber",
                                                      @"Ano"  : @"cardYear",
                                                      @"Mes"  : @"cardMonth",
                                                      @"Cvc"  : @"cardCvc",
                                                      }];
    return postMapping;
}

@end
