//
//  ForgetPasswordViewController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "ForgetPasswordViewController.h"

@interface ForgetPasswordViewController ()
@property (nonatomic,strong) UITextField *phoneTextFiled;
@property (nonatomic,strong) UITextField *codeTextFiled;
@property (nonatomic,strong) UITextField *passwordTextFiled;
@property (nonatomic,strong) UITextField *sePasswordTextFiled;
@property (nonatomic,strong) UIButton *sureButton;
@end

@implementation ForgetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"忘记密码"];
}

- (void)initWithSubviews {
    _phoneTextFiled = [[UITextField alloc]init];
    [_phoneTextFiled setPlaceholder:@"请输入手机号码"];
    [self.view addSubview:_phoneTextFiled];
    
    _codeTextFiled = [[UITextField alloc]init];
    [_codeTextFiled setPlaceholder:@"请输入验证码"];
    [self.view addSubview:_codeTextFiled];
    
    _passwordTextFiled = [[UITextField alloc]init];
    [_passwordTextFiled setPlaceholder:@"请输入密码"];
    [self.view addSubview:_passwordTextFiled];
    
    _sePasswordTextFiled = [[UITextField alloc]init];
    [_sePasswordTextFiled setPlaceholder:@"请再次输入密码"];
    [self.view addSubview:_sePasswordTextFiled];
    
    _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_sureButton setTitle:@"确 定" forState:UIControlStateNormal];
    [_sureButton setTitle:@"确 定" forState:UIControlStateHighlighted];
    
    [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_sureButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    
    [_sureButton setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [_sureButton setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    [_sureButton addTarget:self action:@selector(SureAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_sureButton];
}

- (void)SureAction:(UIButton *)sender {
    if([_phoneTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"手机码号不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if([_codeTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"验证码不能为空！" toView:ALKeyWindow];
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
    
    [[HttpClient sharedInstance]forgetPasswordWithPhone:_phoneTextFiled.text Code:_codeTextFiled.text Password:_passwordTextFiled.text success:^(HttpRequest *request, HttpResponse *response) {
        
        [MBProgressHUD showSuccess:@"密码重设成功！" toView:ALKeyWindow];
        
        [weakself.navigationController popViewControllerAnimated:YES];
        
    } failure:^(HttpRequest *request, HttpResponse *response) {
        [MBProgressHUD showError:response.errorMsg toView:ALKeyWindow];
    } requsetStart:nil responseEnd:nil];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
