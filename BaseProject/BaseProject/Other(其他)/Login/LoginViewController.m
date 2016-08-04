//
//  LoginViewController.m
//  BaseProject
//
//  Created by admin on 16/8/2.
//  Copyright © 2016年 along. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (nonatomic,weak)IBOutlet UITextField *phoneTextFiled;

@property (nonatomic,weak)IBOutlet UITextField *passwordTextFiled;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)LoginAction:(UIButton *)sender {
    
    if([_phoneTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"请填写手机号码！" toView:ALKeyWindow];
        return;
    }
    
    if([_passwordTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"请输入密码！" toView:ALKeyWindow];
        return;
    }

    [[HttpClient sharedInstance]userLoginWithPhone:_phoneTextFiled.text Password:_passwordTextFiled.text success:^(HttpRequest *request, HttpResponse *response) {
        
        //用户信息保存本地
        [(UserInfoModel *)response.sourceModel saveLocal];
        
    } failure:^(HttpRequest *request, HttpResponse *response) {
        [MBProgressHUD showError:response.errorMsg toView:ALKeyWindow];
    } requsetStart:nil responseEnd:nil];
}

- (IBAction)RegisterAction:(UIButton *)sender {
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
