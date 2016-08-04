//
// UITextField+Blocks.m
// UITextFieldBlocks
//
// Created by Håkon Bogen on 19.10.13.
// Copyright (c) 2013 Håkon Bogen. All rights reserved.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
#import "UITextField+ALBlocks.h"
#import <objc/runtime.h>
typedef BOOL (^ALUITextFieldReturnBlock) (UITextField *textField);
typedef void (^ALUITextFieldVoidBlock) (UITextField *textField);
typedef BOOL (^ALUITextFieldCharacterChangeBlock) (UITextField *textField, NSRange range, NSString *replacementString);
@implementation UITextField (ALBlocks)
static const void *ALUITextFieldDelegateKey = &ALUITextFieldDelegateKey;
static const void *ALUITextFieldShouldBeginEditingKey = &ALUITextFieldShouldBeginEditingKey;
static const void *ALUITextFieldShouldEndEditingKey = &ALUITextFieldShouldEndEditingKey;
static const void *ALUITextFieldDidBeginEditingKey = &ALUITextFieldDidBeginEditingKey;
static const void *ALUITextFieldDidEndEditingKey = &ALUITextFieldDidEndEditingKey;
static const void *ALUITextFieldShouldChangeCharactersInRangeKey = &ALUITextFieldShouldChangeCharactersInRangeKey;
static const void *ALUITextFieldShouldClearKey = &ALUITextFieldShouldClearKey;
static const void *ALUITextFieldShouldReturnKey = &ALUITextFieldShouldReturnKey;
#pragma mark UITextField Delegate methods
+ (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    ALUITextFieldReturnBlock block = textField.AL_shouldBegindEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, ALUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]) {
        return [delegate textFieldShouldBeginEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    ALUITextFieldReturnBlock block = textField.AL_shouldEndEditingBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, ALUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]) {
        return [delegate textFieldShouldEndEditing:textField];
    }
    // return default value just in case
    return YES;
}
+ (void)textFieldDidBeginEditing:(UITextField *)textField
{
   ALUITextFieldVoidBlock block = textField.AL_didBeginEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, ALUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (void)textFieldDidEndEditing:(UITextField *)textField
{
    ALUITextFieldVoidBlock block = textField.AL_didEndEditingBlock;
    if (block) {
        block(textField);
    }
    id delegate = objc_getAssociatedObject(self, ALUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldDidEndEditing:)]) {
        [delegate textFieldDidBeginEditing:textField];
    }
}
+ (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    ALUITextFieldCharacterChangeBlock block = textField.AL_shouldChangeCharactersInRangeBlock;
    if (block) {
        return block(textField,range,string);
    }
    id delegate = objc_getAssociatedObject(self, ALUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]) {
        return [delegate textField:textField shouldChangeCharactersInRange:range replacementString:string];
    }
    return YES;
}
+ (BOOL)textFieldShouldClear:(UITextField *)textField
{
    ALUITextFieldReturnBlock block = textField.AL_shouldClearBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, ALUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldClear:)]) {
        return [delegate textFieldShouldClear:textField];
    }
    return YES;
}
+ (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    ALUITextFieldReturnBlock block = textField.AL_shouldReturnBlock;
    if (block) {
        return block(textField);
    }
    id delegate = objc_getAssociatedObject(self, ALUITextFieldDelegateKey);
    if ([delegate respondsToSelector:@selector(textFieldShouldReturn:)]) {
        return [delegate textFieldShouldReturn:textField];
    }
    return YES;
}
#pragma mark Block setting/getting methods
- (BOOL (^)(UITextField *))AL_shouldBegindEditingBlock
{
    return objc_getAssociatedObject(self, ALUITextFieldShouldBeginEditingKey);
}
- (void)setAL_shouldBegindEditingBlock:(BOOL (^)(UITextField *))shouldBegindEditingBlock
{
    [self AL_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, ALUITextFieldShouldBeginEditingKey, shouldBegindEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))AL_shouldEndEditingBlock
{
    return objc_getAssociatedObject(self, ALUITextFieldShouldEndEditingKey);
}
- (void)setAL_shouldEndEditingBlock:(BOOL (^)(UITextField *))shouldEndEditingBlock
{
    [self AL_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, ALUITextFieldShouldEndEditingKey, shouldEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))AL_didBeginEditingBlock
{
    return objc_getAssociatedObject(self, ALUITextFieldDidBeginEditingKey);
}
- (void)setAL_didBeginEditingBlock:(void (^)(UITextField *))didBeginEditingBlock
{
    [self AL_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, ALUITextFieldDidBeginEditingKey, didBeginEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (void (^)(UITextField *))AL_didEndEditingBlock
{
    return objc_getAssociatedObject(self, ALUITextFieldDidEndEditingKey);
}
- (void)setAL_didEndEditingBlock:(void (^)(UITextField *))didEndEditingBlock
{
    [self AL_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, ALUITextFieldDidEndEditingKey, didEndEditingBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *, NSRange, NSString *))AL_shouldChangeCharactersInRangeBlock
{
    return objc_getAssociatedObject(self, ALUITextFieldShouldChangeCharactersInRangeKey);
}
- (void)setAL_shouldChangeCharactersInRangeBlock:(BOOL (^)(UITextField *, NSRange, NSString *))shouldChangeCharactersInRangeBlock
{
    [self AL_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, ALUITextFieldShouldChangeCharactersInRangeKey, shouldChangeCharactersInRangeBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))AL_shouldReturnBlock
{
    return objc_getAssociatedObject(self, ALUITextFieldShouldReturnKey);
}
- (void)setAL_shouldReturnBlock:(BOOL (^)(UITextField *))shouldReturnBlock
{
    [self AL_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, ALUITextFieldShouldReturnKey, shouldReturnBlock, OBJC_ASSOCIATION_COPY);
}
- (BOOL (^)(UITextField *))AL_shouldClearBlock
{
    return objc_getAssociatedObject(self, ALUITextFieldShouldClearKey);
}
- (void)setAL_shouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock
{
    [self AL_setDelegateIfNoDelegateSet];
    objc_setAssociatedObject(self, ALUITextFieldShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
}
#pragma mark control method
/*
 Setting itself as delegate if no other delegate has been set. This ensures the UITextField will use blocks if no delegate is set.
 */
- (void)AL_setDelegateIfNoDelegateSet
{
    if (self.delegate != (id<UITextFieldDelegate>)[self class]) {
        objc_setAssociatedObject(self, ALUITextFieldDelegateKey, self.delegate, OBJC_ASSOCIATION_ASSIGN);
        self.delegate = (id<UITextFieldDelegate>)[self class];
    }
}
@end