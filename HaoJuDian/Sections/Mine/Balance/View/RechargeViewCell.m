//
//  RechargeViewCell.m
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "RechargeViewCell.h"

@implementation RechargeViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self creatView];
        
    }
    return self;
}
-(void)creatView
{

    _moneyLabel = [[UILabel alloc]init];
    
    _moneyLabel.frame =CGRectMake(100*AUTO_IPHONE6_WIDTH_375, 8*AUTO_IPHONE6_HEIGHT_667, ScreenWidth-60-100, 25*AUTO_IPHONE6_HEIGHT_667);

    _moneyLabel.font = JDFont(16);
    _moneyLabel.textColor =MAINCOLOR;
    [self.contentView addSubview:_moneyLabel];
    
    
    _changeField = [[UITextField alloc]init];
    _changeField.frame = CGRectMake(100, 0, ScreenWidth-120-20, 45);
    _changeField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    _changeField.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    _changeField.clearButtonMode=UITextFieldViewModeAlways;
    _changeField.font =JDFont(14);
    _changeField.returnKeyType =UIReturnKeyDone;
    
    [self.contentView addSubview:_changeField];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];




}

@end
