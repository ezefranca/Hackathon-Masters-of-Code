//
//  MCRequesters.m
//  HackathonMaster
//
//  Created by Ezequiel on 11/04/15.
//  Copyright (c) 2015 Hackathon. All rights reserved.
//

#import "MCRequesters.h"
#import "Base64.h"
#import "Usuario.h"
#import "MCNotificationRequester.h"
#define APP_ID_REQUEST_TOKEN @"LauNQw0pp0jH"
@interface MCRequesters()
@property (strong, nonatomic) UIView *overlayView;
@property (strong, nonatomic) AFHTTPClient *mappinglessClient;
-(void) renewAuthorizationTokenWithSuccessBlock:(void(^)(Usuario *user)) successBlock errorBlock:(void(^)(NSError *error)) errorBlock;
- (void)showLoadingOverlayView;
- (void)removeLoadingOverlayView;
@end

@implementation MCRequesters
#pragma mark OverlayView Methods
- (void)showLoadingOverlayView
{
    if(!self.overlayView) {
        CGRect screenRect = [[UIScreen mainScreen] bounds];
        self.overlayView = [[UIView alloc] initWithFrame:screenRect];
        
        [self.overlayView setBackgroundColor:[UIColor clearColor]];
        
        UIActivityIndicatorView *spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        
        UITabBarController *tabBarController = [UIApplication sharedApplication].keyWindow.window.rootViewController.tabBarController;
        UINavigationController *nav = [UIApplication sharedApplication].keyWindow.window.rootViewController.navigationController;
        
        if (IS_IPHONE) {
            float navigationBarHeight = [[nav navigationBar] frame].size.height;
            float tabBarHeight = [[tabBarController tabBar] frame].size.height;
            
            [spinner setCenter:CGPointMake(self.overlayView.frame.size.width / 2.0, (self.overlayView.frame.size.height  - navigationBarHeight - tabBarHeight) / 2.0)];
            [spinner startAnimating];
            
        }else{
            
            float navigationBarHeight = [[nav navigationBar] frame].size.height;
            float tabBarHeight = [[tabBarController tabBar] frame].size.height;
            
            [spinner setCenter:CGPointMake(self.overlayView.frame.size.width / 2.0 , (self.overlayView.frame.size.height  - navigationBarHeight - tabBarHeight) / 2.0 + 108)];
            [spinner startAnimating];
        }
        
        
        [self.overlayView addSubview:spinner];
    }
    
    [[UIApplication sharedApplication].keyWindow addSubview:self.overlayView];
}


- (void)removeLoadingOverlayView
{
    if (self.overlayView) {
        [self.overlayView removeFromSuperview];
    }
}

#pragma mark Base Methods
-(id)init {
    
    NSString *URL = [NSString stringWithFormat:@"https://%@", WEBSERVICE_API_CURRENT_SERVER];
    
    if ([self isKindOfClass:[MCNotificationRequester class]]) {
        URL = [NSString stringWithFormat:@"https://%@", WEBSERVICE_PUSH_TOKEN_CURRENT_SERVER];
    }
    
    if ([RKObjectManager sharedManager] == nil) {
        _manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:URL]];
        [RKObjectManager setSharedManager: _manager];
    } else {
        _manager = [RKObjectManager sharedManager];
    }
    
    
    _manager = [RKObjectManager managerWithBaseURL:[NSURL URLWithString:URL]];
    [RKObjectManager setSharedManager: _manager];
    
    Usuario *user = [[Usuario sharedInstance] currentUser];
    
    if (user.token) {
        [_manager.HTTPClient setDefaultHeader:@"Authorization" value:[NSString stringWithFormat:@"Token %@", user.token]];
    }
    [_manager.HTTPClient setDefaultHeader:@"app_id" value:APP_ID_REQUEST_TOKEN];
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"text/javascript"];
    [RKMIMETypeSerialization registerClass:[RKNSJSONSerialization class] forMIMEType:@"application/json"];
    
    return self;
}

