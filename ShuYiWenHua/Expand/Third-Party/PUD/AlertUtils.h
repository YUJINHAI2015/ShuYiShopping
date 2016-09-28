//
//  AlertUtils.h
//  advideo
//
//  Created by mokai on 14-7-26.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^AlertUtilsBlock)();

@interface AlertUtils : NSObject

+ (void)showAlert:(NSString*)message;
+ (void)showAlert:(NSString*)title message:(NSString*)msg cancelButtonTitle:(NSString*)cancelButtonTitle;
+ (void)showAlert:(NSString*)title message:(NSString*)msg cancelButtonTitle:(NSString*)cancelButtonTitle cancelHandler:(AlertUtilsBlock) chandler;

+ (void)showAlert:(NSString *)title message:(NSString *)message  cancelButtonTitle:(NSString *)cancelButtonTitle cancelHandler:(AlertUtilsBlock) chandler
 otherButtonTitle:(NSString *)otherButtonTitle  otherHandler:(AlertUtilsBlock) ohandler;

+(void)showLoadingWithMessage:(NSString *)message;

//在当前view显示toast
+(void)showToastWithMessage:(NSString *)message;
+(void)showToastWithMessage:(NSString *)message inView:(UIView *)view;
+(void)showToastWithMessage:(NSString *)message inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay beIndeter:(BOOL)indeter;
+(void)showToastImgsWithMessage:(NSString *)message inView:(UIView *)view hideAfterDelay:(NSTimeInterval)delay beIndeter:(BOOL)indeter;
+(void)showToastImgsWithMessage:(NSString *)message;
//隐藏当前view的toast
+(void)hideToast;
+(void)hideToastInView:(UIView *)view;

+ (void)showHudInView:(UIView *)view hint:(NSString *)hint;

+ (void)hideHud;

+ (void)showHint:(NSString *)hint;

+ (void)showHintShort:(NSString *)hint;
// 从默认(showHint:)显示的位置再往上(下)yOffset
+ (void)showHint:(NSString *)hint yOffset:(float)yOffset;

@end
