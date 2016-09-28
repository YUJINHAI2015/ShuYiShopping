//
//  SYCalendar.h
//  rili
//
//  Created by yiLian on 16/9/27.
//  Copyright © 2016年 yilian. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ActionBlock) (NSString *);

@interface SYCalendar : UIView
@property (nonatomic,copy) ActionBlock action;

@end
