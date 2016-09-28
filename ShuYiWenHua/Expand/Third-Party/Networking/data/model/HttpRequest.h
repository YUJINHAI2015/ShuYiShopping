//
//  HttpRequest.h
//  p2p
//
//  Created by mokai on 14-8-13.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "HttpResponse.h"
#import "CacheAdapter.h"
#import "AFHTTPRequestOperation.h"
@interface HttpRequest : NSObject
@property(nonatomic,retain) NSString *api;
@property(strong,retain) NSDictionary *params;
@property(strong) YYHttpSuccessBlock success;
@property(strong) YYHttpFailureBlock failure;
@property(retain,atomic) HttpResponse *response;

@property(strong) AFHTTPRequestOperation *operatord;


//文件上传部分
@property(strong) YYHttpBodyBlock bodyBlock;//文件写入
@property(strong) YYHttpUploadBlock uploadBlock;//进度

//缓冲适配器
@property(strong,retain) CacheAdapter *cacheAdapter;

//取消此次请求
-(void)cancel;

+(HttpRequest *)requestWithApi:(NSString *)api;
+(HttpRequest *)requestWithApi:(NSString *)api success:(YYHttpSuccessBlock)success failure:(YYHttpFailureBlock)failure;
+(HttpRequest *)requestWithApi:(NSString *)api params:(NSDictionary *)params;
+(HttpRequest *)requestWithApi:(NSString *)api params:(NSDictionary *)params success:(YYHttpSuccessBlock)success failure:(YYHttpFailureBlock)failure;


@end
