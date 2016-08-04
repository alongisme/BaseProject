//
//  UIScreen+ALFrame.h
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScreen (ALFrame)
/**
 *  返回frame的size
 *
 *  @return 返回frame的size
 */
+ (CGSize)AL_size;

/**
 *  返回frame的width
 *
 *  @return 返回frame的width
 */
+ (CGFloat)AL_width;

/**
 *  返回frame的height
 *
 *  @return 返回frame的height
 */
+ (CGFloat)AL_height;

/**
 *  旋转后的size
 *
 *  @return 旋转后的size
 */
+ (CGSize)AL_orientationSize;
/**
 *  旋转后的width
 *
 *  @return 旋转后的width
 */
+ (CGFloat)AL_orientationWidth;
/**
 *  旋转后的height
 *
 *  @return height
 */
+ (CGFloat)AL_orientationHeight;
/**
 *  分辨率的大小
 *
 *  @return 分辨率大小
 */
+ (CGSize)AL_DPISize;

@end
