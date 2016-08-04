//
//  NSString+CommonCheck.m
//  CateGoriesDemo
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 3ti. All rights reserved.
//

#import "NSString+CommonCheck.h"

@implementation NSString (NSString_CommonCheck)
/**
 *  判断一个字符串是否为空
 *
 *  @param string 字符串
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkIsStringEmpty:(NSString *)string {
    return [string AL_checkIsStringEmpty];
}

/**
 *  判断一个字符串是否为空
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkIsStringEmpty {
    if(self == nil) {
        return YES;
    }
    
    if(self.length == 0) {
        return YES;
    }
    
    if([self isEqualToString:@"<null>"]) {
        return YES;
    }
    
    if([self isEqualToString:@"(null)"]) {
        return YES;
    }
    
    return NO;
}

/**
 *  判断是不是手机号
 *
 *  @param String  要判断的字符串
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkIsPhoneNumberWithString:(NSString *)String {
    return [String AL_checkIsPhoneNumber];
}

/**
 *  判断是不是手机号
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkIsPhoneNumber {
    
    if([self AL_checkIsStringEmpty]) {
        return NO;
    }
    
    NSString *phoneRegex = @"^(0|86|17951)?(13[0-9]|15[012356789]|17[678]|18[0-9]|14[57])[0-9]{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    return [phoneTest evaluateWithObject:self];
}

/**
 *  校验昵称
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkIsNickName {
    if([self AL_checkIsStringEmpty]) {
        return NO;
    }
    NSString *nicknameRegex = @"^[\u4e00-\u9fa5]{4,8}$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",nicknameRegex];
    return [passWordPredicate evaluateWithObject:self];
}

/**
 *  校验昵称
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkIsNickName:(NSString *)nickname {
    if([nickname AL_checkIsStringEmpty]) {
        return NO;
    }
    return [nickname AL_checkIsNickName];
}

/**
 *  校验昵称长度
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkNickNameLength {
    int strlength = 0;
    char *p = (char *)[self cStringUsingEncoding:NSUnicodeStringEncoding];
    for (int i=0 ; i<[self lengthOfBytesUsingEncoding:NSUnicodeStringEncoding];i++) {
        if (*p) {
            p++;
            strlength++;
        }
        else {
            p++;
        }
        
    }
    
    if(strlength >12) {
        return NO;
    }
    
    return YES;
}

/**
 *  校验昵称长度
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkNickNameLength:(NSString *)nickname {
    return [nickname AL_checkNickNameLength];
}

/**
 *  校验密码
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkIsPassword:(NSString *)passWord {
    return [passWord AL_checkIsPassword];
}

/**
 *  校验密码
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkIsPassword {
    if([self AL_checkIsStringEmpty]) {
        return NO;
    }
    
    NSString *passWordRegex = @"^[a-zA-Z0-9]{6,20}+$";
    NSPredicate *passWordPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",passWordRegex];
    return [passWordPredicate evaluateWithObject:self];
}
@end
