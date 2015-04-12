//
//  MCNotificationRequester.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCRequesters.h"
@interface MCNotificationRequester : MCRequesters

- (void)postToken:(NSString *)token andWithSuccessBlock:(void(^)(void))successBlock andErrorBlock:(void(^)(NSError *error))errorBlock;

@end
