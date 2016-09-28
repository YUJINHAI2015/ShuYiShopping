//
//  SYRegistTableViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/22.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYRegistTableViewController.h"
#import "SYMyTableViewCell.h"
#import "MJExtension.h"
#import "registModel.h"
#import "SYLogoView.h"
#import "SYCustomButton.h"
#import "Masonry.h"

static NSString *tgID = @"cell";
@interface SYRegistTableViewController ()
@property (nonatomic ,strong)NSArray * tgs;

@end

@implementation SYRegistTableViewController
- (NSArray *)tgs
{
    if (!_tgs) {
        _tgs = [registModel mj_objectArrayWithFilename:@"regist.plist"];
    }
    return _tgs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYMyTableViewCell class]) bundle:nil] forCellReuseIdentifier:tgID];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = 60;
    
    
    
    SYLogoView *view = [SYLogoView logoView];
    self.tableView.tableHeaderView = view;
//    [view setIcon:@"logos"];
    
    SYCustomButton *button = [[SYCustomButton alloc]initWithFrame:CGRectMake(20, 10, SCREEN_WIDTH - 40, 44)];
    
    UIView *views = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    [views addSubview:button];
    
    self.tableView.tableFooterView = views;

    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"已完成，下一步" forState:UIControlStateNormal];
}
- (void)click{
    NSLog(@"hello");
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tgs.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SYMyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tgID];
    
    // 设置数据
    cell.tg = self.tgs[indexPath.row];
    return cell;
}
/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
