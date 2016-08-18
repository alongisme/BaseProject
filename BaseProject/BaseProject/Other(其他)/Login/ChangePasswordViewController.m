//
//  ChangePasswordViewController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()
@property (nonatomic,strong) UITextField *oldPasswordTextFiled;
@property (nonatomic,strong) UITextField *nePasswordTextFiled;
@property (nonatomic,strong) UITextField *sePasswordTextFiled;
@property (nonatomic,strong) UIButton *sureButton;
@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setTitle:@"修改密码"];
    
    //初始化子控件
    [self initWithSubviews];
}

- (void)initWithSubviews {
    _oldPasswordTextFiled = [[UITextField alloc]init];
    [_oldPasswordTextFiled setPlaceholder:@"请输入旧密码"];
    [self.view addSubview:_oldPasswordTextFiled];
    
    _nePasswordTextFiled = [[UITextField alloc]init];
    [_nePasswordTextFiled setPlaceholder:@"请输入新密码"];
    [self.view addSubview:_nePasswordTextFiled];
    
    _sePasswordTextFiled = [[UITextField alloc]init];
    [_sePasswordTextFiled setPlaceholder:@"请再次输入新密码"];
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

//确认
- (void)SureAction:(UIButton *)sender {
    
    if([_oldPasswordTextFiled.text AL_checkIsStringEmpty]) {
        [MBProgressHUD showMessag:@"旧密码不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if([_nePasswordTextFiled.text AL_checkIsPassword]) {
        [MBProgressHUD showMessag:@"新密码不能为空！" toView:ALKeyWindow];
        return;
    }
    
    if(![_nePasswordTextFiled.text isEqualToString:_sePasswordTextFiled.text]) {
        [MBProgressHUD showMessag:@"两次密码不相等！" toView:ALKeyWindow];
        return;
    }
    
    AL_WeakSelf(self);
    
    [[HttpClient sharedInstance]changePasswordWithUserId:nil OldPassword:_oldPasswordTextFiled.text NewPassword:_nePasswordTextFiled.text success:^(HttpRequest *request, HttpResponse *response) {
        
        [MBProgressHUD showSuccess:@"密码修改成功！" toView:ALKeyWindow];
        
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
