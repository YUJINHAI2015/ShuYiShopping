//
//  SYWindowManager.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYBaseManager.h"
#import <UIKit/UIKit.h>

@interface SYWindowManager : SYBaseManager
/**
 *  创建自定义的tabbar
 *
 *  @return windows
 */
- (UIWindow *)createCustomTabbarViewController;

/**
 *  创建登录的ViewController
 *
 *  @return window
 */
+ (UIWindow *)createLoginViewControllerWindow;
@end
