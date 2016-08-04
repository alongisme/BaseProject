//
//  NSTimer+ALBlocks.m
//
//  Created by Jiva DeVoe on 1/14/11.
//  Copyright 2011 Random Ideas, LLC. All rights reserved.
//

#import "NSTimer+ALBlocks.h"

@implementation NSTimer (ALBlocks)
/**
 *  创建定时器  并加入到当前运行循环中，
 *
 *  @param inTimeInterval 时间
 *  @param inBlock        回调
 *  @param inRepeats      是否重复
 *
 *  @return 定时器
 */
+(id)AL_scheduledTimerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self scheduledTimerWithTimeInterval:inTimeInterval target:self selector:@selector(AL_jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}

/**
 *  创建定时器 block
 *
 *  @param inTimeInterval 时间
 *  @param inBlock        回调
 *  @param inRepeats      是否重复
 *
 *  @return 定时器
 */
+(id)AL_timerWithTimeInterval:(NSTimeInterval)inTimeInterval block:(void (^)())inBlock repeats:(BOOL)inRepeats
{
    void (^block)() = [inBlock copy];
    id ret = [self timerWithTimeInterval:inTimeInterval target:self selector:@selector(AL_jdExecuteSimpleBlock:) userInfo:block repeats:inRepeats];
    return ret;
}
/*
 //必须手动加入到当前循环中去
 NSRunLoop *runloop=[NSRunLoop currentRunLoop];
 [runloop addTimer:_timer forMode:NSDefaultRunLoopMode];
 */


+(void)AL_jdExecuteSimpleBlock:(NSTimer *)inTimer;
{
    if([inTimer userInfo])
    {
        void (^block)() = (void (^)())[inTimer userInfo];
        block();
    }
}

@end
