//
//  LoginViewController.m
//  BaseProject
//
//  Created by admin on 16/8/2.
//  Copyright © 2016年 along. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (nonatomic,strong) UITextField *phoneTextFiled;

@property (nonatomic,strong) UITextField *passwordTextFiled;

@property (nonatomic,strong) UIButton *loginButton;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化子控件
    [self initWithSubviews];
}

- (void)initWithSubviews {
    _phoneTextFiled = [[UITextField alloc]init];
    [_phoneTextFiled setPlaceholder:@"请输入手机号码"];
    [self.view addSubview:_phoneTextFiled];
    
    _passwordTextFiled = [[UITextField alloc]init];
    [_passwordTextFiled setPlaceholder:@"请输入密码"];
    [self.view addSubview:_passwordTextFiled];
    
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_loginButton setTitle:@"注 册" forState:UIControlStateNormal];
    [_loginButton setTitle:@"注 册" forState:UIControlStateHighlighted];
    
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [_loginButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_loginButton setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    [_loginButton addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_loginButton];
}


- (void)LoginAction:(UIButton *)sender {
    
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
