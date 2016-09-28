//
//  CacheAdapter.h
//  p2p
//  Http
//  Created by mokai on 14-8-18.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CacheAdapter : NSObject
-(void)writeObj:(id)responseObj forId:(NSString *)id;
-(id)readObjWithId:(NSString *)id;
@end
