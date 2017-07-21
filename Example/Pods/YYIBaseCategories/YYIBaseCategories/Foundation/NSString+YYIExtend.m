//
//  NSString+YYIExtend.m
//  Pods
//
//  Created by 丁玉松 on 2017/7/21.
//
//

#import "NSString+YYIExtend.h"

@implementation NSString (YYIExtend)

@end


@implementation NSString (YYIFormat)

-(NSString *)upperFirstLetter{
    
    if (self.length < 1) {
        return nil;
    }
    return [self stringByReplacingCharactersInRange:NSMakeRange(0, 1) withString:[[self substringWithRange:NSMakeRange(0, 1)]uppercaseString]];
}

@end


#import <CommonCrypto/CommonDigest.h>

@implementation NSString (YYIEncrypt)

- (NSString *)md5
{
    const char *cStr = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result ); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}


@end


@implementation NSString (YYIManage)

-(BOOL)isTelephone{
    
    BOOL phone = NO;
    if (([self length] == 11) && [[self substringWithRange:NSMakeRange(0, 1)]  isEqualToString:@"1"]) {
        phone = YES;
    }
    return phone;
}

@end

@implementation NSString (YYIDate)

-(NSString *)weekName
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat: @"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:self];
    
    NSDateComponents *componets = [[NSCalendar autoupdatingCurrentCalendar] components:NSCalendarUnitWeekday fromDate:destDate];
    NSInteger weekday = [componets weekday];
    
    switch (weekday) {
        case 1:
        {
            return @"星期天";
        }
            break;
        case 2:
        {
            return @"星期一";
        }
            break;
        case 3:
        {
            return @"星期二";
        }
            break;
        case 4:
        {
            return @"星期三";
        }
            break;
        case 5:
        {
            return @"星期四";
        }
            break;
        case 6:
        {
            return @"星期五";
        }
            break;
        default:
            return @"星期六";
            break;
    }
}

-(NSString *)dateYMD
{
    if (self == nil || self.length < 10) {
        return @"---";
    }else{
        return [self substringWithRange:NSMakeRange(0, 10)];
    }
}

@end













