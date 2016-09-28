//
//  HttpManager.h
//  p2p
//
//  Created by mokai on 14-8-13.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

@class HttpRequest;
@protocol  AFMultipartFormData;


typedef void(^YYHttpSuccessBlock)(HttpRequest *request,id responseObj);
typedef void(^YYHttpFailureBlock)(HttpRequest *request,NSString *errMsg);
typedef void(^YYHttpUploadBlock)(long long totalBytes, long long writed);//文件总大小,已上传
typedef void(^YYHttpBodyBlock)(id<AFMultipartFormData> formData);

#import <Foundation/Foundation.h>
#import "HttpRequest.h"

@interface HttpManager : NSObject

+(HttpManager *)shareManager;
-(void)post:(HttpRequest *)request;

@property(nonatomic)BOOL goOnRequest;

@end
