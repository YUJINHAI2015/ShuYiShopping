//
//  SYCustomButton.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/23.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYCustomButton.h"

@implementation SYCustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        // 文本居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize: 15.0];
        // 改变图片的内容模式
        self.imageView.contentMode = UIViewContentModeCenter;
        self.layer.cornerRadius = 5.0;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor ws_lightBlackColor];
        
        // 重新设置footerView
        UITableView *tableView = (UITableView *)self.superview;
        //    tableView.tableFooterView = self;
        tableView.contentSize = CGSizeMake(0, CGRectGetMaxY(self.frame));
    }
    return self;
}

#pragma mark - 方式二
- (void)layoutSubviews{
    [super layoutSubviews];
    // 设置子控件的位置
    
}

@end
