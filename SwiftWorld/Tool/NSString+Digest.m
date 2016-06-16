//
//  NSString+Digest.m
//  SwiftWorld
//
//  Created by Groupfly on 16/6/14.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

#import "NSString+Digest.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Digest)
/**
 *  MD5加密
 */
+(NSString *)md5HexDigest:(NSString*)Des_str
{
    const char *original_str = [Des_str UTF8String];
    //unsigned char result[16];//开辟一个16字节（128位：md5加密出来就是128位/bit）的空间（一个字节=8字位=8个二进制数）
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    //把cStr字符串转换成了32位的16进制数列（这个过程不可逆转） 存储到了result这个空间中
    CC_MD5(original_str, (CC_LONG)strlen(original_str), result);
    
    NSMutableString *hash = [NSMutableString string];
    
    for (int i = 0; i < 16; i++)
        
    {
        //x表示十六进制，X  意思是不足两位将用0补齐，如果多余两位则不影响
        [hash appendFormat:@"%X", result[i]];
        
    }
    
    NSString *mdfiveString = [hash lowercaseString];
    
    // //NNSLog(@"md5加密输出：Encryption Result = %@",mdfiveString);
    
    return mdfiveString;
}

// sha1加密 它的输出结果是160位的，所以需要20个8位的char来存储
- (NSString*) sha1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%X", digest[i]];
    
    return output;
}


//- (NSString *) sha1_base64
//{
//    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
//    NSData *data = [NSData dataWithBytes:cstr length:self.length];
//    
//    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
//    
//    CC_SHA1(data.bytes, data.length, digest);
//    
//    NSData * base64 = [[NSData alloc]initWithBytes:digest length:CC_SHA1_DIGEST_LENGTH];
//    base64 = [GTMBase64 encodeData:base64];
//    
//    NSString * output = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
//    return output;
//}

//- (NSString *) md5_base64
//{
//    const char *cStr = [self UTF8String];
//    unsigned char digest[CC_MD5_DIGEST_LENGTH];
//    CC_MD5( cStr, strlen(cStr), digest );
//    
//    NSData * base64 = [[NSData alloc]initWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
//    base64 = [GTMBase64 encodeData:base64];
//    
//    NSString * output = [[NSString alloc] initWithData:base64 encoding:NSUTF8StringEncoding];
//    return output;
//}

@end
