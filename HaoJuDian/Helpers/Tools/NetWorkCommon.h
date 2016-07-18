//
//  NetWorkCommon.h
//  ZhuoMuNiao
//
//  Created by 123456 on 15/10/21.
//  Copyright (c) 2015年 .. All rights reserved.
//


#import <Foundation/Foundation.h>
@interface NSMutableDictionary (getParameters)
+ (instancetype)getDefaultParameters;
@end
@interface AFHTTPSessionManager (defaultURL)
- (NSURLSessionDataTask *)GETWithDefaultURL:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (NSURLSessionDataTask *)POSTWithDefaultURL:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (NSURLSessionDataTask *)POSTWithDefaultURL:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void)uploadFile:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(NSString *filePath))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;

- (void)uploadFiles:(NSArray<NSData *> *)files fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(NSString *filePath))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure;
@end
@interface NetWorkCommon : NSObject

@end
