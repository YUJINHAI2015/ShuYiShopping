//
//  SYLoginViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/22.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYLoginViewController.h"
#import <SMPageControl/SMPageControl.h>
#import <EAIntroView.h>
#import "SYWindowManager.h"
#import "SYRegistTableViewController.h"

static NSString * const sampleDescription1 = @"Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
static NSString * const sampleDescription2 = @"Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";
@interface SYLoginViewController () <EAIntroDelegate>

@end

@implementation SYLoginViewController
{
    UIView *rootView;
    EAIntroView *_intro;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"loginView";
    self.view.backgroundColor = [UIColor yellowColor];
    UIButton *but = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:but];
    but.backgroundColor = [UIColor redColor];
    [but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)click{
    SYRegistTableViewController *VC = [SYRegistTableViewController new];
    VC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:VC animated:YES];
}
- (void)showCustomIntro {
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"Hello world";
    page1.titlePositionY = 240;
    page1.desc = sampleDescription1;
    page1.descPositionY = 220;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    page1.titleIconPositionY = 100;
    page1.showTitleView = NO;
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"This is page 2";
    page2.titlePositionY = 240;
    page2.desc = sampleDescription2;
    page2.descPositionY = 220;
    page2.bgImage = [UIImage imageNamed:@"bg2"];
    page2.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon1"]];
    page2.titleIconPositionY = 260;
    
    EAIntroPage *page3 = [EAIntroPage page];
    page3.title = @"This is page 3";
    page3.titlePositionY = 240;
    page3.desc = sampleDescription3;
    page3.descPositionY = 220;
    page3.bgImage = [UIImage imageNamed:@"bg3"];
    page3.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon2"]];
    page3.titleIconPositionY = 260;
    
    EAIntroPage *page4 = [EAIntroPage page];
    page4.title = @"This is page 4";
    page4.titlePositionY = 240;
    page4.desc = sampleDescription4;
    page4.descPositionY = 220;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon3"]];
    page4.titleIconPositionY = 260;
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:rootView.bounds andPages:@[page1,page2,page3,page4]];
    intro.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bigLogo"]];
    intro.titleViewY = 120;
    intro.tapToNext = YES;
    [intro setDelegate:self];
    
    SMPageControl *pageControl = [[SMPageControl alloc] init];
    pageControl.pageIndicatorImage = [UIImage imageNamed:@"pageDot"];
    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"selectedPageDot"];
    [pageControl sizeToFit];
    intro.pageControl = (UIPageControl *)pageControl;
    intro.pageControlY = 130.f;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundImage:[UIImage imageNamed:@"skipButton"] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(0, 0, 270, 50)];
    intro.skipButton = btn;
    intro.skipButtonY = 80.f;
    intro.skipButtonAlignment = EAViewAlignmentCenter;
    
    [intro showInView:rootView animateDuration:0.3];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    // 一个唯一标示 strFlag
    NSString* strFlag = [NSString stringWithFormat:@"isFirstStartWithVersion_%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]];
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:strFlag] isEqualToString:@"YES"]) {
        
        
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:strFlag]; // 一进来先到这里，只加载一次。
        // 引导页
        rootView = self.navigationController.view;
        [self showCustomIntro];
    }
}
@end
