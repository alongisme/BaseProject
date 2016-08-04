//
//  UITextView+PlaceHolder.m
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UITextView+ALPlaceHolder.h"
static const char *AL_placeHolderTextView = "AL_placeHolderTextView";
@implementation UITextView (ALPlaceHolder)
- (UITextView *)AL_placeHolderTextView {
    return objc_getAssociatedObject(self, AL_placeHolderTextView);
}
- (void)setAL_placeHolderTextView:(UITextView *)placeHolderTextView {
    objc_setAssociatedObject(self, AL_placeHolderTextView, placeHolderTextView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (void)AL_addPlaceHolder:(NSString *)placeHolder {
    if (![self AL_placeHolderTextView]) {
        self.delegate = self;
        UITextView *textView = [[UITextView alloc] initWithFrame:self.bounds];
        textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        textView.font = self.font;
        textView.backgroundColor = [UIColor clearColor];
        textView.textColor = [UIColor grayColor];
        textView.userInteractionEnabled = NO;
        textView.text = placeHolder;
        [self addSubview:textView];
        [self setAL_placeHolderTextView:textView];
    }
}
# pragma mark -
# pragma mark - UITextViewDelegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    self.AL_placeHolderTextView.hidden = YES;
    // if (self.textViewDelegate) {
    //
    // }
}
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text && [textView.text isEqualToString:@""]) {
        self.AL_placeHolderTextView.hidden = NO;
    }
}

@end
