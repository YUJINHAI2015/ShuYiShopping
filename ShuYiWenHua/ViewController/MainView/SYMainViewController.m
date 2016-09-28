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
static NSString * const CellReuseIdentify = @"CellReuseIdentify";

@interface SYMainViewController () <SDCycleScrollViewDelegate,UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet SDCycleScrollView *cycleView;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cycleViewHeight;
@property (weak, nonatomic) IBOutlet UIView *calendarView;
@property (strong, nonatomic) NSString *searchString;

@end

@implementation SYMainViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.NavLeftBtn.hidden = YES;
    [self initUI];
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
    [rightButton setImage:[UIImage imageNamed:@"ws_calender_today"] forState:UIControlStateNormal];
    [rightButton setFrame:CGRectMake(0, 0, 44, 44)];
        [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"ws_calender_today"] forState:UIControlStateNormal];
    [leftButton setFrame:CGRectMake(0, 0, 44, 44)];
    [leftButton addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    self.navigationItem.leftBarButtonItem = leftButtonItem;
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 300, 44)];
    searchBar.delegate = self;
    [searchBar setContentMode:UIViewContentModeLeft];
    [searchBar setPlaceholder:@"搜索"];
    searchBar.layer.cornerRadius=15;
    searchBar.layer.masksToBounds=TRUE;
    [searchBar sizeToFit];
    [searchBar setTintColor:[UIColor whiteColor]];
    self.searchBar = searchBar;
    self.navigationItem.titleView = searchBar;
}
- (void)rightButtonClick:(UIButton *)btn{
    NSLog(@"rightButtonClick");
}
- (void)leftButtonClick:(UIButton *)btn{
    NSLog(@"leftButtonClick");
}

#pragma mark UISearchBarDelegate
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [self goToSearchVC];
    return NO;
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
    [self.searchBar resignFirstResponder];
    NSLog(@"%ld",(long)index);
}

#pragma mark - UICollectionViewDataSource method
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = (CollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:CellReuseIdentify forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
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
}

@end
