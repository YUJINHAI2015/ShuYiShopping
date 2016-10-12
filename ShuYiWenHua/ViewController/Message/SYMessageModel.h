//
//  SYMessageModel.h
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/11.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SYMessageModel : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *time;

@end
