//
//  HttpRequest.m
//  p2p
//
//  Created by mokai on 14-8-13.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest
@synthesize api;
@synthesize params;
@synthesize response;
@synthesize operatord;
@synthesize  success;
@synthesize failure;
@synthesize cacheAdapter;
@synthesize bodyBlock;
@synthesize uploadBlock;

-(void)cancel{
    [operatord cancel];
}

+(HttpRequest *)requestWithApi:(NSString *)api{
    return [self requestWithApi:api params:nil];
}

+(HttpRequest *)requestWithApi:(NSString *)api success:(YYHttpSuccessBlock)success failure:(YYHttpFailureBlock)failure{
    return [self requestWithApi:api params:nil success:success failure:failure];
}

+(HttpRequest *)requestWithApi:(NSString *)api params:(NSDictionary *)params{
    return [self requestWithApi:api params:params success:nil failure:nil];
}

+(HttpRequest *)requestWithApi:(NSString *)api params:(NSDictionary *)params success:(YYHttpSuccessBlock)success failure:(YYHttpFailureBlock)failure{
    HttpRequest *req = [[HttpRequest alloc] init];
    req.api = api;
    req.params = params;
    req.success = success;
    req.failure = failure;
    return req;
}
@end
