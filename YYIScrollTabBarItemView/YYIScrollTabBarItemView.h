//
//  YYIScrollTabBarItemView.h
//  OneGold
//
//  Created by 丁玉松 on 2017/3/8.
//  Copyright © 2017年 Beijing Yingyan Internet Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <YYIBaseCategories/YYIBaseCategories.h>
#import "YYIScrollTabBarItemViewConfig.h"


@class YYIScrollTabBarItemView;

@protocol YYIScrollTabBarItemViewDelegate <NSObject>

@required
- (void)YYIScrollTabBarItemView:(YYIScrollTabBarItemView *)barView didSelectedIndex:(NSInteger)index;
@end


@interface YYIScrollTabBarItemView : UIView

@property (nonatomic ,assign) NSInteger selectIndex;

@property (nonatomic ,strong) YYIScrollTabBarItemViewConfig *config;

@property (nonatomic, weak) id <YYIScrollTabBarItemViewDelegate> delegate;

- (instancetype)initWithConfig:(YYIScrollTabBarItemViewConfig *)config;
- (instancetype)initWithTitleItems:(NSArray <NSString *>*)titleItems;

-(void)updateToSelectedBtn:(UIButton *)button;

@end
