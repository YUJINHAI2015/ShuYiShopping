//
//  SYLeftTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYLeftTableViewCell.h"

@interface SYLeftTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@end
@implementation SYLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UIColor *color = [[UIColor alloc]initWithRed:60.0 / 255.0 green:60.0 / 255.0 blue:60.0 / 255.0 alpha:1];//通过RGB来定义自己的颜色
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = color;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)setdict:(NSDictionary *)dict{
    self.leftImageView.image = [UIImage imageNamed:dict[@"imageName"]];
    self.rightLabel.text = dict[@"titleName"];
}
@end
