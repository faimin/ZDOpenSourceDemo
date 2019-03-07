//
//  LottieViewRouter.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2019/3/7.
//  Copyright © 2019 Zero.D.Saber. All rights reserved.
//

#import "LottieViewRouter.h"
#import <ZIKRouter/ZIKViewRouterInternal.h>
#import "LottieViewController.h"

DeclareRoutableView(LottieViewController, LottieViewRouter)

@implementation LottieViewRouter

+ (void)registerRoutableDestination {
    [self registerView:[LottieViewController class]];
}

- (id<ZIKRoutableView>)destinationWithConfiguration:(ZIKPerformRouteConfiguration *)configuration {
    LottieViewController *vc = [[LottieViewController alloc] init];
    return vc;
}

- (void)prepareDestination:(LottieViewController *)destination configuration:(__kindof ZIKViewRouteConfiguration *)configuration {
    
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
