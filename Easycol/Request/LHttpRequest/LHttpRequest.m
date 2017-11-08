//
//  LHttpRequest.m
//  Afnetwork
//
//  Created by xiang on 16/5/2.
//  Copyright © 2016年 xiang. All rights reserved.
//

#import "LHttpRequest.h"
#import "AFHTTPSessionManager.h"
#import "LHttpConfig.h"
#import "NSObject+HXAddtions.h"
#import <netdb.h>
#import <SystemConfiguration/SystemConfiguration.h>

static NSString *g_serverUrl = kServerUrl;

@implementation LHttpRequest

+ (void)setUrl:(NSString *)url {
    if ([url hasPrefix:@"http"]) {
        g_serverUrl = url;
    }
}

+ (NSString *)url {
    return g_serverUrl;
}

+ (void)getHttpRequest:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    NSString *requestURL;
    if (path.length > 0) {
        requestURL = [NSString stringWithFormat:@"%@%@", g_serverUrl, path];
    } else {
        requestURL = [NSString stringWithFormat:@"%@", g_serverUrl];
    }
    if ([path containsString:@"itunes.apple.com"]) {
        requestURL = path;
    }
    
    [LHttpRequest get:requestURL parameters:parameters success:success failure:failure];
}

+ (void)postHttpRequest:(NSString *)path parameters:(NSDictionary *)parameters success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    NSString *requestURL;
    if (path.length > 0) {
        requestURL = [NSString stringWithFormat:@"%@%@", g_serverUrl, path];
    } else {
        requestURL = [NSString stringWithFormat:@"%@", g_serverUrl];
    }
    if ([path containsString:@"itunes.apple.com"]) {
        requestURL = path;
    }
    
    [LHttpRequest post:requestURL parameters:parameters success:success failure:failure];
}

