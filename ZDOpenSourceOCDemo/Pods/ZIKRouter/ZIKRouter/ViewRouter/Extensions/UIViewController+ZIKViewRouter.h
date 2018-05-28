//
//  UIViewController+ZIKViewRouter.h
//  ZIKRouter
//
//  Created by zuik on 2017/5/31.
//  Copyright © 2017 zuik. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <UIKit/UIKit.h>
#import "ZIKViewRouter.h"

NS_ASSUME_NONNULL_BEGIN

@class ZIKPresentationState;

@interface UIViewController (ZIKViewRouter)

/**
 Check UIViewController is routed or not, then determine a UIViewController is first appear or is removing. This property is for all UIViewController.  The implementation is in ZIKViewRouter.
 @discussion
 If a UIViewController is first appear, zix_routed will be NO in -viewWillAppear: and -viewDidAppear: (before [super viewDidAppear:], after [super viewDidAppear:], it's YES). If a UIViewController is removing, zix_routed will be NO in -viewDidDisappear:. When a UIViewController is displaying (even invisible), that means it's routed, zix_routed is YES.
 
 @return If the UIViewController is already routed, return YES, otherwise return NO.
 */
@property (nonatomic, readonly) BOOL zix_routed;

/**
 Check UIViewController is removing or not. This property is for all UIViewController.  The implementation is in ZIKViewRouter.
 @discussion
 If a UIViewController is removing, zix_removing will be YES in -viewWillDisappear: and -viewDidDisappear: (before [super viewDidDisappear:], after [super viewDidDisappear:], it's NO). A removing may be cancelled, such as user swipes to pop view controller from navigation stack but the swiping gesture is cancelled.
 
 @return If the UIViewController is removing, return YES, otherwise return NO.
 */
@property (nonatomic, readonly) BOOL zix_removing;
@property (nonatomic, readonly) BOOL zix_isAppRootViewController;
@property (nonatomic, readonly) BOOL zix_isRootViewControllerInContainer;
- (ZIKPresentationState *)zix_presentationState;
@end

NS_ASSUME_NONNULL_END
