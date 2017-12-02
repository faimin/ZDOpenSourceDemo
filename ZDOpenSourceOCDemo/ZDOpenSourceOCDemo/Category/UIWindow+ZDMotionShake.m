//
//  UIWindow+ZDMotionShake.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/11/30.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "UIWindow+ZDMotionShake.h"
#import <RSSwizzle/RSSwizzle.h>
#import <FLEX/FLEX.h>

@implementation UIWindow (ZDMotionShake)

#if DEBUG

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static const void *ZDMotionShakeKey = &ZDMotionShakeKey;
        SEL selector = @selector(motionBegan:withEvent:);
        /*
        [RSSwizzle swizzleInstanceMethod:selector inClass:[UIWindow class] newImpFactory:^id(RSSwizzleInfo *swizzleInfo) {
            return ^void(__unsafe_unretained id self, UIEventSubtype motion, UIEvent *event) {
                NSLog(@"SwizzleMehod: %@", NSStringFromSelector(selector));
         
                [target zd_motionBegan:motion withEvent:event];
         
                void (*originalIMP)(__unsafe_unretained id, SEL);
                originalIMP = (__typeof__(originalIMP))[swizzleInfo getOriginalImplementation];
                originalIMP(self, selector);
            };
        } mode:RSSwizzleModeOncePerClassAndSuperclasses key:ZDMotionShakeKey];
         */
        RSSwizzleInstanceMethod([UIWindow class], selector, RSSWReturnType(void), RSSWArguments(UIEventSubtype motion, UIEvent *event), RSSWReplacement({
            NSLog(@"SwizzleMehod: %@", NSStringFromSelector(selector));
            RSSWCallOriginal(motion, event);
            [self zd_motionBegan:motion withEvent:event];
        }), RSSwizzleModeOncePerClassAndSuperclasses, ZDMotionShakeKey);
    });
}

- (void)zd_motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        [[FLEXManager sharedManager] showExplorer];
    }
}

#endif

@end
