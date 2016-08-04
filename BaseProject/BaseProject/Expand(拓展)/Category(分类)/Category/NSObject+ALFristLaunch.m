//
//  NSObject+ALFristLaunch.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "NSObject+ALFristLaunch.h"

#define FristLaunchKey @"FristLaunchKey"

@implementation NSObject(NSObject_ALFristLaunch)
/**
 *  判断某个控制器是否第一次启动
 *
 *  @param viewController  控制器 传nil则判断应用是否第一次启动
 *  @return yes or no
 */
- (BOOL)AL_IsFristLaunchWithViewController:(UIViewController *)viewController {
    if(viewController && [viewController isKindOfClass:[UIViewController class]]) {
        
        if([[NSUserDefaults standardUserDefaults]objectForKey:NSStringFromClass([viewController class])]) {
            return NO;
        }else {
            [[NSUserDefaults standardUserDefaults]setObject:NSStringFromClass([viewController class]) forKey:NSStringFromClass([viewController class])];
            return YES;
        }
    }else {
        if([[NSUserDefaults standardUserDefaults]objectForKey:FristLaunchKey]) {
            return NO;
        }else {
            [[NSUserDefaults standardUserDefaults]setObject:FristLaunchKey forKey:FristLaunchKey];
            return YES;
        }
    }
    
    return NO;
}
@end
