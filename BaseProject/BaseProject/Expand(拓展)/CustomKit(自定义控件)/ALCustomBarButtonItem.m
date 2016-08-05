//
//  ALCustomBarButtonItem.m
//  BaseProject
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 along. All rights reserved.
//

#import "ALCustomBarButtonItem.h"

@implementation ALCustomBarButtonItem
/**
 *  创建一个itembutton
 *
 *  @param imageName       图片名字
 *  @param hlImageName     图片高亮名字
 *  @param barButtonAction 按钮点击事件
 *
 *  @return buttonitem
 */
+ (ALCustomBarButtonItem *)CreateBarButtonItemWithImageName:(NSString *)imageName hlImageName:(NSString *)hlImageName barButtonAction:(BarButtonItemClickAction)barButtonAction {
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [self CreateBarButtonItemWithImageName:imageName hlImageName:hlImageName Frame:CGRectMake(0, 0, image.size.width, image.size.height) barButtonAction:barButtonAction];
}

/**
 *  创建一个itembutton 带frame
 *
 *  @param imageName       图片名字
 *  @param hlImageName     图片高亮名字
 *  @param frame           frame
 *  @param barButtonAction 按钮点击事件
 *
 *  @return buttonitem
 */
+ (ALCustomBarButtonItem *)CreateBarButtonItemWithImageName:(NSString *)imageName hlImageName:(NSString *)hlImageName Frame:(CGRect)frame barButtonAction:(BarButtonItemClickAction)barButtonAction {
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:frame];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:hlImageName] forState:UIControlStateHighlighted];
    
    [button AL_handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        barButtonAction(weakSender);
    }];
    
    return [self CreateBarButtonItemWithButton:button];
}

/**
 *  创建一个itemButton 用button
 *
 *  @param button button
 *
 *  @return buttonitem
 */
+ (ALCustomBarButtonItem *)CreateBarButtonItemWithButton:(UIButton *)button {
    return [[self alloc]initWithCustomView:button];
}
@end
