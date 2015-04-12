//
//  DSMappedEntity.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RKObjectMapping.h"
@protocol DSMappedEntity <NSObject>
@required
+ (RKObjectMapping *) mappingForEntity;
@optional
- (NSDictionary *)parametersForEntity;
@end
