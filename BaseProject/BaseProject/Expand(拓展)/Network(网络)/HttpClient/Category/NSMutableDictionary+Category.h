//
//  NSMutableDictionary+Category.h
//  AFNWorking
//
//  Created by admin on 16/7/19.
//  Copyright © 2016年 along. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Category.h"

@interface NSMutableDictionary (NSMutableDictionary_Category)
/**
 *  添加非空字符串
 *
 *  @param date 字符串
 *  @param key  关键字
 */
- (void)addUnEmptyString:(NSString *)stringObject forKey:(NSString *)key;

@end
