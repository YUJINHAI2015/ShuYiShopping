//
//  SYElectriWalletTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/10.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYElectriWalletTableViewCell.h"
#import "SYElectriWalletModel.h"
@interface SYElectriWalletTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *tradeTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *operatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *payAcountLabel;
@property (weak, nonatomic) IBOutlet UILabel *tradeTimeLabel;

@end
@implementation SYElectriWalletTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setShop:(SYElectriWalletModel *)electriWallet{
    _electriWallet = electriWallet;
//    self.listImageView.image = [UIImage imageNamed:shop.icon];
//    self.shopName.text = shop.shopName;
//    self.shopType.text = shop.shopType;
//    self.shopPrice.text = shop.shopPrice;
//    self.pvPrice.text = shop.pvPrice;
}
@end
