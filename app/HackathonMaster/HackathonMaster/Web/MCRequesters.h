//
//  MCRequesters.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
typedef NS_OPTIONS(NSInteger, MCRequestersMethods) {
    MCRequestersMethodGET          = 1 << 0,
    MCRequestersMethodPOST         = 1 << 1,
    MCRequestersMethodPUT          = 1 << 2,
    MCRequestersMethodDELETE       = 1 << 3,
    MCRequestersMethodHEAD         = 1 << 4,
    MCRequestersMethodPATCH        = 1 << 5,
    MCRequestersMethodOPTIONS      = 1 << 6,
    MCRequestersMethodAny          = (RKRequestMethodGET |
                                      RKRequestMethodPOST |
                                      RKRequestMethodPUT |
                                      RKRequestMethodDELETE |
                                      RKRequestMethodHEAD |
                                      RKRequestMethodPATCH |
                                      RKRequestMethodOPTIONS)
};
@interface MCRequesters : NSObject
@property(strong, nonatomic, readonly) RKObjectManager *manager;
-(void) addOperationToQueue:(RKObjectRequestOperation *) operation;
-(RKObjectRequestOperation *) createRequestOperationWithResponseDescriptors:(NSArray *) responseDescriptors andRequest:(NSURLRequest *)request successBlock:(void (^)(NSArray *results))successBlock andErrorBlock:(void (^)(NSError *error))errorBlock;
-(NSURLRequest *) createRequestWithObject:(id) object HTTPMethod:(MCRequestersMethods) method path:(NSString *)path parameters:(NSDictionary *) parameters;
-(void) performRequestWithoutMappingWithParams:(NSDictionary *) params method:(MCRequestersMethods)method path:(NSString *)path withSuccesBlock:(void(^)(id responseObject)) successBlock andErrorBlock:(void(^)(NSError * error)) errorBlock;
- (void)removeLoadingOverlayView;
@end