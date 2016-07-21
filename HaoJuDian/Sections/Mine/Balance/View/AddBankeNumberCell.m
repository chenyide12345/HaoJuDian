//
//  AddBankeNumberCell.m
//  HaoJuDian
//
//  Created by ming on 16/7/21.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "AddBankeNumberCell.h"

@implementation AddBankeNumberCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self creatCoustomView];
        
    }
    
    return self;
}
-(void)creatCoustomView
{
    //左侧
    _leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(12*AUTO_IPHONE6_WIDTH_375, 8*AUTO_IPHONE6_HEIGHT_667, 80, 25)];
    _leftLabel.textAlignment = NSTextAlignmentLeft;
    _leftLabel.font = JDFont(14);
    [self.contentView addSubview:_leftLabel];
    
    //输入框
    _userField =[[UITextField alloc]init];
    _userField.frame = CGRectMake(ViewRight(_leftLabel)+40*AUTO_IPHONE6_HEIGHT_667, 0, ScreenWidth-ViewWidth(_leftLabel)-20, 45);
//    _userField.textColor = [JDTools stringToColor:@"#868686"];
    _userField.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    _userField.contentHorizontalAlignment=UIControlContentHorizontalAlignmentCenter;
    _userField.clearButtonMode=UITextFieldViewModeAlways;
    _userField.font =JDFont(14);
    _userField.returnKeyType =UIReturnKeyDone;
    [self.contentView addSubview:_userField];
    
    //右侧图片
    UIImage *rithtImage = [UIImage imageNamed:@"brance_right"];
    _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _rightButton.frame =CGRectMake(ScreenWidth - 24/2*AUTO_IPHONE6_WIDTH_375-rithtImage.size.width, 15*AUTO_IPHONE6_HEIGHT_667, rithtImage.size.width, rithtImage.size.height);
    [_rightButton setBackgroundImage:rithtImage forState:UIControlStateNormal];
   
    [self.contentView addSubview:_rightButton];
    
    
    _rightLabel = [[UILabel alloc]init];
    _rightLabel.frame = CGRectMake(ScreenWidth -100-ViewWidth(_rightButton)-25*AUTO_IPHONE6_WIDTH_375, 15*AUTO_IPHONE6_HEIGHT_667, 100*AUTO_IPHONE6_WIDTH_375, 25*AUTO_IPHONE6_HEIGHT_667);
    _rightLabel.font =JDFont(14);
    _rightLabel.hidden = YES;
    _rightLabel.textAlignment = NSTextAlignmentRight;
  //  _rightLabel.backgroundColor = [UIColor redColor];
    _rightLabel.text =@"请选择";
    [self.contentView addSubview:_rightLabel];


}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

   
}

@end
