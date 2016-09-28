//
//  DataConfig.h
//  advideo
//
//  Created by LiuHe@MacMini on 14-7-15.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#ifndef advideo_DataConfig_h
#define advideo_DataConfig_h

//手势登录类型
typedef enum : NSUInteger {
    GESTURE_TYPE_NOMAL,
    GESTURE_TYPE_ENTERBACKGROUND
} GestureLoginType;

//重发验证码类型
typedef enum : NSUInteger {
    RESEND_VCODE_TYPE_REGISTER=1,
    GESTURE_VCODE_TYPE_FINDPWD
} ResendVcodeType;

//segment 类型
typedef NS_ENUM (NSUInteger, YYSegmentType){
    SEGMENT_TYPE_NORMAL = 1,//首页
    SEGMENT_TYPE_RED = 2,//红色
};

//标类型
typedef NS_ENUM(NSUInteger,LoanListType){
    
    LOAN_TYPE_INVESTMENT = 0,//所有列表
    LOAN_TYPE_FRAGMENT,//散标
    
    LOAN_TYPE_NETWORTH,//净值列表
    LOAN_TYPE_TRANSFER//债权转让
};

//标状态
typedef NS_ENUM(NSUInteger,LoanListState){
    
    LOAN_STATE_ALL = 0,//所有
    LOAN_STATE_GOING,//投标中；
    
    LOAN_STATE_PAYING,//还款中
    LOAN_STATE_PAYED//已完成
};

typedef enum : NSUInteger {
    CHINABANK=1,  //网银在线
    HUICHAO,
    GUOFUBAO
} CHARGETYPE;

#define  strNull  @""

//返回信息
#define KEY_STATUS_CODE @"status"
#define KEY_MSG @"msg"
#define MSG                         @"msg"

//超时时间
#define TIME_OUT_SECOND             6.0

//返回码
#define NO_NETWORK_STATUS               @"997"
#define ERROR_TIME_OUT_STATUS           @"998"
#define ERROR_SESSION_TIME_OUT_STATUS   @"-998"
#define ERROR_MSG_SERVICE_STATUS        @"-999"

//错误提示
#define NO_NETWORK                  @"网络不给力，请检查网络状况"
#define ERROR_TIME_OUT              @"网络不给力，请稍后再试。"
#define ERROR_SESSION_TIME_OUT      @"session超时"
#define ERROR_MSG_SERVICE           @"登录超时，请重新登录"







//密码位数
#define MAX_LEN_OF_PWD              16
#define MIN_LEN_OF_PWD              6


//当前主题
#define APPConfigKeyCurrentTheme @"APPConfigKeyCurrentTheme"
//网络状态
#define APPConfigKeyNetworkStatu @"APPConfigKeyNetworkStatu"
//登录手势
#define APPConfigKeyLoginGesture @"APPConfigKeyLoginGesture"
//登录手势剩余次数
#define APPConfigKeyLoginGestureCount @"APPConfigKeyLoginGestureCount"

//记录进入后台的时间点 用来判断离开应用的时间。
#define APPEnterBackgroundTime       @"APPEnterBackgroundTime"

//设置手势密码开启时间(秒)
#define GESTUREOPENTIME             300


//开始从网络加载内容条数
#define LOAN_FIRST_FORM_NETWORK     @"10"
//从网络加载读取内容条数
#define LOAD_MORE_FROM_NETWORK      @"-10"

/**** 接口相关字段  ****/

//登录状态
#define KEY_LOGIN_STATU             @"loginstatu"

//用户名
#define KEY_ACCOUNT                @"account"

//密码
#define KEY_PASSWD                  @"passwd"

//服务器随机数
#define KEY_TOKEN                   @"token"
//本地随机数
#define KEY_NONCE                   @"nonce"

//手机号码
#define KEY_MOBILE                  @"mobile"

//验证码
#define KEY_VCODE                   @"vcode"

//重发验证码类型
#define KEY_VCODETYPE               @"vcodetype"

//修改密码相关
//原密码
#define KEY_OLDWD                   @"oldpwd"
//新密码
#define KEY_NEWWD                   @"newpwd"


/****数据库实体 ****/
#define LOGIN_USER                  @"LoginUser"
#define CACHE                       @"Cache"


//主页轮播图片
#define KEY_MAINPAGE_BANNERLIST                     @"bannerlist"
#define KEY_MAINPAGE_BANNERLIST_URL                 @"url"   //图片url
#define KEY_MAINPAGE_BANNERLIST_HREF                @"href"  //点击图片后的跳转地址，可能为空

/*** 主页投融资  ***/
#define KEY_MAINPAGE_USERTYPE                       @"usertype"
#define KEY_MAINPAGE_LOANTYPE                       @"loantype"
#define KEY_MAINPAGE_LOANSTATE                      @"loanstate"
#define KEY_MAINPAGE_STARTID                        @"startid"
#define KEY_MAINPAGE_OFFSET                         @"offset"
#define KEY_MAINPAGE_LOANLIST                       @"loanlist"

#define KEY_MAINPAGE_LOANDID                        @"id"
#define KEY_MAINPAGE_TITLE                          @"title"
#define KEY_MAINPAGE_GUARANTEE                      @"guarantee"
#define KEY_MAINPAGE_INTEREST                       @"interest"
#define KEY_MAINPAGE_AWARD                          @"award"
#define KEY_MAINPAGE_AMOUNT                         @"amount"
#define KEY_MAINPAGE_PERCENT                        @"loanpercent"
#define KEY_MAINPAGE_LOANTIME                       @"loantime"
#define KEY_MAINPAGE_REMAIN                         @"remain"

