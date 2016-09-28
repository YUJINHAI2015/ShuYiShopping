//
//  YYManager.h
//  advideo
//
//  Created by LiuHe@MacMini on 14-7-15.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APPManager : NSObject

+(APPManager *)shareManager;

-(void)loadManager;

@end
