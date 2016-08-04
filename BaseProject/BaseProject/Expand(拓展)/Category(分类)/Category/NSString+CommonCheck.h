//
//  NSString+CommonCheck.h
//  CateGoriesDemo
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 3ti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface  NSString (NSString_CommonCheck)
/**
 *  判断一个字符串是否为空
 *
 *  @param string 字符串
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkIsStringEmpty:(NSString *)string;

/**
 *  判断一个字符串是否为空
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkIsStringEmpty;

/**
 *  判断是不是手机号
 *
 *  @param String  要判断的字符串
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkIsPhoneNumberWithString:(NSString *)String;


/**
 *  判断是不是手机号
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkIsPhoneNumber;

/**
 *  校验昵称
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkIsNickName;

/**
 *  校验昵称
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkIsNickName:(NSString *)nickname;

/**
 *  校验昵称长度
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkNickNameLength;

/**
 *  校验昵称长度
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkNickNameLength:(NSString *)nickname;

/**
 *  校验密码
 *
 *  @return 返回yes或no
 */
+ (BOOL)AL_checkIsPassword:(NSString *)passWord;

/**
 *  校验密码
 *
 *  @return 返回yes或no
 */
- (BOOL)AL_checkIsPassword;
@end
