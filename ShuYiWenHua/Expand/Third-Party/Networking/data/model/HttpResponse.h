//
//  HttpResponse.h
//  p2p
//
//  Created by mokai on 14-8-13.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpResponse : NSObject
@property(retain) id obj;
@property int code;
@property(retain,nonatomic) NSString *msg;
@property BOOL isAutoLogin;
@property BOOL isCache;
@end
