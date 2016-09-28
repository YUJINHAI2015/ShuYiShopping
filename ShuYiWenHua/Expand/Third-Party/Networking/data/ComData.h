//
//  ComData.h
//  MovieWord
//
//  Created by stone on 14-4-15.
//  Copyright (c) 2014年 ylh. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "HttpManager.h"


typedef void(^YYCommCompleteBlock)(NSDictionary *infor);
typedef void(^YYCommErrorBlock)(NSString *errMsg);

@interface ComData : NSObject

+(ComData *)shareInstance;

+(NSMutableDictionary*)getTempData;

@property (nonatomic,strong) NSMutableDictionary    *blocks;
@property(nonatomic,strong) HttpRequest *lastRequest;


-(void)requestData:(NSDictionary *)dit API:(NSString *)api complete:(YYHttpSuccessBlock)complete error:(YYHttpFailureBlock)error;

//图片上传
-(void)uploadImageBase64:(NSDictionary *)dit  complete:(YYHttpSuccessBlock)complete error:(YYHttpFailureBlock)error;

-(void)uploadImage:(NSData *)data
           success:(YYHttpSuccessBlock)success
            upload:(YYHttpUploadBlock)upload
           failure:(YYHttpFailureBlock)failure;
@end
