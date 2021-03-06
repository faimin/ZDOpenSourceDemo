//
//  YogaKitViewRouter.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2019/3/7.
//  Copyright © 2019 Zero.D.Saber. All rights reserved.
//

#import "YogaKitViewRouter.h"
#import <ZIKRouter/ZIKViewRouterInternal.h>
#import "YogaKitViewController.h"

DeclareRoutableView(YogaKitViewController, YogaKitViewRouter)

@implementation YogaKitViewRouter

+ (void)registerRoutableDestination {
    [self registerView:[YogaKitViewController class]];
}

- (id<ZIKRoutableView>)destinationWithConfiguration:(ZIKPerformRouteConfiguration *)configuration {
    YogaKitViewController *vc = [[YogaKitViewController alloc] init];
    return vc;
}

- (void)prepareDestination:(id)destination configuration:(__kindof ZIKViewRouteConfiguration *)configuration {
    
}

- (void)didFinishPrepareDestination:(id)destination configuration:(__kindof ZIKViewRouteConfiguration *)configuration {
    
}

+ (void)router:(nullable ZIKViewRouter *)router willPerformRouteOnDestination:(id)destination fromSource:(id)source {
    NSLog(@"\n----------------------\nrouter: (%@),\n\
          ➡️ will\n\
          perform route\n\
          from source: (%@),\n\
          destination: (%@),\n----------------------",router, source, destination);
}

+ (void)router:(nullable ZIKViewRouter *)router didPerformRouteOnDestination:(id)destination fromSource:(id)source {
    NSLog(@"\n----------------------\nrouter: (%@),\n\
          ✅ did\n\
          perform route\n\
          from source: (%@),\n\
          destination: (%@),\n----------------------",router, source, destination);
}

+ (void)router:(nullable ZIKViewRouter *)router willRemoveRouteOnDestination:(id)destination fromSource:(id)source {
    NSLog(@"\n----------------------\nrouter: (%@),\n\
          ⬅️ will\n\
          remove route\n\
          from source: (%@),\n\
          destination: (%@),\n----------------------",router, source, destination);
}

+ (void)router:(nullable ZIKViewRouter *)router didRemoveRouteOnDestination:(id)destination fromSource:(id)source {
    NSLog(@"\n----------------------\nrouter: (%@),\n\
          ❎ did\n\
          remove route\n\
          from source: (%@),\n\
          destination: (%@),\n----------------------",router, source, destination);
}

@end
