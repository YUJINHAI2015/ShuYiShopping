//
//  AppDelegate.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "AppDelegate.h"
#import "SYWindowManager.h"
#import <iVersion.h>

//#import "WSCoreDataManager.h"
//#import "WSNetworkingManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
+ (AppDelegate *)delegate
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initWindows];
    // 版本更新
    [self iVersionSetting];
    /**
     *  初始化coredata
     */
//    [WSCoreDataManager WS_Setup];
//    // 开始网络监听
//    [WSNetworkingManager startMonitoring];
    
    return YES;
}
#pragma mark --- 初始化window
- (void)initWindows{
    if (/* DISABLES CODE */ (1)) {
        // 主界面
        self.window = [[[SYWindowManager alloc] init] createCustomTabbarViewController];
        
        
    }else {
        // 登录界面
        self.window = [SYWindowManager createLoginViewControllerWindow];
    }
    
    if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
        [[UINavigationBar appearance] setBarTintColor:[UIColor ws_lightBlackColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:
         [NSDictionary dictionaryWithObjectsAndKeys:[UIColor ws_goldColor], NSForegroundColorAttributeName,System_Sixteen, NSFontAttributeName, nil]];
    }
}
#pragma mark 版本更新
- (void)iVersionSetting
{
    
    //更新提示
    [iVersion sharedInstance].applicationBundleID = [[NSBundle mainBundle] bundleIdentifier];
    
    //设置提示按钮的样式
    [iVersion sharedInstance].updatePriority=iVersionUpdatePriorityDefault;
    
    // iVersion *version = [iVersion sharedInstance];
    // version.appStoreID = 123456789;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
