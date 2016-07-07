//
//  CYDSlider.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/6.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "CYDSlider.h"

@implementation CYDSlider

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews
{
    self.backgroundColor = [UIColor blackColor];
    //裁剪
    self.clipsToBounds = YES;
    //设置滑块左右两边导轨的颜色
    self.minimumTrackTintColor = MAINCOLOR;
    self.maximumTrackTintColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
}

- (CGRect)trackRectForBounds:(CGRect)bounds {
    return CGRectMake(0, self.bounds.size.height/2 - 2, self.bounds.size.width, self.bounds.size.height/4);
}

//- (CGRect)thumbRectForBounds:(CGRect)bounds trackRect:(CGRect)rect value:(float)value
//{
//    return CGRectMake(0, 0, 5, 5);
//}


@end
