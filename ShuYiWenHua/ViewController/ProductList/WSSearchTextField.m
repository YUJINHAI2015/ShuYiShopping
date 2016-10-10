//
//  WSSearchTextField.m
//  WeiShiOffice
//
//  Created by zsl-mac on 16/5/7.
//  Copyright © 2016年 Tankch-mac. All rights reserved.
//

#import "WSSearchTextField.h"

@implementation WSSearchTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI{
    self.backgroundColor = [UIColor whiteColor];
    self.placeholder = @"搜索";
    [self zsl_setCornerRadius:5];
    self.textColor = [UIColor blackColor];

    UIImageView *searchImage = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sy_search"]];
    [searchImage setFrame:CGRectMake(5, 0, 15, 15)];
    self.leftView = searchImage;
    self.leftViewMode = UITextFieldViewModeAlways;
    
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds
{
    CGRect iconRect = [super leftViewRectForBounds:bounds];
    iconRect.origin.x += 11; //像右边偏15
    return iconRect;
}

//UITextField 文字与输入框的距离
- (CGRect)textRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 33, 0);
    
}
//控制文本的位置
- (CGRect)editingRectForBounds:(CGRect)bounds{
    
    return CGRectInset(bounds, 33, 0);
}


@end
