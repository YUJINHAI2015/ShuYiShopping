//
//  SYSubmitOrderView.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/8.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYSubmitOrderView.h"

@interface SYSubmitOrderView ()
@property (weak, nonatomic) IBOutlet UIButton *sendTypeLbl;
@property (weak, nonatomic) IBOutlet UITextField *remarkField;
@property (weak, nonatomic) IBOutlet UITextField *detailAddressField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@end
@implementation SYSubmitOrderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)selectSendTypeAction:(id)sender {
    NSLog(@"selectSendTypeAction");
}
- (IBAction)selectUserInfoAction:(id)sender {
    NSLog(@"selectUserInfoAction");
}
- (IBAction)addressTypeAction:(UIButton *)sender {
    //1110
    NSLog(@"%ld",(long)sender.tag);
}
- (IBAction)selectAreaAction:(UIButton *)sender {
    // 1120
     NSLog(@"%ld",(long)sender.tag);
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect temp = self.frame;

    temp.size.height = CGRectGetMaxY(self.phoneField.frame) + 20;

    self.frame = temp;
}
@end
