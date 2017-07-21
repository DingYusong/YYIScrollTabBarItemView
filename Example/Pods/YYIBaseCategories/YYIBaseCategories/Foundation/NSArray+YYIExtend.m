//
//  NSArray+YYIExtend.m
//  Pods
//
//  Created by 丁玉松 on 2017/7/20.
//  Copyright © 2017年 Beijing Yingyan Internet Co., Ltd.. All rights reserved.
//

#import "NSArray+YYIExtend.h"

@implementation NSArray (YYIExtend)

@end


@implementation NSArray (YYISafe)

- (id)safeObjectAtIndex:(NSUInteger)index
{
    if (index >= self.count) {
        return nil;
    }    
    return [self objectAtIndex:index];
}

@end
