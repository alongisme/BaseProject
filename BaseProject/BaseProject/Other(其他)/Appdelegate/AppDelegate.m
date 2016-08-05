//
//  AppDelegate.m
//  BaseProject
//
//  Created by admin on 16/8/2.
//  Copyright © 2016年 along. All rights reserved.
//

#import "AppDelegate.h"
#import "CYLTabBarControllerConfig.h"
#import "FristLaunchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor blueColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:22],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    [[UINavigationBar appearance] setShadowImage:[UIImage new]];
    
    //判断是否第一次启动
    if([self AL_IsFristLaunchWithViewController:nil]) {
        
        //引导图
        FristLaunchViewController *fristLaunchVC = [[FristLaunchViewController alloc]initWithLoadImageArray:@[@"test",@"bg_top"]];
        
        [self.window setRootViewController:fristLaunchVC];

        
    }else {
        
        //非第一次启动进入
        
        CYLTabBarControllerConfig *tabBarControllerConfig = [[CYLTabBarControllerConfig alloc]init];
        
        [self.window setRootViewController:tabBarControllerConfig.tabBarController];
    }
        
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
