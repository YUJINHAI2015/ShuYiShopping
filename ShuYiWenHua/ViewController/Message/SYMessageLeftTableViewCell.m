//
//  SYMessageLeftTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/11.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYMessageLeftTableViewCell.h"

@interface SYMessageLeftTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end
@implementation SYMessageLeftTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Fix the bug in iOS7 - initial constraints warning
    self.contentView.bounds = [UIScreen mainScreen].bounds;
}

- (void)setMessageModel:(SYMessageModel *)messageModel{
    _messageModel = messageModel;
    
    self.titleLabel.text = messageModel.title;
    self.detailLabel.text = messageModel.content;
    self.timeLabel.text = messageModel.time;
}

// If you are not using auto layout, override this method, enable it by setting
// "fd_enforceFrameLayout" to YES.
- (CGSize)sizeThatFits:(CGSize)size {
    CGFloat totalHeight = 0;
    totalHeight += [self.titleLabel sizeThatFits:size].height;
    totalHeight += [self.detailLabel sizeThatFits:size].height;
    totalHeight += [self.timeLabel sizeThatFits:size].height;
    totalHeight += 40; // margins
    return CGSizeMake(size.width, totalHeight);
}
@end