//上传单张图片
+ (void)uploadSingleImageRequest:(NSString *)path parameters:(NSDictionary *)parameters imgData:(NSData *)imgData progress:(void(^)(NSProgress *uploadProgress))process success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure; {
    
    if (![self connectedToNetwork]) {
        NSError *error = [NSError errorWithDomain:kErrorNoNetwork code:-101 userInfo:nil];
        if (failure) {
            failure(error);
        }
        
        return;
    }
    NSLog(@"请求网址:%@\n, 请求参数:%@", path, parameters);
    
    NSString *requestURL;
    if (path.length > 0) {
        requestURL = [NSString stringWithFormat:@"%@%@", g_serverUrl, path];
    } else {
        requestURL = [NSString stringWithFormat:@"%@", g_serverUrl];
    }
    if ([path containsString:@"itunes.apple.com"]) {
        requestURL = path;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager]; manager.requestSerializer.timeoutInterval = 20; manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"multipart/form-data"]];
    
    [manager POST:requestURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        
        NSDate *date = [NSDate date];
        NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
        [formormat setDateFormat:@"HHmmss"];
        NSString *dateString = [formormat stringFromDate:date];
        NSString *fileName = [NSString stringWithFormat:@"%@.png",dateString];
        [formData appendPartWithFileData:imgData name:@"files" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"上传进度---%@",uploadProgress);
        //上传进度
        if (process) {
            process(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        NSLog(@"上传图片返回====%@",responseObject);
        NSDictionary *datas = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"请求成功%@",datas);
        
        if (success) {
            success(datas);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

//上传多张图片
+ (void)uploadImagesRequest:(NSString *)path parameters:(NSDictionary *)parameters imgDatas:(NSArray *)imgDatas progress:(void(^)(NSProgress *uploadProgress))processs success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure {
    
    if (![self connectedToNetwork]) {
        NSError *error = [NSError errorWithDomain:kErrorNoNetwork code:-101 userInfo:nil];
        if (failure) {
            failure(error);
        }
        
        return;
    }
    NSLog(@"请求网址:%@\n, 请求参数:%@", path, parameters);
    
    NSString *requestURL;
    if (path.length > 0) {
        requestURL = [NSString stringWithFormat:@"%@%@", g_serverUrl, path];
    } else {
        requestURL = [NSString stringWithFormat:@"%@", g_serverUrl];
    }
    if ([path containsString:@"itunes.apple.com"]) {
        requestURL = path;
    }
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager]; manager.requestSerializer.timeoutInterval = 20; manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"multipart/form-data"]];
    [manager POST:requestURL parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        
        for (int i=0; i < imgDatas.count; i++) {
            
            NSDate *date = [NSDate date];
            NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
            [formormat setDateFormat:@"HHmmss"];
            NSString *dateString = [formormat stringFromDate:date];
            NSString *fileName = [NSString stringWithFormat:@"%@.png",dateString];
            NSData *imageData = imgDatas[i];
            [formData appendPartWithFileData:imageData name:@"files" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"上传多张图片进度---%@",uploadProgress);
        if (processs) {
            processs(uploadProgress);
        }
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
        NSLog(@"上传多张图片返回：%@",responseObject);
        NSDictionary *datas = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
        NSLog(@"上传多张图片请求成功%@",datas);
        if (success) {
            success(responseObject);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

+ (void)postHttpRequest:(NSString *)path parameters:(NSDictionary *)parameters data:(NSData *)data name:(NSString *)name fileName:(NSString *)fileName mimeType:(NSString *)mimeType success:(void (^)(NSDictionary *))success failure:(void (^)(NSError *))failure {
    
    if (![self connectedToNetwork]) {
        NSError *error = [NSError errorWithDomain:kErrorNoNetwork code:-101 userInfo:nil];
        if (failure) {
            failure(error);
        }
        
        return;
    }
    NSLog(@"请求网址:%@\n, 请求参数:%@", path, parameters);
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html", @"text/plain"]];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [manager POST:[NSString stringWithFormat:@"%@%@", g_serverUrl, path] parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:mimeType];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *jsonString = [NSObject jsonStringWithObject:responseObject];
        NSError *error = nil;
        id jsonObject = [NSJSONSerialization JSONObjectWithData:[jsonString dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:&error];
        if (jsonObject && !error) {
            NSDictionary *jsonDic = [NSDictionary dictionaryWithDictionary:jsonObject];
            NSInteger status = [[jsonDic objectForKey:kSuccessKey] integerValue];
            if (status != kSuccessCode) {
                NSLog(@"requestFailure:\n%@", jsonString);
                NSString *message = [jsonDic objectForKey:kMessageKey];
                error = [NSError errorWithDomain:message code:0 userInfo:nil];
                if (failure) {
                    failure(error);
                }
            } else {
                NSLog(@"requestSuccess:\n%@", jsonString);
                if (success) {
                    success(jsonDic);
                }
            }
        } else {
            //解析错误
            NSLog(@"解析错误:%@, %ld, %@", error.domain, (long)error.code, jsonString);
            NSError *error1 = [NSError errorWithDomain:error.domain code:error.code userInfo:nil];
            if (failure) {
                failure(error1);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"requestFailure:%@, %ld", error.domain, (long)error.code);
        NSError *error1 = [NSError errorWithDomain:error.domain code:error.code userInfo:nil];
        if (failure) {
            failure(error1);
        }

    }];
    
}
 

+ (void)get:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure {
    
    if (![self connectedToNetwork]) {
        NSError *error = [NSError errorWithDomain:kErrorNoNetwork code:-101 userInfo:nil];
        if (failure) {
            failure(error);
        }
        
        return;
    }
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html", @"text/plain"]];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *jsonDic = responseObject;
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:kNilOptions error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"请求网址:%@\n请求参数:%@", url, parameters);
        NSInteger status = [[jsonDic objectForKey:kSuccessKey]integerValue];
        if (status != kSuccessCode) {
            NSLog(@"请求失败:\n%@", jsonString);
            NSString *errMessage = [jsonDic objectForKey:kMessageKey];
            NSError *error = [NSError errorWithDomain:errMessage code:-101 userInfo:nil];
            if (failure) {
                failure(error);
            }
        } else {
            NSLog(@"返回数据:\n%@", jsonString);
            if (success) {
                success(jsonDic);
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *newError = [self prepareError:error];
        NSLog(@"请求网址:%@\n请求参数:%@",url, parameters);
        NSLog(@"请求失败:%@, %ld",newError.domain, (long)newError.code);
        if (failure) {
            failure(newError);
        }
    }];
    
}

+ (void)post:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSDictionary *responseDic))success failure:(void(^)(NSError *error))failure {
    
    if (![self connectedToNetwork]) {
        NSError *error = [NSError errorWithDomain:kErrorNoNetwork code:-101 userInfo:nil];
        if (failure) {
            failure(error);
        }
        
        return;
    }
    
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/html", @"text/plain"]];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [manager POST:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *jsonDic = responseObject;
        NSData *data = [NSJSONSerialization dataWithJSONObject:responseObject options:kNilOptions error:nil];
        NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSLog(@"请求网址:%@\n请求参数:%@", url, parameters);
        NSInteger status = [[jsonDic objectForKey:kSuccessKey]integerValue];
        if (status != kSuccessCode) {
            NSLog(@"请求失败:\n%@", jsonString);
            NSString *errMessage = [jsonDic objectForKey:kMessageKey];
            NSError *error = [NSError errorWithDomain:errMessage code:-101 userInfo:nil];
            if (failure) {
                failure(error);
            }
        } else {
            NSLog(@"返回数据:\n%@", jsonString);
            if (success) {
                success(jsonDic);
            }
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSError *newError = [self prepareError:error];
        NSLog(@"请求网址:%@\n请求参数:%@",url, parameters);
        NSLog(@"请求失败:%@, %ld",newError.domain, (long)newError.code);
        if (failure) {
            failure(newError);
        }
    }];
}

