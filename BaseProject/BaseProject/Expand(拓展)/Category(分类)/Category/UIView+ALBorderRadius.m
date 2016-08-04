//
//  UIView+ALBorderRadius.m
//  Test
//
//  Created by admin on 16/7/27.
//  Copyright © 2016年 3ti. All rights reserved.
//

#import "UIView+ALBorderRadius.h"

@implementation UIView (UIView_ALBorderRadius)
/**
 *  添加圆角和边框
 *
 *  @param radius 角度
 *  @param width  宽度
 *  @param color  颜色
 */
- (void)addBorderRadiusWithRadius:(CGFloat)radius width:(CGFloat)width color:(UIColor *)color {
    [self.layer setMasksToBounds:YES];
    [self.layer setCornerRadius:radius];
    [self.layer setBorderWidth:width];
    [self.layer setBorderColor:[color CGColor]];
}
@end
