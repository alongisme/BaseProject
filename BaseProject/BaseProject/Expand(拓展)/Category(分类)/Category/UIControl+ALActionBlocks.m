//
//  UIControl+ALActionBlocks.m
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import "UIControl+ALActionBlocks.h"
#import <objc/runtime.h>

static const void *UIControlALActionBlockArray = &UIControlALActionBlockArray;

@implementation UIControlALActionBlockWrapper

- (void)AL_invokeBlock:(id)sender {
    if (self.AL_actionBlock) {
        self.AL_actionBlock(sender);
        
    }
}
@end


@implementation UIControl (ALActionBlocks)
-(void)AL_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlALActionBlock)actionBlock {
    NSMutableArray *actionBlocksArray = [self AL_actionBlocksArray];
    
    UIControlALActionBlockWrapper *blockActionWrapper = [[UIControlALActionBlockWrapper alloc] init];
    blockActionWrapper.AL_actionBlock = actionBlock;
    blockActionWrapper.AL_controlEvents = controlEvents;
    [actionBlocksArray addObject:blockActionWrapper];
    
    [self addTarget:blockActionWrapper action:@selector(AL_invokeBlock:) forControlEvents:controlEvents];
}


- (void)AL_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents {
    NSMutableArray *actionBlocksArray = [self AL_actionBlocksArray];
    NSMutableArray *wrappersToRemove = [NSMutableArray arrayWithCapacity:[actionBlocksArray count]];
    
    [actionBlocksArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIControlALActionBlockWrapper *wrapperTmp = obj;
        if (wrapperTmp.AL_controlEvents == controlEvents) {
            [wrappersToRemove addObject:wrapperTmp];
            [self removeTarget:wrapperTmp action:@selector(AL_invokeBlock:) forControlEvents:controlEvents];
        }
    }];
    
    [actionBlocksArray removeObjectsInArray:wrappersToRemove];
}


- (NSMutableArray *)AL_actionBlocksArray {
    NSMutableArray *actionBlocksArray = objc_getAssociatedObject(self, UIControlALActionBlockArray);
    if (!actionBlocksArray) {
        actionBlocksArray = [NSMutableArray array];
        objc_setAssociatedObject(self, UIControlALActionBlockArray, actionBlocksArray, OBJC_ASSOCIATION_RETAIN);
    }
    return actionBlocksArray;
}
@end
