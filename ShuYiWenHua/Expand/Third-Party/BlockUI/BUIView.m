//
//  DLAppDelegate.h
//  DL-Cloud
//
//  Created by Mac on 13-10-14.
//  Copyright (c) 2013年 Louis-wu. All rights reserved.
//

#import "BUIView.h"
#import <objc/runtime.h>
@implementation UIView(BUIView)


const char oldDelegateKey;
const char completionHandlerKey;

#pragma mark - UIAlerView

-(void)showWithCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    UIAlertView *alert = (UIAlertView *)self;
    if(completionHandler != nil)
    {
        id oldDelegate = objc_getAssociatedObject(self, &oldDelegateKey);
        if(oldDelegate == nil)
        {
            objc_setAssociatedObject(self, &oldDelegateKey, oldDelegate, OBJC_ASSOCIATION_ASSIGN);
        }
        
        oldDelegate = alert.delegate;
        alert.delegate = self;
        objc_setAssociatedObject(self, &completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY);
    }
    [alert show];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UIAlertView *alert = (UIAlertView *)self;
    void (^theCompletionHandler)(NSInteger buttonIndex) = objc_getAssociatedObject(self, &completionHandlerKey);
    
    if(theCompletionHandler == nil)
        return;
    
    theCompletionHandler(buttonIndex);
    alert.delegate = objc_getAssociatedObject(self, &oldDelegateKey);
}



#pragma mark - UIActionSheet
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    void (^theCompletionHandler)(NSInteger buttonIndex) = objc_getAssociatedObject(self, &completionHandlerKey);
    
    if(theCompletionHandler == nil)
        return;
    
    theCompletionHandler(buttonIndex);
    UIActionSheet *sheet = (UIActionSheet *)self;
    
    sheet.delegate = objc_getAssociatedObject(self, &oldDelegateKey);
}


-(void)config:(void(^)(NSInteger buttonIndex))completionHandler
{
    if(completionHandler != nil)
    {
        
        id oldDelegate = objc_getAssociatedObject(self, &oldDelegateKey);
        if(oldDelegate == nil)
        {
            objc_setAssociatedObject(self, &oldDelegateKey, oldDelegate, OBJC_ASSOCIATION_ASSIGN);
        }
        
        UIActionSheet *sheet = (UIActionSheet *)self;
        oldDelegate = sheet.delegate;
        sheet.delegate = self;
        objc_setAssociatedObject(self, &completionHandlerKey, completionHandler, OBJC_ASSOCIATION_COPY);
    }
}
-(void)showInView:(UIView *)view
withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    UIActionSheet *sheet = (UIActionSheet *)self;
    [self config:completionHandler];
    [sheet showInView:view];
}

-(void)showFromToolbar:(UIToolbar *)view
 withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    UIActionSheet *sheet = (UIActionSheet *)self;
    [self config:completionHandler];
    [sheet showFromToolbar:view];
}

-(void)showFromTabBar:(UITabBar *)view
withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    UIActionSheet *sheet = (UIActionSheet *)self;
    [self config:completionHandler];
    [sheet showFromTabBar:view];
}

-(void)showFromRect:(CGRect)rect
             inView:(UIView *)view
           animated:(BOOL)animated
withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    UIActionSheet *sheet = (UIActionSheet *)self;
    [self config:completionHandler];
    [sheet showFromRect:rect inView:view animated:animated];
}

-(void)showFromBarButtonItem:(UIBarButtonItem *)item
                    animated:(BOOL)animated
       withCompletionHandler:(void (^)(NSInteger buttonIndex))completionHandler
{
    UIActionSheet *sheet = (UIActionSheet *)self;
    [self config:completionHandler];
    [sheet showFromBarButtonItem:item animated:animated];
}

@end

#pragma mark - UIButton
@implementation UIButton(objects)
//点击不改变
+(UIButton *)buttonWithState:(NSString *)title Image:(NSString *)image Color:(UIColor *)color{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(![image isEqualToString:@""]){
        [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateHighlighted];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    [button setTitleColor:color forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 50, 30);
    return button;

}

+(UIButton *)buttonWithImage:(NSString *)aImage
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(![aImage isEqualToString:@""]){
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateHighlighted];
    }
    button.titleLabel.font = [UIFont systemFontOfSize:15.f];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    button.frame = CGRectMake(0, 0, 44, 44);
    return button;
}

