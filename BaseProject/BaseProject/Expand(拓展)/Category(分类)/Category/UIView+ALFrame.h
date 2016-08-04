//
//  UIView+ALFrame.h
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ALFrame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint AL_origin;
@property (nonatomic, assign) CGSize AL_size;

// shortcuts for positions
@property (nonatomic) CGFloat AL_centerX;
@property (nonatomic) CGFloat AL_centerY;


@property (nonatomic) CGFloat AL_top;
@property (nonatomic) CGFloat AL_bottom;
@property (nonatomic) CGFloat AL_right;
@property (nonatomic) CGFloat AL_left;

@property (nonatomic) CGFloat AL_width;
@property (nonatomic) CGFloat AL_height;
@end
