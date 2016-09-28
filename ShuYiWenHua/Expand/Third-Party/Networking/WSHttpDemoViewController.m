//
//  WSHttpDemoViewController.m
//  WeiShiOffice
//
//  Created by liuligui on 16/5/13.
//  Copyright © 2016年 Tankch-mac. All rights reserved.
//

#import "WSHttpDemoViewController.h"

@interface WSHttpDemoViewController ()

@end

@implementation WSHttpDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)test:(id)sender {
    
    //参数
    NSDictionary *dic =@{
                         @"mobile" : @"13250759030",
                         @"password" :@"123qwe",
                         @"macType" :@"1"
                         };
    
    [[ComData shareInstance] requestData:dic API:@"/appRegister/login.do" complete:^(HttpRequest *request, NSDictionary *responseObj) {
        //成功
        [AlertUtils showToastWithMessage:responseObj[@"message"]inView:self.view hideAfterDelay:4.0 beIndeter:NO];
    } error:^(HttpRequest *request, NSString *errMsg) {
        //失败
        [AlertUtils showToastWithMessage:errMsg inView:self.view hideAfterDelay:4.0 beIndeter:NO];
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