+(UIButton *)buttonWithImage:(NSString *)aImage Title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if(![aImage isEqualToString:@""]){
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateNormal];
        [button setBackgroundImage:[UIImage imageNamed:aImage] forState:UIControlStateHighlighted];
    }
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.titleLabel.font = [UIFont systemFontOfSize:13.f];
    button.frame = CGRectMake(0, 0, 70, 30);
    return button;
}


///左右位置
+(UIButton *)buttonWithTitleImage:(NSString *)LeftImage Title:(NSString *)title Frame:(CGRect)frame
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    UIImage *LeftIcon = [UIImage imageNamed:LeftImage];
    [button setImage:LeftIcon forState:UIControlStateNormal];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, -(frame.size.width - button.imageView.frame.size.width - button.titleLabel.bounds.size.width), 0,0);
    return button;
}

//上图片下文字
+(UIButton *)buttonWithUpImageNextTilte:(NSString *)imagePath Title:(NSString *)title Frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    UIImage *topIcon = [UIImage imageNamed:imagePath];
    [button setImage:topIcon forState:UIControlStateNormal];
    [button setImage:topIcon forState:UIControlStateHighlighted];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, (frame.size.width - topIcon.size.width - 20)/2, 21, 0);
    button.titleEdgeInsets = UIEdgeInsetsMake(button.imageView.bounds.size.height+5,-(frame.size.width - button.titleLabel.bounds.size.width+10),0, 0);
    return button;
}

//圆角边框回复按钮
+(UIButton *)buttonWithComments:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:@"我也说一句..." forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    button.layer.borderWidth =.5;
    button.layer.borderColor = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1].CGColor;
    return button;
}

//圆角按钮
+(id)buttonWithFillet:(NSString *)title Frame:(CGRect)frame{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateHighlighted];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4;
    
    return button;
}

@end

#pragma mark - UINavigationItem
@implementation UINavigationItem (margin)

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_6_1
- (void)setLeftBarButtonItem:(UIBarButtonItem *)_leftBarButtonItem
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSeperator.width = -12;
        
        if (_leftBarButtonItem)
        {
            [self setLeftBarButtonItems:@[negativeSeperator, _leftBarButtonItem]];
        }
        else
        {
            [self setLeftBarButtonItems:@[negativeSeperator]];
        }
    }
    else
    {
        [self setLeftBarButtonItem:_leftBarButtonItem animated:NO];
    }
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)_rightBarButtonItem
{
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)
    {
        UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
        negativeSeperator.width = -12;
        
        if (_rightBarButtonItem)
        {
            [self setRightBarButtonItems:@[negativeSeperator, _rightBarButtonItem]];
        }
        else
        {
            [self setRightBarButtonItems:@[negativeSeperator]];
        }
    }
    else
    {
        [self setRightBarButtonItem:_rightBarButtonItem animated:NO];
    }
}

#endif
@end

#pragma mark - UINavigationController
const char ASSOKEY_PANGESTURE;
const char ASSOKEY_STARTPANPOION;
const char ASSOKEY_ENADLE_BACKGES;
@implementation UINavigationController (BUINavigationController)

-(void)setEnadleBackGes:(BOOL)enadleBackGes{
    objc_setAssociatedObject(self, &ASSOKEY_ENADLE_BACKGES, @(enadleBackGes), OBJC_ASSOCIATION_RETAIN);
    if (enadleBackGes) {
        [self.view addGestureRecognizer:[self panGstureRecognizer]];
    }else{
        [self.view removeGestureRecognizer:[self panGstureRecognizer]];
    }
}

-(BOOL)enadleBackGes{
    BOOL enadle = (BOOL)objc_getAssociatedObject(self, &ASSOKEY_ENADLE_BACKGES);
    return enadle;
}

-(UIPanGestureRecognizer *)panGstureRecognizer{
    UIPanGestureRecognizer *panGestureRecognizer = objc_getAssociatedObject(self,&ASSOKEY_PANGESTURE);
    if(!panGestureRecognizer){
        panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panToBack:)];
        [panGestureRecognizer setDelegate:self];
        objc_setAssociatedObject(self, &ASSOKEY_PANGESTURE, panGestureRecognizer, OBJC_ASSOCIATION_RETAIN);
    }
    return panGestureRecognizer;
}

-(void)setStarPanPoint:(CGPoint)point{
    NSValue *startPanPointValue = [NSValue valueWithCGPoint:point];
    objc_setAssociatedObject(self, &ASSOKEY_STARTPANPOION, startPanPointValue, OBJC_ASSOCIATION_RETAIN);
}

