//
//  YYManager.m
//  advideo
//
//  Created by LiuHe@MacMini on 14-7-15.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import "APPManager.h"
#import "AHReach.h"
#import "DataUtils.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"

@interface APPManager()

@property (nonatomic, strong) AHReach  *reachability;

@end

@implementation APPManager

static APPManager *manager = nil;

+(APPManager *)shareManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!manager) {
            manager = [[APPManager alloc]init];
        }
    });
    return manager;
}

+(id)allocWithZone:(NSZone *)zone{
    @synchronized(self){
        if (!manager) {
            manager = [super allocWithZone:zone];
        }
    }
    return manager;
}

-(void)loadManager{
    static BOOL beLoadManager = YES;
    if (!beLoadManager) {
        return;
    }
    
    //保证该加载过程只会执行一次
    beLoadManager = NO;
    
    //网络状态监测
    [self networkObserve];
    
    //友盟设置
    [self umentInit];
    
    //友盟设置微信  初始化
    [self weChatInit];
    
    [self TencentQQInit];
    
}

#pragma mark - network check
-(void)networkObserve{
    _reachability = [AHReach reachForDefaultHost];
    [_reachability startUpdatingWithBlock:^(AHReach * reach) {
        [DataUtils setTempData:[NSNumber numberWithBool:[reach isReachable]] forKey:APPConfigKeyNetworkStatu];
    }];
}

#pragma mark -umeng settting
-(void)umentInit
{
    //友盟社会化
    [UMSocialData setAppKey:APP_KEY_UMENG];
}


#pragma mark - Umeng weChatInit
-(void)weChatInit
{
    //    //设置微信AppId，url地址传nil，将默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:APP_KEY_WEIXIN appSecret:APP_KEY_WEINXIN_APPSECRET url:@"http://baidu.com"];
    
    [UMSocialData defaultData].extConfig.wechatSessionData.wxMessageType = UMSocialWXMessageTypeImage;  //设置微信好友分享纯图片
    [UMSocialData defaultData].extConfig.wechatTimelineData.wxMessageType = UMSocialWXMessageTypeImage;  //设置微信朋友圈分享纯图片
    
}

#pragma mark - qqInit
-(void)TencentQQInit
{
    //设置友盟Appkey
    [UMSocialData setAppKey:@"5211818556240bc9ee01db2f"];
    
    //设置微信AppId，设置分享url，默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
    
    //设置手机QQ的AppId，指定你的分享url，若传nil，将使用友盟的网址
    [UMSocialQQHandler setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
    
    //如果你要支持不同的屏幕方向，需要这样设置，否则在iPhone只支持一个竖屏方向
    [UMSocialConfig setSupportedInterfaceOrientations:UIInterfaceOrientationMaskAll];
    
    [UMSocialData defaultData].extConfig.qqData.qqMessageType = UMSocialQQMessageTypeImage; //设置QQ分享纯图片，默认分享图文消息
    [UMSocialData defaultData].extConfig.wechatSessionData.wxMessageType = UMSocialWXMessageTypeImage;  //设置微信好友分享纯图片
    [UMSocialData defaultData].extConfig.wechatTimelineData.wxMessageType = UMSocialWXMessageTypeImage;  //设置微信朋友圈分享纯图片
    
}





@end
