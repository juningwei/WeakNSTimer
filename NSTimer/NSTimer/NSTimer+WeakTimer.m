//
//  NSTimer+WeakTimer.m
//  NSTimer
//
//  Created by 鞠凝玮 on 2018/8/8.
//  Copyright © 2018年 Ju. All rights reserved.
//

#import "NSTimer+WeakTimer.h"

@interface TimerWeakObject : NSObject
@property (nonatomic, assign)SEL selector;
@property (nonatomic, weak)NSTimer *timer;
@property (nonatomic, weak)id target;

-(void)fire:(NSTimer *)timer;
@end

@implementation TimerWeakObject
-(void)fire:(NSTimer *)timer{
    NSLog(@"%s---%@",__func__,[NSThread currentThread]);
    if (self.target) {
        [self.target performSelector:self.selector withObject:timer.userInfo];
    } else {
        
        [self.timer invalidate];
        self.timer = nil;
        CFRunLoopStop(CFRunLoopGetCurrent());
        
    }
}
@end



@implementation NSTimer (WeakTimer)
+ (NSTimer *)weak_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo{
    
    TimerWeakObject * timer = [TimerWeakObject new];
    timer.target = aTarget;
    timer.selector = aSelector;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        timer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:timer selector:@selector(fire:) userInfo:userInfo repeats:yesOrNo];
        CFRunLoopRun();
//        return timer.timer;
    });
    
    return nil;
 
    
    
}

@end
