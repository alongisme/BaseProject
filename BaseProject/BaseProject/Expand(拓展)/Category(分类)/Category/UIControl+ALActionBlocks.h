//
//  UIControl+ALActionBlocks.h
//  ALCategories (https://github.com/shaojiankui/ALCategories)
//
//  Created by Jakey on 15/5/23.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//  https://github.com/lavoy/ALActionBlocks

#import <UIKit/UIKit.h>
typedef void (^UIControlALActionBlock)(id weakSender);//返回实例对象


@interface UIControlALActionBlockWrapper : NSObject
@property (nonatomic, copy) UIControlALActionBlock AL_actionBlock;
@property (nonatomic, assign) UIControlEvents AL_controlEvents;
- (void)AL_invokeBlock:(id)sender;
@end



@interface UIControl (ALActionBlocks)
/**
 *  加添一个控制事件
 *
 *  @param controlEvents 控制事件
 *  @param actionBlock   用block回调响应事件
 */
- (void)AL_handleControlEvents:(UIControlEvents)controlEvents withBlock:(UIControlALActionBlock)actionBlock;

/**
 *  移除一个控制事件
 *
 *  @param controlEvents 控制事件
 */
- (void)AL_removeActionBlocksForControlEvents:(UIControlEvents)controlEvents;
@end
