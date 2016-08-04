//
//  ALCustomBarButtonItem.m
//  BaseProject
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 along. All rights reserved.
//

#import "ALCustomBarButtonItem.h"

@implementation ALCustomBarButtonItem
+ (ALCustomBarButtonItem *)CreateBarButtonItemWithImageName:(NSString *)imageName hlImageName:(NSString *)hlImageName barButtonAction:(BarButtonItemClickAction)barButtonAction {
    
    UIImage *image = [UIImage imageNamed:imageName];
    
    return [self CreateBarButtonItemWithImageName:imageName hlImageName:hlImageName Frame:CGRectMake(0, 0, image.size.width, image.size.height) barButtonAction:barButtonAction];
    
}

+ (ALCustomBarButtonItem *)CreateBarButtonItemWithImageName:(NSString *)imageName hlImageName:(NSString *)hlImageName Frame:(CGRect)frame barButtonAction:(BarButtonItemClickAction)barButtonAction {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:frame];
    
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:hlImageName] forState:UIControlStateHighlighted];
    
    [button AL_handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        barButtonAction(weakSender);
    }];
    
    return [[self alloc]initWithCustomView:button];
}
@end
