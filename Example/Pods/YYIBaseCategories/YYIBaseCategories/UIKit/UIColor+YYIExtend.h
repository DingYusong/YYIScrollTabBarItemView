//
//  UIColor+YYIExtend.h
//  Pods
//
//  Created by 丁玉松 on 2017/7/21.
//
//

#import <UIKit/UIKit.h>

@interface UIColor (YYIExtend)

/**
 16进制转UIColor
 
 @param hexStr hexStr description
 @return UIColor
 */
+ (UIColor *)colorWithHexStr:(NSString *)hexStr;

/**
 UIColor转为16进制字符串
 
 @return #AABBCC
 */
- (NSString *)hexStr;
@end
