//
//  CommonMacro.h
//  Test
//
//  Created by admin on 16/7/27.
//  Copyright © 2016年 3ti. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

//DeBug
#ifdef DEBUG
#define ALLog(...) NSLog(@"%s %d Line \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ALLog(...)
#endif

//AppDelegate
#define ALAppDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)

//KeyWindow
#define ALKeyWindow [UIApplication sharedApplication].keyWindow

//设置随机颜色
#define AL_SetRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]
//设置颜色
#define AL_SetColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]

//weakself
#define AL_WeakSelf(type)  __weak typeof(type) weakself = type;

// 判断是否为 iPhone 5SE
#define ALiPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f

// 判断是否为iPhone 6/6s
#define AL_iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f

// 判断是否为iPhone 6Plus/6sPlus
#define AL_iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f

//获取系统版本
#define AL_IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//GCD - 一次性执行
#define AL_DISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);

//GCD - 在Main线程上运行
#define AL_DISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);

//GCD - 开启异步线程
#define AL_DISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

#endif /* CommonMacro_h */
