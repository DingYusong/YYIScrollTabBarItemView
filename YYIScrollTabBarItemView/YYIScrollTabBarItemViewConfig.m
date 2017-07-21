//
//  YYIScrollTabBarItemViewConfig.m
//  OneGold
//
//  Created by 丁玉松 on 2017/3/9.
//  Copyright © 2017年 Beijing Yingyan Internet Co., Ltd. All rights reserved.
//

#import "YYIScrollTabBarItemViewConfig.h"



@implementation YYIScrollTabBarItemViewConfig

- (instancetype)init
{
    self = [super init];
    if (self) {
        _titleFont = 12.0;
        _titleInterval = 10;
        _indicatorViewHeight = 3;
        _indicatorViewBottomOffset = .0;
        _titleItems = [NSArray new];
        _textNormalColor = [UIColor blackColor];
        _textSelectedColor = [UIColor colorWithHexStr:@"333333"];
        _lineSelectedColor = [UIColor colorWithHexStr:@"333333"];
        
        _align = YYIScrollTabBarItemAlignTypeLeft;
        _tabBarViewHeight = 40.0;
        _bgColor = [UIColor colorWithHexStr:@"ffffff"];
        
    }
    return self;
}


@end
