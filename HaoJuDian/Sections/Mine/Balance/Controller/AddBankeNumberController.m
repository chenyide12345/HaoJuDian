//
//  AddBankeNumberController.m
//  HaoJuDian
//
//  Created by ming on 16/7/20.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "AddBankeNumberController.h"

@interface AddBankeNumberController ()
{

    UILabel *_titleLabel;
}

@property (nonatomic,strong)UIView *banckView;//背景图



@end

@implementation AddBankeNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"添加银行卡";
     self.view.backgroundColor = kColor(245, 245, 245);
    
    [self creatFieldUserInfoView];
    
}
-(void)creatFieldUserInfoView
{
    UILabel *titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(10*autoSizeScaleX, 0, 200*AUTO_IPHONE6_WIDTH_375, 40*AUTO_IPHONE6_HEIGHT_667)];
    titleLabel.textColor =[JDTools stringToColor:@"#2f2f2f"];
    titleLabel.font = JDFont(15);

}















@end
