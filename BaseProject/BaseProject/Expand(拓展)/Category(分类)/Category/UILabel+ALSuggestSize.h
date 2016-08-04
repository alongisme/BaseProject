//
//  UILabel+SuggestSize.h
//  WordPress
//
//  Created by Eric J on 6/18/13.
//  Copyright (c) 2013 WordPress. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ALSuggestSize)

/**
 *  给定宽度
 *
 *  @param width 宽度
 *
 *  @return size
 */
- (CGSize)AL_suggestedSizeForWidth:(CGFloat)width;

/**
 *  给定宽度
 *
 *  @param string 文字
 *  @param width  宽度
 *
 *  @return size
 */
- (CGSize)AL_suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width;

/**
 *  给定宽度
 *
 *  @param string 文字
 *  @param width  宽度
 *
 *  @return size
 */
- (CGSize)AL_suggestSizeForString:(NSString *)string width:(CGFloat)width;

@end
