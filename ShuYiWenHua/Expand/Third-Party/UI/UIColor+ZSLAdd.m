//
//  UIColor+ZSLAdd.m
//  QuickWorkingTest
//
//  Created by zsl-mac on 16/4/25.
//  Copyright © 2016年 zsl-mac. All rights reserved.
//

#import "UIColor+ZSLAdd.h"

@implementation UIColor (ZSLAdd)

+ (UIColor *)zsl_BackGroundColor
{
    return [self zsl_hexWithColorValue:(0xeeeeee)];
}


+ (UIColor *)zsl_TableViewBackGroundColor
{
    
    return [self zsl_hexWithColorValue:(0xf7f7f7)];
}

+ (UIColor *)zsl_BlueColor
{
    return [self zsl_hexWithColorValue:(0x0088dd)];
}

+ (UIColor *)zsl_TextFieldColor
{
    return [self zsl_hexWithColorValue:(0xdddddd)];
}

+ (UIColor *)zsl_TagTextColor
{
    return [self zsl_hexWithColorValue:(0x999999)];
}

+ (UIColor *)zsl_ContentTextColor
{
    return [self zsl_hexWithColorValue:(0x333333)];
}

+ (UIColor *)zsl_OrangeColor
{
    return [self zsl_hexWithColorValue:(0xff7300)];
}

+ (UIColor *)zsl_GreenColor
{
    return [self zsl_hexWithColorValue:(0x11bb11)];
}

+ (UIColor *)zsl_RedColor
{
    return [self zsl_hexWithColorValue:(0xff0000)];
}

+ (UIColor *)ws_goldColor{
    return [self zsl_hexWithColorValue:(0xffffff)];
    
}
+ (UIColor *)ws_tabarColor{
    return [self zsl_hexWithColorValue:(0xeeeeee)];
    
}

+ (UIColor *)ws_lightBlackColor{
    return [self zsl_hexWithColorValue:(0x5189c4)];
    
}

+ (UIColor *)zsl_hexColorWithColorValue : (NSInteger )colorValue andAlpha : (CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((colorValue & 0xFF0000) >> 16))/255.0
                           green:((float)((colorValue & 0xFF00) >> 8))/255.0
                            blue:((float)(colorValue & 0xFF))/255.0 alpha:alphaValue];
}


+ (UIColor *)zsl_hexWithColorValue:(NSInteger )hexValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:1];
}

+ (UIColor *)zsl_RgbWithRed : (NSInteger)red andGreen : (NSInteger )green andBlue : (NSInteger)blue
{
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:1];
}


@end
