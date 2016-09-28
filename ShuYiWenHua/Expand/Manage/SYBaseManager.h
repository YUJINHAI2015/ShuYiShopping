//
//  SYBaseManager.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SYBaseManager <NSObject>

@optional
/**
 *  第三方产品名称
 *
 *  @return 产品名称
 */
+ (NSString *)name;
/**
 *  第三方库的版本号
 *
 *  @return 版本号
 */
+ (NSString *)version;
/**
 *  第三方库加入时间
 *
 *  @return 时间
 */
+ (NSString *)joinInTime;

/**
 *  简单描述
 *
 *  @return 描述
 */
+ (NSString *)description;


@end


@interface SYBaseManager : NSObject

@end
