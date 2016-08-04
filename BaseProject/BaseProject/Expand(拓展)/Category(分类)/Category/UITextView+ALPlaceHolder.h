//
//  UITextView+PlaceHolder.h
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UITextView (ALPlaceHolder) <UITextViewDelegate>
@property (nonatomic, strong) UITextView *AL_placeHolderTextView;
//@property (nonatomic, assign) id <UITextViewDelegate> textViewDelegate;
- (void)AL_addPlaceHolder:(NSString *)placeHolder;
@end
