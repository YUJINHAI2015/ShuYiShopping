//
//  SYBaseTableViewController.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/12.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SYBaseViewController.h"
typedef void (^ActionBlock)(void);

@interface SYBaseTableViewController : UITableViewController<SYBaseViewControllerProtocol>
- (void)createBackButtonItemAction : (ActionBlock)block;


@end
