//
//  UIViewController+ALAction.h
//  BaseProject
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 along. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol UINavigationItemActionDelegate <NSObject>

@optional
- (void)NavigationItemLeftButtonClickActionWithButton:(UIButton *)button;

@end

@interface UIViewController(UIViewController_ALAction)<UINavigationItemActionDelegate>

@end
