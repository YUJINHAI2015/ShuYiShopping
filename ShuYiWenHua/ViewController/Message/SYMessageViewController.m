//
//  WSContactsViewController.m
//  框架
//
//  Created by shupengstar on 16/7/7.
//  Copyright © 2016年 YJH. All rights reserved.
//

#import "SYMessageViewController.h"
#import "NYSegmentedControl.h"
#import "SYMessageLeftTableViewCell.h"
#import "SYMessageRightTableViewCell.h"
#import "SYMessageModel.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import <MJRefresh.h>
typedef NS_ENUM(NSInteger, SYMessageTabelViewTag) {
    SYMessageTabelViewTagLeft = 0,
    SYMessageTabelViewTagRight        
};

static NSString *leftIdentifier = @"messageLeft";
static NSString *rightIdentifier = @"messageRight";

@interface SYMessageViewController ()<UITableViewDataSource,UITableViewDelegate>
@property UIView *visibleExampleView;
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic, assign) SYMessageTabelViewTag tag;
@property (nonatomic, copy) NSArray *leftTableViewDataFromJson;
@property (nonatomic, copy) NSArray *rightTableViewDataFromJson;
@end

@implementation SYMessageViewController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self addHeadRefresh];
    [self addFootReFresh];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    [self buildTestDataThen:^{
        
    }];
}
- (void)buildTestDataThen:(void (^)(void))then {
    // Simulate an async request
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // Data from `data.json`
        NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"datas" ofType:@"json"];
        NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
        NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *feedDicts = rootDict[@"feed"];
        // Convert to `FDFeedEntity`
        NSMutableArray *entities = @[].mutableCopy;
        [feedDicts enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [entities addObject:[[SYMessageModel alloc] initWithDictionary:obj]];
        }];
        self.leftTableViewDataFromJson = entities;
        self.rightTableViewDataFromJson = entities;
        // Callback
        dispatch_async(dispatch_get_main_queue(), ^{
            !then ?: then();
        });
    });
}

- (void)initUI{
    
    self.NavLeftBtn.hidden = YES;
    self.tag = SYMessageTabelViewTagLeft;
    self.leftTableView.hidden = NO;
    self.rightTableView.hidden = YES;
    self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,SCREEN_W,SCREEN_HEIGHT-64) style:UITableViewStylePlain];
    self.leftTableView.delegate = self;
    self.leftTableView.dataSource = self;
    [self.leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYMessageLeftTableViewCell class]) bundle:nil] forCellReuseIdentifier:leftIdentifier];
    self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.leftTableView];
    
    NYSegmentedControl *foursquareSegmentedControl = [[NYSegmentedControl alloc] initWithItems:@[@"公司新闻", @"产品介绍"]];
    foursquareSegmentedControl.titleTextColor = [UIColor ws_lightBlackColor];
    foursquareSegmentedControl.selectedTitleTextColor = [UIColor whiteColor];
    foursquareSegmentedControl.selectedTitleFont = [UIFont systemFontOfSize:13.0f];
    foursquareSegmentedControl.segmentIndicatorBackgroundColor = [UIColor ws_lightBlackColor];
    foursquareSegmentedControl.backgroundColor = [UIColor whiteColor];
    foursquareSegmentedControl.borderWidth = 0.0f;
    foursquareSegmentedControl.segmentIndicatorBorderWidth = 0.0f;
    foursquareSegmentedControl.segmentIndicatorInset = 1.0f;
    foursquareSegmentedControl.segmentIndicatorBorderColor = self.view.backgroundColor;
    [foursquareSegmentedControl sizeToFit];
    foursquareSegmentedControl.cornerRadius = CGRectGetHeight(foursquareSegmentedControl.frame) / 2.0f;
    self.navigationItem.titleView = foursquareSegmentedControl;
    foursquareSegmentedControl.NYSegmentedControlAction = ^(NSInteger index){
        NSLog(@"index:%ld",(long)index);
        switch(index){
            case 0:
                self.leftTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,SCREEN_W,SCREEN_HEIGHT-64-44) style:UITableViewStylePlain];
                self.leftTableView.delegate = self;
                self.leftTableView.dataSource = self;
                [self.leftTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYMessageLeftTableViewCell class]) bundle:nil] forCellReuseIdentifier:leftIdentifier];
                self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                self.tag = SYMessageTabelViewTagLeft;
                self.leftTableView.hidden = NO;
                self.rightTableView.hidden = YES;
                [self.view addSubview:self.leftTableView];
                [self.leftTableView reloadData];
                [self addHeadRefresh];
                [self addFootReFresh];
                break;
                
            case 1:
                self.rightTableView = [[UITableView alloc]initWithFrame:CGRectMake(0,0,SCREEN_W,SCREEN_HEIGHT-64-44) style:UITableViewStylePlain];
                self.rightTableView.delegate = self;
                self.rightTableView.dataSource = self;
                [self.rightTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYMessageRightTableViewCell class]) bundle:nil] forCellReuseIdentifier:rightIdentifier];
                self.rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
                self.tag = SYMessageTabelViewTagRight;
                self.leftTableView.hidden = YES;
                self.rightTableView.hidden = NO;
                [self.view addSubview:self.rightTableView];
                [self.rightTableView reloadData];
                [self addHeadRefresh];
                [self addFootReFresh];
                break;
                
            default:
                break; 
        }
    };
}

- (void)addHeadRefresh{
    self.leftTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        sleep(3);
        [self.leftTableView.mj_header endRefreshing];
        NSLog(@"刷新头部");
    }];
    self.rightTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        sleep(3);
        [self.rightTableView.mj_header endRefreshing];
        NSLog(@"刷新头部");
    }];
}
- (void)addFootReFresh{
    self.leftTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"刷新尾部");
        sleep(3);
        [self.leftTableView.mj_footer endRefreshing];
    }];
    self.rightTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"刷新尾部");
        sleep(3);
        [self.rightTableView.mj_footer endRefreshing];
    }];
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tag) {
        return self.leftTableViewDataFromJson.count;
    }
    else {
        return self.rightTableViewDataFromJson.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tag) {
        
        SYMessageRightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rightIdentifier];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }else {
        
        SYMessageLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:leftIdentifier];
        [self configureCell:cell atIndexPath:indexPath];
        return cell;
    }
}

- (void)configureCell:(id)cell atIndexPath:(NSIndexPath *)indexPath {
    if (self.tag) {
        SYMessageRightTableViewCell *myCell = cell;
        myCell.fd_enforceFrameLayout = NO;
        myCell.messageModel = self.leftTableViewDataFromJson[indexPath.row];
    }else {
        SYMessageLeftTableViewCell *myCell = cell;
        myCell.fd_enforceFrameLayout = NO;
        myCell.messageModel = self.rightTableViewDataFromJson[indexPath.row];
    }
}
#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.tag) {
        return [tableView fd_heightForCellWithIdentifier:rightIdentifier cacheByIndexPath:indexPath configuration:^(SYMessageRightTableViewCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
    }else {
        return [tableView fd_heightForCellWithIdentifier:leftIdentifier cacheByIndexPath:indexPath configuration:^(SYMessageLeftTableViewCell *cell) {
            [self configureCell:cell atIndexPath:indexPath];
        }];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%d",indexPath.row);
}
@end
