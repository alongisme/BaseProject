//
//  MainNavigationController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "MainNavigationController.h"
#import "UIViewController+ALAction.h"

@interface MainNavigationController ()<UIGestureRecognizerDelegate,UINavigationControllerDelegate>
@property (nonatomic,weak)id popDelegate;
@end

@implementation MainNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.popDelegate = self.interactivePopGestureRecognizer.delegate;
    
    [self setDelegate:self];
        
    [self setUpNavigationBarAppearance];
    
}

- (void)setUpNavigationBarAppearance {
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
//    if([viewController isKindOfClass:NSClassFromString(@"FiveBaseViewController")]) {
//        [viewController.navigationController setNavigationBarHidden:YES animated:YES];
//    }else {
//        [viewController.navigationController setNavigationBarHidden:NO animated:YES];
//    }
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if(viewController == [self.viewControllers firstObject]) {
        [self.interactivePopGestureRecognizer setDelegate:self.popDelegate];
    }else {
        [self.interactivePopGestureRecognizer setDelegate:nil];
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if([self.viewControllers count] > 0) {
        [viewController.navigationItem setLeftBarButtonItem:[self createLeftItemWithController:viewController]];
        [viewController setHidesBottomBarWhenPushed:YES];
    }
    [super pushViewController:viewController animated:animated];
}

- (UIBarButtonItem *)createLeftItemWithController:(UIViewController *)viewController {
    
    AL_WeakSelf(self);

    return [ALCustomBarButtonItem CreateBarButtonItemWithImageName:@"back_nor" hlImageName:@"back_sel" barButtonAction:^(id button) {
        
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
