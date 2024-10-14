//
//  DoraemonDemoURLProtocol1.m
//  DoraemonKitDemo
//
//  Created by didi on 2020/3/19.
//  Copyright © 2020 yixiang. All rights reserved.
//

#import "DoraemonDemoURLProtocol1.h"
#import "DoraemonUrlUtil.h"
#import "DoraemonNetFlowManager.h"

static NSString * const kDoraemonDemoUrlProtocolKey = @"doraemon_demo_url_protocol_1_key";

@interface DoraemonDemoURLProtocol1()

@property (nonatomic, strong) NSURLConnection *connection;

@end

@implementation DoraemonDemoURLProtocol1

+ (BOOL)canInitWithTask:(NSURLSessionTask *)task {
    NSURLRequest *request = task.currentRequest;
    NSLog(@"11111 == canInitWithTask");
    return request == nil ? NO : [self canInitWithRequest:request];
}

+ (BOOL)canInitWithRequest:(NSURLRequest *)request{
    if ([NSURLProtocol propertyForKey:kDoraemonDemoUrlProtocolKey inRequest:request]) {
        return NO;
    }
    NSLog(@"11111 == canInitWithRequest");
    return YES;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request{
    NSMutableURLRequest *mutableReqeust = [request mutableCopy];
    [NSURLProtocol setProperty:@YES forKey:kDoraemonDemoUrlProtocolKey inRequest:mutableReqeust];
    NSLog(@"11111 == canonicalRequestForRequest");
    return [mutableReqeust copy];
}

- (void)startLoading{
    NSMutableURLRequest *mutableReqeust = [[self request] mutableCopy];
    NSLog(@"11111 == startLoading");
    self.connection = [NSURLConnection connectionWithRequest:mutableReqeust delegate:self];
}

- (void)stopLoading{
    NSLog(@"11111 == stopLoading");
    [[DoraemonNetFlowManager shareInstance] httpBodyFromRequest:self.request bodyCallBack:^(NSData *httpBody) {
        NSString* requestBody = [DoraemonUrlUtil convertJsonFromData:httpBody];
        NSLog(@"11111 == requestBody = %@",requestBody);
        [self.connection cancel];
    }];
}



#pragma mark - NSURLSessionDelegate
- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    NSLog(@"11111 == didReceiveResponse");
    [self.client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"11111 == didReceiveData");
    [self.client URLProtocol:self didLoadData:data];
}

- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"11111 == connectionDidFinishLoading");
    [self.client URLProtocolDidFinishLoading:self];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"11111 == didFailWithError");
    [self.client URLProtocol:self didFailWithError:error];
}

@end
