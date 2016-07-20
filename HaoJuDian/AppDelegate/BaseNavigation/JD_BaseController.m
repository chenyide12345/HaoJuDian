//
//  JD_BaseController.m
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "JD_BaseController.h"


@interface JD_BaseController ()

@end

@implementation JD_BaseController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.tabBarController.tabBar.hidden= YES;
    


}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setNavBarBackgroundColor];
    
    [self setNavigationLeftImage:@"backImage"];
    
}

/*
  设置导航栏
 */
-(void)setNavBarImage
{
    UIImage *image = [UIImage imageNamed:IsiPhone4?@"":@""];

    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    NSDictionary *attribute = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:JDFont(17)};
    
    [self.navigationController.navigationBar setTitleTextAttributes:attribute];
}

/*
 导航背景颜色
 */
-(void)setNavBarBackgroundColor
{
    
   [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:MAINCOLOR] forBarMetrics:UIBarMetricsDefault];
    
    
    
    self.navigationController.navigationBar.shadowImage = [[UIImage alloc]init];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    [self.navigationController.navigationBar setTintColor:[UIColor whiteColor]];

    NSDictionary *attribute = @{NSForegroundColorAttributeName:[UIColor whiteColor],
                                NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    [self.navigationController.navigationBar setTitleTextAttributes:attribute];

}
/**
 *  设置左侧导航栏图片
 *
 *  @param imageName 左侧导航图片名称
 */
-(void)setNavigationLeftImage:(NSString *)imgName
{

    UIImage *image = [UIImage imageNamed:imgName];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithImage:image style:UIBarButtonItemStyleBordered target:self action:@selector(NavigationLeftEvent)];
    self.navigationItem.leftBarButtonItem  = item;
    

}
/**
 *  设置右侧导航栏图片
 *
 *  @param imageName 右侧导航图片名称
 */

-(void)setNavigationRightImage:(NSString *)imgName
{
    UIImage *image=[UIImage imageNamed:imgName];
    image=[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleBordered target:self action:@selector(NavigationRightEvent)];
    self.navigationItem.rightBarButtonItem=item;


}


/**
 *  设置左侧导航栏标题
 *
 *  @param titleName  左侧导航标题名称
 *  @param fontSize   标题字号
 *  @param titleColor 标题颜色
 *  @param isEnable   是否可用
 */
-(void)setNavigationLeftTitle:(NSString *)titleName fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor isEnable:(BOOL)isEnable
{
    UIBarButtonItem *item=[[UIBarButtonItem alloc] initWithTitle:titleName style:UIBarButtonItemStyleDone target:self action:isEnable?nil:nil];
    self.navigationItem.leftBarButtonItem=item;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] =JDFont(fontSize);
    attrs[NSForegroundColorAttributeName] =titleColor;
    [item setTitleTextAttributes:attrs forState:isEnable?UIControlStateNormal:UIControlStateDisabled];
}

/**
 * 左侧导航 点击事件
 */
-(void)NavigationLeftEvent
{
    
    [self.navigationController popViewControllerAnimated:YES];

}
-(void)NavigationRightEvent
{


}
- (MBProgressHUD *)progressHud
{
    
    if (!_progressHud) {
        
        _progressHud = [[MBProgressHUD alloc] initWithView:self.view];
        
        _progressHud.frame = self.view.bounds;
        
        _progressHud.minSize = CGSizeMake(100, 100);
        
        _progressHud.mode = MBProgressHUDModeIndeterminate;
        
        _progressHud.label.text = @"加载中...";
        
        [self.view addSubview:_progressHud];
    }
    return _progressHud;
}

/**
 * 显示菊花
 */

- (void)showHud
{
    [self.progressHud showAnimated:YES];
   // [self.progressHud show:YES];
}

/**
 * 隐藏菊花
 */

- (void)hidHud
{
    [self.progressHud hideAnimated:YES];
   // [self.progressHud hide:YES];
}

/**
 * 定制菊花下方显示字体
 */

- (void)showHudWithString:(NSString *)loadingText
{
    
    self.progressHud.label.text = loadingText;
    
    [self.progressHud showAnimated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
