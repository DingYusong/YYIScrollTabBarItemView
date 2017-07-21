//
//  YYIViewController.m
//  YYIScrollTabBarItemView
//
//  Created by DingYusong on 07/19/2017.
//  Copyright (c) 2017 DingYusong. All rights reserved.
//

#import "YYIViewController.h"
#import <YYIScrollTabBarItemView/YYIScrollTabBarItemView.h>

@interface YYIViewController ()<YYIScrollTabBarItemViewDelegate,UIScrollViewDelegate>

@property (nonatomic, strong) YYIScrollTabBarItemView *scrollTabBarItemView;

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation YYIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self yyi_addScrollTabBar];
    [self yyi_addScrollContent];
	// Do any additional setup after loading the view, typically from a nib.
}


-(void)yyi_addScrollTabBar{
    YYIScrollTabBarItemViewConfig *config = [[YYIScrollTabBarItemViewConfig alloc] init];
    config.titleItems = @[@"头条",@"体育",@"科技"];
    config.titleFont = 18;
    config.textNormalColor = [UIColor darkGrayColor];
    config.textSelectedColor = [UIColor redColor];
    config.tabBarViewHeight = 60;
    config.indicatorViewHeight = 4;
    config.indicatorViewBottomOffset = 15;
    config.lineSelectedColor = [UIColor redColor];
    
    YYIScrollTabBarItemView *view = [[YYIScrollTabBarItemView alloc] initWithConfig:config];
    view.delegate = self;
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
        make.height.equalTo(@(config.tabBarViewHeight));
    }];
    
    _scrollTabBarItemView = view;
}

-(void)yyi_addScrollContent{
    
    _scrollView = [UIScrollView new];
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_scrollTabBarItemView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
    
    UIView* contentView = UIView.new;
    [self.scrollView addSubview:contentView];
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.height.equalTo(self.scrollView);
    }];
    
    __block UIView *lastView;
    [_scrollTabBarItemView.config.titleItems enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIView *view = [UIView new];
        [contentView addSubview:view];
        
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastView ? lastView.mas_right : @0);
            make.top.equalTo(@0);
            make.width.equalTo(_scrollView.mas_width);
            make.height.equalTo(contentView.mas_height);
        }];
        
        int R = (arc4random() % 256);
        int G = (arc4random() % 256);
        int B = (arc4random() % 256);
        view.backgroundColor = [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1];
        
        UILabel *label = [UILabel new];
        label.text = [NSString stringWithFormat:@"第%lu页",(unsigned long)idx+1];
        [view addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(view);
        }];
        
        lastView = view;
        NSLog(@"stop:%d",*stop);
    }];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(lastView.mas_right);
    }];    
}


#pragma mark - scrollViewDelegate

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView == _scrollView) {
        NSInteger buttonTag = round(scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width);
        UIButton *button = [_scrollTabBarItemView viewWithTag:buttonTag+100];
        [_scrollTabBarItemView updateToSelectedBtn:button];
    }
}


#pragma mark - YYIScrollTabBarItemViewDelegate

-(void)YYIScrollTabBarItemView:(YYIScrollTabBarItemView *)barView didSelectedIndex:(NSInteger)index{
    
    [_scrollView setContentOffset:(CGPoint){index*[UIScreen mainScreen].bounds.size.width,0} animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
