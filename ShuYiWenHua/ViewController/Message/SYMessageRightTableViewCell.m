//
//  SYMessageRightTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/11.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYMessageRightTableViewCell.h"

@interface SYMessageRightTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *productNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *productDetailLabel;

@end
@implementation SYMessageRightTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Fix the bug in iOS7 - initial constraints warning
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}

- (void)setMessageModel:(SYMessageModel *)messageModel{
    _messageModel = messageModel;
    
    self.leftImageView.image = [UIImage imageNamed:@"sy_main_icon_pay"];
    self.productNameLabel.text = messageModel.title;
    self.productDetailLabel.text = messageModel.content;
}
- (CGSize)sizeThatFits:(CGSize)size {
    return CGSizeMake(size.width, 120);;
}
@end
