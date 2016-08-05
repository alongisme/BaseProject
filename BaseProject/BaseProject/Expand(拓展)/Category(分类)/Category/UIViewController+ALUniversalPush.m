//
//  UIViewController+ALUniversalPush.m
//  BaseProject
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 along. All rights reserved.
//

#import "UIViewController+ALUniversalPush.h"
#import <objc/runtime.h>

@implementation UIViewController(UIViewController_ALUniversalPush)
/**
 *  万能跳转
 *
 *  @param classString 控制器名字
 *  @param parameters  参数 KVC赋值
 *  @param animated    动画
 */
- (void)AL_ViewControllerUniversalPushWithClassString:(NSString *)classString parameters:(NSDictionary *)parameters animated:(BOOL)animated {
    
    //如果名字不为空
    if(![classString AL_checkIsStringEmpty]) {
        
        //创建class
        Class getClass = objc_getClass([classString cStringUsingEncoding:NSUTF8StringEncoding]);
        
        //如果class 存在
        if(getClass) {
            
            //初始化
            id controllerClass = [[getClass alloc]init];
            
            //遍历参数字典
            for (NSString *value in parameters) {
                
                //校验是否有这个属性存在
                if([self checkClassIsExisPropertyWithInstance:getClass verifyPropertyName:value]) {
                    //有则赋值
                    [controllerClass setValue:value forKey:[parameters objectForKey:value]];
                }
                
            }
            
            //如果navVC存在
            if(self.navigationController) {
                
                //获取rootVC
                UIViewController *rootVC = ALAppDelegate.window.rootViewController;
                
                //如果rootVC 是tabbarVC  tabbarVC - NavVC
                if([rootVC isKindOfClass:[UITabBarController class]]) {
                    
                    //强转rootVC
                    UITabBarController *tabBarRootVC = (UITabBarController *)rootVC;
                    
                    //如果tabbarVC 选中的VC是navVC
                    if([tabBarRootVC.selectedViewController isKindOfClass:[UINavigationController class]]) {
                        
                        //强转navVC
                        UINavigationController *navigationTopVC = (UINavigationController *)tabBarRootVC.selectedViewController;
                        
                        //使用当前选中界面的导航栏 push到 制定controller
                        [navigationTopVC pushViewController:controllerClass animated:animated];
                        
                    }
                    
                }
                
            }
            
        }

    }
        
}

- (BOOL)checkClassIsExisPropertyWithInstance:(Class)instance verifyPropertyName:(NSString *)verifyPropertyName {
   
    unsigned int outCount = 0;
    
    Ivar *ivars = class_copyIvarList([instance class], &outCount);
    
    for(unsigned int i=0; i < outCount; i++) {
        
        Ivar property = ivars[i];
        
        NSString *keyName = [NSString stringWithCString:ivar_getName(property) encoding:NSUTF8StringEncoding];
        
        keyName = [keyName stringByReplacingOccurrencesOfString:@"_" withString:@""];
        
        if([keyName isEqualToString:verifyPropertyName]) {
            
            free(ivars);
            
            return YES;
        }
    }
    free(ivars);
    return NO;
}

@end
