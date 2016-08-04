//
//  UITextField+Blocks.h
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface UITextField (ALBlocks)
@property (copy, nonatomic) BOOL (^AL_shouldBegindEditingBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^AL_shouldEndEditingBlock)(UITextField *textField);
@property (copy, nonatomic) void (^AL_didBeginEditingBlock)(UITextField *textField);
@property (copy, nonatomic) void (^AL_didEndEditingBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^AL_shouldChangeCharactersInRangeBlock)(UITextField *textField, NSRange range, NSString *replacementString);
@property (copy, nonatomic) BOOL (^AL_shouldReturnBlock)(UITextField *textField);
@property (copy, nonatomic) BOOL (^AL_shouldClearBlock)(UITextField *textField);

- (void)setAL_shouldBegindEditingBlock:(BOOL (^)(UITextField *textField))shouldBegindEditingBlock;
- (void)setAL_shouldEndEditingBlock:(BOOL (^)(UITextField *textField))shouldEndEditingBlock;
- (void)setAL_didBeginEditingBlock:(void (^)(UITextField *textField))didBeginEditingBlock;
- (void)setAL_didEndEditingBlock:(void (^)(UITextField *textField))didEndEditingBlock;
- (void)setAL_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *textField, NSRange range, NSString *string))shouldChangeCharactersInRangeBlock;
- (void)setAL_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock;
- (void)setAL_shouldReturnBlock:(BOOL (^)(UITextField *textField))shouldReturnBlock;
@end