+ (NSError *)prepareError:(NSError *)error {
    if ((error.code <= -1001 && error.code >= -1002) || error.code == -3240 || error.code == -3840) {
        NSError *newError = [NSError errorWithDomain:kErrorNoNetwork code:error.code userInfo:nil];
        return newError;
    }
    
    return error;
}

+ (BOOL)connectedToNetwork {
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED >= 90000) || (defined(__MAC_OS_X_VERSION_MIN_REQUIRED) && __MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    struct sockaddr_in6 zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin6_len = sizeof(zeroAddress);
    zeroAddress.sin6_family = AF_INET6;
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    if (!didRetrieveFlags) {
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
#else
    struct sockaddr_in zeroAddress;
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
    SCNetworkReachabilityFlags flags;
    
    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    if (!didRetrieveFlags) {
        return NO;
    }
    
    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
    return (isReachable && !needsConnection) ? YES : NO;
#endif
    
//    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress);
//    SCNetworkReachabilityFlags flags;
//    
//    BOOL didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
//    CFRelease(defaultRouteReachability);
//    if (!didRetrieveFlags) {
//        return NO;
//    }
//    
//    BOOL isReachable = ((flags & kSCNetworkFlagsReachable) != 0);
//    BOOL needsConnection = ((flags & kSCNetworkFlagsConnectionRequired) != 0);
//    return (isReachable && !needsConnection) ? YES : NO;
}

#pragma mark - 示例
//上传单张图片
- (void)uploadSingleImage {
    UIImage *image = [UIImage imageNamed:@"3"];
    NSMutableDictionary *photo = [NSMutableDictionary dictionary];
    [photo setObject:@"123" forKey:@"phoneNumber"];
    [photo setObject:@"123" forKey:@"psw"];
    NSLog(@"1111%@",photo);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager]; manager.requestSerializer.timeoutInterval = 20; manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"multipart/form-data"]];
    [manager POST:@"http://192.168.0.105:8080/miracle/Upload.action" parameters:photo constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        NSDate *date = [NSDate date];
        NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
        [formormat setDateFormat:@"HHmmss"];
        NSString *dateString = [formormat stringFromDate:date];
        NSString *fileName = [NSString stringWithFormat:@"%@.png",dateString];
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        double scaleNum = (double)300*1024/imageData.length;
        NSLog(@"图片压缩率：%f",scaleNum);
        if(scaleNum <1) {
            imageData = UIImageJPEGRepresentation(image, scaleNum);
        } else {
            imageData = UIImageJPEGRepresentation(image, 0.1);
            
        }
        [formData appendPartWithFileData:imageData name:@"files" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
         NSLog(@"---%@",uploadProgress);
     } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) {
         NSLog(@"`````````%@",responseObject);
         NSDictionary *datas = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
          NSLog(@"请求成功%@",datas);
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         
     }];
        
}

//上传多张图片
- (void)uploadMutiImages {
    NSArray * _imageArr = @[@"1",@"2",@"3"];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager]; manager.requestSerializer.timeoutInterval = 20; manager.responseSerializer.acceptableContentTypes = [NSSet setWithArray:@[@"text/plain",@"multipart/form-data"]];
    [manager POST:@"http://192.168.0.105:8080/miracle/Upload.action" parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> _Nonnull formData) {
        for (int i=0; i<_imageArr.count; i++) {
            UIImage * image =[UIImage imageNamed:_imageArr[i]];
            NSDate *date = [NSDate date];
            NSDateFormatter *formormat = [[NSDateFormatter alloc]init];
            [formormat setDateFormat:@"HHmmss"];
            NSString *dateString = [formormat stringFromDate:date];
            NSString *fileName = [NSString stringWithFormat:@"%@.png",dateString];
            NSData *imageData = UIImageJPEGRepresentation(image, 1);
            double scaleNum = (double)300*1024/imageData.length;
            NSLog(@"图片压缩率：%f",scaleNum);
            if(scaleNum < 1) {
                imageData = UIImageJPEGRepresentation(image, scaleNum);
            } else {
                imageData = UIImageJPEGRepresentation(image, 0.1);
            }
            
            [formData appendPartWithFileData:imageData name:@"files" fileName:fileName mimeType:@"image/jpg/png/jpeg"];
        }
        
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"---%@",uploadProgress);
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id _Nullable responseObject) { NSLog(@"`````````%@",responseObject);
        NSDictionary *datas = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers | NSJSONReadingMutableLeaves error:nil];
         NSLog(@"请求成功%@",datas);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
