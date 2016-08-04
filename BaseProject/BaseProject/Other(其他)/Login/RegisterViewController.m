//
//  RegisterViewController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (nonatomic,weak)IBOutlet UITextField *phoneTextFiled;
@property (nonatomic,weak)IBOutlet UITextField *codeTextFiled;
@property (nonatomic,weak)IBOutlet UITextField *nikeNameTextFiled;
@property (nonatomic,weak)IBOutlet UITextField *passwordTextFiled;
@property (nonatomic,weak)IBOutlet UITextField *sePasswordTextFiled;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//获取验证码
- (IBAction)GetCodeAction:(UIButton *)sender {
    if([_phoneTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"手机码号不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if([_phoneTextFiled.text AL_checkIsPhoneNumber]) {
        [MBProgressHUD showMessag:@"手机码号不能为空！" toView:ALKeyWindow];
        return;
    }
    
    __block UIButton *codeButton = sender;
    
    [sender AL_handleControlEvents:UIControlEventTouchUpInside withBlock:^(id weakSender) {
        
        [codeButton AL_startTime:1 title:@"获取验证码" waitTittle:@"重新获取"];
        
        [[HttpClient sharedInstance]getCodeWithPhone:_phoneTextFiled.text success:^(HttpRequest *request, HttpResponse *response) {
            [MBProgressHUD showSuccess:@"验证码发送成功！" toView:ALKeyWindow];;
        } failure:^(HttpRequest *request, HttpResponse *response) {
            [MBProgressHUD showError:response.errorMsg toView:ALKeyWindow];
        } requsetStart:nil responseEnd:nil];
        
    }];
    
}

//注册
- (IBAction)RegisterAction:(UIButton *)sender {
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
