//
//  NewsCell.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell

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
    self.iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 50, 50)];
    self.iconImg.backgroundColor = MAINCOLOR;
    self.iconImg.layer.masksToBounds = YES;
    self.iconImg.layer.cornerRadius = 25;
    [self addSubview:self.iconImg];
    
    self.titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, 10, WIDTH - CGRectGetMaxX(self.iconImg.frame), 20)];
    self.titLab.text = @"好聚点";
    self.titLab.textColor = [UIColor blackColor];
    self.titLab.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.titLab];
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 110, 10, 100, 20)];
    self.timeLab.text = @"2016-4-20 11:25";
    self.timeLab.textColor = [UIColor colorWithWhite:0.773 alpha:1.000];
    self.timeLab.font = [UIFont systemFontOfSize:11];
    self.timeLab.textAlignment = NSTextAlignmentRight;
    [self addSubview:self.timeLab];
    
    self.contentLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(self.titLab.frame), WIDTH - CGRectGetMaxX(self.iconImg.frame) - self.timeLab.text.length - 20, 20)];
    self.contentLab.text = @"27岁, 身高180cm, 5-8k, 河南郑州";
    self.contentLab.textColor = [UIColor colorWithWhite:0.773 alpha:1.000];
    self.contentLab.font = [UIFont systemFontOfSize:13];
    self.contentLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.contentLab];
    
    
}

@end