-(CGPoint)starPanPoint{
    NSValue *startPanPointValue = objc_getAssociatedObject(self, &ASSOKEY_STARTPANPOION);
    if (!startPanPointValue) {
        return CGPointZero;
    }
    return [startPanPointValue CGPointValue];
}

-(void)panToBack:(UIPanGestureRecognizer *)pan{
    UIView *currentView = self.topViewController.view;
    if ([self panGstureRecognizer].state == UIGestureRecognizerStateBegan) {
        [self setStarPanPoint:currentView.frame.origin];
        CGPoint velocity = [pan velocityInView:self.view];
        if (velocity.x != 0) {
            [self willShowPreViewController];
        }
    }
    CGPoint currentPostion = [pan translationInView:self.view];
    CGFloat xoffset = [self starPanPoint].x + currentPostion.x;
    CGFloat yoffset = [self starPanPoint].y + currentPostion.y;
    if (xoffset > 0) {//向右滑
        
    }else if (xoffset < 0){//向左滑
        if (currentView.frame.origin.x > 0) {
            xoffset = xoffset <- self.view.frame.size.width ? -self.view.frame.size.width : xoffset;
        }else{
            xoffset = 0;
        }
    }
    
    if (!CGPointEqualToPoint(CGPointMake(xoffset, yoffset), currentView.frame.origin)) {
        [self layoutCurrentViewWithOffset:UIOffsetMake(xoffset, yoffset)];
    }
    
    if ([self panGstureRecognizer].state == UIGestureRecognizerStateEnded) {
        if (currentView.frame.origin.x == 0) {
        }else{
            if (currentView.frame.origin.x < BackGestureOffsetXToBack) {
                [self hidePreViewController];
            }else{
                [self showPreViewController];
            }
        }
    }
}

-(void)showPreViewController{
    NSInteger count = self.viewControllers.count;
    if (count > 1) {
        UIView *currentView = self.topViewController.view;
        NSTimeInterval animatedTime = 0;
        animatedTime = ABS(self.view.frame.size.width - currentView.frame.origin.x) / self.view.frame.size.width * 0.35;
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView animateWithDuration:animatedTime animations:^{
            [self layoutCurrentViewWithOffset:UIOffsetMake(self.view.frame.size.width, 0)];
        } completion:^(BOOL finished) {
            [self popViewControllerAnimated:NO];
        }];
    }
}

-(void)hidePreViewController{
    NSInteger count = self.viewControllers.count;
    if (count > 1) {
        UIViewController *preVC = [self.viewControllers objectAtIndex:count-2];
        UIView *currentView = self.topViewController.view;
        NSTimeInterval animatedTime =0;
        animatedTime = ABS(self.view.frame.size.width - currentView.frame.origin.x) / self.view.frame.size.width * 0.35;
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        [UIView animateWithDuration:animatedTime animations:^{
            [self layoutCurrentViewWithOffset:UIOffsetMake(0, 0)];
        } completion:^(BOOL finished) {
            [preVC.view removeFromSuperview];
        }];
    }
}

-(void)layoutCurrentViewWithOffset:(UIOffset)offset{
    NSInteger count = self.viewControllers.count;
    if (count > 1) {
        UIViewController *currentVC = [self topViewController];
        UIViewController *preVC = [self.viewControllers objectAtIndex:count-2];
        [currentVC.view setFrame:CGRectMake(offset.horizontal, self.view.bounds.origin.x + 64, self.view.frame.size.width, currentVC.view.frame.size.height)];
        [preVC.view setFrame:CGRectMake(offset.horizontal/2-self.view.frame.size.width/2, self.view.bounds.origin.y + 64, self.view.frame.size.width, preVC.view.frame.size.height)];
    }
}

-(void)willShowPreViewController{
    NSInteger count = self.viewControllers.count;
    if (count > 1) {
        UIViewController *currentVC = [self topViewController];
        UIViewController *preVC = [self.viewControllers objectAtIndex:count-2];
        [currentVC.view.superview insertSubview:preVC.view belowSubview:currentVC.view];
    }
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (gestureRecognizer == [self panGstureRecognizer]) {
        UIPanGestureRecognizer *panGestrue = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint translation = [panGestrue translationInView:self.view];
        if ([panGestrue velocityInView:self.view].x < 600 && ABS(translation.x) / ABS(translation.y) > 1) {
            return YES;
        }
        return NO;
    }
    return YES;
}

