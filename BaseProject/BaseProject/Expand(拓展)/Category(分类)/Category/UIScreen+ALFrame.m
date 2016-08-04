//
//  UIScreen+ALFrame.m
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 15/5/22.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIScreen+ALFrame.h"

@implementation UIScreen (ALFrame)
+ (CGSize)AL_size
{
    return [[UIScreen mainScreen] bounds].size;
}

+ (CGFloat)AL_width
{
    return [[UIScreen mainScreen] bounds].size.width;
}

+ (CGFloat)AL_height
{
    return [[UIScreen mainScreen] bounds].size.height;
}

+ (CGSize)AL_orientationSize
{
    CGFloat systemVersion = [[[UIDevice currentDevice] systemVersion]
                             doubleValue];
    BOOL isLand =   UIInterfaceOrientationIsLandscape([UIApplication sharedApplication].statusBarOrientation);
    return (systemVersion>8.0 && isLand) ? AL_SizeSWAP([UIScreen AL_size]) : [UIScreen AL_size];
}

+ (CGFloat)AL_orientationWidth
{
    return [UIScreen AL_orientationSize].width;
}

+ (CGFloat)AL_orientationHeight
{
    return [UIScreen AL_orientationSize].height;
}

+ (CGSize)AL_DPISize
{
    CGSize size = [[UIScreen mainScreen] bounds].size;
    CGFloat scale = [[UIScreen mainScreen] scale];
    return CGSizeMake(size.width * scale, size.height * scale);
}


/**
 *  交换高度与宽度
 */
static inline CGSize AL_SizeSWAP(CGSize size) {
    return CGSizeMake(size.height, size.width);
}
@end
