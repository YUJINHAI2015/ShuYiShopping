//
//  SYBaseNavigationViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYBaseNavigationViewController.h"

@interface SYBaseNavigationViewController ()

@end

@implementation SYBaseNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [UINavigationBar appearance].translucent = NO;
    [UINavigationBar appearance].tintColor=[UIColor whiteColor];
    [UINavigationBar appearance].barTintColor=[UIColor ws_lightBlackColor];
    [UINavigationBar appearance].titleTextAttributes=@{NSForegroundColorAttributeName:[UIColor whiteColor]};
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
