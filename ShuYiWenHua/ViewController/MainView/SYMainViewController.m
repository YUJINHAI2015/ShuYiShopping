//
//  SYMainViewController.m
//  框架
//
//  Created by shupengstar on 16/7/7.
//  Copyright © 2016年 YJH. All rights reserved.
//

#import "SYMainViewController.h"
#import "SDCycleScrollView.h"
#import "CollectionViewCell.h"
#import "SYCalendar.h"
#import "SYBaseNavigationViewController.h"
#import "SYSearchViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "SYRegistViewController.h"
#import "SYShopRecordViewController.h"
#import "SYShoppingListViewController.h"
#import <SMPageControl/SMPageControl.h>
#import <EAIntroView.h>
#import "SYLoginViewController.h"
#import "WSSearchTextField.h"
#import "SYSubmitOrderViewController.h"
static NSString * const sampleDescription1 = @"没有人比我们更专业";
static NSString * const sampleDescription2 = @"没有人比我们更便捷";
static NSString * const sampleDescription3 = @"Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.";
static NSString * const sampleDescription4 = @"Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit.";
static NSString * const CellReuseIdentify = @"CellReuseIdentify";

@interface SYMainViewController () <SDCycleScrollViewDelegate,UITextFieldDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,EAIntroDelegate>

@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cycleViewHeight;
@property (weak, nonatomic) IBOutlet UIView *calendarView;
@property (strong, nonatomic) NSArray *mainIconArr;
@property (nonatomic, strong) UIView *rootView;
@property (nonatomic, strong) EAIntroView *intro;
@end


@implementation SYMainViewController
- (NSArray *)mainIconArr{
    if (!_mainIconArr) {
        _mainIconArr = @[
                             @{@"imageName":@"sy_main_regist",
                               @"titleName":@"学员注册"
                               },
                             @{@"imageName":@"sy_main_order",
                               @"titleName":@"订单管理"
                               },
                             @{@"imageName":@"sy_main_personalMessage",
                               @"titleName":@"个人信息"
                               },
                             @{@"imageName":@"sy_main_icon_pay",
                               @"titleName":@"在线充值"
                               },
                             @{@"imageName":@"sy_main_studyPrise",
                               @"titleName":@"学习奖金"
                               },
                             @{@"imageName":@"sy_main_activity",
                               @"titleName":@"社区论坛"
                               }
                             ];
    }
    return _mainIconArr;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    // 一个唯一标示 strFlag
    NSString* strFlag = [NSString stringWithFormat:@"isFirstStartWithVersion_%@",[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"]];
    
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:strFlag] isEqualToString:@"YES"]) {
        
        
    }else{
        [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:strFlag]; // 一进来先到这里，只加载一次。
        // 引导页
        self.rootView = self.navigationController.view;
        [self showCustomIntro];
        self.tabBarController.tabBar.hidden = YES;
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.NavLeftBtn.hidden = YES;
    [self initUI];
//    [self setAutomaticallyAdjustsScrollViewInsets:YES];
//    [self setExtendedLayoutIncludesOpaqueBars:YES];
}
#pragma mark - 引导页
- (void)showCustomIntro {
    
    EAIntroPage *page1 = [EAIntroPage page];
    page1.title = @"专业化运营服务平台";
    page1.titlePositionY = 240;
    page1.desc = sampleDescription1;
    page1.descPositionY = 220;
    page1.bgImage = [UIImage imageNamed:@"bg1"];
    page1.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"title1"]];
    page1.titleIconPositionY = 100;
    page1.showTitleView = NO;
    
    EAIntroPage *page2 = [EAIntroPage page];
    page2.title = @"便捷安全的支付方式";
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
    page4.title = @"全新APP正式上线";
    page4.titlePositionY = 240;
    page4.desc = sampleDescription4;
    page4.descPositionY = 220;
    page4.bgImage = [UIImage imageNamed:@"bg4"];
    page4.titleIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon3"]];
    page4.titleIconPositionY = 260;
    
    EAIntroView *intro = [[EAIntroView alloc] initWithFrame:self.rootView.bounds andPages:@[page1,page2,page3,page4]];
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
    [intro showInView:self.rootView animateDuration:0.3];
}
- (void)introDidFinish:(EAIntroView *)introView wasSkipped:(BOOL)wasSkipped{
    self.tabBarController.tabBar.hidden = NO;
}

