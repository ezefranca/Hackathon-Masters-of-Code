//
//  MCRequesters.h
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define WEBSERVICE_API_CURRENT_SERVER @"masterof.azurewebsites.net/api"
#define WEBSERVICE_CURRENT_SERVER @"http://masterof.azurewebsites.net/api"
//#define WEBSERVICE_SOAP_CURRENT_SERVER @"http://masterof.azurewebsites.net/api"
//#define WEBSERVICE_API_CURRENT_SERVER @"api.site.com.br/v1.1"
//#define WEBSERVICE_TOKEN_ISSUER_CURRENT_SERVER @"api.site.com.br"
#define WEBSERVICE_PUSH_TOKEN_CURRENT_SERVER @"http://masterof.azurewebsites.net/api"
//#define WEBSERVICE_UPLOAD_PHOTO_SERVER @"http://www.site.com.br/api/v1/"

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