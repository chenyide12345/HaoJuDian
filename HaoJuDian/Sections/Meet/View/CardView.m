//
//  CardView.m
//  仿陌陌点点切换
//
//  Created by zjwang on 16/3/28.
//  Copyright © 2016年 Xsummerybc. All rights reserved.
//

#import "CardView.h"
#import "CYDSlider.h"

@implementation CardView
- (instancetype)init {
    self = [super init];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup {
    // Shadow
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.33;
    self.layer.shadowOffset = CGSizeMake(0, 1.5);
    self.layer.shadowRadius = 4.0;
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    
    // Corner Radius
    self.layer.cornerRadius = 5.0;
    
    
    // Custom view
    [self addSubview:self.imageView];
    _imageView.frame = CGRectMake(2.5, 2.5, self.frame.size.width - 5, self.frame.size.height - 5);
    _imageView.layer.cornerRadius = 5.0;
    _imageView.backgroundColor = [UIColor whiteColor];
    
    
    CGFloat backViewH = HEIGHT*0.1;
    
    if (HEIGHT == 480) {
        backViewH = HEIGHT*0.1 + 15;
    } else if (HEIGHT == 568){
        backViewH = HEIGHT*0.1 + 10;
    } else if (HEIGHT == 667) {
        backViewH = HEIGHT*0.1;
    } else {
        backViewH = HEIGHT*0.1 - 10;
    }
    
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(2.5, _imageView.frame.size.height - backViewH, _imageView.frame.size.width - 5, backViewH)];
    backView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.40];
    [_imageView addSubview:backView];
    
    self.nameLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, backView.frame.size.width/3*2, 20)];
//    self.nameLab.backgroundColor = MAINCOLOR;
    self.nameLab.text = @"你若安好便是晴天 20岁";
    self.nameLab.font = [UIFont systemFontOfSize:14];
    self.nameLab.textColor = ZITIWHITECOLOR;
    [backView addSubview:self.nameLab];
    
    UIImageView * jingshenImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nameLab.frame), CGRectGetMaxY(self.nameLab.frame), 15, 15)];
//    jingshenImg.backgroundColor = MAINCOLOR;
    jingshenImg.image = [UIImage imageNamed:@"jingshen"];
    [backView addSubview:jingshenImg];
    
    self.jingshenLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(jingshenImg.frame), CGRectGetMinY(jingshenImg.frame), 50, 20)];
    self.jingshenLab.text = @"精神50%";
    self.jingshenLab.textColor = ZITIWHITECOLOR;
    self.jingshenLab.font = [UIFont systemFontOfSize:11];
    [backView addSubview:self.jingshenLab];
    
    CGFloat sliderW = 0.625*WIDTH;
    CGFloat sliderH = 30;

    
    CYDSlider * slider = [[CYDSlider alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nameLab.frame), CGRectGetMaxY(jingshenImg.frame) - 5, sliderW, sliderH)];
    slider.backgroundColor = [UIColor clearColor];
    //裁剪
    slider.clipsToBounds = YES;
    //设置滑块左右两边导轨的颜色
    slider.minimumTrackTintColor = MAINCOLOR;
    slider.maximumTrackTintColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
    
    //注意这里要加UIControlStateHightlighted的状态，否则当拖动滑块时滑块将变成原生的控件
    [slider setThumbImage:[UIImage imageNamed:@"1"] forState:UIControlStateHighlighted];
    [slider setThumbImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
    
    slider.minimumValue = 1;
    slider.maximumValue = 100;
    slider.value = 50;
    
    [slider addTarget:self
               action:@selector(sliderChange:)
     forControlEvents:UIControlEventValueChanged];
    //是否持续发送值的更新, 默认为YES
    slider.continuous = YES;
    slider.userInteractionEnabled = NO;
    [backView addSubview:slider];
    
    self.wuzhiLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(slider.frame) - 50, CGRectGetMinY(self.jingshenLab.frame), 50, 20)];
    self.wuzhiLab.text = @"物质50%";
    self.wuzhiLab.textColor = ZITIWHITECOLOR;
    self.wuzhiLab.font = [UIFont systemFontOfSize:11];
    [backView addSubview:self.wuzhiLab];
    
    
    UIImageView * wuzhiImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.wuzhiLab.frame) - 20, CGRectGetMinY(jingshenImg.frame), 15, 15)];
//    wuzhiImg.backgroundColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
    wuzhiImg.image = [UIImage imageNamed:@"wuzhi"];
    [backView addSubview:wuzhiImg];
    
    UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(slider.frame) + 10, 5, 0.5, backViewH - 10)];
    lineLab.backgroundColor = BACKGROUNDCOLOR;
    [backView addSubview:lineLab];
    
    self.percentLab = [[UILabel alloc] init];
    self.percentLab.text = @"50%";
    self.percentLab.textColor = ZITIWHITECOLOR;
    self.percentLab.textAlignment = NSTextAlignmentCenter;
    self.percentLab.font = [UIFont systemFontOfSize:20];
    [backView addSubview:self.percentLab];
    
    [self.percentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(backView.mas_top).offset(5);
        make.left.equalTo(lineLab.mas_right).offset(0);
        make.right.equalTo(backView.mas_right).offset(0);
        make.height.equalTo(@(backViewH/2 - 5));
    }];
    
    
    UILabel * lab = [[UILabel alloc] init];
    lab.text = @"恋爱观匹配度";
    lab.textColor = ZITIWHITECOLOR;
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:11];
    [backView addSubview:lab];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.percentLab.mas_bottom).offset(0);
        make.left.equalTo(lineLab.mas_right).offset(0);
        make.right.equalTo(backView.mas_right).offset(0);
        make.height.equalTo(@(backViewH/2));
    }];
    
    
    
}


- (UILabel *)labelTitle
{
    if (_labelTitle == nil) {
        _labelTitle = [[UILabel alloc] init];
    }
    return _labelTitle;
}
- (UIImageView *)imageView
{
    if (_imageView == nil) {
        _imageView = [[UIImageView alloc] init];
    }
    return _imageView;
}
@end
