//
//  UIColor+YYIExtend.m
//  Pods
//
//  Created by 丁玉松 on 2017/7/21.
//
//

#import "UIColor+YYIExtend.h"

#define DEFAULT_VOID_COLOR [UIColor whiteColor]

@implementation UIColor (YYIExtend)

+ (UIColor *)colorWithHexStr:(NSString *)hexStr{
    //转换成大写
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    if ([cString length] < 6)
        return DEFAULT_VOID_COLOR;
    
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    
    if ([cString length] != 6)
        return DEFAULT_VOID_COLOR;
    
    NSRange range;
    range.length = 2;
    
    range.location = 0;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
    
}

- (NSString *)hexStr{
    
    const CGFloat*cs=CGColorGetComponents(self.CGColor);
    
    NSString *r = [NSString stringWithFormat:@"%@",[self  hexWithDecimal:cs[0]*255]];
    NSString *g = [NSString stringWithFormat:@"%@",[self  hexWithDecimal:cs[1]*255]];
    NSString *b = [NSString stringWithFormat:@"%@",[self  hexWithDecimal:cs[2]*255]];
    return [NSString stringWithFormat:@"#%@%@%@",r,g,b];
}


//十进制转十六进制
-(NSString *)hexWithDecimal:(int)decimal
{
    NSString *endtmp=@"";
    NSString *nLetterValue;
    NSString *nStrat;
    int ttmpig=decimal%16;
    int tmp=decimal/16;
    switch (ttmpig)
    {
        case 10:
            nLetterValue =@"A";break;
        case 11:
            nLetterValue =@"B";break;
        case 12:
            nLetterValue =@"C";break;
        case 13:
            nLetterValue =@"D";break;
        case 14:
            nLetterValue =@"E";break;
        case 15:
            nLetterValue =@"F";break;
        default:nLetterValue=[[NSString alloc]initWithFormat:@"%i",ttmpig];
            
    }
    switch (tmp)
    {
        case 10:
            nStrat =@"A";break;
        case 11:
            nStrat =@"B";break;
        case 12:
            nStrat =@"C";break;
        case 13:
            nStrat =@"D";break;
        case 14:
            nStrat =@"E";break;
        case 15:
            nStrat =@"F";break;
        default:nStrat=[[NSString alloc]initWithFormat:@"%i",tmp];
            
    }
    endtmp=[[NSString alloc]initWithFormat:@"%@%@",nStrat,nLetterValue];
    return endtmp;
}


@end

