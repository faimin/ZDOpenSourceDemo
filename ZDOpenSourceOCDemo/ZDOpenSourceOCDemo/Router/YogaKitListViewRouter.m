//
//  YogaKitListViewRouter.m
//  ZDOpenSourceOCDemo
//
//  Created by Zero.D.Saber on 2019/3/7.
//  Copyright © 2019 Zero.D.Saber. All rights reserved.
//

#import "YogaKitListViewRouter.h"
#import <ZIKRouter/ZIKViewRouterInternal.h>
#import "YogaKitListViewController.h"

DeclareRoutableView(YogaKitListViewController, YogaListViewRouter)

@implementation YogaKitListViewRouter

+ (void)registerRoutableDestination {
    [self registerView:[YogaKitListViewController class]];
}

- (id<ZIKRoutableView>)destinationWithConfiguration:(ZIKPerformRouteConfiguration *)configuration {
    YogaKitListViewController *vc = [[YogaKitListViewController alloc] init];
    return vc;
}

- (void)prepareDestination:(YogaKitListViewController *)destination configuration:(__kindof ZIKViewRouteConfiguration *)configuration {
    
}

- (void)didFinishPrepareDestination:(YogaKitListViewController *)destination configuration:(__kindof ZIKViewRouteConfiguration *)configuration {
    
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