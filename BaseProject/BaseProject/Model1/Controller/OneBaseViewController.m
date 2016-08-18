//
//  OneBaseViewController.m
//  BaseProject
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 along. All rights reserved.
//

#import "OneBaseViewController.h"

@interface OneBaseViewController ()

@end

@implementation OneBaseViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.navigationController pushViewController:[[NSClassFromString(@"TwoBaseViewController") alloc]init] animated:YES];
        
    [self AL_ViewControllerUniversalPushWithClassString:@"TwoBaseViewController" parameters:@{@"df":self} animated:YES];
    
//    TestViewController *two = [[TestViewController alloc]init];
//       
//    [self.navigationController pushViewController:two animated:YES];
}

@end
