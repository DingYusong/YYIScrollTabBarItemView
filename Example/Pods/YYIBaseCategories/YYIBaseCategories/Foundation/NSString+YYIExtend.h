//
//  NSString+YYIExtend.h
//  Pods
//
//  Created by 丁玉松 on 2017/7/21.
//
//

#import <Foundation/Foundation.h>

@interface NSString (YYIExtend)

@end




/**
 格式化字符串
 */
@interface NSString (YYIFormat)

/**
 首字母大写 （用于支持set方法 例如：bigApple setBigApple）

 @return 首字母修改为大写字母
 */
-(NSString *)upperFirstLetter;

@end


@interface NSString (YYIEncrypt)

- (NSString *)md5;

@end



@interface NSString (YYIManage)

/**
 判断是否是手机号

 @return yes or no
 */
-(BOOL)isTelephone;

@end


@interface NSString (YYIDate)

/**
 *  从日期得到星期几的信息
 *
 *  @return 汉字星期
 */
-(NSString *)weekName;

/**
 yyyy-MM-dd hh:mm:ss 取前十位
 
 @return yyyy-MM-dd
 */
-(NSString *)dateYMD;

@end
