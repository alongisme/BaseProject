//
//  FiveBaseViewController.m
//  BaseProject
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 along. All rights reserved.
//

#import "FiveBaseViewController.h"

@interface FiveBaseViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation FiveBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self.tableview setDelegate:self];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.tableview setDelegate:nil];
    [self.navigationController.navigationBar AL_reset];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    UIColor * color = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:250/255.0 alpha:1];
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY > 64) {
        CGFloat alpha = MIN(1, 1 - ((64 + 64 - offsetY) / 64));
        [self.navigationController.navigationBar AL_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar AL_setBackgroundColor:[color colorWithAlphaComponent:0]];
    }

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"sd"];
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"sd"];
    cell.textLabel.text = @"test";
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[[NSClassFromString(@"TwoBaseViewController") alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
