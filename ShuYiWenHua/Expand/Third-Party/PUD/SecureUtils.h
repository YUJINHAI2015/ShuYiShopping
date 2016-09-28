//
//  SecureUtils.h
//  advideo
//
//  Created by mokai on 14-7-28.
//  Copyright (c) 2014年 cloudyoo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

@interface SecureUtils : NSObject

+(NSString *)md5:(NSString *)str;

//3des加密解密
//+(NSString*)TripleDES:(NSString*)plainText encryptOrDecrypt:(CCOperation)encryptOrDecrypt;

@end
