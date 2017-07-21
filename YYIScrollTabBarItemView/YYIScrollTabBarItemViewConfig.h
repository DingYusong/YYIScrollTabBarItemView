//
//  YYIScrollTabBarItemViewConfig.h
//  OneGold
//
//  Created by 丁玉松 on 2017/3/9.
//  Copyright © 2017年 Beijing Yingyan Internet Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YYIBaseCategories.h"

typedef enum : NSUInteger {
    YYIScrollTabBarItemAlignTypeLeft,
    YYIScrollTabBarItemAlignTypeRight,
    YYIScrollTabBarItemAlignTypeCenter,
} YYIScrollTabBarItemAlignType;


@interface YYIScrollTabBarItemViewConfig : NSObject

#pragma mark - 按钮
/**
 按钮数组
 */
@property (nonatomic ,strong) NSArray *titleItems;
/**
 按钮的字号
 */
@property (nonatomic ,assign) CGFloat titleFont;

/**
 按钮之间的间隔 -1的话，表示是均匀分布。
 */
@property (nonatomic ,assign) CGFloat titleInterval;


/**
 按钮文字颜色
 */
@property (nonatomic ,strong) UIColor *textNormalColor;

/**
 按钮文字选中色
 */
@property (nonatomic ,strong) UIColor *textSelectedColor;

#pragma mark - 指示器
/**
 指示器高度
 */
@property (nonatomic ,assign) CGFloat indicatorViewHeight;

/**
 指示器距离底部偏移
 */
@property (nonatomic ,assign) CGFloat indicatorViewBottomOffset;

/**
 指示器颜色
 */
@property (nonatomic ,strong) UIColor *lineSelectedColor;


/**
  TopBar的高度
 */
@property (nonatomic ,assign) CGFloat tabBarViewHeight;

/**
 背景色
 */
@property (nonatomic ,strong) UIColor *bgColor;

@property (nonatomic, assign) YYIScrollTabBarItemAlignType align;

@end
