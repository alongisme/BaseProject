//
//  TwoBaseViewController.m
//  BaseProject
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 along. All rights reserved.
//

#import "TwoBaseViewController.h"


@interface TwoBaseViewController (){
    int a;
    NSString *oiuo;
    double d;
    NSArray *ppoi;
}
@property (nonatomic,strong)NSArray *aaa;
@property (nonatomic,strong)NSDictionary *asd;
@property (nonatomic,strong)NSArray *xzc;
@property (nonatomic,strong)NSNumber *ssa;
@property (nonatomic,strong)NSString *df;
@end

@implementation TwoBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor AL_randomColor]];
        
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.navigationController pushViewController:[[NSClassFromString(@"FourBseViewController") alloc]init] animated:YES];
}

@end
