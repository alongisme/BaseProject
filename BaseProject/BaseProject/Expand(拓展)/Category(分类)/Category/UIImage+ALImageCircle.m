//
//  UIImage+ALImageCirALe.m
//  05-图片的裁剪和保存
//
//  Created by lin on 15/8/28.
//  Copyright (c) 2015年 itxdl. All rights reserved.
//

#import "UIImage+ALImageCircle.h"

@implementation UIImage (ALImageCircle)

+ (instancetype)circleImageWithOldImageName:(NSString *)oldImageName WithBorder:(CGFloat)borderW WithColor:(UIColor *)borderColer {
    UIImage *oldImage = [UIImage imageNamed:oldImageName];
    
    CGFloat newImageW = oldImage.size.width + 2 * borderW;
    
    CGFloat newImageH = oldImage.size.height + 2 * borderW;
    
    // opaque  YES 不透明  NO 透明
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(newImageW, newImageH), NO, 0.0);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    if(borderColer) {
        [borderColer set];
    }
    
    CGFloat outCenterX = newImageW * 0.5;
    
    CGFloat outCenterY = newImageH * 0.5;
    
    CGFloat radius = newImageW * 0.5;
    
    CGContextAddArc(ctx, outCenterX, outCenterY, radius, 0, M_PI * 2, 0);
    
    CGContextFillPath(ctx);
    
    CGFloat inCenterX = outCenterX;
    
    CGFloat inCenterY = outCenterY;
    
    CGFloat inRadius = radius - borderW;
    
    CGContextAddArc(ctx, inCenterX, inCenterY, inRadius, 0, M_PI * 2, 0);
    
    CGContextClip(ctx);
    
    [oldImage drawInRect:CGRectMake(borderW, borderW, oldImage.size.width, oldImage.size.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

@end
