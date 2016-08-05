//
//  MainNavigationController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak)id popDelegate;
@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置代理
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    [self setDelegate:self];
    
}

//- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
////    滑动返回带动画 连着navigation一起
//    if([viewController isKindOfClass:NSClassFromString(@"FiveBaseViewController")]) {
//        [viewController.navigationController setNavigationBarHidden:YES animated:YES];
//    }else {
//        [viewController.navigationController setNavigationBarHidden:NO animated:YES];
//    }
//}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //设置手势返回按钮代理对象
    if(viewController == [self.viewControllers firstObject]) {
        [self.interactivePopGestureRecognizer setDelegate:self.popDelegate];
    }else {
        [self.interactivePopGestureRecognizer setDelegate:nil];
    }
}

//每次push都会调用
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    //统一设置左边item
    if([self.viewControllers count] > 0) {
        [viewController.navigationItem setLeftBarButtonItem:[self createLeftItemWithController:viewController]];
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    [super pushViewController:viewController animated:animated];
}

//返回一个leftItem
- (UIBarButtonItem *)createLeftItemWithController:(UIViewController *)viewController {
    
    AL_WeakSelf(self);

    return [ALCustomBarButtonItem CreateBarButtonItemWithImageName:@"back_nor" hlImageName:@"back_sel" barButtonAction:^(id button) {
        
        //判断是否有控制器实现左按钮点击方法 有则调用
        if([viewController respondsToSelector:@selector(NavigationItemLeftButtonClickActionWithButton:)]) {
            [viewController NavigationItemLeftButtonClickActionWithButton:button];
        }
        
        [weakself popViewControllerAnimated:YES];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
