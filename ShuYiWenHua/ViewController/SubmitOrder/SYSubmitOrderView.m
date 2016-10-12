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
@property (weak, nonatomic) IBOutlet UIButton *sendServerCenterBtn;
@property (weak, nonatomic) IBOutlet UIButton *getBySelfBtn;
@property (weak, nonatomic) IBOutlet UIButton *assignAddressBtn;

@end
@implementation SYSubmitOrderView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

// 配送方式
- (IBAction)selectSendTypeAction:(id)sender {
    NSLog(@"selectSendTypeAction");
}
// 使用者信息
- (IBAction)selectUserInfoAction:(id)sender {
    NSLog(@"selectUserInfoAction");
}
// 收货地址方式
- (IBAction)addressTypeAction:(UIButton *)sender {
    //1110
    NSLog(@"%ld",(long)sender.tag);
    [self.sendServerCenterBtn setImage:[UIImage imageNamed:@"ovalBtn"] forState:UIControlStateNormal];
    [self.getBySelfBtn setImage:[UIImage imageNamed:@"ovalBtn"] forState:UIControlStateNormal];
    [self.assignAddressBtn setImage:[UIImage imageNamed:@"ovalBtn"] forState:UIControlStateNormal];
    self.sendServerCenterBtn.selected = NO;
    self.getBySelfBtn.selected = NO;
    self.assignAddressBtn.selected = NO;
    switch (sender.tag) {
        case 1110:
            self.sendServerCenterBtn.selected = !sender.selected;
            [self.sendServerCenterBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
            break;
        case 1111:
            self.getBySelfBtn.selected = !sender.selected;
            [self.getBySelfBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
            break;
        case 1112:
            self.assignAddressBtn.selected = !sender.selected;
            [self.assignAddressBtn setImage:[UIImage imageNamed:@"select"] forState:UIControlStateNormal];
            break;
        default:
            break;
    }
    NSLog(@"%d",self.sendServerCenterBtn.selected);
    NSLog(@"%d",self.getBySelfBtn.selected);
    NSLog(@"%d",self.assignAddressBtn.selected);
}
// 下拉列表
- (IBAction)selectAreaAction:(UIButton *)sender {
    // 1120
     NSLog(@"%ld",(long)sender.tag);
    if (self.getBySelfBtn.selected) {
        if (_submitOrderAction) {
            if (sender.tag == 1120) {
                _submitOrderAction(sender.tag);
            }
        }
    }
    if (self.assignAddressBtn.selected) {
        if (sender.tag == 1120) {
            return;
        }
        if (_submitOrderAction) {
            _submitOrderAction(sender.tag);
        }
    }
    
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect temp = self.frame;

    temp.size.height = CGRectGetMaxY(self.phoneField.frame) + 20;

    self.frame = temp;
}
@end
