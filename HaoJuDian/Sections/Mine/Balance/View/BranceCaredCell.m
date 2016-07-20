//
//  BranceCaredCell.m
//  HaoJuDian
//
//  Created by ming on 16/7/20.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "BranceCaredCell.h"

@implementation BranceCaredCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        //设置选中不变灰
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return self;
}
-(void)createContentView
{
    
    self.bgView=[[UIImageView alloc]initWithFrame:CGRectMake(10, 15, ScreenWidth-20, 135)];
    self.bgView.layer.cornerRadius=3.0;
    self.bgView.layer.masksToBounds = YES;
    [self addSubview:self.bgView];
    
    self.circleView = [[UIView alloc]initWithFrame:CGRectMake(15, 10,60, 60)];
    self.circleView.layer.cornerRadius=30;
    self.circleView.layer.allowsEdgeAntialiasing= YES;
    self.circleView.clipsToBounds=YES;
    self.circleView.backgroundColor =[UIColor whiteColor];
    [self.bgView addSubview:self.circleView];
    
    self.logoImage=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10,40, 40)];
    self.logoImage.layer.cornerRadius=20;
    self.logoImage.layer.allowsEdgeAntialiasing= YES;
    self.logoImage.clipsToBounds=YES;
    
    [self.circleView addSubview:self.logoImage];
    
    self.bankNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(ViewRight(self.circleView)+8, ViewY(self.circleView)+10, 200, 16)];
    self.bankNameLabel.font=JDFont(16);
    self.bankNameLabel.text=@"中国银行";
    self.bankNameLabel.textColor =[UIColor whiteColor];
    [self.bgView addSubview:self.bankNameLabel];
    
    self.bankType =[[UILabel alloc]initWithFrame:CGRectMake(ViewX(self.bankNameLabel)+2, ViewBelow(self.bankNameLabel)+10, 100, 14)];
    self.bankType.font=JDFont(13);
    self.bankType.text=@"储蓄卡";
    self.bankType.textColor =[UIColor whiteColor];
    [self.bgView addSubview:self.bankType];
    
    self.bankNum =[[UILabel alloc]initWithFrame:CGRectMake(ViewX(self.bankNameLabel)+2, ViewBelow(self.bankType)+10, 200, 13)];
    self.bankNum.font=JDFont(13);
    self.bankNum.text=@"456498461321321465456465";
    self.bankNum.textColor =[UIColor whiteColor];
    [self.bgView addSubview:self.bankNum];
    
    
    self.unbindBtn=[[UIButton alloc]initWithFrame:CGRectMake(ViewWidth(self.bgView)-80, 105, 70, 20)];
    
    [self.unbindBtn setTitle:@"解绑银行卡" forState:UIControlStateNormal];
    self.unbindBtn.titleLabel.font=JDFont(14);
    [self.unbindBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.bgView addSubview:self.unbindBtn];
    
    UIView *lucencyView =[[UIView alloc]initWithFrame:CGRectMake(0, 135-40, ScreenWidth-20, 40)];
    
    lucencyView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.2];
    
    [self.bgView addSubview:lucencyView];
    
    CGSize size =CGSizeMake(3.0, 3.0);
    
    [self setCornerRadiusWithView:lucencyView roundingCorners:UIRectCornerBottomLeft|UIRectCornerBottomRight andRadius:size];
}


- (void)setCornerRadiusWithView:(UIView *)view roundingCorners:(UIRectCorner)corners andRadius:(CGSize)radius {
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:radius];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    
    maskLayer.frame = view.bounds;
    
    maskLayer.path = maskPath.CGPath;
    
    view.layer.mask = maskLayer;
}



-(void)setModel:(BranceBankModel *)model
{
    
    //   //银行卡颜色判断
    //    if ([model.color isEqualToString:@"red"]) {
    //
    //        self.bgView.image =[UIImage imageNamed:@"WLredColorBKCards"];
    //
    //    }else if ([model.color isEqualToString:@"blue"])
    //    {
    //        self.bgView.image =[UIImage imageNamed:@"WLBlueColorBKCards"];
    //
    //    }else if ([model.color isEqualToString:@"green"])
    //    {
    //        self.bgView.image =[UIImage imageNamed:@"WLgreenColorBKCards"];
    //
    //    }else if([model.color isEqualToString:@"purple"])
    //    {
    //        self.bgView.image =[UIImage imageNamed:@"WLpurpleColorBkCards"];
    //    }
    self.bgView.backgroundColor =[JDTools stringToColor:model.color];
    
    NSString *str=[NSString stringWithFormat:@"%@%@",BaseURL,model.BankImgSrc];
    
    
    [self.logoImage sd_setImageWithURL:[NSURL URLWithString:str] placeholderImage:[UIImage imageNamed:@"placeHolderLogo"]];
    
    
    self.bankNameLabel.text=[NSString stringWithFormat:@"%@",model.BankName];
    
    self.bankNum.text=[NSString stringWithFormat:@"%@",model.CartId];
    self.bankType.text=[NSString stringWithFormat:@"%@",@"储蓄卡"];
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