@end


#pragma mark - UITextView
static UILabel *PlaceholderLabel;
@implementation UITextView (BUITextView)
static char UIB_PROPERTY_KEY;

//圆角TextView
+(UITextView *)allInitFillet:(CGRect)frame{
    UITextView *textView = [[UITextView alloc]initWithFrame:frame];
    textView.layer.borderColor = [UIColor grayColor].CGColor;
    textView.layer.borderWidth = .5;
    textView.layer.cornerRadius = 4;
    textView.layer.masksToBounds = YES;
    return textView;
}

@dynamic placeholder;
-(void)setPlaceholder:(NSString *)placeholder{
    [self InitPlaceholder:placeholder];
    objc_setAssociatedObject(self, &UIB_PROPERTY_KEY, placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)placeholder{
    return (NSString *)objc_getAssociatedObject(self, &UIB_PROPERTY_KEY);
}

static char UIB_MAXIMPUT_LENGTH;
@dynamic MaxInpuLength;
-(void)setMaxInpuLength:(int)MaxInpuLength{
    objc_setAssociatedObject(self, &UIB_MAXIMPUT_LENGTH, [NSString stringWithFormat:@"%d",MaxInpuLength] , OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(int)MaxInpuLength{
    return (int)[objc_getAssociatedObject(self, &UIB_MAXIMPUT_LENGTH) integerValue];
}

//创建占位提示控件
-(void)InitPlaceholder:(NSString *)placeStr{
    self.delegate = self;
    UIFont *tfont = [UIFont systemFontOfSize:14];
    CGSize actualsize= [placeStr boundingRectWithSize:CGSizeMake(self.frame.size.width, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObjectsAndKeys:tfont,NSFontAttributeName, nil] context:nil].size;
    CGRect frame = CGRectMake(5, 0, actualsize.width, 20);
    if(self.frame.size.width != 0){
        float y = (self.frame.size.height - 20) / 2;
        if (frame.size.height <= 25) {
            y = 3;
        }
        frame = CGRectMake(5, y, actualsize.width, 20);
    }
    PlaceholderLabel = [[UILabel alloc]initWithFrame:frame];
    PlaceholderLabel.font = tfont;
    PlaceholderLabel.textAlignment = NSTextAlignmentLeft;
    PlaceholderLabel.textColor = [UIColor grayColor];
    PlaceholderLabel.text = placeStr;
    [self addSubview:PlaceholderLabel];
}

//TextView 输入文字 隐藏Placeholder  删除文字为空 显示Placeholder
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if(![text isEqualToString:@""]){
        PlaceholderLabel.hidden = YES;
    }
    if ([text isEqualToString:@""]&& range.location == 0 && range.length == 1) {
        PlaceholderLabel.hidden = NO;
    }
    
    if(self.MaxInpuLength != 0){
        if ([text isEqualToString:@""] && range.length > 0) {
            return YES;
        }else{
            if (textView.text.length - range.length + text.length > self.MaxInpuLength) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"超出最大可输入长度" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                [alert show];
                return NO;
            }
        }
    }
    
    return YES;
}
//TextView 获取到焦点 隐藏Placeholder
-(void)textViewDidBeginEditing:(UITextView *)textView{
//    PlaceholderLabel.hidden = YES;
}

//TextView 失去焦点 显示Placeholder
-(void)textViewDidEndEditing:(UITextView *)textView{
    if (textView.text && [textView.text isEqualToString:@""]) {
        PlaceholderLabel.hidden = NO;
    }
}

@end

#pragma  mark - UIScrollView
@implementation UIScrollView (BUIScrollView)

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self nextResponder] touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self nextResponder] touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self nextResponder] touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    [[self nextResponder] touchesCancelled:touches withEvent:event];
    [super touchesCancelled:touches withEvent:event];
}

@end

#pragma  mark - UITableView
@implementation UITableView (BUITableView)


@end

#pragma  mark - UILabel
const char LabelDelegateKey;
@implementation UILabel (BUILabel)

//Label点击事件
-(void)didLabelClick:(didClick)ClickLabel{
    if (ClickLabel != nil) {
        objc_setAssociatedObject(self, &LabelDelegateKey, ClickLabel, OBJC_ASSOCIATION_COPY);
    }
}

//回调给Label给予的事件函数
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    void (^didClick)() = objc_getAssociatedObject(self, &LabelDelegateKey);
    if(didClick == nil)
        return;
    didClick();
}
@end

