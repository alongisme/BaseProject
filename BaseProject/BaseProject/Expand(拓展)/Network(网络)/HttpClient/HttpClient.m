//
//  HttpClient.m
//  XLAFNetworking
//
//  Created by admin on 16/5/12.
//  Copyright © 2016年 along. All rights reserved.
//

#import "HttpClient.h"
#import "NSMutableDictionary+Category.h"

#define HTTPURL @""
#define HTTPIMAGEURL @""

@implementation HttpClient

#pragma mark 单例

static HttpClient *httpClient = nil;
+ (id)sharedInstance {
    
    static dispatch_once_t predicate = 0;
    
    dispatch_once(&predicate, ^{
        if(httpClient == nil) {
            httpClient = [[HttpClient alloc]init];
        }
    });
    
    return httpClient;
}

/**
 *  校验网络状态
 *  网络状态
 *  1 网络不通
 *  2 WIFI
 *  3 3G 4G
 *  4 未知
 *  @param block 回调
 */
- (void)checkNetworkingStatus:(NetworingStautBlock)block {
    HttpRequest *requst = [[HttpRequest alloc]init];
    [requst checkNetworkingStatus:block];
}

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
                        responseEnd:(ResponseEndBlock)responseEnd {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters addUnEmptyString:phone forKey:@""];
    [parameters addUnEmptyString:password forKey:@""];
    
    return [self requestBaseWithName:@"用户登录" url:[HTTPURL DoMainNameWithString:@""] parameters:parameters isPost:YES success:^(HttpRequest *request, HttpResponse *response) {
        
        UserInfoModel *dataModel = [[UserInfoModel alloc]initWithDictionary:response.result error:nil];
        
        if(dataModel) {
            response.sourceModel = dataModel;
        }
        
        success(request,response);
        
    } failure:failure requsetStart:requestStart responseEnd:responseEnd];
    
}

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
                           responseEnd:(ResponseEndBlock)responseEnd {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters addUnEmptyString:phone forKey:@""];
    [parameters addUnEmptyString:code forKey:@""];
    [parameters addUnEmptyString:password forKey:@""];
    [parameters addUnEmptyString:nickName forKey:@""];
    
    return [self requestBaseWithName:@"用户注册" url:[HTTPURL DoMainNameWithString:@""] parameters:parameters isPost:YES success:success failure:failure requsetStart:requestStart responseEnd:responseEnd];
    
}

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
                      responseEnd:(ResponseEndBlock)responseEnd {
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters addUnEmptyString:phone forKey:@""];
    
    return [self requestBaseWithName:@"获取验证码" url:[HTTPURL DoMainNameWithString:@""] parameters:parameters isPost:YES success:success failure:failure requsetStart:requestStart responseEnd:responseEnd];
}

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
                             responseEnd:(ResponseEndBlock)responseEnd {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters addUnEmptyString:phone forKey:@""];
    [parameters addUnEmptyString:code forKey:@""];
    [parameters addUnEmptyString:password forKey:@""];
    
    return [self requestBaseWithName:@"找回密码" url:[HTTPURL DoMainNameWithString:@""] parameters:parameters isPost:YES success:success failure:failure requsetStart:requestStart responseEnd:responseEnd];
}

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
                              responseEnd:(ResponseEndBlock)responseEnd {
    
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    [parameters addUnEmptyString:userId forKey:@""];
    [parameters addUnEmptyString:oldPassword forKey:@""];
    [parameters addUnEmptyString:newPassword forKey:@""];
    
    return [self requestBaseWithName:@"修改密码" url:[HTTPURL DoMainNameWithString:@""] parameters:parameters isPost:YES success:success failure:failure requsetStart:requestStart responseEnd:responseEnd];
}


//上传请求接口测试
- (HttpRequest *)uploadPhotoWithPhotoFile:(NSArray *)PhotoFile
                                 progress:(UploadProgressBlock)progress
                         success:(CompletionHandlerSuccessBlock)success
                                  failure:(CompletionHandlerFailureBlock)failure
                             requsetStart:(RequstStartBlock)requestStart
                              responseEnd:(ResponseEndBlock)responseEnd {
  
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    
    HttpRequest *uploadRequset = [[HttpRequest alloc]init];
    
    [uploadRequset uploadRequestWithrequestName:@"上传测试" URLString:[HTTPURL DoMainNameWithString:@""] parameters:parameters PhotoFile:PhotoFile isPOST:YES];
    
    [uploadRequset uploadStartRequsetWithUnitSize:UntiSizeIsKByte Progress:progress SuccessBlock:^(HttpRequest *request, HttpResponse *response) {
        //可以在这里转模型数据传出去 付给response.sourceModel
        success(request,response);
    } FailedBlock:failure requsetStart:requestStart responseEnd:responseEnd];
    
    return uploadRequset;
}

//图片下载测试
- (HttpRequest *)downloadPhotoWithprogress:(UploadProgressBlock)progress
                               destination:(downloadDestinationBlock)destination
                                   success:(CompletionHandlerSuccessBlock)success
                                   failure:(CompletionHandlerFailureBlock)failure
                              requsetStart:(RequstStartBlock)requestStart
                               responseEnd:(ResponseEndBlock)responseEnd {
    
    HttpRequest *uploadRequset = [[HttpRequest alloc]init];
    
    [uploadRequset downloadRequestWithrequestName:@"下载测试" URLString:[HTTPIMAGEURL DoMainNameWithString:@""]];
    
    [uploadRequset downloadStartRequsetWithUnitSize:UntiSizeIsByte Progress:progress destination:destination SuccessBlock:^(HttpRequest *request, HttpResponse *response) {
        //可以在这里转模型数据传出去 付给response.sourceModel
        success(request,response);
    } FailedBlock:failure requsetStart:requestStart responseEnd:responseEnd];
    
    return uploadRequset;

}

//普通接口基类
- (HttpRequest *)requestBaseWithName:(NSString *)name url:(NSString *)url parameters:(NSMutableDictionary *)parameters isPost:(BOOL)isPost success:(CompletionHandlerSuccessBlock)success
                             failure:(CompletionHandlerFailureBlock)failure
                        requsetStart:(RequstStartBlock)requestStart
                         responseEnd:(ResponseEndBlock)responseEnd {
    
    HttpRequest *request = [[HttpRequest alloc]init];
    
    [request requestWithrequestName:name URLString:url parameters:parameters isPOST:isPost];
    
    [request startRequsetWithSuccessBlock:success FailedBlock:failure requsetStart:requestStart responseEnd:responseEnd];
    
    return request;
    
}
@end
