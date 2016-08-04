//
//  UIImage+ALOrientation.h
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 15/1/4.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
//CGFloat DegreesToRadiansForOrientation(CGFloat degrees) {return degrees * M_PI / 180;};
//CGFloat RadiansToDegreesForOrientation(CGFloat radians) {return radians * 180/M_PI;};
@interface UIImage (ALOrientation)
/**
*  修正图片的方向
*
*  @param srcImg 图片
*
*  @return 修正方向后的图片
*/
+ (UIImage *)AL_fixOrientation:(UIImage *)srcImg;
/**
 *  旋转图片
 *
 *  @param degrees 角度
 *
 *  @return 旋转后图片
 */
- (UIImage *)AL_imageRotatedByDegrees:(CGFloat)degrees;

/**
 *  旋转图片
 *
 *  @param radians 弧度
 *
 *  @return 旋转后图片
 */
- (UIImage *)AL_imageRotatedByRadians:(CGFloat)radians;

/**
 *  垂直翻转
 *
 *  @return 翻转后的图片
 */
- (UIImage *)AL_flipVertical;

/**
 *  水平翻转
 *
 *  @return 翻转后的图片
 */
- (UIImage *)AL_flipHorizontal;

/**
 *  角度转弧度
 *
 *  @param degrees 角度
 *
 *  @return 弧度
 */
+ (CGFloat)AL_degreesToRadians:(CGFloat)degrees;

/**
 *  弧度转角度
 *
 *  @param radians 弧度
 *
 *  @return 角度
 */
+ (CGFloat)AL_radiansToDegrees:(CGFloat)radians;

@end
