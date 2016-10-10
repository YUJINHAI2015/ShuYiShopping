//
//  SYBankTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYBankTableViewCell.h"

@interface SYBankTableViewCell()
@property (weak, nonatomic) IBOutlet UIButton *bankBtn;

@end
@implementation SYBankTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [SYExpand initUIForBtn:_bankBtn];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)bankAction:(UIButton *)sender {
    if (_bankAC) {
        _bankAC(sender.titleLabel.text);
    }
}

@end
