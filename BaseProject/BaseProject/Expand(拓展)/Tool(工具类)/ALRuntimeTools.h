//
//  ALRuntimeTools.h
//  BaseProject
//
//  Created by admin on 16/8/11.
//  Copyright © 2016年 along. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ALRuntimeTools : NSObject

/**
 *  获取一个class
 *
 *  @param name class名字
 *
 *  @return 返回class
 */
Class AL_CreateClassWithName(NSString *name);

/**
 *  注册一个方法
 *
 *  @param name 方法名
 *
 *  @return 选择器
 */
SEL AL_RegisterSelWithName(NSString *name);

/**
 *  调用方法
 *
 *  @param obj     实例
 *  @param selName 方法名
 *
 *  @return id
 */
id AL_MsgSendWithObj(id obj,NSString *selName);

/**
 *  调用一个带参数的方法 最多6个参数
 *
 *  @param obj       实例
 *  @param selName   方法名
 *  @param paramters 参数
 *
 *  @return id
 */
id AL_MsgSendWithObjs(id obj,NSString *selName,NSArray *paramters);

/**
 *  获取所有变量名
 *
 *  @param class 实例
 *
 *  @return 数组
 */
NSArray *ALGetClassIvar(Class class);

/**
 *  获取所有属性名
 *
 *  @param class 实例
 *
 *  @return 数组
 */
NSArray *ALGetClassProperty(Class class);

/**
 *  获取所有方法名
 *
 *  @param class 实例
 *
 *  @return 数组
 */
NSArray *ALGetAllMethods(Class class);
@end
