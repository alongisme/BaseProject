//
//  UIView+CustomBorder.h
//  Categories
//
//  Created by luomeng on 15/11/3.
//  Copyright © 2015年 luomeng. All rights reserved.
//
/**
 * 视图添加边框（其实是添加view）
 */

#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSUInteger, ALExcludePoint) {
    ALExcludeStartPoint = 1 << 0,
    ALExcludeEndPoint = 1 << 1,
    ALExcludeAllPoint = ~0UL
};


@interface UIView (ALCustomBorder)

/**
 *  头部边框线
 *
 *  @param color       颜色
 *  @param borderWidth 宽度
 */
- (void)AL_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
/**
 *  左部边框线
 *
 *  @param color       颜色
 *  @param borderWidth 宽度
 */
- (void)AL_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth;
/**
 *  底部边框线
 *
 *  @param color       颜色
 *  @param borderWidth 宽度
 */
- (void)AL_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;
/**
 *  右部边框线
 *
 *  @param color       颜色
 *  @param borderWidth 宽度
 */
- (void)AL_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth;

/**
 *  移除头部边框线
 */
- (void)AL_removeTopBorder;
/**
 *  移除左部边框线
 */
- (void)AL_removeLeftBorder;
/**
 *  移除底部边框线
 */
- (void)AL_removeBottomBorder;
/**
 *  移除右部边框线
 */
- (void)AL_removeRightBorder;

/**
 *  添加头部边框线
 *
 *  @param color       颜色
 *  @param borderWidth 宽度
 *  @param point       位置点
 *  @param edge        开始还是结束
 */
- (void)AL_addTopBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(ALExcludePoint)edge;
/**
 *  添加左部边框线
 *
 *  @param color       颜色
 *  @param borderWidth 宽度
 *  @param point       位置点
 *  @param edge        开始还是结束
 */
- (void)AL_addLeftBorderWithColor: (UIColor *) color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(ALExcludePoint)edge;
/**
 *  添加底部边框线
 *
 *  @param color       颜色
 *  @param borderWidth 宽度
 *  @param point       位置点
 *  @param edge        开始还是结束
 */
- (void)AL_addBottomBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(ALExcludePoint)edge;
/**
 *  添加右部边框线
 *
 *  @param color       颜色
 *  @param borderWidth 宽度
 *  @param point       位置点
 *  @param edge        开始还是结束
 */
- (void)AL_addRightBorderWithColor:(UIColor *)color width:(CGFloat) borderWidth excludePoint:(CGFloat)point edgeType:(ALExcludePoint)edge;
@end
