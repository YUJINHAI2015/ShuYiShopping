//
//  SYLoginViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/30.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYLoginViewController.h"
#import "SDauthCode.h"
#import "SYChangePWViewController.h"
@interface SYLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameTf;
@property (weak, nonatomic) IBOutlet UITextField *userPasswordTf;
@property (weak, nonatomic) IBOutlet UITextField *codeTf;
@property (weak, nonatomic) IBOutlet SDauthCode *codeView;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;


@end

@implementation SYLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.loginBtn.backgroundColor = [UIColor ws_lightBlackColor];
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 4;
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    self.title = @"用户登录";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginAction:(id)sender {
    NSString *authCodeStr = [self.codeView.authCodeString uppercaseString];
    NSString *codeTfStr = [self.codeTf.text uppercaseString];
    if ([authCodeStr isEqualToString:codeTfStr]) {
        
        //这里面写验证正确之后的动作.
//        [self.codeView reloadAuthCodeView];
        NSLog(@"相等");

    }else{
        
        //这里面写验证失败之后的动作.
        
//        [self.codeView reloadAuthCodeView];
        NSLog(@"不相等");
    }
}
- (IBAction)changePWAction:(id)sender {
    SYChangePWViewController *changePW = [SYChangePWViewController new];
    [self.navigationController pushViewController:changePW animated:YES];
}
- (IBAction)registAction:(id)sender {
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
