//
//  SYRegistViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/28.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYRegistViewController.h"
#import "SYMyTableViewCell.h"
#import "MJExtension.h"
#import "registModel.h"
#import "SYLogoView.h"
#import "SYRegistDataModel.h"
#import "SYRegistNextViewController.h"
static NSString *tgID = @"cell";

@interface SYRegistViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic ,strong)NSArray * tgs;
@property (nonatomic, strong) SYRegistDataModel *myRegister;
@end

@implementation SYRegistViewController
- (NSArray *)tgs
{
    if (!_tgs) {
        _tgs = [registModel mj_objectArrayWithFilename:@"regist.plist"];
    }
    return _tgs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
    if (!_myRegister) {
        self.myRegister = [SYRegistDataModel new];
    }
    self.title = @"请输入个人信息";
}
- (void)initUI{
    [self setUpTableView];
}
- (void)setUpTableView{
    
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYMyTableViewCell class]) bundle:nil] forCellReuseIdentifier:tgID];
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.rowHeight = 60;
    
    SYLogoView *view = [SYLogoView logoView];
    self.myTableView.tableHeaderView = view;
    [view setIcon:@"logos"];
    
    UIButton *btn = [UIButton buttonWithFillet:@"已完成，下一步" Frame:CGRectMake(20, 10, SCREEN_WIDTH - 40, 44)];
    btn.backgroundColor = [UIColor ws_lightBlackColor];
    
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [views addSubview:btn];
    self.myTableView.tableFooterView = views;
    [btn handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        // 下一步
        NSLog(@"%@",_myRegister.referrerPeople);
        NSLog(@"%@",_myRegister.identifiedCard);
        SYRegistNextViewController *next = [SYRegistNextViewController new];
        [self.navigationController pushViewController:next animated:YES];
    }];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tgs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tgID];
    
    // 设置数据
    __weak typeof(self) weakSelf = self;
    cell.tg = self.tgs[indexPath.row];
    if (indexPath.row == 0) {
        cell.textValueChangedBlock = ^(NSString *valueStr){
            weakSelf.myRegister.name = valueStr;
        };
    }else if (indexPath.row == 1) {
        cell.textValueChangedBlock = ^(NSString *valueStr){
            weakSelf.myRegister.identifiedCard = valueStr;
        };
    }else if (indexPath.row == 2) {
        cell.textValueChangedBlock = ^(NSString *valueStr){
            weakSelf.myRegister.referrerPeople = valueStr;
        };
    }else if (indexPath.row == 3) {
        cell.textValueChangedBlock = ^(NSString *valueStr){
            weakSelf.myRegister.arrangePeople = valueStr;
        };
    } else{
        cell.textValueChangedBlock = ^(NSString *valueStr){
            weakSelf.myRegister.serverCenter = valueStr;
        };
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"didSelectRowAtIndexPath:%d",indexPath.row);
}
@end
