//
//  SYWindowManager.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYWindowManager.h"
#import "SYBaseTabBarController.h"

#import "SYLeftRootViewController.h"
#import "SYRightRootViewController.h"
#import "MMDrawerController.h"
#import "SYLoginViewController.h"
#import "SYBaseNavigationViewController.h"
@interface SYWindowManager ()
@property (nonatomic,strong) MMDrawerController * drawerController;

@end
@implementation SYWindowManager
- (UIWindow *)createCustomTabbarViewController
{
    // 中间
    SYBaseTabBarController *tabBarVC = [SYBaseTabBarController new];
    // 左边
    UIViewController * leftSideDrawerViewController = [[SYLeftRootViewController alloc] init];
//    // 右边
//    UIViewController * rightSideDrawerViewController = [[SYRightRootViewController alloc] init];
//    rightSideDrawerViewController.view.backgroundColor = [UIColor yellowColor];

    self.drawerController = [[MMDrawerController alloc]
                             initWithCenterViewController:tabBarVC
                             leftDrawerViewController:leftSideDrawerViewController
                             rightDrawerViewController:nil];
    [self.drawerController setShowsShadow:NO];
    [self.drawerController setRestorationIdentifier:@"MMDrawer"];
    [self.drawerController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [self.drawerController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    window.rootViewController = self.drawerController;
    window.backgroundColor = [UIColor whiteColor];
    [window makeKeyAndVisible];
    
    return window;
}
+ (UIWindow *)createLoginViewControllerWindow
{
    SYLoginViewController *loginVC = [SYLoginViewController new];
    UIWindow *window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    SYBaseNavigationViewController *navi = [[SYBaseNavigationViewController alloc]initWithRootViewController:loginVC];
    window.rootViewController = navi;
    
    window.backgroundColor = [UIColor whiteColor];
    [window makeKeyAndVisible];
    return window;
}
@end
