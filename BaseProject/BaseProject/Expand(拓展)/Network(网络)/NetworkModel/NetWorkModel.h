//
//  NetWorkModel.h
//  BaseProject
//
//  Created by admin on 16/8/3.
//  Copyright © 2016年 along. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JSONModel.h"

#define AL_JSONPROPERTYNONATOMICSTRONG(name) @property (nonatomic,copy)NSString<Optional> *name

//用户信息
@interface UserInfoModel : JSONModel
AL_JSONPROPERTYNONATOMICSTRONG(name);

/**
 *  保存用户信息
 */
- (void)saveLocal;

/**
 *  获取保存的数据
 */
+ (UserInfoModel *)getDataFromLocal;

/**
 *  清除用户信息
 */
+ (void)clearData;

@end
