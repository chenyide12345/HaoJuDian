//
//  ShowViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/8.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "ShowViewController.h"

@interface ShowViewController ()

@end

@implementation ShowViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self setupViews];
}


#pragma mark -
#pragma mark - 加载导航栏

- (void)setupNav
{
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font = [UIFont systemFontOfSize:17];  //设置文本字体与大小
    titleLabel.textColor = ZITIWHITECOLOR;  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"显示设置";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = BACKGROUNDCOLOR;
}



#pragma mark - 加载Views

- (void)setupViews
{
    NSArray * titAry = [NSArray arrayWithObjects:@"显示婚姻状态", @"显示我的资料", @"显示我的电话", @"显示我的QQ", @"显示我的微信", nil];
    
    for (int i = 0; i < 5; i++) {
        
        CGFloat viewH = 49;
        
        UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT + 44 + viewH*i, WIDTH, viewH)];
        view1.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view1];
        
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, viewH/2 - 10, 60, 20)];
        label1.text = [titAry objectAtIndex:i];
        label1.textColor = ZITIBLACKCOLOR;
        label1.textAlignment = NSTextAlignmentLeft;
        label1.backgroundColor = [UIColor clearColor];
        label1.layer.cornerRadius = 6;
        label1.layer.masksToBounds = YES;
        [label1 sizeToFit];
        [view1 addSubview:label1];
        
        
        UILabel * lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, viewH - 0.5, WIDTH, 0.5)];
        lineLab.backgroundColor = BACKGROUNDCOLOR;
        [view1 addSubview:lineLab];
        
        
        UISwitch * cSwitch = [[UISwitch alloc] initWithFrame:
                         CGRectMake(WIDTH - 61, (viewH-31)/2, 0, 0)];
        [cSwitch setOn:YES];
        cSwitch.onTintColor = MAINCOLOR;
//        cSwitch.tintColor = MAINCOLOR;
        [view1 addSubview:cSwitch];
        
        [cSwitch addTarget:self
                          action:@selector(cSwitchChanged:)
                forControlEvents:UIControlEventValueChanged];
        
        
    }
    
}



- (void)cSwitchChanged:(UISwitch *)sender
{
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
