//
//  QuickMacro.h
//  Arrange
//
//  Created by zsl-mac on 15/7/3.
//  Copyright (c) 2015年 ZhaoSuLiao. All rights reserved.
//

#ifndef Arrange_QuickMacro_h
#define Arrange_QuickMacro_h

/**
 *  @author Tankch, 15-07-03 11:07:31
 *
 *  这里是放一些方便APP的宏
 */

/**
 *  @author Tankch, 15-07-03 11:07:08
 *
 *  XIB 和 Storyboard宏
 */
#define InitVCFromStoryBoard(storyboardName)  [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateInitialViewController];

#define InitVCFromStoryboard(storyboardName, VCID) [[UIStoryboard storyboardWithName:storyboardName bundle:nil] instantiateViewControllerWithIdentifier:VCID];
#define InitVCFromXib(XibName) [[XibName alloc]initWithNibName:NSStringFromClass(XibName) bundle:nil];


/**
 *  @author Tankch, 15-07-03 11:07:00
 *
 *  调试宏
 */



/**
 *  @author Tankch, 15-07-03 11:07:01
 *
 *  颜色宏
 */

#define RGBCOLOR(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
// 16进制颜色转UIColor
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:1.0]
// 16进制颜色转UIColor并加透明
#define HEXCOLORWITHALPHA(c,a) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:((c)&0xFF)/255.0 alpha:a]

//背景色
#define PRICE_GOOD_BACKGROUNDCOLOR HEXCOLOR(0xf7f7f7)
#define ORANGE_COLOR_BACKGROUND HEXCOLOR(0xfff5ee)

//字体 橘色
#define ORANGE_COLOR HEXCOLOR(0xff7300)

/**
 *  @author Tankch, 15-07-03 11:07:45
 *
 *  字体宏
 */
//字体雅黑
#define YAHEI_FONT(X) [UIFont fontWithName:@"MicrosoftYaHei" size:X]

//View的操作
#define ViewWidth(v)                        v.frame.size.width
#define ViewHeight(v)                       v.frame.size.height
#define ViewX(v)                            v.frame.origin.x
#define ViewY(v)                            v.frame.origin.y

//图片加载
#define ImageNamed(name) [UIImage imageWithContentsOfFile:[ResourcePath stringByAppendingPathComponent:name]]

//断言
// assert
#ifdef ENABLE_ASSERT_STOP
#define APP_ASSERT_STOP                     {LogRed(@"APP_ASSERT_STOP"); NSAssert1(NO, @" \n\n\n===== APP Assert. =====\n%s\n\n\n", __PRETTY_FUNCTION__);}
#define APP_ASSERT(condition)               {NSAssert(condition, @" ! Assert");}
#else
#define APP_ASSERT_STOP                     do {} while (0);
#define APP_ASSERT(condition)               do {} while (0);
#endif

//判空
#define StringNotEmpty(str)                 (str && (str.length > 0))
#define ArrayNotEmpty(arr)                  (arr && (arr.count > 0))
#define URLFromString(str)                  [NSURL URLWithString:str]

#define oriOfftY -230
#define oriHeight 180
#endif
