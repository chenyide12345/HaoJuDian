//
//  JTBaseNavigationController.h
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYDBaseNavigationController : UINavigationController

+ (instancetype)shareNavgationController;

@property (nonatomic, assign) BOOL fullScreenPopGestureEnable; /**<是否开启全屏侧滑返回手势*/

@property (nonatomic, strong) UIImage *backButtonImage; /**<返回按钮图片*/

@property (nonatomic, copy) NSArray<UIViewController *> *rootViewControllers; /**<真正的viewControllers*/

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com