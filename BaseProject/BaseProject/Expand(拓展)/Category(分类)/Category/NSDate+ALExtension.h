//
//  NSDate+Extension.h
//
//  Created by Jakey on 15/4/25.
//  Copyright (c) 2015年 www.skyfox.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ALExtension)
#pragma mark 获取日 月 年 时 分 秒
/**
*  获取日
*
*  @return 日
*/
- (NSUInteger)AL_day;
/**
 *  获取月
 *
 *  @return 月
 */
- (NSUInteger)AL_month;
/**
 *  获取年
 *
 *  @return 年
 */
- (NSUInteger)AL_year;
/**
 *  获取时
 *
 *  @return 时
 */
- (NSUInteger)AL_hour;
/**
 *  获取分
 *
 *  @return 分
 */
- (NSUInteger)AL_minute;
/**
 *  获取秒
 *
 *  @return 秒
 */
- (NSUInteger)AL_second;
/**
 *  获取日
 *
 *  @return 日
 */
+ (NSUInteger)AL_day:(NSDate *)date;
/**
 *  获取月
 *
 *  @return 月
 */
+ (NSUInteger)AL_month:(NSDate *)date;
/**
 *  获取年
 *
 *  @return 年
 */
+ (NSUInteger)AL_year:(NSDate *)date;
/**
 *  获取时
 *
 *  @return 时
 */
+ (NSUInteger)AL_hour:(NSDate *)date;
/**
 *  获取分
 *
 *  @return 分
 */
+ (NSUInteger)AL_minute:(NSDate *)date;
/**
 *  获取秒
 *
 *  @return 秒
 */
+ (NSUInteger)AL_second:(NSDate *)date;

#pragma mark 获取一年中的总天数
/**
 * 获取一年中的总天数
 */
- (NSUInteger)AL_daysInYear;
/**
 * 获取一年中的总天数
 */
+ (NSUInteger)AL_daysInYear:(NSDate *)date;

#pragma mark 是否是闰年
/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
- (BOOL)AL_isLeapYear;
/**
 * 判断是否是润年
 * @return YES表示润年，NO表示平年
 */
+ (BOOL)AL_isLeapYear:(NSDate *)date;
#pragma mark 获取该日期是该年的第几周
/**
 * 获取该日期是该年的第几周
 */
- (NSUInteger)AL_weekOfYear;
/**
 * 获取该日期是该年的第几周
 */
+ (NSUInteger)AL_weekOfYear:(NSDate *)date;

#pragma mark 日期格式化
/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
- (NSString *)AL_formatYMD;
/**
 * 获取格式化为YYYY-MM-dd格式的日期字符串
 */
+ (NSString *)AL_formatYMD:(NSDate *)date;

#pragma mark 返回当前月一共有几周
/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
- (NSUInteger)AL_weeksOfMonth;
/**
 * 返回当前月一共有几周(可能为4,5,6)
 */
+ (NSUInteger)AL_weeksOfMonth:(NSDate *)date;

#pragma mark 获取该月的第一天的日期 获取该月的最后一天的日期
/**
 * 获取该月的第一天的日期
 */
- (NSDate *)AL_begindayOfMonth;
/**
 * 获取该月的第一天的日期
 */
+ (NSDate *)AL_begindayOfMonth:(NSDate *)date;

/**
 * 获取该月的最后一天的日期
 */
- (NSDate *)AL_lastdayOfMonth;
/**
 * 获取该月的最后一天的日期
 */
+ (NSDate *)AL_lastdayOfMonth:(NSDate *)date;
#pragma mark 返回 day month year hours 后的日期 
/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)AL_dateAfterDay:(NSUInteger)day;
/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
+ (NSDate *)AL_dateAfterDate:(NSDate *)date day:(NSInteger)day;

/**
 * 返回month月后的日期(若day为负数,则为|day|天前的日期)
 */
- (NSDate *)AL_dateAfterMonth:(NSUInteger)month;
/**
 * 返回day天后的日期(若day为负数,则为|day|天前的日期)
 */
+ (NSDate *)AL_dateAfterDate:(NSDate *)date month:(NSInteger)month;

/**
 * 返回numYears年后的日期
 */
- (NSDate *)AL_offsetYears:(int)numYears;
/**
 * 返回numYears年后的日期
 */
+ (NSDate *)AL_offsetYears:(int)numYears fromDate:(NSDate *)fromDate;

/**
 * 返回numMonths月后的日期
 */
- (NSDate *)AL_offsetMonths:(int)numMonths;
/**
 * 返回numMonths月后的日期
 */
+ (NSDate *)AL_offsetMonths:(int)numMonths fromDate:(NSDate *)fromDate;

/**
 * 返回numDays天后的日期
 */
- (NSDate *)AL_offsetDays:(int)numDays;
/**
 * 返回numDays天后的日期
 */
+ (NSDate *)AL_offsetDays:(int)numDays fromDate:(NSDate *)fromDate;

/**
 * 返回numHours小时后的日期
 */
- (NSDate *)AL_offsetHours:(int)hours;
/**
 * 返回numHours小时后的日期
 */
+ (NSDate *)AL_offsetHours:(int)numHours fromDate:(NSDate *)fromDate;
#pragma mark距离该日期几天
/**
 * 距离该日期前几天
 */
