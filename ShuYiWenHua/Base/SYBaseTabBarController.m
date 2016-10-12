//
//  SYBaseTabBarController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYBaseTabBarController.h"
#import "SYBaseNavigationViewController.h"
#import "SYBaseViewController.h"

#import "SYMainViewController.h"
#import "SYMessageViewController.h"
#import "WSFindViewController.h"


@interface SYBaseTabBarController ()

@end

@implementation SYBaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray <SYBaseNavigationViewController *>*viewControllers = @[].mutableCopy;
    
    NSArray *tabbarNormalImage = @[@"sy_main_icon_normal",@"sy_message_icon_normal",@"sy_me_icon_normal"];
    NSArray *tabBarSeleteImage = @[@"sy_main_icon_selected",@"sy_message_icon_selected",@"sy_me_icon_selected"];
    // NSStringFromClass返回该类的名字
    NSArray *VCClassArray = @[NSStringFromClass([SYMainViewController class]),NSStringFromClass([SYMessageViewController class]) ,NSStringFromClass([WSFindViewController class])];
    NSArray *titleArray = @[@"首页",@"咨询",@"我"];
    
    [tabbarNormalImage enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        SYBaseViewController *vc =  InitVCFromStoryBoard(VCClassArray[idx]);
        vc.tabBarItem.image = [UIImage imageNamed:tabbarNormalImage[idx]];
        vc.tabBarItem.title =titleArray[idx];
        vc.tabBarItem.selectedImage = [UIImage imageNamed:tabBarSeleteImage[idx]];
        SYBaseNavigationViewController *nav = [[SYBaseNavigationViewController alloc]initWithRootViewController:vc];
        [viewControllers addObject:nav];
    }];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tabBar.barTintColor = [UIColor ws_tabarColor];
    self.tabBar.tintColor = [UIColor ws_lightBlackColor];
    self.viewControllers = viewControllers;
}


@end
