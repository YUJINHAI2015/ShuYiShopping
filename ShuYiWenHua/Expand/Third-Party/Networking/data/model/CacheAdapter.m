//
//  CacheAdapter.m
//  p2p
//
//  Created by mokai on 14-8-18.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import "CacheAdapter.h"


@implementation CacheAdapter

-(void)writeObj:(id)responseObj forId:(NSString *)id{
    //    NSArray *cacheArr = [[YYDBManager shareInstance]fetchObjectsWithEntityName:CACHE filter:[NSPredicate predicateWithFormat:@"key=%@",id]];
    //     MeatCache *cache;
    //    if(cacheArr.count==0){
    //        cache = (MeatCache *)[[YYDBManager shareInstance]createObjectWithEntityName:CACHE];
    //    }else{
    //        cache = [cacheArr objectAtIndex:0];
    //    }
    //
    //    cache.key=id;
    //    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:responseObj];
    //    cache.value = data;
    //    cache.time = [NSDate date];
    //
    //    [[YYDBManager shareInstance]saveContext];
}

-(id)readObjWithId:(NSString *)id{
    //    NSArray *cacheArr = [[YYDBManager shareInstance]fetchObjectsWithEntityName:CACHE filter:[NSPredicate predicateWithFormat:@"key=%@",id]];
    //
    //    if(cacheArr.count==0){
    //        return nil;
    //    }else{
    //        MeatCache *cache = [cacheArr objectAtIndex:0];
    //        if([AppUtils getLeftFromFirstDate:[NSDate date] andAnoterDate:cache.time]>1){
    //            //数据超过一天则无效，且删除
    //            [[YYDBManager shareInstance] deleteObjectsWithEntityName:CACHE filter:[NSPredicate predicateWithFormat:@"key=%@",id]];
    //            [[YYDBManager shareInstance] saveContext];
    //            return nil;
    //        }
    //        NSData *data = cache.value;
    //        return [NSKeyedUnarchiver unarchiveObjectWithData:data];
    //    }
    return nil;
}

@end
