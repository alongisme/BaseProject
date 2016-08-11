//
//  ALRuntimeTools.m
//  BaseProject
//
//  Created by admin on 16/8/11.
//  Copyright © 2016年 along. All rights reserved.
//

#import "ALRuntimeTools.h"
#import <objc/runtime.h>
#import <objc/message.h>

@implementation ALRuntimeTools
/**
 *  获取一个class
 *
 *  @param name class名字
 *
 *  @return 返回class
 */
Class AL_CreateClassWithName(NSString *name) {
    return objc_getClass([name cStringUsingEncoding:NSUTF8StringEncoding]);
}

/**
 *  注册一个方法
 *
 *  @param name 方法名
 *
 *  @return 选择器
 */
SEL AL_RegisterSelWithName(NSString *name) {
    return sel_registerName([name cStringUsingEncoding:NSUTF8StringEncoding]);
}

/**
 *  调用方法
 *
 *  @param obj     实例
 *  @param selName 方法名
 *
 *  @return id
 */
id AL_MsgSendWithObj(id obj,NSString *selName) {
    return objc_msgSend(obj,AL_RegisterSelWithName(selName));
}

/**
 *  调用一个带参数的方法 最多6个参数
 *
 *  @param obj       实例
 *  @param selName   方法名
 *  @param paramters 参数
 *
 *  @return id
 */
id AL_MsgSendWithObjs(id obj,NSString *selName,NSArray *paramters) {
    
    if(paramters && [paramters count] > 0) {
        id parater1 = [paramters count] >= 1?[paramters objectAtIndex:0]:nil;
        id parater2 = [paramters count] >= 2?[paramters objectAtIndex:1]:nil;
        id parater3 = [paramters count] >= 3?[paramters objectAtIndex:2]:nil;
        id parater4 = [paramters count] >= 4?[paramters objectAtIndex:3]:nil;
        id parater5 = [paramters count] >= 5?[paramters objectAtIndex:4]:nil;
        id parater6 = [paramters count] >= 6?[paramters objectAtIndex:5]:nil;
        
        return objc_msgSend(obj,AL_RegisterSelWithName(selName),parater1,parater2,parater3,parater4,parater5,parater6);
    }else {
        return objc_msgSend(obj,AL_RegisterSelWithName(selName));
    }
  
}

/**
 *  获取所有变量名
 *
 *  @param class 实例
 *
 *  @return 数组
 */
NSArray *ALGetClassIvar(Class class) {
    
    NSMutableArray *varArray = [NSMutableArray array];
    
    unsigned int count = 0;
    
    Ivar *ivar = class_copyIvarList(class, &count);
    
    for (unsigned int i = 0; i < count; i++) {
        Ivar var = ivar[i];
        const char *name = ivar_getName(var);
        [varArray addObject:[NSString stringWithUTF8String:name]];
    }
    free(ivar);
    
    return [varArray copy];
}

/**
 *  获取所有属性名
 *
 *  @param class 实例
 *
 *  @return 数组
 */
NSArray *ALGetClassProperty(Class class) {
    
    NSMutableArray *varArray = [NSMutableArray array];
    
    unsigned int count = 0;
    
    objc_property_t *propertys = class_copyPropertyList(class, &count);
    
    for (unsigned int i = 0; i < count; i++) {
        objc_property_t pro = propertys[i];
        const char *name = property_getName(pro);
        [varArray addObject:[NSString stringWithUTF8String:name]];
    }
    free(propertys);
    
    return [varArray copy];
}

/**
 *  获取所有方法名
 *
 *  @param class 实例
 *
 *  @return 数组
 */
NSArray *ALGetAllMethods(Class class) {
    
    NSMutableArray *varArray = [NSMutableArray array];
    
    unsigned int mothCout_f =0;
    Method* mothList_f = class_copyMethodList(class,&mothCout_f);
    for(int i=0;i<mothCout_f;i++)
    {
        Method temp_f = mothList_f[i];
//        IMP imp_f = method_getImplementation(temp_f);
//        SEL name_f = method_getName(temp_f);
        const char* name_s =sel_getName(method_getName(temp_f));
//        int arguments = method_getNumberOfArguments(temp_f);
//        const char* encoding =method_getTypeEncoding(temp_f);
//        NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],arguments,[NSString stringWithUTF8String:encoding]);
        [varArray addObject:[NSString stringWithUTF8String:name_s]];
    }
    free(mothList_f);
    
    return [varArray copy];
}
@end
