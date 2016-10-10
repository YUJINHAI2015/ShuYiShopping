//
//  SYMyTableViewCell.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/9/23.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYMyTableViewCell.h"
#import "registModel.h"

@interface SYMyTableViewCell()<UITextFieldDelegate>

@end
@implementation SYMyTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.textField.delegate = self;
    [_textField setFont:[UIFont systemFontOfSize:17]];
    [_textField addTarget:self action:@selector(editDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [_textField addTarget:self action:@selector(textValueChanged:) forControlEvents:UIControlEventEditingChanged];
    [_textField addTarget:self action:@selector(editDidEnd:) forControlEvents:UIControlEventEditingDidEnd];
}

/**
 *  设置子控件的数据
 */
- (void)setTg:(registModel *)tg
{
    _tg = tg;
    self.name.text = tg.name;
    self.textField.placeholder = tg.placeholder;
    [self.textField setValue:[UIFont boldSystemFontOfSize:GLOBAL_FONTSIZE] forKeyPath:@"_placeholderLabel.font"];
}


#pragma mark TextField
- (void)editDidBegin:(id)sender {
//    self.lineView.backgroundColor = [UIColor colorWithHexString:@"0xffffff"];
//    self.clearBtn.hidden = _isForLoginVC? self.textField.text.length <= 0: YES;
    
    if (self.editDidBeginBlock) {
        self.editDidBeginBlock(self.textField.text);
    }
}

- (void)editDidEnd:(id)sender {
//    self.lineView.backgroundColor = [UIColor colorWithHexString:@"0xffffff" andAlpha:0.5];
//    self.clearBtn.hidden = YES;
    
    if (self.editDidEndBlock) {
        self.editDidEndBlock(self.textField.text);
    }
}

- (void)textValueChanged:(id)sender {
//    self.clearBtn.hidden = _isForLoginVC? self.textField.text.length <= 0: YES;
    
    if (self.textValueChangedBlock) {
        self.textValueChangedBlock(self.textField.text);
    }
}
@end
