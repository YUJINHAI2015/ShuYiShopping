//
//  SYMyTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/23.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYMyTableViewCell.h"
#import "registModel.h"

@interface SYMyTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITextField *filed;

@end
@implementation SYMyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}
/**
 *  设置子控件的数据
 */
- (void)setTg:(registModel *)tg
{
    _tg = tg;
    self.name.text = tg.name;
    self.filed.placeholder = tg.placeholder;
}
@end
