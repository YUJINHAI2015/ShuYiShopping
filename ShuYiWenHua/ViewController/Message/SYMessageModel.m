//
//  SYMessageModel.m
//  ShuYiWenHua
//
//  Created by yiLian on 16/10/11.
//  Copyright © 2016年 shuyi. All rights reserved.
//

#import "SYMessageModel.h"

@implementation SYMessageModel
- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = super.init;
    if (self) {
        
        _title = dictionary[@"title"];
        _content = dictionary[@"content"];
        _time = dictionary[@"time"];
    }
    return self;
}
@end
