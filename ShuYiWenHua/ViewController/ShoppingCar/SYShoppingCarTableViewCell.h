//
//  SYShoppingCarTableViewCell.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/8.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SYShoppingCarModel;
@interface SYShoppingCarTableViewCell : UITableViewCell
@property (nonatomic, strong) SYShoppingCarModel *ShoppingCar;
@property (nonatomic,copy) void(^shopCarActionType)(void);

@end
