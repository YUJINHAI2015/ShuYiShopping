//
//  TimeUtils.m
//  HomeImprovement
//
//  Created by C C on 14-9-13.
//  Copyright (c) 2014年 IWork. All rights reserved.
//

#import "TimeUtils.h"

@implementation TimeUtils

+(NSString *)GetDescriptionTime:(NSDate *)timestamp ISType:(BOOL)Istype{
//    NSArray *weekArray = @[@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSInteger unitFlag = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    NSDate *nowDate = [NSDate date];
    NSDateComponents *comps = [calendar components:unitFlag fromDate:timestamp];
    NSDateComponents *nowComps = [calendar components:unitFlag fromDate:nowDate];
    
    NSString *TimeStr;
    if (Istype) {
        if ([comps year] < [nowComps year]) {
            TimeStr = [NSString stringWithFormat:@"%d年前",(int)([nowComps year] - [comps year])];
        }else if ([comps year] == [nowComps year] && [comps month] < [nowComps month]){
            TimeStr = [NSString stringWithFormat:@"%d个月前",(int)([nowComps month] - [comps month])];
        }else if ([comps year] == [nowComps year] && [comps month] == [nowComps month] && [comps day] < [nowComps day]){
            TimeStr = [NSString stringWithFormat:@"%d天前",(int)([nowComps day] - [comps day])];
        }else if ([comps year] == [nowComps year] && [comps month] == [nowComps month] && [comps day] == [nowComps day] && [comps hour] < [nowComps hour]){
            TimeStr = [NSString stringWithFormat:@"%d小时前",(int)([nowComps hour] - [comps hour])];
        }else if ([comps year] == [nowComps year] && [comps month] == [nowComps month] && [comps day] == [nowComps day] && [comps hour] == [nowComps hour] && [comps minute] < [nowComps minute]){
            long hour = [nowComps minute] - [comps minute];
            if (hour > 3) {
                TimeStr = [NSString stringWithFormat:@"%ld分钟前",hour];
            }else{
                TimeStr = @"刚刚";
            }
        }
    }else{
        if (([comps year] == [nowComps year] && [comps month] == [nowComps month] && [comps day] < [nowComps day]) || [comps day] == [nowComps day]) {
            long day = [nowComps day] - [comps day];
            switch (day) {
                case 0:
                    TimeStr = [NSString stringWithFormat:@"今天 %@", [self ToTimeFormat:timestamp TimeFormat:@"hh:mm"]];
                    break;
                case 1:
                    TimeStr = [NSString stringWithFormat:@"昨天 %@", [self ToTimeFormat:timestamp TimeFormat:@"hh:mm"]];
                    break;
                case 2:
                    TimeStr = [NSString stringWithFormat:@"前天 %@", [self ToTimeFormat:timestamp TimeFormat:@"hh:mm"]];
                    break;
                case 3:
                    TimeStr = [NSString stringWithFormat:@"%@",[self ToTimeFormat:timestamp TimeFormat:@"MM-dd hh:mm"]];
                    break;
                default:
                    break;
            }
        }
    }
    
    return TimeStr;
}

/*
 yyyy-MM-dd
 hh:mm
 yyyy-MM-dd hh:mm
 MM月dd日
 MM月dd日 hh:mm
 yyyy年MM月dd日 hh:mm
*/

+(NSString *)ToTimeFormat:(NSDate *)time TimeFormat:(NSString *)StrFormat{
    NSDateFormatter *mDateFormatter = [[NSDateFormatter alloc]init];
    [mDateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [mDateFormatter setTimeStyle:NSDateFormatterShortStyle];
    [mDateFormatter setDateFormat:StrFormat];
     return [mDateFormatter stringFromDate:time];
}

@end
