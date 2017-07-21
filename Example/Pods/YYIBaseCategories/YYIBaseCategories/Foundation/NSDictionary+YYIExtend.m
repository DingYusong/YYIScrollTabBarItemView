//
//  NSDictionary+YYIExtend.m
//  Pods
//
//  Created by 丁玉松 on 2017/7/21.
//
//

#import "NSDictionary+YYIExtend.h"

@implementation NSDictionary (YYIExtend)

@end

@implementation NSDictionary (YYISafe)

- (id)safeObjectForKey:(id)key
{
    id r = [self objectForKey:key];
    if (r == [NSNull null]) {
        return nil;
    }
    return r;
}

@end
