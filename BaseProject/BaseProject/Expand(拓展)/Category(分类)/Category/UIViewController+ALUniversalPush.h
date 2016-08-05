//
//  UIViewController+ALUniversalPush.h
//  BaseProject
//
//  Created by admin on 16/8/5.
//  Copyright © 2016年 along. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIViewController(UIViewController_ALUniversalPush)
/**
*  万能跳转
*
*  @param classString 控制器名字
*  @param parameters  参数 KVC赋值
*  @param animated    动画
*/
- (void)AL_ViewControllerUniversalPushWithClassString:(NSString *)classString parameters:(NSDictionary *)parameters animated:(BOOL)animated;
@end
