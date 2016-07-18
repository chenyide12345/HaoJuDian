//
//  NetWorkCommon.m
//  ZhuoMuNiao
//
//  Created by 123456 on 15/10/21.
//  Copyright (c) 2015年 .. All rights reserved.
//


#import "NetWorkCommon.h"
@implementation NSMutableDictionary (getParameters)
+ (instancetype)getDefaultParameters{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
//    [param setObject:ClinetVersion forKey:@"version"];
    return param;
}
@end
@implementation AFHTTPSessionManager (defaultURL)
- (NSURLSessionDataTask *)GETWithDefaultURL:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    NSString *fullURL = [BaseURL stringByAppendingPathComponent:URLString];
    return [self GET:fullURL parameters:parameters progress:nil success:success failure:failure];
}
- (NSURLSessionDataTask *)POSTWithDefaultURL:(NSString *)URLString parameters:(id)parameters constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    NSString *fullURL = [BaseURL stringByAppendingPathComponent:URLString];
    return [self POST:fullURL parameters:parameters constructingBodyWithBlock:block progress:nil success:success failure:failure];
}
- (NSURLSessionDataTask *)POSTWithDefaultURL:(NSString *)URLString parameters:(id)parameters success:(void (^)(NSURLSessionDataTask *task, id responseObject))success failure:(void (^)(NSURLSessionDataTask *task, NSError *error))failure{
    NSString *fullURL = [BaseURL stringByAppendingPathComponent:URLString];
    return [self POST:fullURL parameters:parameters progress:nil success:success failure:failure];
}

- (void)uploadFile:(NSData *)data fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(NSString *))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    [self POSTWithDefaultURL:@"upload/appUploadFile" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:@"name" fileName:fileName mimeType:mimeType];
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        if (dic){
            NSString *path = dic[@"data"];
            success(path);
        }else{
            [SVProgressHUD showErrorWithStatus:@"上传文件失败"];
        }
    } failure:failure];
}
- (void)uploadFiles:(NSArray<NSData *> *)files fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(NSString *))success failure:(void (^)(NSURLSessionDataTask *, NSError *))failure{
    [self POSTWithDefaultURL:@"upload/appUploadFile" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        for (NSInteger i = 0; i < files.count; i++) {
            [formData appendPartWithFileData:files[i] name:[NSString stringWithFormat:@"name%ld",(long)i] fileName:fileName mimeType:mimeType];
        }
    } success:^(NSURLSessionDataTask *task, id responseObject) {
        NSDictionary *dic = (NSDictionary *)responseObject;
        if (dic){
            NSString *path = dic[@"data"];
            success(path);
        }else{
            [SVProgressHUD showErrorWithStatus:@"上传文件失败"];
        }
    } failure:failure];
}


@end
@implementation NetWorkCommon

@end
