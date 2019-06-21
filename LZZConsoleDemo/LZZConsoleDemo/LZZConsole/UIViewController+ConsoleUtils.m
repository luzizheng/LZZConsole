//
//  UIViewController+ConsoleUtils.m
//  LZZConsoleDemo
//
//  Created by 玩车tv on 2019/6/20.
//  Copyright © 2019 玩车tv. All rights reserved.
//

#import "UIViewController+ConsoleUtils.h"
#import "LZZConsole.h"
#import <objc/runtime.h>


@implementation UIViewController (ConsoleUtils)
+ (void)load {
    [self swizzlingMethorA];
    [self swizzlingMethorB];
}

+(void)swizzlingMethorA
{
    Method fromMethod = class_getInstanceMethod([self class], @selector(canBecomeFirstResponder));
    Method toMethod = class_getInstanceMethod([self class], @selector(swizzlingCanBecomeFirstResponder));
    if (!class_addMethod([self class], @selector(swizzlingCanBecomeFirstResponder), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}
+(void)swizzlingMethorB
{
    Method fromMethod = class_getInstanceMethod([self class], @selector(motionEnded:withEvent:));
    Method toMethod = class_getInstanceMethod([self class], @selector(swizzlingMotionEnded:withEvent:));
    if (!class_addMethod([self class], @selector(swizzlingMotionEnded:withEvent:), method_getImplementation(toMethod), method_getTypeEncoding(toMethod))) {
        method_exchangeImplementations(fromMethod, toMethod);
    }
}

-(BOOL)swizzlingCanBecomeFirstResponder
{
    if ([LZZConsole shareConsole].enable == YES) {
        return YES;
    }else{
        if ([self respondsToSelector:@selector(swizzlingCanBecomeFirstResponder)]) {
            return [self swizzlingCanBecomeFirstResponder];
        }else{
            return NO;
        }
        
    }
}

- (void)swizzlingMotionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    // 摇动结束
    [[LZZConsole shareConsole] openConsoleWindow];
}

@end
