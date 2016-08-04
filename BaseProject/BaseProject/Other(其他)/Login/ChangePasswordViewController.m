//
//  ChangePasswordViewController.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()
@property (nonatomic,weak)IBOutlet UITextField *oldPasswordTextFiled;
@property (nonatomic,weak)IBOutlet UITextField *nePasswordTextFiled;
@property (nonatomic,weak)IBOutlet UITextField *sePasswordTextFiled;
@end

@implementation ChangePasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

//确认
- (IBAction)SureAction:(UIButton *)sender {
    
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
