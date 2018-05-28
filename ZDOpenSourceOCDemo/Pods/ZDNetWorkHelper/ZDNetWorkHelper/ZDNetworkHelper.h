//
//  ZDNetWorkService.h
//  RequestNetWork
//
//  Created by Zero on 14/11/21.
//  Copyright (c) 2014年 Zero.D.Saber. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>

#ifdef DEBUG
#define ZD_Log(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define ZD_Log(...) ((void)0)
#endif

typedef AFHTTPSessionManager ZDHTTPSessionManager;

typedef NS_ENUM (NSUInteger, HttpMethod) {
	HttpMethod_GET,
	HttpMethod_POST,
};
typedef NS_ENUM(NSInteger, ZDNetworkStatus) {
    ZDNetworkStatusUnknown          = -1,   ///< 未知
    ZDNetworkStatusNotReachable     = 0,    ///< 无连接
    ZDNetworkStatusWWAN             = 1,    ///< 移动网络
    ZDNetworkStatusWiFi             = 2,    ///< WiFi
};

NS_ASSUME_NONNULL_BEGIN

typedef void(^SuccessHandle)(id _Nullable responseObject);
typedef void(^FailureHandle)(NSError *_Nonnull error);
typedef void(^ProgressHandle)(NSProgress *_Nonnull progress, CGFloat progressValue);
typedef void(^CachedHandle)(id _Nullable cachedResponse);

@class AFHTTPSessionManager;
@interface ZDNetworkHelper : NSObject

@property (nonatomic,  copy, nullable) NSString *baseURLString;         ///< baseURL
@property (class, nonatomic, readonly) ZDNetworkStatus networkStatus;   ///< 网络状态
@property (class, nonatomic) BOOL hasCertificate;                       ///< 有无证书

/// @brief helper单例
/// @return 实例化后的selfClass
+ (instancetype)shareInstance;

/// 自定义配置信息
- (void)overrideConfiguration:(void(^)(ZDHTTPSessionManager *manager))configBlock;

/// @abstract GET && POST请求
///
/// @param URLString : 请求地址
/// @param params : 请求参数
/// @param httpMethod : GET/POST 请求
/// @param successBlock : 成功的回调
/// @param failureBlock : 回调block
/// @return NSURLSessionDataTask
- (nullable NSURLSessionDataTask *)requestWithURL:(NSString *)URLString
                                           params:(nullable id)params
                                       httpMethod:(HttpMethod)httpMethod
                                         progress:(nullable ProgressHandle)progressBlock
                                          success:(nullable SuccessHandle)successBlock
                                          failure:(nullable FailureHandle)failureBlock;

- (nullable NSURLSessionDataTask *)requestWithURL:(NSString *)URLString
                                           params:(nullable id)params
                                       httpMethod:(HttpMethod)httpMethod
                                   cachedResponse:(nullable CachedHandle)cachedBlock
                                         progress:(nullable ProgressHandle)progressBlock
                                          success:(SuccessHandle)successBlock
                                          failure:(FailureHandle)failureBlock;

- (nullable NSURLSessionDownloadTask *)downloadWithURL:(NSString *)urlString
                                            saveToPath:(nullable NSString *)savePath
                                              progress:(nullable ProgressHandle)progressBlock
                                               success:(SuccessHandle)successBlock // 回调的是filePath
                                               failure:(FailureHandle)failureBlock;

- (void)uploadFileWithURL:(NSString *)urlString
                 filePath:(NSString *)filePath
                 progress:(nullable ProgressHandle)progressBlock
                  success:(SuccessHandle)successBlock
                  failure:(FailureHandle)failureBlock;

/// 异步上传,回调数组中的url顺序与添加图片时的顺序一一对应
- (void)uploadDataWithURL:(NSString *)urlString
           dataDictionary:(NSDictionary *)dataDic
               completion:(void(^)(NSArray *result))completionBlock;

- (void)uploadFileWithURL:(NSString *)urlString
                filePaths:(NSArray<NSString *> *)filePaths
               completion:(void(^)(NSArray *result))completionBlock;

- (void)cancelTaskWithURL:(NSString *)urlString;

- (void)cancelAllTasks;

/// 使session无效化，并取消挂起的任务
- (void)invalidateSession;

/// 监控网络变化
+ (void)detectNetworkStatus:(void(^)(ZDNetworkStatus status))networkStatus;

@end

NS_ASSUME_NONNULL_END