-(void) performRequestWithoutMappingWithParams:(NSDictionary *) params method:(MCRequestersMethods)method path:(NSString *)path withSuccesBlock:(void(^)(id responseObject)) successBlock andErrorBlock:(void(^)(NSError * error)) errorBlock{
    if (!self.mappinglessClient) {
        NSString *URL = [NSString stringWithFormat:@"https://%@", WEBSERVICE_API_CURRENT_SERVER];
        
        if ([self isKindOfClass:[MCNotificationRequester class]]) {
            URL = [NSString stringWithFormat:@"https://%@", WEBSERVICE_PUSH_TOKEN_CURRENT_SERVER];
        }
        self.mappinglessClient = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:URL]];
        [self.mappinglessClient setParameterEncoding:AFJSONParameterEncoding];
        
        Usuario *user = [[Usuario sharedInstance] currentUser];
        
        if (user.token) {
            [self.mappinglessClient setDefaultHeader:@"Authorization" value:[NSString stringWithFormat:@"Token %@", user.token]];
        }
    }
    
    NSString *methodName = @"";
    
    switch (method) {
        case MCRequestersMethodPOST:
            methodName = @"POST";
            break;
        case MCRequestersMethodGET:
            methodName = @"GET";
            break;
        case MCRequestersMethodPUT:
            methodName = @"PUT";
            break;
        case MCRequestersMethodDELETE:
            methodName = @"DELETE";
            break;
        default:
            methodName = @"GET";
            break;
    }
    __block MCRequesters *innerSelf = self;
    NSURLRequest *request = [self.mappinglessClient requestWithMethod:methodName path:path parameters:params];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc]initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (successBlock) {
            successBlock(responseObject);
        }
        [innerSelf removeLoadingOverlayView];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (errorBlock) {
            errorBlock(error);
        }
        [innerSelf removeLoadingOverlayView];
    }];
    
    [self showLoadingOverlayView];
    //  [_mappinglessClient postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    //    MVLog(@"%@", operation.request);
    //  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //    MVLog(@"%@", error);
    //  }];
    [self.mappinglessClient enqueueHTTPRequestOperation:operation];
}

-(void) addOperationToQueue:(RKObjectRequestOperation *) operation {
    [_manager enqueueObjectRequestOperation:operation];
    [self showLoadingOverlayView];
}

//-(void) renewAuthorizationTokenWithSuccessBlock:(void(^)(Usuario *user)) successBlock errorBlock:(void(^)(NSError *error)) errorBlock {
//    
//    //Modificado para V2
//    Usuario *user = [[DSUsuarioModel sharedInstance] currentUser];
//    NSString *authData = [[NSString stringWithFormat:@"%@:%@", user.email, user.senha] base64EncodedString];
//    NSString *URL = [NSString stringWithFormat:@"https://%@", WEBSERVICE_TOKEN_ISSUER_CURRENT_SERVER];
//    
//    AFHTTPClient* client = [AFHTTPClient clientWithBaseURL:[NSURL URLWithString:URL]];
//    [client setAuthorizationHeaderWithToken:[NSString stringWithFormat:@"Basic %@", authData]];
//    [client postPath:@"tokenissuer/v2/dietaesaude" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSError *fail = nil;
//        Usuario *user = [[DSUsuarioModel sharedInstance] currentUser];
//        
//        NSError* error;
//        NSData *data = [operation.responseString dataUsingEncoding:NSUTF8StringEncoding];
//        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data
//                                                                     options:kNilOptions
//                                                                       error:&error];
//        
//        if (error) {
//            NSLog(@"Error when casting Json to NSDictionary");
//            return;
//        }
//        
//        if ([jsonResponse objectForKey:@"AccessToken"]) {
//            user.token = [jsonResponse objectForKey:@"AccessToken"];
//            MVLog(@"Novo token: %@", user.token);
//        }else{
//            NSLog(@"Error with token");
//        }
//        
//        [[[DSDataManager sharedDataManager]localContext] save:&fail];
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//    }];
//}

-(RKObjectRequestOperation *) createRequestOperationWithResponseDescriptors:(NSArray *) responseDescriptors andRequest:(NSURLRequest *)request successBlock:(void (^)(NSArray *results))successBlock andErrorBlock:(void (^)(NSError *error))errorBlock; {
    RKObjectRequestOperation *operation = [[RKObjectRequestOperation alloc] initWithRequest:request responseDescriptors:responseDescriptors];
    
    __block MCRequesters *blockSelf = self;
    __block MCRequesters *innerBlockSelf = self;
    
    [operation setCompletionBlockWithSuccess:^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
        if (successBlock) {
            successBlock([mappingResult array]);
        }
        [self removeLoadingOverlayView];
    } failure:^(RKObjectRequestOperation *operation, NSError *error) {
        
        if (operation.HTTPRequestOperation.response.statusCode == 401) {
            [blockSelf renewAuthorizationTokenWithSuccessBlock:^(Usuario *user) {
                [innerBlockSelf addOperationToQueue:operation];
            } errorBlock:nil];
        }
        
        if (errorBlock) {
            errorBlock(error);
        }
        [self removeLoadingOverlayView];
    }];
    
    return operation;
}
-(NSURLRequest *)createRequestWithObject:(id)object HTTPMethod:(MCRequestersMethods)method path:(NSString *)path parameters:(NSDictionary *)parameters {
    NSURLRequest *request = [_manager requestWithObject:object method:method path:path parameters:parameters];
    return request;
}
@end

