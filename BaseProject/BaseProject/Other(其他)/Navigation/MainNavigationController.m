//
//  MainNavigationController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak) id popDelegate; //滑动手势代理
@property (nonatomic,weak) UIViewController *pushViewController;//push的控制器
@property (nonatomic,strong) NSMutableArray *leftButtons;//每个控制器的左按钮
@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];

    //设置代理
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    [self setDelegate:self];
    
    //增加一个手势监听
    [(UIScreenEdgePanGestureRecognizer *)self.interactivePopGestureRecognizer addTarget:self action:@selector(handleGesture:)];
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
        
        self.pushViewController = viewController;
        
        [viewController.navigationItem setLeftBarButtonItem:[self createLeftItem]];
        
        //push的时候隐藏bar
        [viewController setHidesBottomBarWhenPushed:YES];
        
//        设置偏移量 （UINavigationItem+ALMargin）
//        [viewController.navigationItem setAL_leftMargin:100];
//        [viewController.navigationItem setAL_rightMargin:0];
    }
    [super pushViewController:viewController animated:animated];
}

//返回一个leftItem (ALCustomBarButtonItem)
- (UIBarButtonItem *)createLeftItem {
        
    UIImage *image = [UIImage imageNamed:@"back_nor"];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    [button addTarget:self action:@selector(popButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setImage:image forState:UIControlStateNormal];
    
    [button setImage:[UIImage imageNamed:@"back_sel"] forState:UIControlStateHighlighted];
    
    //记录保存按钮
    [self.leftButtons addObject:button];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    return barButtonItem;
}

- (void)popButtonAction:(UIButton *)button {
    [self notificationSubViewControllerHandleLeftButtonAction];
}

- (void)notificationSubViewControllerHandleLeftButtonAction {
    //判断是否有控制器实现左按钮点击方法 有则调用 （UIViewController_ALAction）
    if([self.pushViewController respondsToSelector:@selector(NavigationItemLeftButtonClickActionWithButton:)]) {
        [self.pushViewController NavigationItemLeftButtonClickActionWithButton:[self.leftButtons lastObject]];
    }
    //移除最后一个元素
    [self.leftButtons removeLastObject];
    
    [self popViewControllerAnimated:YES];
}

//手势事件
- (void)handleGesture:(UIScreenEdgePanGestureRecognizer *)recognizer {
    float progress = [recognizer translationInView:self.view].x / self.view.bounds.size.width;
    if ([recognizer state] == UIGestureRecognizerStateEnded || [recognizer state] == UIGestureRecognizerStateCancelled) {
        //划过半屏幕 
        if(progress > 0.5) {
            [self notificationSubViewControllerHandleLeftButtonAction];
        }
    }
}

- (NSMutableArray *)leftButtons {
    if(_leftButtons == nil) {
        _leftButtons = [NSMutableArray array];
    }
    return _leftButtons;
}

@end
