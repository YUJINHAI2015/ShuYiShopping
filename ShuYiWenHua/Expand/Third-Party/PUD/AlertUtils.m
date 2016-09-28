//
//  AlertUtils.m
//  advideo
//
//  Created by mokai on 14-7-26.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import "AlertUtils.h"
#import "MBProgressHUD.h"
#import <objc/runtime.h>

static const void *HttpRequestHUDKey = &HttpRequestHUDKey;
@implementation AlertUtils

+ (void)showAlert:(NSString*)message{
    [self showAlert:nil message:message cancelButtonTitle:@"确定"];
}

+ (void)showAlert:(NSString*)title message:(NSString*)msg cancelButtonTitle:(NSString*)cancelButtonTitle
{
    [self showAlert:title message:msg cancelButtonTitle:cancelButtonTitle cancelHandler:nil];
}

+ (void)showAlert:(NSString*)title message:(NSString*)msg cancelButtonTitle:(NSString*)cancelButtonTitle cancelHandler:(AlertUtilsBlock) chandler
{
    [self showAlert:title message:msg cancelButtonTitle:cancelButtonTitle cancelHandler:chandler otherButtonTitle:nil otherHandler:nil];
}




+(void)showToastWithMessage:(NSString *)message inView:(UIView *)view{
    [self showToastWithMessage:message inView:view hideAfterDelay:1 beIndeter:NO];
}

+(void)showToastWithMessage:(NSString *)message inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay beIndeter:(BOOL)indeter{
    [self hideToastInView:view];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
	
	// Configure for text only and offset down
    if (indeter) {
        hud.mode = MBProgressHUDModeIndeterminate;
    }else{
        hud.mode = MBProgressHUDModeText;
    }

	hud.labelText = message;
    hud.labelFont = [UIFont fontWithName:@"BanglaSangamMN" size:15];
	hud.margin = 10.f;
    //	hud.yOffset = 150.f;
	hud.removeFromSuperViewOnHide = YES;
	if (delay > 0) {
        [hud hide:YES afterDelay:delay];
    }
}



+(void)hideToastInView:(UIView *)view{
    [MBProgressHUD hideAllHUDsForView:view  animated:NO];
}



+(MBProgressHUD *)HUD{
    return objc_getAssociatedObject(self, HttpRequestHUDKey);
}

+(void)setHUD:(MBProgressHUD *)HUD{
    objc_setAssociatedObject(self, HttpRequestHUDKey, HUD, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(void)showHudInView:(UIView *)view hint:(NSString *)hint{
    MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:view];
    HUD.labelText = hint;
    [view addSubview:HUD];
    [HUD show:YES];
    [self setHUD:HUD];
}

+ (void)showHint:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = IS_IPHONE_5?200.f:150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}
+(void)showHintShort:(NSString *)hint
{
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = IS_IPHONE_5?200.f:150.f;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:0.4];
}
+ (void)showHint:(NSString *)hint yOffset:(float)yOffset {
    //显示提示信息
    UIView *view = [[UIApplication sharedApplication].delegate window];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.userInteractionEnabled = NO;
    // Configure for text only and offset down
    hud.mode = MBProgressHUDModeText;
    hud.labelText = hint;
    hud.margin = 10.f;
    hud.yOffset = IS_IPHONE_5?200.f:150.f;
    hud.yOffset += yOffset;
    hud.removeFromSuperViewOnHide = YES;
    [hud hide:YES afterDelay:2];
}

+ (void)hideHud{
    [[self HUD] hide:YES];
}

@end

