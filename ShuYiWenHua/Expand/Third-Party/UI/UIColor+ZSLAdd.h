//
//  UIColor+ZSLAdd.h
//  QuickWorkingTest
//
//  Created by zsl-mac on 16/4/25.
//  Copyright © 2016年 zsl-mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ZSLAdd)
/**
 *
 *
 *  @return tabar的颜色
 */
+ (UIColor *)ws_tabarColor;
/**
 *
 *
 *  @return 背景色和导航底色
 */
+ (UIColor *)zsl_BackGroundColor;

/**
 *
 *
 *  @return TableView背景色
 */
+ (UIColor *)zsl_TableViewBackGroundColor;

/**
 *
 *
 *  @return 蓝色
 */
+ (UIColor *)zsl_BlueColor;

/**
 *
 *
 *  @return textField字体颜色
 */
+ (UIColor *)zsl_TextFieldColor;
/**
 *
 *
 *  @return 标签颜色
 */
+ (UIColor *)zsl_TagTextColor;
/**
 *
 *
 *  @return 内容颜色
 */
+ (UIColor *)zsl_ContentTextColor;
/**
 *
 *
 *  @return 橘色
 */
+ (UIColor *)zsl_OrangeColor;
/**
 *
 *
 *  @return 绿色
 */
+ (UIColor *)zsl_GreenColor;
/**
 *
 *
 *  @return 红色
 */
+ (UIColor *)zsl_RedColor;

/**
 *  金色
 *
 *  @return 金色色块
 */
+ (UIColor *)ws_goldColor;
/**
 *  亮黑色
 *
 *  @return 黑色色块
 */
+ (UIColor *)ws_lightBlackColor;

/**
 *  hex 16进制颜色带透明度
 *
 *  @param colorValue 色值
 *  @param alphaValue 透明度
 *
 *  @return 色块
 */
+ (UIColor *)zsl_hexColorWithColorValue : (NSInteger )colorValue andAlpha : (CGFloat)alphaValue;

/**
 *  hex 16进制颜色
 *
 *  @param hexValue 色值
 *
 *  @return 色块
 */
+ (UIColor *)zsl_hexWithColorValue:(NSInteger )hexValue;


/**
 *  RGB 颜色
 *
 *  @param red   红色
 *  @param green 绿色
 *  @param blue  蓝色
 *
 *  @return 色块
 */
+ (UIColor *)zsl_RgbWithRed : (NSInteger)red andGreen : (NSInteger )green andBlue : (NSInteger)blue;




@end
