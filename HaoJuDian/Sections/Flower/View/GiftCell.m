//
//  GiftCell.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/7.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "GiftCell.h"

@implementation GiftCell

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
    self.iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    self.iconImg.backgroundColor = MAINCOLOR;
    self.iconImg.layer.masksToBounds = YES;
    self.iconImg.layer.cornerRadius = 40;
    [self addSubview:self.iconImg];
    
    self.nameLab = [[UILabel alloc] init];
    self.nameLab.text = @"好聚点";
    self.nameLab.textColor = [UIColor colorWithWhite:0.298 alpha:1.000];
    self.nameLab.font = [UIFont systemFontOfSize:15];
    self.nameLab.numberOfLines = 0;//根据最大行数需求来设置
    self.nameLab.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize = CGSizeMake(9999, 20);//labelsize的最大值
    //关键语句
    CGSize expectSize = [self.nameLab sizeThatFits:maximumLabelSize];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    self.nameLab.frame = CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMinY(self.iconImg.frame) + 5, expectSize.width, expectSize.height);
    [self addSubview:self.nameLab];
    
    self.nameLab1 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nameLab.frame), CGRectGetMinY(self.nameLab.frame), 80, 20)];
    self.nameLab1.text = @"收到我的礼物";
    self.nameLab1.textColor = [UIColor colorWithWhite:0.773 alpha:1.000];
    self.nameLab1.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.nameLab1];
    
    
    self.contentLab1 = [[UILabel alloc] init];
    self.contentLab1.text = @"鲜花啊啊:10000";
    self.contentLab1.textColor = MAINCOLOR;
    self.contentLab1.font = [UIFont systemFontOfSize:14];
    self.contentLab1.numberOfLines = 0;//根据最大行数需求来设置
    self.contentLab1.lineBreakMode = NSLineBreakByTruncatingTail;
    CGSize maximumLabelSize1 = CGSizeMake(9999, 20);//labelsize的最大值
    //关键语句
    CGSize expectSize1 = [self.contentLab1 sizeThatFits:maximumLabelSize1];
    //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
    self.contentLab1.frame = CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(self.nameLab.frame) + 5, expectSize1.width, expectSize1.height);
    [self addSubview:self.contentLab1];
    
    self.timeLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(self.contentLab1.frame) + 5, 100, 20)];
    self.timeLab.text = @"2016-4-28";
    self.timeLab.textColor = [UIColor colorWithWhite:0.773 alpha:1.000];
    self.timeLab.font = [UIFont systemFontOfSize:11];
    self.timeLab.textAlignment = NSTextAlignmentLeft;
    [self addSubview:self.timeLab];
    
    self.flowImg = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 70, 10, 60, 60)];
    self.flowImg.backgroundColor = MAINCOLOR;
    [self addSubview:self.flowImg];
    
    self.contentLab2 = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.flowImg.frame), CGRectGetMaxY(self.flowImg.frame), self.flowImg.frame.size.width, 20)];
    self.contentLab2.text = @"一生一世";
    self.contentLab2.textColor = MAINCOLOR;
    self.contentLab2.font = [UIFont systemFontOfSize:15];
    self.contentLab2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.contentLab2];
    
    
}



@end
