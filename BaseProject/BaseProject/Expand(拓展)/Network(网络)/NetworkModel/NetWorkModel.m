//
//  NetWorkModel.m
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import "NetWorkModel.h"

//保存用户信息的Key
#define Default_UserInfoKey @"Default_UserInfoKey"

@implementation UserInfoModel
/**
 *  保存用户信息
 */
- (void)saveLocal {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:Default_UserInfoKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

/**
 *  获取保存的数据
 */
+ (UserInfoModel *)getDataFromLocal {
    id data = [[NSUserDefaults standardUserDefaults] objectForKey:Default_UserInfoKey];
    
    if(data) {
        id model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        if(model) {
            if([model isKindOfClass:[UserInfoModel class]]) {
                return (UserInfoModel *)model;
            }
        }
    }
    return nil;
}

/**
 *  清除用户信息
 */
+ (void)clearData {
    [[NSUserDefaults standardUserDefaults] setObject:nil forKey:Default_UserInfoKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
@end
