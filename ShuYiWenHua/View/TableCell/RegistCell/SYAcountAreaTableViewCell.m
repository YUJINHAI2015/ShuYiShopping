//
//  SYAcountAreaTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYAcountAreaTableViewCell.h"

@interface SYAcountAreaTableViewCell ()
@property (weak, nonatomic) IBOutlet UIButton *firstBtn;
@property (weak, nonatomic) IBOutlet UIButton *secondBtn;
@property (weak, nonatomic) IBOutlet UIButton *thirdBtn;

@end

@implementation SYAcountAreaTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;

    [SYExpand initUIForBtn:_firstBtn];
    [SYExpand initUIForBtn:_secondBtn];
    [SYExpand initUIForBtn:_thirdBtn];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)firstAction:(UIButton*)sender {
    if (_firstAC) {
        _firstAC(sender.titleLabel.text);
    }
}
- (IBAction)secondAction:(UIButton*)sender {
    if (_secondAC) {
        _secondAC(sender.titleLabel.text);
    }
}
- (IBAction)thirdAction:(UIButton*)sender {
    if (_secondAC) {
        _secondAC(sender.titleLabel.text);
    }
}

@end
