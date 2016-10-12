//
//  SYSubmitOrderView.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/8.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYSubmitOrderView : UIView
@property (nonatomic,copy) void(^submitOrderAction)(NSInteger);

@end
