//
//  SYBaseViewController.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"
@protocol SYBaseViewControllerProtocol <NSObject>

@optional
/**
 *  创建UI
 */
- (void)createUI;

/**
 *  加载UI数据
 */
- (void)loadViewData;
/**
 *  添加头刷新
 */
- (void)addHeadRefresh;
/**
 *  添加尾刷新
 */
- (void)addFootReFresh;

/**
 *  初始化UI数据
 */
- (void)initViewData;

- (void)HiddenCellLine: (UITableView *)tableView;//隐藏多余的分割线
@end

@interface SYBaseViewController : UIViewController<SYBaseViewControllerProtocol,UITextFieldDelegate,UINavigationControllerDelegate>
@property(strong,nonatomic)UIButton *NavLeftBtn,*NavRightBtn;

@end
