//
//  CapitalRecordCacheAdapter.m
//  p2p
//
//  Created by mokai on 14-8-18.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import "CapitalRecordCacheAdapter.h"

@implementation CapitalRecordCacheAdapter

-(void)writeObj:(id)responseObj forId:(NSString *)id{
    [NSThread  sleepForTimeInterval:1];
    //在此进行缓冲写入
    [super writeObj:responseObj forId:id];
}

-(id)readObjWithId:(NSString *)id{
    [NSThread  sleepForTimeInterval:1];
    
    //在此进行缓冲读取
    return [super readObjWithId:id];
}
@end
