//
//  DLAppDelegate.h
//  DL-Cloud
//
//  Created by Mac on 13-10-14.
//  Copyright (c) 2013年 Louis-wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIView(BUIView)<UIAlertViewDelegate,UIActionSheetDelegate>

//UIAlertView
-(void)showWithCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler;



//UIActionSheet
-(void)showInView:(UIView *)view withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler;

-(void)showFromToolbar:(UIToolbar *)view withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler;

-(void)showFromTabBar:(UITabBar *)view withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler;

-(void)showFromRect:(CGRect)rect
             inView:(UIView *)view
           animated:(BOOL)animated
withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler;

-(void)showFromBarButtonItem:(UIBarButtonItem *)item
                    animated:(BOOL)animated
       withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler;
//
@end

#pragma mark - UIButton
@interface UIButton(objects)
//点击不改变
+(UIButton *)buttonWithState:(NSString *)title Image:(NSString *)image Color:(UIColor *)color;
//背景图片
+(UIButton *)buttonWithImage:(NSString *)aImage;
+(UIButton *)buttonWithImage:(NSString *)aImage Title:(NSString *)titl;
//左图片右文字
+(UIButton *)buttonWithTitleImage:(NSString *)LeftImage Title:(NSString *)title Frame:(CGRect)frame;
//上图片下文字
+(UIButton *)buttonWithUpImageNextTilte:(NSString *)imagePath Title:(NSString *)title Frame:(CGRect)frame;
//圆角边框回复按钮
+(UIButton *)buttonWithComments:(CGRect)frame;
//圆角按钮
+(id)buttonWithFillet:(NSString *)title Frame:(CGRect)frame;
@end


#pragma mark - UINavigationItem
@interface UINavigationItem (margin)

@end

#pragma mark - UINavigationController
#define BackGestureOffsetXToBack 80//>80 show pre vc
@interface UINavigationController (BUINavigationController)<UIGestureRecognizerDelegate>

@property(assign,nonatomic) BOOL enadleBackGes;
@end

#pragma mark - UITextView
@interface UITextView(BUITextView)<UITextViewDelegate>

@property (nonatomic, strong) NSString *placeholder;

@property (nonatomic) int MaxInpuLength;

+(UITextView *)allInitFillet:(CGRect)frame;

@end

#pragma mark - UIScrollView
@interface UIScrollView (BUIScrollView)<UIScrollViewDelegate>

@end

#pragma mark - UITableView
@interface UITableView (BUITableView)

@end

#pragma mark - UILabel
@class BUILabel;

typedef void (^didClick)();

@interface UILabel (BUILabel)

//Label选中事件
-(void)didLabelClick:(didClick) ClickLabel;

@end