//
//  SYShopRecordViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYShopRecordViewController.h"
#import "SYShopRecordTableViewCell.h"
#import "UIPopoverListView.h"
#import <MJRefresh.h>
@interface SYShopRecordViewController ()<UITableViewDataSource,UITableViewDelegate,UIPopoverListViewDataSource, UIPopoverListViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *shopRecordTableView;
@property (weak, nonatomic) IBOutlet UIButton *typeBtn;
@property (weak, nonatomic) IBOutlet UIButton *timeBtn;
@property (weak, nonatomic) IBOutlet UIButton *stateBtn;
@property (weak, nonatomic) IBOutlet UIButton *payBtn;

@end
static NSString *myCell = @"RecordCell";
@implementation SYShopRecordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.shopRecordTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYShopRecordTableViewCell class]) bundle:nil] forCellReuseIdentifier:myCell];
    self.shopRecordTableView.rowHeight = 140;
    self.shopRecordTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [SYExpand initUIForBtn:_typeBtn];
    [SYExpand initUIForBtn:_timeBtn];
    [SYExpand initUIForBtn:_stateBtn];
    [SYExpand initUIForBtn:_payBtn];
    [self addHeadRefresh];
    [self addFootReFresh];
}
- (void)addHeadRefresh{
    _shopRecordTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        sleep(3);
        [_shopRecordTableView.mj_header endRefreshing];
        NSLog(@"刷新头部");
    }];
}
- (void)addFootReFresh{
    _shopRecordTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        NSLog(@"刷新尾部");
        sleep(3);
        [_shopRecordTableView.mj_footer endRefreshing];
    }];
}
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionP{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYShopRecordTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCell];
    cell.actionType = ^(NSString *type){
        NSLog(@"type%@",type);
    };
    return cell;

}
- (IBAction)btnAction:(UIButton *)sender {
    // 1000
    switch (sender.tag) {
        case 1000:
            [self initPopView:@"订单类型"];
            break;
        case 1001:
            [self initPopView:@"订单时间"];
            break;
        case 1002:
            [self initPopView:@"订单状态"];
            break;
        case 1003:
            [self initPopView:@"支付方式"];
            break;
            
        default:
            break;
    }
}
- (void)initPopView:(NSString *)type{
    CGFloat xWidth = self.view.bounds.size.width - 20.0f;
    CGFloat yHeight = 272.0f;
    CGFloat yOffset = (self.view.bounds.size.height - yHeight)/2.0f;
    UIPopoverListView *poplistview = [[UIPopoverListView alloc] initWithFrame:CGRectMake(10, yOffset, xWidth, yHeight)];
    poplistview.delegate = self;
    poplistview.datasource = self;
    poplistview.listView.scrollEnabled = FALSE;
    [poplistview setTitle:type];
    [poplistview show];
}
#pragma mark - UIPopoverListViewDataSource

- (UITableViewCell *)popoverListView:(UIPopoverListView *)popoverListView
                    cellForIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                                    reuseIdentifier:identifier];
    
    int row = indexPath.row;
    
    if(row == 0){
        cell.textLabel.text = @"Facebook";
        //        cell.imageView.image = [UIImage imageNamed:@"ic_facebook.png"];
    }else if (row == 1){
        cell.textLabel.text = @"Twitter";
        //        cell.imageView.image = [UIImage imageNamed:@"ic_twitter.png"];
    }else if (row == 2){
        cell.textLabel.text = @"Google Plus";
        //        cell.imageView.image = [UIImage imageNamed:@"ic_google_plus.png"];
    }else {
        cell.textLabel.text = @"Email";
        //        cell.imageView.image = [UIImage imageNamed:@"ic_share_email.png"];
    }
    
    return cell;
}

- (NSInteger)popoverListView:(UIPopoverListView *)popoverListView
       numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

#pragma mark - UIPopoverListViewDelegate
- (void)popoverListView:(UIPopoverListView *)popoverListView
     didSelectIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%s : %d", __func__, indexPath.row);
    [self.typeBtn setTitle:@"email" forState:UIControlStateNormal];
    // your code here
}

- (CGFloat)popoverListView:(UIPopoverListView *)popoverListView
   heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

@end
