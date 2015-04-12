//
//  MCRequesterInvoice.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MCRequesters.h"
#import "Invoice.h"

#define GET_INVOICE @"http://masterof.azurewebsites.net/api/Product/List?vendorId=1"
#define POST_INVOICE @"http://masterof.azurewebsites.net/api/User/Cadastro"

@interface MCRequesterInvoice : MCRequesters

-(void)listInvoiceWithSuccessBlock:(Invoice *)usuario successBlock:(void (^)(NSArray *results))successBlock errorBlock:(void (^)(NSError *error))errorBlock  ;

-(void)addInvoiceWithSucessBlock:(Invoice *)newUser successBlock:(void (^)())successBlock errorBlock:(void (^)(NSError *error))errorBlock;


@end
