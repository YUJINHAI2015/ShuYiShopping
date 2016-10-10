//
//  SYShoppingCarTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/8.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYShoppingCarTableViewCell.h"

@interface SYShoppingCarTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLable;
@property (weak, nonatomic) IBOutlet UILabel *pvLabel;
@property (weak, nonatomic) IBOutlet UILabel *acountLabel;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;

@end
@implementation SYShoppingCarTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectBtn.layer.masksToBounds = YES;
    self.selectBtn.layer.cornerRadius = 10.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)shopCarAction:(id)sender {
    if (_shopCarActionType) {
        _shopCarActionType();
    }
}

@end
