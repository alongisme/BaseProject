//
//  UIView+ALBorderRadius.h
//  Test
//
//  Created by admin on 16/7/27.
//  Copyright © 2016年 3ti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (UIView_ALBorderRadius)

/**
 *  添加圆角和边框
 *
 *  @param radius 角度
 *  @param width  宽度
 *  @param color  颜色
 */
- (void)addBorderRadiusWithRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color;

@end
