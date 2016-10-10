//
//  SYAcountAreaTableViewCell.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/29.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYAcountAreaTableViewCell : UITableViewCell
@property (nonatomic,copy) void(^firstAC)(NSString *);
@property (nonatomic,copy) void(^secondAC)(NSString *);
@property (nonatomic,copy) void(^thirdAC)(NSString *);

@end
