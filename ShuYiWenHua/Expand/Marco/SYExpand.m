//
//  SYExpand.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYExpand.h"

@implementation SYExpand
+ (void)initUIForBtn:(UIButton*)btn{
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:3.0]; //设置矩圆角半径
    [btn.layer setBorderWidth:1.0];   //边框宽度
    
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef colorref = CGColorCreate(colorSpace,(CGFloat[]){ 217/255.0, 217/255.0, 217/255.0, 1 });
    [btn.layer setBorderColor:colorref];//边框颜色
}
@end
