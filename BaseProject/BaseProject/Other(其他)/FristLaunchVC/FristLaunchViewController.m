//
//  FristLaunchViewController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "FristLaunchViewController.h"

@interface FristLaunchViewController ()
@property (nonatomic,strong)NSArray *loadImageArray;
@end

@implementation FristLaunchViewController

- (instancetype)initWithLoadImageArray:(NSArray *)loadImageArray {
    if(self = [super init]) {
        self.loadImageArray = [loadImageArray copy];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView *scrollView = [[UIScrollView alloc]init];
        
    [scrollView setPagingEnabled:YES];
    
    [scrollView setBackgroundColor:[UIColor whiteColor]];
    
    [scrollView setFrame:CGRectMake(0, 0, [UIScreen AL_width], [UIScreen AL_height])];
    
    for(int i = 0;i < [_loadImageArray count]; i++) {
        UIImageView *imgV = [[UIImageView alloc]init];
        [imgV setFrame:CGRectMake(i * [UIScreen AL_width], 0, [UIScreen AL_width], [UIScreen AL_height])];
        [imgV setImage:[UIImage AL_imageWithBundleName:[_loadImageArray objectAtIndex:i]]];
        [scrollView addSubview:imgV];
        
        if(i == [_loadImageArray count] - 1) {
            UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [pushButton setFrame:CGRectMake(0, 0, 200, 40)];
            [pushButton setBackgroundColor:[UIColor redColor]];
            [scrollView addSubview:pushButton];
            
            [pushButton AL_handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
                
            }];
            
        }
        
    }
    
    [scrollView setContentSize:CGSizeMake([_loadImageArray count] * [UIScreen AL_width], 0)];
    
    [self.view addSubview:scrollView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
