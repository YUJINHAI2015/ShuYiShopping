//
//  ComData.m
//  MovieWord
//
//  Created by stone on 14-4-15.
//  Copyright (c) 2014年 ylh. All rights reserved.
//


#import "ComData.h"

#import "CapitalRecordCacheAdapter.h"

static ComData *dataManage = nil;

static NSMutableDictionary  *tempData;

@implementation ComData

+(ComData *)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!dataManage) {
            dataManage = [[self alloc]init];
        }
    });
    
    return dataManage;
}

+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (!dataManage) {
            dataManage = [super allocWithZone:zone];
        }
    }
    return dataManage;
}

-(id)init{
    @synchronized(self)
    {
        if (self = [super init])
        {
            [self initData];
        }
    }
    
    return self;
}

#pragma mark - comm interface
-(void)initData{
    _blocks = [NSMutableDictionary dictionary];
}

#pragma mark - 全局字典,用于内存数据缓存
+(NSMutableDictionary*)getTempData{
    if (!tempData) {
        tempData = [[NSMutableDictionary alloc] initWithCapacity:5];
    }
    return tempData;
}


#pragma mark


-(void)requestData:(NSDictionary *)dit API:(NSString *)api complete:(YYHttpSuccessBlock)complete error:(YYHttpFailureBlock)error
{
     HttpRequest *request = [HttpRequest requestWithApi:api params:dit success:complete failure:error];
    [[HttpManager shareManager] post:request];
}

-(void)requestDataSyn:(NSDictionary *)dit API:(NSString *)api complete:(YYHttpSuccessBlock)complete error:(YYHttpFailureBlock)error
{
    HttpRequest *request = [HttpRequest requestWithApi:api params:dit success:complete failure:error];
    [[HttpManager shareManager] post:request];
}


//图片上传
-(void)uploadImageBase64:(NSDictionary *)dit  complete:(YYHttpSuccessBlock)complete error:(YYHttpFailureBlock)error
{
    HttpRequest *request = [HttpRequest requestWithApi:@"/appMyMassage/updateHeadimg.do" params:dit success:complete failure:error];
    [[HttpManager shareManager] post:request];
}


-(void)uploadImage:(NSData *)data
           success:(YYHttpSuccessBlock)success
            upload:(YYHttpUploadBlock)upload
           failure:(YYHttpFailureBlock)failure
{
    HttpRequest *req = [HttpRequest requestWithApi:@"/file/upload" params:nil success:success failure:failure];
    req.uploadBlock = upload;
    req.bodyBlock = ^(id<AFMultipartFormData> formData){
        [formData appendPartWithFileData:data name:@"image"  fileName:@"avatar.png" mimeType:@"image/png"];
    };
    [[HttpManager shareManager] post:req];
}

#pragma mark

@end











