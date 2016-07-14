//
//  NearbyCell.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/6.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "NearbyCell.h"
#import "CYDSlider.h"

@implementation NearbyCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addAllViews];
    }
    return self;
}

- (void)addAllViews
{
    
    self.iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 12.5, 80, 80)];
    self.iconImg.backgroundColor = MAINCOLOR;
    self.iconImg.layer.masksToBounds = YES;
    self.iconImg.layer.cornerRadius = 40;
    [self addSubview:self.iconImg];
    
    self.nameLab = [[UILabel alloc] init];
    self.nameLab.text = @"好聚点11111111";
    self.nameLab.textColor = ZITIBLACKCOLOR;
    self.nameLab.font = [UIFont systemFontOfSize:14];
//    self.nameLab.backgroundColor = [UIColor orangeColor];
    self.nameLab.numberOfLines = 0;//根据最大行数需求来设置
    self.nameLab.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(9999, 20);//labelsize的最大值
    //关键语句
    CGSize expectSize = [self.nameLab sizeThatFits:maximumLabelSize];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    self.nameLab.frame = CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMinY(self.iconImg.frame) + 5, expectSize.width, expectSize.height);
    [self addSubview:self.nameLab];
    
    self.dingWeiImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLab.frame) + 10, CGRectGetMinY(self.iconImg.frame) + 5, 15, 15)];
    self.dingWeiImg.backgroundColor = MAINCOLOR;
    [self addSubview:self.dingWeiImg];
    
    self.disLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dingWeiImg.frame) + 10, CGRectGetMinY(self.iconImg.frame) + 5, 50, 15)];
    self.disLab.text = @"0.8km";
    self.disLab.textColor = ZITIBLACKCOLOR;
    self.disLab.font = [UIFont systemFontOfSize:9];
    [self addSubview:self.disLab];
    
    self.contentLab = [[UILabel alloc] init];
    self.contentLab.text = @"27岁, 身高180cm, 5-8k, 河南郑州";
    self.contentLab.textColor = ZITIGRAYCOLOR;
    self.contentLab.font = [UIFont systemFontOfSize:13];
    self.contentLab.textAlignment = NSTextAlignmentLeft;
    self.contentLab.numberOfLines = 0;//根据最大行数需求来设置
    self.contentLab.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize1 = CGSizeMake(WIDTH - self.iconImg.frame.size.width - 30, 20);//labelsize的最大值
    //关键语句
    CGSize expectSize1 = [self.contentLab sizeThatFits:maximumLabelSize1];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    self.contentLab.frame = CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(self.nameLab.frame) + 10, expectSize1.width, expectSize1.height);
    [self addSubview:self.contentLab];
    
    self.jingshenImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(self.contentLab.frame) + 10, 15, 15)];
    self.jingshenImg.backgroundColor = MAINCOLOR;
    [self addSubview:self.jingshenImg];
    
    self.jingshenLab = [[UILabel alloc] init];
    self.jingshenLab.text = @"精神100%";
    self.jingshenLab.textColor = ZITIBLACKCOLOR;
    self.jingshenLab.font = [UIFont systemFontOfSize:9];
    self.jingshenLab.numberOfLines = 0;//根据最大行数需求来设置
    self.jingshenLab.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize2 = CGSizeMake(9999, 15);//labelsize的最大值
    //关键语句
    CGSize expectSize2 = [self.jingshenLab sizeThatFits:maximumLabelSize2];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    self.jingshenLab.frame = CGRectMake(CGRectGetMaxX(self.jingshenImg.frame), CGRectGetMinY(self.jingshenImg.frame), expectSize2.width, expectSize2.height);
    [self addSubview:self.jingshenLab];
    
    CGFloat sliderW = 136.5;
    CGFloat sliderH = 20;
    
    CYDSlider * slider = [[CYDSlider alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(self.jingshenImg.frame), sliderW, sliderH)];
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
    [self addSubview:slider];
    
    
    self.wuzhiLab = [[UILabel alloc] init];
    self.wuzhiLab.text = @"物质50%";
    self.wuzhiLab.textColor = ZITIBLACKCOLOR;
    self.wuzhiLab.font = [UIFont systemFontOfSize:9];
    self.wuzhiLab.numberOfLines = 0;//根据最大行数需求来设置
    self.wuzhiLab.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize3 = CGSizeMake(9999, 15);//labelsize的最大值
    //关键语句
    CGSize expectSize3 = [self.wuzhiLab sizeThatFits:maximumLabelSize3];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    self.wuzhiLab.frame = CGRectMake(CGRectGetMaxX(slider.frame) - 20, CGRectGetMinY(self.jingshenImg.frame), expectSize3.width, expectSize3.height);
    [self addSubview:self.wuzhiLab];
    
    
    self.wuzhiImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.wuzhiLab.frame) - 15, CGRectGetMinY(self.jingshenImg.frame), 15, 15)];
    self.wuzhiImg.backgroundColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
    [self addSubview:self.wuzhiImg];

    UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.iconImg.frame) + 12.5, WIDTH, 0.5)];
    lineLab.backgroundColor = BACKGROUNDCOLOR;
    [self addSubview:lineLab];
    
    
    CGFloat btnW = (WIDTH - 1)/3;
    CGFloat btnH = 35;
    
    self.dazhaohuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.dazhaohuBtn.frame = CGRectMake(0, CGRectGetMaxY(lineLab.frame), btnW, btnH);
    self.dazhaohuBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:self.dazhaohuBtn];
    
    
    self.dazhaohuImg = [[UIImageView alloc] initWithFrame:CGRectMake(btnW/2 - 30, (btnH-25)/2, 25, 25)];
    self.dazhaohuImg.backgroundColor = MAINCOLOR;
    [self.dazhaohuBtn addSubview:self.dazhaohuImg];
    
    self.dazhaohuLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.dazhaohuImg.frame), CGRectGetMinY(self.dazhaohuImg.frame), btnW/2, 25)];
    self.dazhaohuLab.text = @"打招呼";
    self.dazhaohuLab.textColor = ZITIGRAYCOLOR;
    self.dazhaohuLab.font = [UIFont systemFontOfSize:11];
    [self.dazhaohuBtn addSubview:self.dazhaohuLab];
    
    
    self.songliwuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.songliwuBtn.frame = CGRectMake(btnW, CGRectGetMaxY(lineLab.frame), btnW, btnH);
    self.songliwuBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:self.songliwuBtn];
    
    self.songliwuImg = [[UIImageView alloc] initWithFrame:CGRectMake(btnW/2 - 30, (btnH-25)/2, 25, 25)];
    self.songliwuImg.backgroundColor = MAINCOLOR;
    [self.songliwuBtn addSubview:self.songliwuImg];
    
    self.songliwuLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.songliwuImg.frame), CGRectGetMinY(self.songliwuImg.frame), btnW/2, 25)];
    self.songliwuLab.text = @"送礼物";
    self.songliwuLab.textColor = ZITIGRAYCOLOR;
    self.songliwuLab.font = [UIFont systemFontOfSize:11];
    [self.songliwuBtn addSubview:self.songliwuLab];
    
    UIImageView * lineImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0.5, btnH)];
    lineImg1.backgroundColor = MAINCOLOR;
    [self.songliwuBtn addSubview:lineImg1];
    
    UIImageView * lineImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(btnW - 0.5, 0, 0.5, btnH)];
    lineImg2.backgroundColor = MAINCOLOR;
    [self.songliwuBtn addSubview:lineImg2];
    
    
    self.xihuanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.xihuanBtn.frame = CGRectMake(btnW*2, CGRectGetMaxY(lineLab.frame), btnW, btnH);
    self.xihuanBtn.backgroundColor = [UIColor clearColor];
    [self addSubview:self.xihuanBtn];
    
    self.xihuanImg = [[UIImageView alloc] initWithFrame:CGRectMake(btnW/2 - 30, (btnH-25)/2, 25, 25)];
    self.xihuanImg.backgroundColor = MAINCOLOR;
    [self.xihuanBtn addSubview:self.xihuanImg];
    
    self.xihuanLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.xihuanImg.frame), CGRectGetMinY(self.xihuanImg.frame), btnW/2, 25)];
    self.xihuanLab.text = @"喜欢";
    self.xihuanLab.textColor = ZITIGRAYCOLOR;
    self.xihuanLab.font = [UIFont systemFontOfSize:11];
    [self.xihuanBtn addSubview:self.xihuanLab];
    
    
    UILabel *lineLab1 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.dazhaohuBtn.frame), WIDTH, 0.5)];
    lineLab1.backgroundColor = XIANCOLOR;
    [self addSubview:lineLab1];
    
    UILabel *lineLab2 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineLab1.frame), WIDTH, 5)];
    lineLab2.backgroundColor = BACKGROUNDCOLOR;
    [self addSubview:lineLab2];
    
    UILabel *lineLab3 = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineLab2.frame), WIDTH, 0.5)];
    lineLab3.backgroundColor = XIANCOLOR;
    [self addSubview:lineLab3];
    
    
}


- (void)sliderChange:(UISlider *)sender
{
    NSLog(@"%d", (int)sender.value);
    self.jingshenLab.text = [NSString stringWithFormat:@"精神%d%%", (int)sender.value];
}



@end
