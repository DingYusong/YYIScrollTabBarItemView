//
//  NSDictionary+YYIExtend.h
//  Pods
//
//  Created by 丁玉松 on 2017/7/21.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (YYIExtend)

@end

@interface NSDictionary (YYISafe)

- (id)safeObjectForKey:(id)key;

@end
