//
//  MCRequesterLogin.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MCRequesterLogin.h"

@implementation MCRequesterLogin

-(void)loginWithSuccessBlock:(LoginUser *)usuario successBlock:(void (^)(NSArray *results))successBlock errorBlock:(void (^)(NSError *error))errorBlock {
    
    RKResponseDescriptor *responseDescriptor =  [RKResponseDescriptor responseDescriptorWithMapping:[LoginUser mappingForEntity]
                                                                                             method:RKRequestMethodGET
                                                                                        pathPattern:nil
                                                                                            keyPath:nil
                                                                                        statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    
    NSLog(@"USUARIO: %@ E SENHA: %@", usuario.userName, usuario.userPass);
    
    NSString *url = [NSString stringWithFormat:GET_LOGIN, usuario.userName, usuario.userPass];
    NSURLRequest *request = [self createRequestWithObject:self HTTPMethod:MCRequestersMethodGET path:url parameters:nil];
    
    RKObjectRequestOperation *op = [self createRequestOperationWithResponseDescriptors:@[responseDescriptor] andRequest:request successBlock:^(NSArray *results) {
        if (successBlock) {
            successBlock(results);
        }
    } andErrorBlock:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
    
    [self addOperationToQueue:op];
    
}

-(void)signInWithSucessBlock:(LoginUser *)newUser successBlock:(void (^)())successBlock errorBlock:(void (^)(NSError *error))errorBlock {
    
    NSDictionary *data = [[NSDictionary alloc]init];
    NSString *username = newUser.userName;
    NSString *password = newUser.userPass;
    data = @{ @"UserName": username, @"Password": password};
    
    [self performRequestWithoutMappingWithParams:data method:MCRequestersMethodPOST path:POST_CADASTRO withSuccesBlock:^(id responseObject) {
        if (successBlock) {
            successBlock();
            NSLog(@"%@", responseObject);
        }
    } andErrorBlock:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

@end
