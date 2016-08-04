//
//  UIView+ALFrame.m
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+ALFrame.h"

@implementation UIView (ALFrame)
#pragma mark - Shortcuts for the coords

- (CGFloat)AL_top
{
    return self.frame.origin.y;
}

- (void)setAL_top:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)AL_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setAL_right:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)AL_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setAL_bottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)AL_left
{
    return self.frame.origin.x;
}

- (void)setAL_left:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)AL_width
{
    return self.frame.size.width;
}

- (void)setAL_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)AL_height
{
    return self.frame.size.height;
}

- (void)setAL_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)AL_origin {
    return self.frame.origin;
}

- (void)setAL_origin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)AL_size {
    return self.frame.size;
}

- (void)setAL_size:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)AL_centerX {
    return self.center.x;
}

- (void)setAL_centerX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)AL_centerY {
    return self.center.y;
}

- (void)setAL_centerY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

@end
