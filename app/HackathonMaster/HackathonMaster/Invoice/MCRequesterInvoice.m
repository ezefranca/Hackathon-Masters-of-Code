//
//  MCRequesterInvoice.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MCRequesterInvoice.h"

@implementation MCRequesterInvoice

-(void)listInvoiceWithSuccessBlock:(Invoice *)invoice successBlock:(void (^)(NSArray *results))successBlock errorBlock:(void (^)(NSError *error))errorBlock {
    
    RKResponseDescriptor *responseDescriptor =  [RKResponseDescriptor responseDescriptorWithMapping:[Invoice mappingForEntity]
                                                                                             method:RKRequestMethodGET
                                                                                        pathPattern:nil
                                                                                            keyPath:nil
                                                                                        statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)];
    


    NSURLRequest *request = [self createRequestWithObject:self HTTPMethod:MCRequestersMethodGET path:GET_INVOICE parameters:nil];
    
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

-(void)addInvoiceWithSucessBlock:(Invoice *)invoice successBlock:(void (^)())successBlock errorBlock:(void (^)(NSError *error))errorBlock {
    
    NSDictionary *data = [[NSDictionary alloc]init];
    NSString *userID = invoice.userID;
    NSString *productID = invoice.productID;
    NSString *cardID = invoice.cardID;
    NSString *quantidade = invoice.quantidade;
    data = @{  @"UserId"  : userID,
               @"ProductId"  : productID,
               @"CardId"  : cardID,
               @"Quantidade"  : quantidade};
    
    [self performRequestWithoutMappingWithParams:data method:MCRequestersMethodPOST path:POST_INVOICE withSuccesBlock:^(id responseObject) {
        if (successBlock) {
            successBlock();
            NSLog(@"%@", responseObject);
            NSArray * myNewArray = [NSArray arrayWithObjects:responseObject, nil];
        }
    } andErrorBlock:^(NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
    }];
}

@end