#define  CELL_LOANTIME_TYPE @"type"                 //type，融资期限类型：1：按日 2：按月；
#define  CELL_LOANTIME_COUNT @"count"               //count，期限值
#define  CELL_PERCENT_TYPE  @"type"
#define  CELL_PERCENT_NUM   @"percent"


//标详情
#define KEY_CELL_ITEM_DETAIL                        @"loandetail"
#define KEY_CELL_ITEM_DETAIL_TITLE                  @"title"
#define KEY_CELL_ITEM_DETAIL_INFO                   @"info"
#define KEY_CELL_ITEM_DETAIL_INFO_COLOR             @"textColor"


#define KEY_CELL_ITEM_DETAIL_CHECK_INFO_ARR         @"checkinfo"             // 已审核信息数组
#define KEY_CELL_ITEM_DETAIL_CHECK_INFO_STR         @"checkinfostr"         // 已审核信息
#define KEY_CELL_ITEM_DETAIL_BORROWER_INFO          @"describe"       // 借款方介绍
#define KEY_CELL_ITEM_DETAIL_RISK_CONTROL           @"riskcontrol"        // 风控措施
#define KEY_CELL_ITEM_DETAIL_IMG_ARR                @"pictures"             //现场图


#define KEY_ITEM_DETAIL_DESCRIBE                    @"describe"     //详情描述
#define KEY_ITEM_DETAIL_REMAINDER                   @"remainder"    //剩余可投金额
#define KEY_ITEM_DETAIL_REPAYTYPE                   @"repaytype"    //还款类型：1：按月分期还款 2：按月付息到期还本 3：按季还款 4：到期全额还款
#define KEY_ITEM_DETAIL_DEADLINE                    @"deadline"     //截止时间
#define KEY_ITEM_DETAIL_TIMELINE                    @"timelimit"     //融资期限

//标还款计划
#define KEY_PAYPLAN_PLANLIST                        @"planlist"     //列表
#define KEY_PAYPLAN_TIME                            @"time"         //预计还款时间
#define KEY_PAYPLAN_AMOUNT                          @"amount"       //金额
#define KEY_PAYPLAN_TYPE                            @"type"         //还款类型：1：利息;2：本金;3：利息+本金

//投标记录
#define KEY_ITEM_DETAIL_INVESTLIST                  @"investlist"   //列表
#define KEY_ITEM_DETAIL_INVESTLIST_NAME             @"name"         //投资人
#define KEY_ITEM_DETAIL_INVESTLIST_TIME             @"time"         //投资时间
#define KEY_ITEM_DETAIL_INVESTLIST_AMOUNT           @"amount"       //投资金额
#define KEY_ITEM_DETAIL_INVESTLIST_STARTID          @"startid"      //开始id
#define KEY_ITEM_DETAIL_INVESTLIST_OFFSET           @"offset"       //偏移量
#define KEY_ITEM_DETAIL_INVESTLIST_INVESTID         @"id"           //记录id

//充值
#define KEY_CHARGE_MOENY                            @"amount"       //充值金额
#define KEY_CHARGE_PLATFORMTYPE                     @"platformid"   //充值平台
#define KEY_CHARGE_ORDERID                          @"orderid"      //充值订单号

//投标
#define KEY_BID_AMOUNT                              @"amount"       //投标金额
#define KEY_REMAIN_AMOUNT                           @"remainamount" //剩余可投金额

#define KEY_WEB_URL                                 @"weburl"       //网页地址
#define KEY_WEB_TITLE                               @"webtitle"     //网页标题
#define KEY_WEB_POST_INFO                           @"webPostInfo"  //post内容
#define KEY_WEBFLAG                                 @"isWeb"        //web标示

//标刷新标记
#define KEY_LOAN_REFRESH                            @"key_loan_refresh"
#define KEY_LOAN_REFRESH_ID                         @"key_loan_refresh_id"
#define KEY_LOAN_REFRESH_AMOUNT                     @"key_loan_refresh_AMOUNT"


/****  我的帐户首页 ****/
//我的帐户首页
#define KEY_MYACCOUNT                   @"userinfo"
#define KEY_MYACCOUNT_NAME              @"name"
#define KEY_MYACCOUNT_GROSSINCOME       @"grossincome"//累计
#define KEY_MYACCOUNT_BALANCE           @"balance"//可用
#define KEY_MYACCOUNT_CAPITAL           @"capital"//总资产
#define KEY_MYACCUONT_AVATARIMG         @"avatar"//头像

#define KEY_BANK_CARDID                 @"cardid" //银行卡号
#define KEY_BANK_BANKID                 @"bankid" //银行类型
#define KEY_BANK_ADDRESS                @"bankaddr" //开户行所在地
#define KEY_BANK_SUBBRANCH              @"subbranch"//开户行支行名称

//绑定手机
#define KEY_SAFE_ISAUTH                 @"isauth"//身份证号码
#define KEY_SAFE_BINDMOBILE             @"bindmobile"//身份证号码

#define KEY_SAFE_NAME                   @"name"//名字
#define KEY_SAFE_CARDID                 @"id"//身份证号码
#define KEY_SAFE_CARDIMG1               @"idpic1"//身份证正面
#define KEY_SAFE_CARDIMG2               @"idpic2"//身份证反面

//通知
#define POST_NOTIFICATON_MES            @"post_notification_mes"    //监听消息
#define KEY_NOTIFICATION_REMAIN         @"remain"  //剩余未读消息数
#define KEY_NOTIFICATION_LIST           @"msglist" //剩余消息数量
#define KEY_NOTIFICATION_COUNT          @"count"   //接口参数 读多少条 count < 0读所有的未读消息 count = 0读未读消息数目 count>0读count条已读消息



#endif
