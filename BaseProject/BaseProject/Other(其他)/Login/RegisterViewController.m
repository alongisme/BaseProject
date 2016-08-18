//
//  RegisterViewController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (nonatomic,strong) UITextField *phoneTextFiled;
@property (nonatomic,strong) UITextField *codeTextFiled;
@property (nonatomic,strong) UIButton *codeButton;
@property (nonatomic,strong) UITextField *nikeNameTextFiled;
@property (nonatomic,strong) UITextField *passwordTextFiled;
@property (nonatomic,strong) UITextField *sePasswordTextFiled;
@property (nonatomic,strong) UIButton *registButton;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"注册用户"];
    
    //初始化子控件
    [self initWithSubviews];
}

- (void)initWithSubviews {
    _phoneTextFiled = [[UITextField alloc]init];
    [_phoneTextFiled setPlaceholder:@"请输入手机号码"];
    [self.view addSubview:_phoneTextFiled];
    
    _codeTextFiled = [[UITextField alloc]init];
    [_codeTextFiled setPlaceholder:@"请输入验证码"];
    [self.view addSubview:_codeTextFiled];
    
    _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_codeButton setTitle:@"获取验证码" forState:UIControlStateHighlighted];
    
    [_codeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_codeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [_codeButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_codeButton setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    [_codeButton addTarget:self action:@selector(GetCodeAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_codeButton];
    
    _nikeNameTextFiled = [[UITextField alloc]init];
    [_nikeNameTextFiled setPlaceholder:@"请输入昵称"];
    [self.view addSubview:_nikeNameTextFiled];
    
    _passwordTextFiled = [[UITextField alloc]init];
    [_passwordTextFiled setPlaceholder:@"请输入密码"];
    [self.view addSubview:_passwordTextFiled];
    
    _sePasswordTextFiled = [[UITextField alloc]init];
    [_sePasswordTextFiled setPlaceholder:@"请再次输入密码"];
    [self.view addSubview:_sePasswordTextFiled];
    
    _registButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_registButton setTitle:@"注 册" forState:UIControlStateNormal];
    [_registButton setTitle:@"注 册" forState:UIControlStateHighlighted];

    [_registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [_registButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_registButton setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    [_registButton addTarget:self action:@selector(RegisterAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_registButton];
}

//获取验证码
- (void)GetCodeAction:(UIButton *)sender {
    if([_phoneTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"手机码号不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if([_phoneTextFiled.text AL_checkIsPhoneNumber]) {
        [MBProgressHUD showMessag:@"手机码号不能为空！" toView:ALKeyWindow];
        return;
    }
    
    [sender AL_handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        
        [sender AL_startTime:1 title:@"获取验证码" waitTittle:@"重新获取"];
        
        [[HttpClient sharedInstance]getCodeWithPhone:_phoneTextFiled.text success:^(HttpRequest *request, HttpResponse *response) {
            [MBProgressHUD showSuccess:@"验证码发送成功！" toView:ALKeyWindow];;
        } failure:^(HttpRequest *request, HttpResponse *response) {
            [MBProgressHUD showError:response.errorMsg toView:ALKeyWindow];
        } requsetStart:nil responseEnd:nil];
        
    }];
    
}

//注册
- (void)RegisterAction:(UIButton *)sender {
    if([_phoneTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"手机码号不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if([_codeTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"验证码不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if([_nikeNameTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"昵称不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if(![_nikeNameTextFiled.text AL_checkNickNameLength]) {
        [MBProgressHUD showMessag:@"昵称过长！" toView:ALKeyWindow];
        return;
    }
    
    if([_nikeNameTextFiled.text AL_checkIsNickName]) {
        [MBProgressHUD showMessag:@"请输入正确的昵称！" toView:ALKeyWindow];
        return;
    }
    
    if([_passwordTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"密码不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if([_passwordTextFiled.text AL_checkIsPassword]) {
        [MBProgressHUD showMessag:@"密码中包含非法符号！" toView:ALKeyWindow];
        return;
    }
    
    if(![_sePasswordTextFiled.text isEqualToString:_passwordTextFiled.text]) {
        [MBProgressHUD showMessag:@"两次密码不相等！" toView:ALKeyWindow];
        return;
    }
    
    AL_WeakSelf(self);
    
    [[HttpClient sharedInstance]userRegisterWithPhone:_phoneTextFiled.text Code:_codeTextFiled.text Password:_passwordTextFiled.text NickName:_nikeNameTextFiled.text success:^(HttpRequest *request, HttpResponse *response) {
        
        [MBProgressHUD showSuccess:@"注册成功！" toView:ALKeyWindow];
        
        [weakself.navigationController popViewControllerAnimated:YES];
        
    } failure:^(HttpRequest *request, HttpResponse *response) {
        [MBProgressHUD showError:response.errorMsg toView:ALKeyWindow];
    } requsetStart:nil responseEnd:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
