//
//  BranceCaredCell.h
//  HaoJuDian
//
//  Created by ming on 16/7/20.
//  Copyright © 2016年 陈义德. All rights reserved.
//
//  我的银行卡-->银行卡列表cell
#import <UIKit/UIKit.h>
#import "BranceBankModel.h"


@interface BranceCaredCell : UITableViewCell
//背景
@property(nonatomic,strong)UIImageView *bgView;

//白色背景圆
@property(nonatomic,strong)UIView *circleView;
//银行卡 logo
@property(nonatomic,strong)UIImageView *logoImage;
//银行卡 银行卡名称
@property(nonatomic,strong)UILabel *bankNameLabel;
//银行卡类型
@property(nonatomic,strong)UILabel *bankType;
//银行卡号
@property(nonatomic,strong)UILabel *bankNum;
//底部透明层
@property(nonatomic,strong)UIImageView *botomView;
//解绑按钮
@property(nonatomic,strong)UIButton *unbindBtn;

@property (nonatomic,strong)BranceBankModel *model;

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
