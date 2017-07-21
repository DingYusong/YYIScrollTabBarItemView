//
//  UIView+YYIExtend.m
//  Pods
//
//  Created by 丁玉松 on 2017/7/21.
//
//

#import "UIView+YYIExtend.h"

@implementation UIView (YYIExtend)

@end


@implementation UIView (YYIFrame)


- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth: (CGFloat) newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}


@end