- (NSUInteger)AL_daysAgo;
/**
 * 距离该日期前几天
 */
+ (NSUInteger)AL_daysAgo:(NSDate *)date;
#pragma mark 获取星期几
/**
 *  获取星期几
 *
 *  @return Return weekday number
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
/**
 *   获取星期几
 *
 *  @return weekday number
 */
- (NSInteger)AL_weekday;
/**
 *   获取星期几
 *
 *  @return weekday number
 */
+ (NSInteger)AL_weekday:(NSDate *)date;

/**
 *  获取星期几(名称)
 *
 *  @return Return weekday as a localized string
 *  [1 - Sunday]
 *  [2 - Monday]
 *  [3 - Tuerday]
 *  [4 - Wednesday]
 *  [5 - Thursday]
 *  [6 - Friday]
 *  [7 - Saturday]
 */
/**
 *   获取星期几
 *
 *  @return localized string
 */
- (NSString *)AL_dayFromWeekday;

/**
 *   获取星期几
 *
 *  @return localized string
 */
+ (NSString *)AL_dayFromWeekday:(NSDate *)date;
#pragma mark 日期是否相等
/**
 *  日期是否相等
 *
 *  @param anotherDate The another date to compare as NSDate
 *  @return Return YES if is same day, NO if not
 */
- (BOOL)AL_isSameDay:(NSDate *)anotherDate;
#pragma mark 是否是今天
/**
 *  是否是今天
 *
 *  @return Return if self is today
 */
- (BOOL)AL_isToday;
#pragma mark 添加天数
/**
 *  Add days to self
 *
 *  @param days The number of days to add
 *  @return Return self by adding the gived days number
 */
- (NSDate *)AL_dateByAddingDays:(NSUInteger)days;

/**
 *  Get the month as a localized string from the given month number 从给定月份号获取一个本地化字符串的月份
 *
 *  @param month The month to be converted in string
 *  [1 - January]
 *  [2 - February]
 *  [3 - March]
 *  [4 - April]
 *  [5 - May]
 *  [6 - June]
 *  [7 - July]
 *  [8 - August]
 *  [9 - September]
 *  [10 - October]
 *  [11 - November]
 *  [12 - December]
 *
 *  @return Return the given month as a localized string
 */
+ (NSString *)AL_monthWithMonthNumber:(NSInteger)month;

#pragma mark 根据日期返回字符串
/**
 *  根据日期返回字符串
 *
 *  @param date   date
 *  @param format format string
 *
 *  @return nsstring
 */
+ (NSString *)AL_stringWithDate:(NSDate *)date format:(NSString *)format;
/**
 *  根据日期返回字符串
 *
 *  @param format format string
 *
 *  @return nsstring
 */
- (NSString *)AL_stringWithFormat:(NSString *)format;
/**
 *  根据日期返回字符串
 *
 *  @param string string
 *  @param format format
 *
 *  @return nsdate
 */
+ (NSDate *)AL_dateWithString:(NSString *)string format:(NSString *)format;

#pragma mark 获取指定月份的天数
/**
 *  获取指定月份的天数
 *
 *  @param month month
 *
 *  @return number
 */
- (NSUInteger)AL_daysInMonth:(NSUInteger)month;
/**
 *  获取指定月份的天数
 *
 *  @param date  date
 *  @param month month
 *
 *  @return number
 */
+ (NSUInteger)AL_daysInMonth:(NSDate *)date month:(NSUInteger)month;

#pragma mark 获取当前月份的天数
/**
 *  获取当前月份的天数
 *
 *  @return number
 */
- (NSUInteger)AL_daysInMonth;
/**
 *  获取当前月份的天数
 *
 *  @return number
 */
+ (NSUInteger)AL_daysInMonth:(NSDate *)date;

#pragma mark 返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
/**
 *  返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 *
 *  @return x时间前
 */
- (NSString *)AL_timeInfo;
/**
 *  返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 *
 *  @param date 相对的时间
 *
 *  @return x时间前
 */
+ (NSString *)AL_timeInfoWithDate:(NSDate *)date;
/**
 *  返回x分钟前/x小时前/昨天/x天前/x个月前/x年前
 *
 *  @param dateString 相对的时间字符串
 *
 *  @return x时间前
 */
+ (NSString *)AL_timeInfoWithDateString:(NSString *)dateString;

#pragma mark 分别获取yyyy-MM-dd/HH:mm:ss/yyyy-MM-dd HH:mm:ss格式的字符串
/**
 *  yyyy-MM-dd
 *
 *  @return string
 */
- (NSString *)AL_ymdFormat;
/**
 *  HH:mm:ss
 *
 *  @return string
 */
- (NSString *)AL_hmsFormat;
/**
 *  yyyy-MM-dd HH:mm:ss
 *
 *  @return string
 */
- (NSString *)AL_ymdHmsFormat;
/**
 *  yyyy-MM-dd
 *
 *  @return string
 */
+ (NSString *)AL_ymdFormat;
/**
 *  HH:mm:ss
 *
 *  @return string
 */
+ (NSString *)AL_hmsFormat;
/**
 *  yyyy-MM-dd HH:mm:ss
 *
 *  @return string
 */
+ (NSString *)AL_ymdHmsFormat;

@end
