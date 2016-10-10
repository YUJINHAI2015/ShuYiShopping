//
//  SYLogoView.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/23.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYLogoView : UIView
// 提供set方法
- (void)setIcon: (NSString *)icon;
//- (void)setName: (NSString *)name;

+ (instancetype)logoView;
@end
