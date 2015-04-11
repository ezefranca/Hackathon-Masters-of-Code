//
//  MCRequesterLogin.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MCRequesters.h"
#import "Usuario.h"
#import "LoginUser.h"

#define GET_LOGIN @"http://masterof.azurewebsites.net/api/User/Login?UserName=%@&password=%@"
#define POST_CADASTRO @"http://masterof.azurewebsites.net/api/User/Cadastro"

@interface MCRequesterLogin : MCRequesters

-(void)loginWithSuccessBlock:(LoginUser *)usuario successBlock:(void (^)(NSArray *results))successBlock errorBlock:(void (^)(NSError *error))errorBlock  ;

-(void)signInWithSucessBlock:(LoginUser *)newUser successBlock:(void (^)())successBlock errorBlock:(void (^)(NSError *error))errorBlock;
    

@end