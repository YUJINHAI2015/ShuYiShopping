//
//  SYCalendar.m
//  rili
//
//  Created by yiLian on 16/9/27.
//  Copyright © 2016年 yilian. All rights reserved.
//

#import "SYCalendar.h"
#import <objc/runtime.h>
@interface SYCalendar ()
@property (weak, nonatomic) IBOutlet UIDatePicker *calendar;
@property (weak, nonatomic) IBOutlet UIButton *testButton;

@end
@implementation SYCalendar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        
        
    }
    return self;
}
- (void)awakeFromNib{
    [self clearSeparatorWithView:self];
    [self setColorForCalendar];
    [self initUI];
}
- (void)initUI{
    self.testButton.layer.cornerRadius = 3.0;
    self.testButton.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor ws_lightBlackColor];
}
- (void)setColorForCalendar{
    unsigned int outCount;
    int i;
    objc_property_t *pProperty = class_copyPropertyList([UIDatePicker class], &outCount);
    for (i = outCount -1; i >= 0; i--)
    {
        // 循环获取属性的名字   property_getName函数返回一个属性的名称
        NSString *getPropertyName = [NSString stringWithCString:property_getName(pProperty[i]) encoding:NSUTF8StringEncoding];
        NSString *getPropertyNameString = [NSString stringWithCString:property_getAttributes(pProperty[i]) encoding:NSUTF8StringEncoding];
        if([getPropertyName isEqualToString:@"textColor"])
        {
            [_calendar setValue:[UIColor whiteColor] forKey:@"textColor"];
        }
        
//        NSLog(@"%@====%@",getPropertyNameString,getPropertyName);
    }
    
    SEL selector = NSSelectorFromString(@"setHighlightsToday:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDatePicker instanceMethodSignatureForSelector:selector]];
    BOOL no = NO;
    [invocation setSelector:selector];
    [invocation setArgument:&no atIndex:2];
    [invocation invokeWithTarget:_calendar];
}
- (void)clearSeparatorWithView:(UIView * )view
{
    if(view.subviews != 0  )
    {
        if(view.bounds.size.height < 5)
        {
            view.backgroundColor = [UIColor clearColor];
        }
        
        [view.subviews enumerateObjectsUsingBlock:^( UIView *  obj, NSUInteger idx, BOOL *  stop) {
            [self clearSeparatorWithView:obj];
        }];
    }
    
}
- (IBAction)testAction:(id)sender {
    
    NSString *dateString = [NSString stringWithFormat:@"%@",self.calendar.date];
    if (_action) {
        _action(dateString);
    }
    
//    NSLog(@"testAction%@",self.calendar.date);
}
@end
