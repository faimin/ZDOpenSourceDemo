//
//  main.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/4.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#if defined (__arm64__)
void gohook();
#endif

int main(int argc, char * argv[]) {
    @autoreleasepool {
#if defined (__arm64__)
        //gohook();
#endif
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
