//
//  UIImageView+Addition.h
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (ALAddition)
/**
*  根据bundle中的图片名创建imageview
*
*  @param imageName bundle中的图片名
*
*  @return imageview
*/
+ (id)AL_imageViewWithImageNamed:(NSString*)imageName;
/**
 *  根据frame创建imageview
 *
 *  @param frame frame
 *
 *  @return imageview
 */
+ (id)AL_imageViewWithFrame:(CGRect)frame;

/**
 *  图片部分拉伸
 *
 *  @param imageName 图片名字
 *  @param frame     大小
 *
 *  @return imageview
 */
+ (id)AL_imageViewWithStretchableImage:(NSString*)imageName Frame:(CGRect)frame;

/**
 *  创建imageview动画
 *
 *  @param imageArray 图片名称数组
 *  @param duration   动画时间
 *
 *  @return imageview
 */
+ (id)AL_imageViewWithImageArray:(NSArray*)imageArray duration:(NSTimeInterval)duration;
/**
 *  图片部分拉伸
 *
 *  @param imageName 图片名
 */
- (void)AL_setImageWithStretchableImage:(NSString*)imageName;


// 画水印
/**
 *  图片水印
 *
 *  @param image 图片
 *  @param mark  水印图
 *  @param rect  位置
 */
- (void)AL_setImage:(UIImage *)image withWaterMark:(UIImage *)mark inRect:(CGRect)rect;
// 文字水印
/**
 *  文字水印
 *
 *  @param image      图片
 *  @param markString 水印文字
 *  @param rect       位置
 *  @param color      颜色
 *  @param font       字体
 */
- (void)AL_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString inRect:(CGRect)rect color:(UIColor *)color font:(UIFont *)font;
/**
 *  文字水印
 *
 *  @param image      图片
 *  @param markString 水印文字
 *  @param point      位置
 *  @param color      颜色
 *  @param font       字体
 */
- (void)AL_setImage:(UIImage *)image withStringWaterMark:(NSString *)markString atPoint:(CGPoint)point color:(UIColor *)color font:(UIFont *)font;
@end
