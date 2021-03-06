//
//  UIColor+ALHEX.h
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ALHEX)
/**
 *  根据十六进制值返回颜色
 *
 *  @param hex 十六进制值
 *
 *  @return 颜色
 */
+ (UIColor *)AL_colorWithHex:(UInt32)hex;
/**
 *  根据十六进制值返回颜色
 *
 *  @param hex   十六进制值
 *  @param alpha 透明
 *
 *  @return 颜色
 */
+ (UIColor *)AL_colorWithHex:(UInt32)hex andAlpha:(CGFloat)alpha;

/**
 *  根据十六进制字符串返回颜色
 *
 *  @param hexString 十六进制字符串
 *
 *  @return 颜色
 */
+ (UIColor *)AL_colorWithHexString:(NSString *)hexString;

/**
 *  获取颜色的十六进制值
 *
 *  @return 返回字符串
 */
- (NSString *)AL_HEXString;

/**
 *  设置r，g，b，a值
 *
 *  @param red   R
 *  @param green G
 *  @param blue  B
 *  @param alpha A
 *
 *  @return 颜色
 */
+ (UIColor *)AL_colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue
                         alpha:(CGFloat)alpha;

/**
 *  设置r,g,b值
 *
 *  @param red   R
 *  @param green G
 *  @param blue  B
 *
 *  @return 颜色
 */
+ (UIColor *)AL_colorWithWholeRed:(CGFloat)red
                         green:(CGFloat)green
                          blue:(CGFloat)blue;
@end
