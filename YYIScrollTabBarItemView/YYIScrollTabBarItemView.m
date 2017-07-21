//
//  YYIScrollTabBarItemView.m
//  OneGold
//
//  Created by 丁玉松 on 2017/3/8.
//  Copyright © 2017年 Beijing Yingyan Internet Co., Ltd. All rights reserved.
//

#import "YYIScrollTabBarItemView.h"
/**
 *  TopBar的按钮宽度
 */
#define YYIScrollTabBarItemWidth 94


@interface YYIScrollTabBarItemView ()
@property (nonatomic ,strong) NSArray *titleItems;
/**
 标题下方的指示器
 */
@property (nonatomic, strong) UIView *indicatorView;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation YYIScrollTabBarItemView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithConfig:(YYIScrollTabBarItemViewConfig *)config
{
    self = [super init];
    if (self) {
        _config = config;
        _titleItems = config.titleItems;
        
        [self yyi_initTabbar];
    }
    return self;
}

- (instancetype)initWithTitleItems:(NSArray <NSString *>*)titleItems
{
    self = [super init];
    if (self) {
        _titleItems = titleItems;
        _config = [[YYIScrollTabBarItemViewConfig alloc] init];

        [self yyi_initTabbar];
    }
    return self;
}

-(void)yyi_initTabbar{
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor clearColor];
    scrollView.alwaysBounceHorizontal = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    [self addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    
    self.scrollView = scrollView;
    
    __block CGFloat totalButtonWidth = _config.titleInterval < 0?0:_config.titleInterval;
    __block UIButton *firstBtn;

    [self.titleItems enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton *button = [self createButtonWith:obj tag:idx totalButtonWidth:totalButtonWidth];
        
        if (_config.titleInterval <0) {
            totalButtonWidth += button.width;
        }else{
            totalButtonWidth += button.width;
            totalButtonWidth += _config.titleInterval;
        }
        
        if (!firstBtn) {
            firstBtn = button;
        }
    }];
    
    scrollView.contentSize = CGSizeMake(_config.titleInterval < 0?[UIScreen mainScreen].bounds.size.width:totalButtonWidth , _config.tabBarViewHeight);
    
    UIView *indicatorView = [UIView new];
    indicatorView.backgroundColor = _config.lineSelectedColor;
    [scrollView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    [indicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(_config.indicatorViewHeight));
        make.width.equalTo(@(firstBtn.width));
        make.top.equalTo(firstBtn.mas_bottom).with.offset(-_config.indicatorViewBottomOffset);
        make.centerX.equalTo(firstBtn.mas_centerX);
    }];
    
    
    if (_config.align == YYIScrollTabBarItemAlignTypeCenter) {
        [scrollView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
            make.width.equalTo(@(_config.titleInterval < 0?[UIScreen mainScreen].bounds.size.width:totalButtonWidth));
            make.height.equalTo(self.mas_height);
        }];
    }
    
    
    firstBtn.selected = YES;
    _selectIndex = 0;
}

-(UIButton *)createButtonWith:(NSString *)title tag:(NSInteger)tag totalButtonWidth:(CGFloat)totalButtonWidth{
    
    UIButton *button = [UIButton new];
    button.titleLabel.font = [UIFont systemFontOfSize:_config.titleFont];
    [button setTitle:title forState:UIControlStateNormal];
    
    [button sizeToFit];
    
//    [button setTitleColor:_config.textNormalColor selectColor:_config.textSelectedColor];
    [button setTitleColor:_config.textNormalColor forState:UIControlStateNormal];
    [button setTitleColor:_config.textSelectedColor forState:UIControlStateSelected];

    button.tag = 100+tag;
    [button addTarget:self action:@selector(titleButtonSelected:) forControlEvents:UIControlEventTouchUpInside];
    [_scrollView addSubview:button];
    
    CGFloat btnWidth = [UIScreen mainScreen].bounds.size.width/_config.titleItems.count;
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollView.mas_top);
        if (_config.titleInterval < 0) {
            make.width.equalTo(@(btnWidth));
            make.left.equalTo(_scrollView).offset(btnWidth*tag);
        }else{
            make.left.equalTo(_scrollView).offset(totalButtonWidth);
            make.width.equalTo(@(button.width));
        }
        make.height.equalTo(@(_config.tabBarViewHeight - _config.indicatorViewHeight));
    }];

    return button;
}

-(void)titleButtonSelected:(UIButton *)button{
    if (_selectIndex != button.tag - 100) {
        [self updateToSelectedBtn:button];
        if ([self.delegate respondsToSelector:@selector(YYIScrollTabBarItemView:didSelectedIndex:)]) {
            [self.delegate YYIScrollTabBarItemView:self didSelectedIndex:_selectIndex];
        }
    }
}

-(void)updateToSelectedBtn:(UIButton *)button{
    if (_selectIndex != button.tag - 100) {
        self.userInteractionEnabled= NO;
        
        [self updateBtnUI:[self.scrollView viewWithTag:self.selectIndex+100] newBtn:button];
        
        [self moveIndicatorViewUnderSelectedBtn:button];
        
        [self scrollViewWithButton:button];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.userInteractionEnabled= YES;
        });
    }
}

-(void)updateBtnUI:(UIButton *)oldBtn newBtn:(UIButton *)selectedBtn{
    oldBtn.selected = NO;
    selectedBtn.selected = YES;
    _selectIndex = selectedBtn.tag - 100;
}

-(void)moveIndicatorViewUnderSelectedBtn:(UIButton *)selectBtn{
    
    [self.indicatorView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(_config.indicatorViewHeight));
        make.width.equalTo(@(selectBtn.width));
        make.top.equalTo(selectBtn.mas_bottom).with.offset(-_config.indicatorViewBottomOffset);
        make.centerX.equalTo(selectBtn.mas_centerX);
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self layoutIfNeeded];
    }];
}

-(void)scrollViewWithButton:(UIButton *)button{
    
    if (_config.align == YYIScrollTabBarItemAlignTypeLeft) {
        if (button.frame.origin.x + button.frame.size.width < self.bounds.size.width) {
            return;
        }
    }
    
    //滚动scrollview
    CGFloat willOffsetX = ((button.frame.origin.x + button.frame.size.width/2.f) - self.bounds.size.width/2.f);
    [UIView animateWithDuration:.5f animations:^{
        if (willOffsetX < 0) {
            self.scrollView.contentOffset = CGPointZero;
        } else if(willOffsetX + self.scrollView.bounds.size.width > self.scrollView.contentSize.width) {
            self.scrollView.contentOffset = CGPointMake(self.scrollView.contentSize.width - self.scrollView.bounds.size.width, 0);
        } else {
            self.scrollView.contentOffset = CGPointMake(willOffsetX, 0);
        }
    }];
}

@end
