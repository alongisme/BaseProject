//
//  UINavigationBar+Awesome.h
//  LTNavigationBar
//
//  Created by ltebean on 15-2-15.
//  Copyright (c) 2015 ltebean. All rights reserved.
//  https://github.com/ltebean/LTNavigationBar

#import <UIKit/UIKit.h>

@interface UINavigationBar (ALAwesome)
/**
 *  设置背景颜色
 *
 *  @param backgroundColor color
 */
- (void)AL_setBackgroundColor:(UIColor *)backgroundColor;

/**
 *  设置透明度
 *
 *  @param alpha alpha
 */
- (void)AL_setElementsAlpha:(CGFloat)alpha;

/**
 *  Y的偏移量
 *
 *  @param translationY CGFloat
 */
- (void)AL_setTranslationY:(CGFloat)translationY;

/**
 *  还原
 */
- (void)AL_reset;
@end