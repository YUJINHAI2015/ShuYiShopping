//
//  SYRegistSuccessViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/30.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYRegistSuccessViewController.h"

@interface SYRegistSuccessViewController ()
@property (weak, nonatomic) IBOutlet UILabel *userNumber;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation SYRegistSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.loginBtn.backgroundColor = [UIColor ws_lightBlackColor];
    self.loginBtn.layer.masksToBounds = YES;
    self.loginBtn.layer.cornerRadius = 4;
    self.loginBtn.titleLabel.font = [UIFont systemFontOfSize: 15.0];
    self.title = @"注册成功";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)loginAction:(id)sender {
    
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
