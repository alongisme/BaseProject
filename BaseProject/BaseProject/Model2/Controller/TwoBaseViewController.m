//
//  TwoBaseViewController.m
//  BaseProject
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 along. All rights reserved.
//

#import "TwoBaseViewController.h"


@interface TwoBaseViewController ()

@end

@implementation TwoBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    [self.view setBackgroundColor:[UIColor AL_randomColor]];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(0, 20, 50, 50)];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button AL_handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        NSLog(@"asdasd");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[[NSClassFromString(@"FourBseViewController") alloc]init] animated:YES];
}

-(void)dealloc {
//    NSLog(@"%@",self);
    
    NSLog(@"%@",_df);
}

@end
