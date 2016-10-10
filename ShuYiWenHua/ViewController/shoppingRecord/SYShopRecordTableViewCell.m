//
//  SYShopRecordTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYShopRecordTableViewCell.h"

@interface SYShopRecordTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *recordImageView;
@property (weak, nonatomic) IBOutlet UILabel *recordNumber;
@property (weak, nonatomic) IBOutlet UILabel *recordType;
@property (weak, nonatomic) IBOutlet UILabel *recordWay;
@property (weak, nonatomic) IBOutlet UILabel *recordName;
@property (weak, nonatomic) IBOutlet UILabel *recordStuNumber;
@property (weak, nonatomic) IBOutlet UILabel *recordTime;
@property (weak, nonatomic) IBOutlet UILabel *acountMoney;
@property (weak, nonatomic) IBOutlet UILabel *pvMoney;
@property (weak, nonatomic) IBOutlet UIButton *recordBtnType;

@end
@implementation SYShopRecordTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.recordBtnType.layer.masksToBounds = YES;
    self.recordBtnType.layer.cornerRadius = 3.0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setShop:(SYShopRecordModel *)shop{
    
}
- (IBAction)actionPayType:(UIButton *)sender {
    if (_actionType) {
        _actionType(sender.titleLabel.text);
    }
}
@end
