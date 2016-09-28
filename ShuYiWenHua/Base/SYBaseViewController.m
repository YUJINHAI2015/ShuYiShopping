//
//  SYBaseViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYBaseViewController.h"


@interface SYBaseViewController ()

@property (nonatomic,assign) BOOL keyboardIsVisible;

@property (nonatomic,strong) UITextField *oldTextField;
@end

@implementation SYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc] init];
    [self InitNavigation];
}

#pragma mark 检测键盘状态
//点击空白
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
//当用户按下return键或者按回车键，keyboard消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    switch (textField.returnKeyType) {
        case UIReturnKeyNext:
            [self textFieldNext:textField];
            break;
        default:
            [self textFieldReturn:textField];
            [textField resignFirstResponder];
            break;
    }
    return  YES;
}
-(void)textFieldReturn:(UITextField *)textField{
    
}
-(void)textFieldNext:(UITextField *)textField{
    UIView *view = [textField.superview viewWithTag:textField.tag+1];
    
    if ([view isKindOfClass:[UITextField class]]) {
        
        UITextField *next = (UITextField *)view;
        
        [next becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self name:UIKeyboardDidShowNotification object:nil];
    [center removeObserver:self name:UIKeyboardDidHideNotification object:nil];
    //隐藏键盘
    [_oldTextField resignFirstResponder];
}
#pragma mark --- 隐藏多余的分割线
- (void)HiddenCellLine: (UITableView *)tableView

{
    UIView *view = [UIView new];
    
    view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [tableView setTableFooterView:view];
}

#pragma mark - 初始化导航栏
-(void)InitNavigation{
    
    self.NavLeftBtn = [UIButton buttonWithImage:@""];
    [self.NavLeftBtn setImage:[UIImage imageNamed:@"ws_nav_back"] forState:UIControlStateNormal];
    [self.navigationItem setLeftBarButtonItem:[[[UIBarButtonItem alloc] init] initWithCustomView:self.NavLeftBtn]];
    [self.NavLeftBtn  setFrame:CGRectMake(0, 0, 44, 44)];
    [self.NavLeftBtn handleControlEvent:UIControlEventTouchDown withBlock:^(id sender) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    self.NavRightBtn = [UIButton buttonWithImage:@""];
    self.NavRightBtn.titleLabel.font =System_Twenty;
    [self.NavRightBtn  setFrame:CGRectMake(0, 0, 46, 44)];
    [self.NavRightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.navigationItem setRightBarButtonItem:[[[UIBarButtonItem alloc]init] initWithCustomView:self.NavRightBtn]];
    
}

@end
