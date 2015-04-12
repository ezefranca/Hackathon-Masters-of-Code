//
//  Usuario.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Usuario : NSObject

@property (nonatomic, retain) NSString * token;

+ (Usuario *)sharedInstance;
//Usuario atual que esta sendo trabalhado
- (Usuario *) currentUser;
@end
