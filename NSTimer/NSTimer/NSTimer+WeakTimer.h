//
//  NSTimer+WeakTimer.h
//  NSTimer
//
//  Created by 鞠凝玮 on 2018/8/8.
//  Copyright © 2018年 Ju. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WeakTimer)
+ (NSTimer *)weak_scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
@end
