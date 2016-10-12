//
//  SYSubmitOrderViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/8.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYSubmitOrderViewController.h"
#import "SYSubmitOrderView.h"
#import "UIPopoverListView.h"
@interface SYSubmitOrderViewController ()<UITableViewDelegate,UITableViewDataSource,UIPopoverListViewDataSource, UIPopoverListViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *submitOrderTableView;

@end

@implementation SYSubmitOrderViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    SYSubmitOrderView *submitView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SYSubmitOrderView class]) owner:self options:nil] lastObject];

    self.submitOrderTableView.tableFooterView = submitView;
    
    submitView.submitOrderAction=^(NSInteger btnTag){
        //1120
        NSLog(@"btnTag:%d",btnTag);
        switch (btnTag) {
            case 1120:
                [self initPopView:@"仓库名称"];
                break;
            case 1121:
                [self initPopView:@"选择城市"];
                break;
            case 1122:
                [self initPopView:@"选择县级"];
                break;
            case 1123:
                [self initPopView:@"选择街道"];
                break;
                
            default:
                break;
        }
    };
    
    
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
#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = @"cellcell";
    return cell;
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
//    [self.typeBtn setTitle:@"email" forState:UIControlStateNormal];
    // your code here
}

- (CGFloat)popoverListView:(UIPopoverListView *)popoverListView
   heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

@end
