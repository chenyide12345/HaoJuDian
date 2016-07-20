//
//  JD_BaseController.h
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//
/*
   导航控制器-基类
 
 */
#import <UIKit/UIKit.h>
#import "UIImage+Extension.h"

@interface JD_BaseController : UIViewController

@property (nonatomic,strong)MBProgressHUD *progressHud;
/**
 *  设置导航栏
 */
-(void)setNavBarImage;
/*
 设置导航栏背景颜色
 */

-(void)setNavBarBackgroundColor;

/*
 设置导航栏左侧图片
 @parma  imgName 左侧导航图片名称
 */

-(void)setNavigationLeftImage:(NSString *)imgName;

/*
  设置导航栏右侧图片
 @parma imgName 右侧导航图片名称
 */
-(void)setNavigationRightImage:(NSString *)imgName;

/*
 *  设置左侧导航栏标题
 *
 *  @param titleName  左侧导航标题名称
 *  @param fontSize   标题字号
 *  @param titleColor 标题颜色
 *  @param isEnable   是否可用
 */
-(void)setNavigationLeftTitle:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor*)titleColor isEnable:(BOOL)isEnable;


/*
 左侧导航点击事件
 */
-(void)NavigationLeftEvent;


/**
 * 显示菊花
 */

- (void)showHud;

/**
 * 隐藏菊花
 */

- (void)hidHud;

/**
 * 定制菊花下方显示字体
 */

- (void)showHudWithString:(NSString *)loadingText;

@end

















































