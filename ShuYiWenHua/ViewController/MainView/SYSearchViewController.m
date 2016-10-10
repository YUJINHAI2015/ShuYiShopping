//
//  SYSearchViewController.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/27.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYSearchViewController.h"
#import "ZYTokenManager.h"
#import "WSSearchTextField.h"
#define fontCOLOR [UIColor colorWithRed:163/255.0f green:163/255.0f blue:163/255.0f alpha:1]

@interface SYSearchViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSMutableArray * searchHistory;
@property (nonatomic, strong) WSSearchTextField *searchBar;
@property (nonatomic,strong) NSArray *myArray;//搜索记录的数组
@property (nonatomic, assign) BOOL isSelectTableView;
@end

@implementation SYSearchViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:NO];
    [self.searchBar becomeFirstResponder];
    self.isSelectTableView = NO;
    [self readNSUserDefaults];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
//    [self setAutomaticallyAdjustsScrollViewInsets:YES];
//    [self setExtendedLayoutIncludesOpaqueBars:YES];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.searchBar resignFirstResponder];

}
- (void)initUI{
    [self HiddenCellLine:self.myTableView];
    self.NavLeftBtn.hidden = YES;
    
    WSSearchTextField *search = [[WSSearchTextField alloc] initWithFrame:CGRectMake(0, 0, 300, 30)];
    search.delegate = self;
    self.searchBar = search;
    [self.searchBar setReturnKeyType:UIReturnKeySearch];
    self.navigationItem.titleView = search;
    
    
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightButton setImage:[UIImage imageNamed:@"ws_calender_today"] forState:UIControlStateNormal];
    [rightButton setFrame:CGRectMake(0, 0, 44, 44)];
    [rightButton addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    
    
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(rightButtonClick:)];
    UIBarButtonItem *fix = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.rightBarButtonItems = @[right,fix];
}
- (void)rightButtonClick:(UIButton *)btn{
    [self dismissViewControllerAnimated:NO completion:nil];
}
#pragma mark - textFieldDelegate
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (textField.text.length > 0) {
        // 执行跳转语句
        NSLog(@"%@",textField.text);
        if (self.isSelectTableView) {
            self.isSelectTableView = NO;
            return ;
        }
        [ZYTokenManager SearchText:textField.text];//缓存搜索记录
        //        [self readNSUserDefaults];
    }else{
        NSLog(@"请输入查找内容");
    }
}

#pragma mark -  UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section==0) {
        if (_myArray.count>0) {
            return _myArray.count+1+1;
        }else{
            return 1;
        }
    }else{
        return 0;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if(indexPath.row ==0){
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            cell.textLabel.text = @"历史搜索";
            cell.textLabel.textColor = fontCOLOR;
            return cell;
        }else if (indexPath.row == _myArray.count+1){
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            cell.textLabel.text = @"清除历史记录";
            cell.textLabel.textColor = fontCOLOR;
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            return cell;
        }else{
            UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
            NSArray* reversedArray = [[_myArray reverseObjectEnumerator] allObjects];
            cell.textLabel.text = reversedArray[indexPath.row-1];
            
            return cell;
        }
    }else{
        UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:0 reuseIdentifier:@"cell"];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 0;
    }else{
        return 10;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    self.myTableView.estimatedRowHeight = 44.0f;
    return UITableViewAutomaticDimension;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [self.searchBar resignFirstResponder];
    
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == _myArray.count+1) {//清除所有历史记录
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"清除历史记录" message:@"" preferredStyle: UIAlertControllerStyleAlert];
        
        //@“ UIAlertControllerStyleAlert，改成这个就是中间弹出"
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [ZYTokenManager removeAllArray];
            _myArray = nil;
            [self.myTableView reloadData];
        }];
        //            UIAlertAction *archiveAction = [UIAlertAction actionWithTitle:@"保存" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancelAction];
        [alertController addAction:deleteAction];
        //            [alertController addAction:archiveAction];
        [self presentViewController:alertController animated:YES completion:nil];
    }else{
        // 执行跳转语句
        self.isSelectTableView = YES;
        NSArray* reversedArray = [[_myArray reverseObjectEnumerator] allObjects];
        self.searchBar.text = reversedArray[indexPath.row-1];
    }
}


-(void)readNSUserDefaults{//取出缓存的数据
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray * myArray = [userDefaultes arrayForKey:@"myArray"];
    self.myArray = myArray;
    [self.myTableView reloadData];
    NSLog(@"myArray======%@",myArray);
}

@end
