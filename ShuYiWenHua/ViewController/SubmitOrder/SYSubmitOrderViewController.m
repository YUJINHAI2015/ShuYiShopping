//
//  SYSubmitOrderViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/8.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYSubmitOrderViewController.h"
#import "SYSubmitOrderView.h"
@interface SYSubmitOrderViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *submitOrderTableView;

@end

@implementation SYSubmitOrderViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    SYSubmitOrderView *submitView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([SYSubmitOrderView class]) owner:self options:nil] lastObject];

    self.submitOrderTableView.tableFooterView = submitView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [UITableViewCell new];
    cell.textLabel.text = @"cellcell";
    return cell;
}

@end
