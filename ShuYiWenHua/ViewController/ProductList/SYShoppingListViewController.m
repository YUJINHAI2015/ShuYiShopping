//
//  SYShoppingListViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYShoppingListViewController.h"
#import "SYShoppingListTableViewCell.h"
#import "SYShoppingListModel.h"
#import "MJExtension.h"
#import "KxMenu.h"
#import "WSSearchTextField.h"
#import "SYSearchViewController.h"
#import "SYBaseNavigationViewController.h"
#import "WSSearchTextField.h"

#define kScreen_Width [UIScreen mainScreen].bounds.size.width
#define kDevice_Is_iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)
static NSString *shoppingCellID = @"shoppingCell";
@interface SYShoppingListViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *shoppingListTableView;
@property (nonatomic, strong) NSArray *tgs;
@property (strong, nonatomic) NSMutableArray *searchResults;

@end

@implementation SYShoppingListViewController
- (NSArray *)tgs
{
    if (!_tgs) {
        _tgs = [SYShoppingListModel mj_objectArrayWithFilename:@"tgs.plist"];
    }
    return _tgs;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.shoppingListTableView registerNib:[UINib nibWithNibName:NSStringFromClass([SYShoppingListTableViewCell class])  bundle:nil] forCellReuseIdentifier:shoppingCellID];;
    self.shoppingListTableView.rowHeight = 80;
    [self HiddenCellLine:self.shoppingListTableView];
    [self initUI];
//    [self setAutomaticallyAdjustsScrollViewInsets:YES];
//    [self setExtendedLayoutIncludesOpaqueBars:YES];
    
}
- (void)initUI{
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"sy_select"] forState:UIControlStateNormal];
    [rightButton setFrame:CGRectMake(0, 0, 44, 44)];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    
    UIButton *shoppingCarBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [shoppingCarBtn setImage:[UIImage imageNamed:@"sy_shoppingCar"] forState:UIControlStateNormal];
    [shoppingCarBtn setFrame:CGRectMake(0, 0, 44, 44)];
    [shoppingCarBtn addTarget:self action:@selector(shoppingButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *shoppingButtonItem = [[UIBarButtonItem alloc]initWithCustomView:shoppingCarBtn];
    
    self.navigationItem.rightBarButtonItems = @[rightButtonItem,shoppingButtonItem];
    
    WSSearchTextField *search = [[WSSearchTextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    search.delegate = self;
    search.placeholder = @"搜索产品";
    self.navigationItem.titleView = search;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tgs.count;;
}
- (void)rightButtonClick:(UIButton *)btn{
    [self rightNavBtnClicked];
};
- (void)shoppingButtonClick:(UIButton *)btn{};

- (void)rightNavBtnClicked{
    
    if ([KxMenu isShowingInView:self.view]) {
        [KxMenu dismissMenu:YES];
    }else{
        [KxMenu setTitleFont:[UIFont systemFontOfSize:14]];
        [KxMenu setTintColor:[UIColor whiteColor]];
        [KxMenu setLineColor:[UIColor colorWithHexString:@"0xdddddd"]];
        NSArray *menuItems = @[
                               [KxMenuItem menuItem: @"戒指类" image:nil target:self action:@selector(ringType)],
                               [KxMenuItem menuItem:@"手表类" image:nil target:self action:@selector(watchType)],
                               [KxMenuItem menuItem:@"门牌类" image:[UIImage imageNamed:@"tips_menu_icon_mkread"] target:self action:@selector(watchType)],
                               [KxMenuItem menuItem:@"手链类" image:[UIImage imageNamed:@"tips_menu_icon_mkread"] target:self action:@selector(watchType)]
                               ];
        
        [menuItems setValue:[UIColor colorWithHexString:@"0x222222"] forKey:@"foreColor"];
        CGRect senderFrame = CGRectMake(kScreen_Width - (kDevice_Is_iPhone6Plus? 30: 26), 0, 0, 0);
        [KxMenu showMenuInView:self.view
                      fromRect:senderFrame
                     menuItems:menuItems];
    }
}
- (void)ringType{

}
- (void)watchType{

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SYShoppingListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:shoppingCellID];
    cell.shop = self.tgs[indexPath.row];
    return cell;

}
#pragma mark - textFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    [self goToSearchVC];
    return YES;
}
-(void)goToSearchVC{
    SYSearchViewController *vc=[[SYSearchViewController alloc] init];
    SYBaseNavigationViewController *searchNav=[[SYBaseNavigationViewController alloc]initWithRootViewController:vc];
    [self.navigationController presentViewController:searchNav animated:NO completion:nil];
}
@end
