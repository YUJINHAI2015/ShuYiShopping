//
//  SYShoppingListTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYShoppingListTableViewCell.h"
#import "SYShoppingListModel.h"
@interface SYShoppingListTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *listImageView;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *shopType;
@property (weak, nonatomic) IBOutlet UILabel *shopPrice;
@property (weak, nonatomic) IBOutlet UILabel *pvPrice;

@end
@implementation SYShoppingListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setShop:(SYShoppingListModel *)shop{
    _shop = shop;
    self.listImageView.image = [UIImage imageNamed:shop.icon];
    self.shopName.text = shop.shopName;
    self.shopType.text = shop.shopType;
    self.shopPrice.text = shop.shopPrice;
    self.pvPrice.text = shop.pvPrice;
}
@end
