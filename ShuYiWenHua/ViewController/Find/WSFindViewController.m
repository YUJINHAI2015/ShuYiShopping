//
//  WSFindViewController.m
//  框架
//
//  Created by shupengstar on 16/7/7.
//  Copyright © 2016年 YJH. All rights reserved.
//

#import "WSFindViewController.h"
#define oriOffsetY -200
#define oriHeightset 200
@interface WSFindViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *PersonTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightConstr;

@end
static NSString *ID = @"cell";
@implementation WSFindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.NavLeftBtn.hidden = YES;
    [self.PersonTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    //不要自动设置偏移量
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.navigationController.navigationBar.hidden = YES;
    //当调用contentInset会自动调用scrollViewDidScroll
    self.PersonTableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    //求偏移量
    //当前点 - 最原始的点
    NSLog(@"%f",scrollView.contentOffset.y);
    CGFloat offset = scrollView.contentOffset.y - oriOffsetY;
    NSLog(@"offset======%f",offset);
    
    CGFloat h = oriHeightset - offset;
    if (h < 64) {
        h = 64;
    }
    self.heightConstr.constant = h;
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
    UITableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    NSLog(@"%p",cell);
    
    cell.textLabel.text = @"xmg";
    
    return cell;
}

@end
