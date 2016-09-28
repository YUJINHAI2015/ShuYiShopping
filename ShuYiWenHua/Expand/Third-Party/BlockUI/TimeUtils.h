//
//  TimeUtils.h
//  HomeImprovement
//
//  Created by C C on 14-9-13.
//  Copyright (c) 2014年 IWork. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimeUtils : NSObject

+(NSString *)GetDescriptionTime:(NSDate *)timestamp ISType:(BOOL)Istype;

+(NSString *)ToTimeFormat:(NSDate *)time TimeFormat:(NSString *)StrFormat;

@end
