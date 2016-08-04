//
//  NSObject+ALFristLaunch.h
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(NSObject_ALFristLaunch)
/**
 *  判断某个控制器是否第一次启动
 *
 *  @param viewController  控制器 传nil则判断应用是否第一次启动
 *  @return yes or no
 */
- (BOOL)AL_IsFristLaunchWithViewController:(UIViewController *)viewController;
@end
