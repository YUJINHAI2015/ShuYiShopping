//
//  DLAppDelegate.h
//  DL-Cloud
//
//  Created by Mac on 13-10-14.
//  Copyright (c) 2013年 Louis-wu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (BUIControl)

- (void)handleControlEvent:(UIControlEvents)event withBlock:(void(^)(id sender))block;
- (void)removeHandlerForEvent:(UIControlEvents)event;

@end
