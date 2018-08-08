//
//  AppDelegate.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2017/8/4.
//  Copyright © 2017年 Zero.D.Saber. All rights reserved.
//

#import "AppDelegate.h"
#import <GDPerformanceView/GDPerformanceMonitor.h>
#import "ZDTraceHandler.h"
#if __has_include(<Buglife/Buglife.h>)
#import <Buglife/Buglife.h>
#endif
//#if __has_include(<SonarKit/SonarKit-umbrella.h>)
#import <SonarKitLayoutPlugin/SonarKitLayoutPlugin.h>
#import <SonarKitLayoutPlugin/SKDescriptorMapper.h>
//#endif

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    // 打开摇一摇
    application.applicationSupportsShakeToEdit = YES;
    
    [self setup];
    
    //[ZDTraceHandler traceAllClass];

    return YES;
}

- (void)setup {
    [self setupPerformanceMonitor];
    [self setupBuglife];
    [self sonar];
}

- (void)sonar {
#if DEBUG
//#if __has_include(<SonarKit/SonarKit-umbrella.h>)
    SonarClient *client = [SonarClient sharedClient];
    SKDescriptorMapper *mapper = [[SKDescriptorMapper alloc] initWithDefaults];
    [client addPlugin:[[SonarKitLayoutPlugin alloc] initWithRootNode:context.application withDescriptorMapper:mapper]]
    [client addPlugin: [SonarKitNetworkPlugin new]]
    [client start];
//#endif
#endif
}

- (void)setupPerformanceMonitor {
    // 性能监控器
    GDPerformanceMonitor.sharedInstance.appVersionHidden = YES;
    [[GDPerformanceMonitor sharedInstance] startMonitoring];
}

- (void)setupBuglife {
#if __has_include(<Buglife/Buglife.h>)
    // bugMonitor
    [[Buglife sharedBuglife] startWithEmail:@"fuxianchao2009@163.com"];
#endif
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
