//
//  LoginUser.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "LoginUser.h"
#import "DSMappedEntity.h"

@implementation LoginUser

+ (RKObjectMapping *) mappingForEntity {
    RKObjectMapping *postMapping = [RKObjectMapping mappingForClass:[LoginUser class]];
    [postMapping addAttributeMappingsFromDictionary:@{
                                                      @"Id"  : @"userID",
                                                      @"UserName"  : @"userName",
                                                      @"Password"  : @"userPass",
                                                      }];
    return postMapping;
}
@end
