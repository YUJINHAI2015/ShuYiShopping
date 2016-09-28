//
//  SYLogoView.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/23.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYLogoView.h"
@interface SYLogoView ()
@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;

@end
@implementation SYLogoView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark - 快速构造方法
+ (instancetype)logoView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}
#pragma mark - 设置数据
- (void)setIcon:(NSString *)icon{
    self.logoImageView.image = [UIImage imageNamed:icon];
}
@end
