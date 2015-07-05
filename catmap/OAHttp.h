//
//  OAHttp.h
//  catmap
//
//  Created by OA Wu on 2015/7/5.
//  Copyright (c) 2015年 OA Wu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OAHttp : NSObject

- (NSString *)urlencode:(NSString *)input;
- (NSString *)getMimeType:(NSData *)data;
- (NSString *)httpAttributeEncode:(NSString *)input attributeName:(NSString *)attributeName;

/*
 OAHttp *http = [OAHttp new];
 
 NSMutableDictionary *vars = [NSMutableDictionary new];
 [vars setObject:[[NSUUID UUID] UUIDString] forKey:@"title"];
 
 [http getURL:@"url" vars:vars completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
 NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
 NSLog(@"%@", result);
 }];
 */
- (void)getURL:(NSString *)urlStr vars:(NSDictionary *)vars completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler;

/*
 OAHttp *http = [OAHttp new];
 
 NSMutableDictionary *vars = [NSMutableDictionary new];
 [vars setObject:[[NSUUID UUID] UUIDString] forKey:@"title"];
 
 [http postURL:@"url" vars:vars completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
 NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
 NSLog(@"%@", result);
 }];
 */
- (void)postURL:(NSString *)urlStr vars:(NSDictionary *)vars completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler;

/*
 OAHttp *http = [OAHttp new];
 
 NSMutableDictionary *vars = [NSMutableDictionary new];
 [vars setObject:[[NSUUID UUID] UUIDString] forKey:@"title"];
 [vars setObject:[NSData dataWithContentsOfFile:[NSHomeDirectory() stringByAppendingString:@"/Documents/.../xxx.jpg"]] forKey:@"name"];
 
 [http postMulti:@"url" vars:vars completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
 NSMutableDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
 NSLog(@"%@", result);
 }];
 */
- (void)postMulti:(NSString *)urlStr vars:(NSDictionary *)vars completionHandler:(void (^)(NSURLResponse* response, NSData* data, NSError* connectionError)) handler;

@end
