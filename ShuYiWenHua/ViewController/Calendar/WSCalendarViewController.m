//
//  WSCalendarViewController.m
//  框架
//
//  Created by shupengstar on 16/7/7.
//  Copyright © 2016年 YJH. All rights reserved.
//

#import "WSCalendarViewController.h"
#import "UIButton+LXLayout.h"

@interface WSCalendarViewController ()
@property (nonatomic,strong) UIButton *seleteButton;

@end

@implementation WSCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.NavLeftBtn.hidden = YES;
    [self initUI];

    // Do any additional setup after loading the view.
}
- (void)initUI
{
    [self createNavRightButtons];
    [self createNavSeleteTimeView];
}
- (void)createNavSeleteTimeView
{
    _seleteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_seleteButton setTitle:[[NSDate dateWithTimeIntervalSinceNow:0] stringWithFormat:@"yyyy/MM"] forState:UIControlStateNormal];
    _seleteButton.lx_subMargin = 5;
    _seleteButton.lx_layoutType = LXButtonLayoutTypeImageRight;
    [_seleteButton setImage:[UIImage imageNamed:@"ws_calender_downArrow"] forState:UIControlStateNormal];
    [_seleteButton setFrame:CGRectMake(0, 0, 100, 44)];
//    [_seleteButton addTarget:self action:@selector(seleteTimeClick: ) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _seleteButton;
    
}

- (void)createNavRightButtons
{
    NSMutableArray *rightButtons = @[].mutableCopy;
    UIButton *searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [searchButton setImage:[UIImage imageNamed:@"ws_calender_Search"] forState:UIControlStateNormal];
    [searchButton setFrame:CGRectMake(0, 0, 44, 44)];
//    [searchButton addTarget:self action:@selector(searchButtonClick : ) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *searchButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchButton];
    
    
    UIButton *todayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [todayButton setImage:[UIImage imageNamed:@"ws_calender_today"] forState:UIControlStateNormal];
    [todayButton setFrame:CGRectMake(0, 0, 44, 44)];
//    [todayButton addTarget:self action:@selector(todayButtonClick :) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *todayButtonItem = [[UIBarButtonItem alloc]initWithCustomView:todayButton];
    
    [rightButtons addObject:searchButtonItem];
    [rightButtons addObject:todayButtonItem];
    self.navigationItem.rightBarButtonItems = rightButtons;
}



@end