#pragma mark - UI
- (void)initUI
{
    [self createNavRightButtons];
    [self initCollectionView];
    [self cycleScrollView];
    [self testCalendar];
}
- (void)testCalendar{
    SYCalendar *calendar = [[[NSBundle mainBundle] loadNibNamed:@"SYCalendar" owner:self options:nil] lastObject];
    [self.calendarView addSubview:calendar];
    
    calendar.action = ^(NSString *test){
        NSLog(@"选中日期：%@",test);
    };
}
- (void)initCollectionView{
    //不要自动设置偏移量
    self.automaticallyAdjustsScrollViewInsets = NO;
    //当调用contentInset会自动调用scrollViewDidScroll
    self.collectionView.contentInset          = UIEdgeInsetsMake(180+50, 0, 0, 0);
    
    UICollectionViewFlowLayout *flowLayout    = [[UICollectionViewFlowLayout alloc] init];
    // 设置列的最小间距
    flowLayout.minimumInteritemSpacing        = 1;
    // 设置最小行间距
    flowLayout.minimumLineSpacing             = 1;
    // 设置布局的内边距
    flowLayout.sectionInset                   = UIEdgeInsetsMake(0, 0, 0, 0);
    // 设置每个item的大小，
    flowLayout.itemSize                       = CGSizeMake((SCREEN_WIDTH - 2) / 3.0, (SCREEN_HEIGHT - 64 - 180 - 50 - 44 - 1) / 2.0);

    self.collectionView.collectionViewLayout  = flowLayout;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"CollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:CellReuseIdentify];
}
#pragma mark - navigationButton
- (void)createNavRightButtons
{
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"sy_main_right"] forState:UIControlStateNormal];
    [rightButton setFrame:CGRectMake(0, 0, 44, 44)];
        [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"sy_main_left"] forState:UIControlStateNormal];
    [leftButton setFrame:CGRectMake(0, 0, 44, 44)];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    WSSearchTextField *search = [[WSSearchTextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    search.delegate = self;
    self.navigationItem.titleView = search;
}
- (void)rightButtonClick:(UIButton *)btn{
    NSLog(@"rightButtonClick");
    
}
- (void)leftButtonClick:(UIButton *)btn{
    NSLog(@"leftButtonClick");
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];

}
#pragma mark - textFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self goToSearchVC];
    return YES;
}
-(void)goToSearchVC{
    SYSearchViewController *vc=[[SYSearchViewController alloc] init];
    SYBaseNavigationViewController *searchNav=[[SYBaseNavigationViewController alloc]initWithRootViewController:vc];
    [self.navigationController presentViewController:searchNav animated:NO completion:nil];
}
#pragma mark - 滚动图
- (void)cycleScrollView{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    // 情景一：采用本地图片实现
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            @"h4.jpg"
                            ];
    // 情景二：网络加载 --- 创建带标题的图片轮播器
    //    NSArray *imagesURLStrings = @[
    //                                  @"https://ss2.baidu.com/-vo3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a4b3d7085dee3d6d2293d48b252b5910/0e2442a7d933c89524cd5cd4d51373f0830200ea.jpg",
    //                                  @"https://ss0.baidu.com/-Po3dSag_xI4khGko9WTAnF6hhy/super/whfpf%3D425%2C260%2C50/sign=a41eb338dd33c895a62bcb3bb72e47c2/5fdf8db1cb134954a2192ccb524e9258d1094a1e.jpg",
    //                                  @"http://c.hiphotos.baidu.com/image/w%3D400/sign=c2318ff84334970a4773112fa5c8d1c0/b7fd5266d0160924c1fae5ccd60735fae7cd340d.jpg"
    //                                  ];
    //
    // 图片配文字
    //    NSArray *titles = @[@"感谢您的支持，如果下载的",
    //                        @"如果代码在使用过程中出现问题",
    //                        @"您可以发邮件到gsdios@126.com",
    //                        @"感谢您的支持"
    //                        ];
    
    
    self.cycleView.imageURLStringsGroup = imageNames;
    self.cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleView.delegate = self;
    //    self.cycleView.titlesGroup = titles;
    self.cycleView.currentPageDotColor = [UIColor whiteColor]; // 自定义分页控件小圆标颜色
    self.cycleView.placeholderImage = [UIImage imageNamed:@"placeholder"];
}
#pragma mark - SDCycleScrollViewDelegate
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"%ld",(long)index);
}

#pragma mark - UICollectionViewDataSource method
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.mainIconArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentify forIndexPath:indexPath];
    [cell setdict:self.mainIconArr[indexPath.row]];
    return cell;
}
#pragma mark - UICollectonViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //当前点 - 最原始的点
    CGFloat offset = scrollView.contentOffset.y - oriOfftY;
    CGFloat h = oriHeight - offset;
    if (h < 64) {
        h = 64;
    }
    self.cycleViewHeight.constant = h;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",indexPath.row);
    switch (indexPath.row) {
        case 0:
            [self pushAntherController:NSStringFromClass([SYRegistViewController class])];
            break;
        case 1:
            [self pushAntherController:NSStringFromClass([SYShopRecordViewController class])];
            break;
        case 2:
            [self pushAntherController:NSStringFromClass([SYShoppingListViewController class])];
            break;
        case 3:
            [self pushAntherController:NSStringFromClass([SYLoginViewController class])];
            break;
        case 4:
            [self pushAntherController:NSStringFromClass([SYSubmitOrderViewController class])];
            break;
        case 5:
            
            break;
            
        default:
            break;
    }
}
- (void)pushAntherController:(NSString *)controller {
    
    Class myClass = NSClassFromString(controller);
    if (myClass) {
        UIViewController *myClassInit = [[myClass alloc] init];
        myClassInit.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:myClassInit animated:YES];
    }

}
@end
