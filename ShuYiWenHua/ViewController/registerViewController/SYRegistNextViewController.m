//
//  SYRegistNextViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/28.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYRegistNextViewController.h"
#import "SYMyTableViewCell.h"
#import "SYLogoView.h"
#import "registModel.h"
#import "MJExtension.h"
#import "SYAcountAreaTableViewCell.h"
#import "SYBankTableViewCell.h"
#import "SYRegistSuccessViewController.h"
@interface SYRegistNextViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic ,strong)NSArray * tgs;

@end
static NSString *myCell = @"myCell";
static NSString *accountCell = @"accountCell";
static NSString *bankCell = @"bankCell";
@implementation SYRegistNextViewController
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
    self.title = @"请绑定银行卡";
    
}
- (void)initUI{
    [self setUpTableView];
}
- (void)setUpTableView{
    
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYMyTableViewCell class]) bundle:nil] forCellReuseIdentifier:myCell];
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYAcountAreaTableViewCell class]) bundle:nil] forCellReuseIdentifier:accountCell];
    [self.myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYBankTableViewCell class]) bundle:nil] forCellReuseIdentifier:bankCell];
    
    self.myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.rowHeight = 60;
    
    SYLogoView *view = [SYLogoView logoView];
    self.myTableView.tableHeaderView = view;
    [view setIcon:@"logos"];
    
    UIButton *submitBtn = [UIButton buttonWithFillet:@"提交注册" Frame:CGRectMake(20, 10, SCREEN_WIDTH - 40, 44)];
    submitBtn.backgroundColor = [UIColor ws_lightBlackColor];
    
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 100)];
    [views addSubview:submitBtn];
    // button
    UIButton *btnSelect = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(submitBtn.frame) + 5, 20, 20)];
    btnSelect.backgroundColor = [UIColor redColor];
    [views addSubview: btnSelect];
    // noteLabel
    UILabel* noteLabel = [[UILabel alloc] init];
    noteLabel.frame = CGRectMake(CGRectGetMaxX(btnSelect.frame) + 5, CGRectGetMaxY(submitBtn.frame) + 5, 100, 20);
    noteLabel.textColor = [UIColor blackColor];
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:@"我已阅读并同意《用户协议》"];
    NSRange redRange = NSMakeRange([[noteStr string] rangeOfString:@"《用户协议》"].location, [[noteStr string] rangeOfString:@"《用户协议》"].length);
    [noteStr addAttribute:NSForegroundColorAttributeName value:[UIColor orangeColor] range:redRange];
    [noteLabel setAttributedText:noteStr];
    [noteLabel sizeToFit];
    [views addSubview:noteLabel];
    //btnTip
    UIButton *btnTip = [[UIButton alloc] init];
    btnTip.frame = CGRectMake(100, CGRectGetMaxY(submitBtn.frame) + 5, 150, 20);
    [views addSubview:btnTip];
    self.myTableView.tableFooterView = views;
    
    [btnTip handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        //跳转到tip界面
        
    }];
    
    
    [submitBtn handleControlEvent:UIControlEventTouchUpInside withBlock:^(id sender) {
        //
        SYRegistSuccessViewController *success = [SYRegistSuccessViewController new];
        [self.navigationController pushViewController:success animated:YES];
    }];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tgs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myCell];
    SYAcountAreaTableViewCell *aCell = [tableView dequeueReusableCellWithIdentifier:accountCell];
    SYBankTableViewCell *bCell = [tableView dequeueReusableCellWithIdentifier:bankCell];
    // 设置数据
    __weak typeof(self) weakSelf = self;

    if (indexPath.row == 0) {
        cell.textValueChangedBlock = ^(NSString *valueStr){
        };
        cell.name.text = @"银行卡号";
        cell.textField.placeholder = @"请输入银行卡号";
        [cell.textField setValue:[UIFont boldSystemFontOfSize:GLOBAL_FONTSIZE] forKeyPath:@"_placeholderLabel.font"];
        
    }else if (indexPath.row == 1) {
        cell.textValueChangedBlock = ^(NSString *valueStr){
        };
        cell.name.text = @"手机号码";
        cell.textField.placeholder = @"请输入绑定银行卡的手机号";
        [cell.textField setValue:[UIFont boldSystemFontOfSize:GLOBAL_FONTSIZE] forKeyPath:@"_placeholderLabel.font"];
    }else if (indexPath.row == 2) {
        cell.textValueChangedBlock = ^(NSString *valueStr){
        };
        return aCell;
    }else if (indexPath.row == 3) {
        cell.textValueChangedBlock = ^(NSString *valueStr){
        };
        return bCell;
    } else{
        cell.textValueChangedBlock = ^(NSString *valueStr){
        };
        cell.name.text = @"开户行";
        cell.textField.placeholder = @"请输入开户行";
        [cell.textField setValue:[UIFont boldSystemFontOfSize:GLOBAL_FONTSIZE] forKeyPath:@"_placeholderLabel.font"];
    }
    return cell;
}


@end
