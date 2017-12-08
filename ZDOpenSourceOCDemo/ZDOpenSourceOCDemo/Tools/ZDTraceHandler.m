//
//  ZDTraceHandler.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/12/8.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//
//  https://github.com/johnno1962/Xtrace

#import "ZDTraceHandler.h"
#import <objc/runtime.h>
#import "Xtrace.h"
@import UIKit;

@implementation ZDTraceHandler

+ (void)traceAllClass {
    NSLog(@"ClassName Start:::::");
    unsigned int outCount;
    Class *classes = objc_copyClassList(&outCount);
    for (int i = 0; i < outCount; i++) {
        const char *className = class_getName(classes[i]);
        printf(" %s\n", className);
    }
    NSLog(@"ClassName End!!!!!!\n\n");
    
    [UIViewController xtrace];
    [UIView notrace];
    
    [Xtrace showCaller:YES];
    [Xtrace showArguments:NO];
}

@end
