//
//  SYLeftRootViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/20.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYLeftRootViewController.h"
#import "SYLeftTableViewCell.h"
@interface SYLeftRootViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *myTableView;
@property (strong, nonatomic) NSArray *leftIconArr;

@end
static NSString *myCellId = @"myCellId";
@implementation SYLeftRootViewController
- (NSArray *)leftIconArr{
    if (!_leftIconArr) {
        _leftIconArr = @[
                         @{@"imageName":@"组-2",
                           @"titleName":@"学员报单"
                           },
                         @{@"imageName":@"组-3",
                           @"titleName":@"电子钱包"
                           },
                         @{@"imageName":@"组-4",
                           @"titleName":@"订单管理"
                           },
                         @{@"imageName":@"组-5",
                           @"titleName":@"奖金账户"
                           },
                         @{@"imageName":@"组-6",
                           @"titleName":@"公司新闻"
                           }
                         ];
    }
    return _leftIconArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.backgroundColor = [UIColor colorWithRed:31 / 255.0 green:31 / 255.0 blue:31 / 255.0 alpha:0.8];
    self.myTableView.separatorStyle = UITableViewCellAccessoryNone;
    [self.view addSubview:self.myTableView];
    self.myTableView.tableFooterView = [UIView new];
    
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYLeftTableViewCell class]) bundle:nil] forCellReuseIdentifier:myCellId];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.leftIconArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SYLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCellId];
    [cell setdict:self.leftIconArr[indexPath.row]];
    return cell;
}
@end
