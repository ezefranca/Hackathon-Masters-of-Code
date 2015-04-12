//
//  Invoice.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "Invoice.h"

@implementation Invoice

+ (RKObjectMapping *) mappingForEntity {
    RKObjectMapping *postMapping = [RKObjectMapping mappingForClass:[Invoice class]];
    [postMapping addAttributeMappingsFromDictionary:@{
                                                      @"UserId"  : @"userID",
                                                      @"ProductId"  : @"productID",
                                                      @"CardId"  : @"cardID",
                                                      @"Quantidade"  : @"quantidade",
                                                      }];
    return postMapping;
}



//{
//UserId:3,
//ProductId:5,
//CardId:11,
//Quantidade: 1
//}

@end
