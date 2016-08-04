//
//  HttpClient.h
//  XLAFNetworking
//
//  Created by admin on 16/5/12.
//  Copyright © 2016年 along. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HttpRequest.h"
#import "UploadModel.h"
#import "HttpFileLoadProgress.h"


#define HTTPCLIENTSTART [HttpClient sharedInstance]

@interface HttpClient : NSObject
/**
 *  单例
 *
 *  @return 返回实例
 */
+ (id)sharedInstance;

/**
 *  校验网络状态
 *  网络状态
 *  1 网络不通
 *  2 WIFI
 *  3 3G 4G
 *  4 未知
 *  @param block 回调
 */
- (void)checkNetworkingStatus:(NetworingStautBlock)block;

#pragma mark ----------------------Add New Requst----------------------
//缺省接口

#pragma mark 用户登录
/**
 *  用户登录接口
 *
 *  @param phone        手机号码
 *  @param password     密码
 *  @param success      成功回调
 *  @param failure      失败回调
 *  @param requestStart 请求成功回调
 *  @param responseEnd  响应结束回调
 *
 *  @return 返回请求对象
 */
- (HttpRequest *)userLoginWithPhone:(NSString *)phone
                           Password:(NSString *)password
                    success:(CompletionHandlerSuccessBlock)success
                             failure:(CompletionHandlerFailureBlock)failure
                        requsetStart:(RequstStartBlock)requestStart
                         responseEnd:(ResponseEndBlock)responseEnd;

#pragma mark 用户注册
/**
 *  用户注册接口
 *
 *  @param phone        手机号码
 *  @param code         验证码
 *  @param password     密码
 *  @param nickName     昵称
 *  @param success      成功回调
 *  @param failure      失败回调
 *  @param requestStart 请求成功回调
 *  @param responseEnd  响应结束回调
 *
 *  @return 返回请求对象
 */
- (HttpRequest *)userRegisterWithPhone:(NSString *)phone
                                  Code:(NSString *)code
                              Password:(NSString *)password
                              NickName:(NSString *)nickName
                            success:(CompletionHandlerSuccessBlock)success
                            failure:(CompletionHandlerFailureBlock)failure
                       requsetStart:(RequstStartBlock)requestStart
                        responseEnd:(ResponseEndBlock)responseEnd;

#pragma mark 获取验证码
/**
 *  获取验证码
 *
 *  @param phone        手机号码
 *  @param success      成功回调
 *  @param failure      失败回调
 *  @param requestStart 请求成功回调
 *  @param responseEnd  响应结束回调
 *
 *  @return 返回请求对象
 */
- (HttpRequest *)getCodeWithPhone:(NSString *)phone
                                 success:(CompletionHandlerSuccessBlock)success
                                 failure:(CompletionHandlerFailureBlock)failure
                            requsetStart:(RequstStartBlock)requestStart
                             responseEnd:(ResponseEndBlock)responseEnd;

#pragma mark 忘记密码
/**
 *  忘记密码
 *
 *  @param phone        手机号码
 *  @param code         验证码
 *  @param password     重设的密码
 *  @param success      成功回调
 *  @param failure      失败回调
 *  @param requestStart 请求成功回调
 *  @param responseEnd  响应结束回调
 *
 *  @return 返回请求对象
 */
- (HttpRequest *)forgetPasswordWithPhone:(NSString *)phone
                                     Code:(NSString *)code
                                 Password:(NSString *)password
                                  success:(CompletionHandlerSuccessBlock)success
                                  failure:(CompletionHandlerFailureBlock)failure
                             requsetStart:(RequstStartBlock)requestStart
                              responseEnd:(ResponseEndBlock)responseEnd;

#pragma mark 修改密码
/**
 *  修改密码
 *
 *  @param UserId       用户id
 *  @param oldPassword  旧密码
 *  @param newPassword  新密码
 *  @param success      成功回调
 *  @param failure      失败回调
 *  @param requestStart 请求成功回调
 *  @param responseEnd  响应结束回调
 *
 *  @return 返回请求对象
 */
- (HttpRequest *)changePasswordWithUserId:(NSString *)userId
                              OldPassword:(NSString *)oldPassword
                                NewPassword:(NSString *)newPassword
                                 success:(CompletionHandlerSuccessBlock)success
                                 failure:(CompletionHandlerFailureBlock)failure
                            requsetStart:(RequstStartBlock)requestStart
                             responseEnd:(ResponseEndBlock)responseEnd;


//图片上传测试
- (HttpRequest *)uploadPhotoWithPhotoFile:(NSArray *)PhotoFile
                                 progress:(UploadProgressBlock)progress
                         success:(CompletionHandlerSuccessBlock)success
                                  failure:(CompletionHandlerFailureBlock)failure
                             requsetStart:(RequstStartBlock)requestStart
                              responseEnd:(ResponseEndBlock)responseEnd;

//图片下载测试
- (HttpRequest *)downloadPhotoWithprogress:(UploadProgressBlock)progress
                               destination:(downloadDestinationBlock)destination
                                   success:(CompletionHandlerSuccessBlock)success
                                   failure:(CompletionHandlerFailureBlock)failure
                              requsetStart:(RequstStartBlock)requestStart
                               responseEnd:(ResponseEndBlock)responseEnd;

@end
