//
//  SYMyTableViewCell.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/23.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhoneCodeButton.h"

@class registModel;

@interface SYMyTableViewCell : UITableViewCell
@property (nonatomic ,strong)registModel *tg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UITextField *textField;


@property (nonatomic,copy) void(^textValueChangedBlock)(NSString *);
@property (nonatomic,copy) void(^editDidBeginBlock)(NSString *);
@property (nonatomic,copy) void(^editDidEndBlock)(NSString *);
@property (nonatomic,copy) void(^phoneCodeBtnClckedBlock)(PhoneCodeButton *);

- (void)setPlaceholder:(NSString *)phStr value:(NSString *)valueStr;
+ (NSString *)randomCellIdentifierOfPhoneCodeType;
@end
