//
//  NSArray+YYIExtend.h
//  Pods
//
//  Created by 丁玉松 on 2017/7/20.
//  Copyright © 2017年 Beijing Yingyan Internet Co., Ltd.. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YYIExtend)

@end


@interface NSArray (YYISafe)

- (id)safeObjectAtIndex:(NSUInteger)index;

@end
