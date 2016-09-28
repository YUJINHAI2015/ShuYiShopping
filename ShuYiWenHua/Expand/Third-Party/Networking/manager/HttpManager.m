//
//  HttpManager.m
//  p2p
//
//  Created by mokai on 14-8-13.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//


#import "HttpManager.h"
#import "MyMD5.h"

@implementation HttpManager
static HttpManager *manager = nil;

+(HttpManager *)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[self alloc]init];
        }
    });
    return manager;
}

+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (!manager) {
            manager = [super allocWithZone:zone];
        }
    }
    return manager;
}

-(id)init{
    @synchronized(self)
    {
        if (self = [super init])
        {
            _goOnRequest = YES;
        }
    }
    return self;
}

-(void)post:(HttpRequest *)request{
    
    
    NSString *url = [NSString stringWithFormat:@"%@%@",APP_HOST,request.api];
    request.response = [HttpResponse new];
    debugLog(@"开始加载url:%@?%@",url,[self dictParams2String:request.params]);
   
    NSMutableURLRequest *req;
    if (request.bodyBlock) {
        req = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:url parameters:request.params constructingBodyWithBlock:request.bodyBlock error:nil];
    }else{
        req = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:request.params error:nil];
    }
  
//[req setTimeoutInterval:TIME_OUT_SECOND];//设置请求超时
    
    AFHTTPRequestOperation *afOpt = [[AFHTTPRequestOperation alloc]initWithRequest:req];
    //文件上传
    if (request.uploadBlock) {
        [req setTimeoutInterval:IMG_UPLOAD_TIME_OUT_SECOND];//图片请求超时
        [afOpt setUploadProgressBlock:^(NSUInteger bytesWritten, long long totalBytesWritten, long long totalBytesExpectedToWrite) {
            request.uploadBlock(totalBytesExpectedToWrite,totalBytesWritten);
        }];
    }
    afOpt.responseSerializer = [AFJSONResponseSerializer serializer];
    afOpt.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [afOpt setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        request.response.isCache = NO;
        //请求成功返回
        request.response.obj = responseObject;
        int retCode = request.response.code =  [responseObject[KEY_STATUS_CODE] intValue];
        request.response.msg = responseObject[KEY_MSG];
        
        debugLog(@"结果:%@",responseObject);
        if (2000000 == retCode) {//成功
            if (request.success) {
                request.response.code = retCode;
                request.success(request,request.response.obj);
                
            }
            
            _goOnRequest = YES;
        }else{//失败
            NSString *errorStr= responseObject[@"message"];
            request.failure(request,errorStr);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        request.response.isCache = NO;
        //请求超时
        debugLog(@"请求报错:%@",error.description);
        debugLog(@"Error: %@", error);
        debugLog ( @"operation: %@" , operation. responseString );
        request.response.msg = ERROR_TIME_OUT;
        request.response.code = [ERROR_TIME_OUT_STATUS intValue];
        request.failure(request,request.response.msg);
    }];
    [afOpt start];    
    request.operatord = afOpt;
}



-(NSString *)dictParams2String:(NSDictionary *)map{
    NSString  *str = @"";
    for (NSString *key in map.allKeys) {
        if (![str isEqualToString:@""]) {
            str = [str stringByAppendingString:@"&"];
        }
        
        str = [NSString stringWithFormat:@"%@%@=%@",str, key , [map objectForKey:key]];
    }
    return str;
}


@end
