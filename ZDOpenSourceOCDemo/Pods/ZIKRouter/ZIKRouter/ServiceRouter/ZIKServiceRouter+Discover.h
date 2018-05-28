//
//  ZIKServiceRouter+Discover.h
//  ZIKRouter
//
//  Created by zuik on 2018/4/8.
//  Copyright © 2018 zuik. All rights reserved.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import "ZIKServiceRouter.h"
#import "ZIKServiceRouterType.h"

NS_ASSUME_NONNULL_BEGIN

///Get service router in a type safe way. There will be complie error if the service protocol is not ZIKServiceRoutable.
#define ZIKRouterToService(ServiceProtocol) (ZIKServiceRouterType<id<ServiceProtocol>,ZIKPerformRouteConfiguration *> *)[ZIKServiceRouter<id<ServiceProtocol>,ZIKPerformRouteConfiguration *> toService](@protocol(ServiceProtocol))

///Get service router in a type safe way. There will be complie error if the module protocol is not ZIKServiceModuleRoutable.
#define ZIKRouterToServiceModule(ModuleProtocol) (ZIKServiceRouterType<id,ZIKPerformRouteConfiguration<ModuleProtocol> *> *)[ZIKServiceRouter<id,ZIKPerformRouteConfiguration<ModuleProtocol> *> toModule](@protocol(ModuleProtocol))

@interface ZIKServiceRouter<__covariant Destination: id, __covariant RouteConfig: ZIKPerformRouteConfiguration *> (Discover)

/**
 Get the router class registered with a service protocol. Always use macro `ZIKServiceRouterToService` to get router class, don't use this method directly.
 
 The parameter serviceProtocol of the block is: the protocol conformed by the service. Should be a ZIKServiceRoutable protocol when ZIKROUTER_CHECK is enabled.
 
 The return Class of the block is: a router class matched with the service. Return nil if protocol is nil or not declared. There will be an assert failure when result is nil.
 */
@property (nonatomic,class,readonly) ZIKServiceRouterType<id<ZIKServiceRoutable>, RouteConfig> * _Nullable (^toService)(Protocol *serviceProtocol) NS_SWIFT_UNAVAILABLE("Use `Router.to(RoutableService<ServiceProtocol>())` in ZRouter instead");

/**
 Get the router class combined with a custom ZIKRouteConfiguration conforming to a unique protocol. Always use `ZIKServiceRouterToModule`, don't use this method directly.
 
 The parameter configProtocol of the block is: the protocol conformed by defaultConfiguration of router. Should be a ZIKServiceModuleRoutable protocol when ZIKROUTER_CHECK is enabled.
 The return Class of the block is: a router class matched with the service. Return nil if protocol is nil or not declared. There will be an assert failure when result is nil.
 */
@property (nonatomic,class,readonly) ZIKServiceRouterType<Destination, RouteConfig> * _Nullable (^toModule)(Protocol *configProtocol) NS_SWIFT_UNAVAILABLE("Use `Router.to(RoutableServiceModule<ModuleProtocol>())` in ZRouter instead");

///Find service router registered with the unique identifier.
@property (nonatomic, class, readonly) ZIKAnyServiceRouterType * _Nullable (^toIdentifier)(NSString *identifier);

@end

NS_ASSUME_NONNULL_END
