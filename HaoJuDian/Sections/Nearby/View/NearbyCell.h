//
//  NearbyCell.h
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/6.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearbyCell : UITableViewCell

@property (nonatomic, strong) UIImageView * iconImg;
@property (nonatomic, strong) UILabel * nameLab;
@property (nonatomic, strong) UIImageView * dingWeiImg;//定位图片
@property (nonatomic, strong) UILabel * disLab; //距离
@property (nonatomic, strong) UILabel * contentLab;
@property (nonatomic, strong) UIImageView * jingshenImg;
@property (nonatomic, strong) UILabel * jingshenLab;
@property (nonatomic, strong) UIImageView * wuzhiImg;
@property (nonatomic, strong) UILabel * wuzhiLab;

@property (nonatomic, strong) UIImageView * dazhaohuImg;//打招呼
@property (nonatomic, strong) UILabel * dazhaohuLab; //
@property (nonatomic, strong) UIButton * dazhaohuBtn;
@property (nonatomic, strong) UIImageView * songliwuImg;//送礼物
@property (nonatomic, strong) UILabel * songliwuLab; //
@property (nonatomic, strong) UIButton * songliwuBtn;
@property (nonatomic, strong) UIImageView * xihuanImg;//喜欢
@property (nonatomic, strong) UILabel * xihuanLab; //
@property (nonatomic, strong) UIButton * xihuanBtn;


@end
