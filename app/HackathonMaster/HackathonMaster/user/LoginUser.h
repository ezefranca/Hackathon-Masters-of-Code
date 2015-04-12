//
//  LoginUser.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DSMappedEntity.h"

@interface LoginUser : NSObject <DSMappedEntity>

@property(strong, nonatomic) NSString *userID;
@property(strong, nonatomic) NSString *userName;
@property(strong, nonatomic) NSString *userPass;

@end
