//
//  CollectionViewCell.m
//  UICollectionViewDemo1
//
//  Created by user on 15/11/2.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "CollectionViewCell.h"

@interface CollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *titleLabelName;
@end
@implementation CollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.backgroundColor = [UIColor whiteColor];

}
- (void)setdict:(NSDictionary *)dict{
    self.imageViewIcon.image = [UIImage imageNamed:dict[@"imageName"]];
    self.titleLabelName.text = dict[@"titleName"];
}
@end
