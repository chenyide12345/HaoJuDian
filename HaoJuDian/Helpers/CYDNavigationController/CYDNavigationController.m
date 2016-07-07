//
//  JTNavigationController.m
//  JTNavigationController
//
//  Created by Tian on 16/1/23.
//  Copyright © 2016年 TianJiaNan. All rights reserved.
//

#import "CYDNavigationController.h"
#import "CYDBaseNavigationController.h"

#define kDefaultBackImageName @"backImage"

#pragma mark - JTWrapNavigationController

@interface CYDWrapNavigationController : UINavigationController

@end

@implementation CYDWrapNavigationController

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    return [[CYDBaseNavigationController shareNavgationController] popViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
   return [[CYDBaseNavigationController shareNavgationController] popToRootViewControllerAnimated:animated];
}

- (NSArray<UIViewController *> *)popToViewController:(UIViewController *)viewController animated:(BOOL)animated {
    NSInteger index = [[CYDBaseNavigationController shareNavgationController].rootViewControllers indexOfObject:viewController];
    return [[CYDBaseNavigationController shareNavgationController] popToViewController:[CYDBaseNavigationController shareNavgationController].viewControllers[index] animated:animated];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    UIImage *backButtonImage;
    
    if ([CYDBaseNavigationController shareNavgationController].backButtonImage) {
        backButtonImage = [CYDBaseNavigationController shareNavgationController].backButtonImage;
    } else {
        backButtonImage = [UIImage imageNamed:kDefaultBackImageName];
    }
    
    viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:backButtonImage style:UIBarButtonItemStylePlain target:self action:@selector(didTapBackButton)];
    [viewController.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    [[CYDBaseNavigationController shareNavgationController] pushViewController:[CYDWrapViewController wrapViewControllerWithViewController:viewController] animated:animated];
}

- (void)didTapBackButton {
    [[CYDBaseNavigationController shareNavgationController] popViewControllerAnimated:YES];
}

@end

#pragma mark - JTWrapViewController

@implementation CYDWrapViewController

+ (CYDWrapViewController *)wrapViewControllerWithViewController:(UIViewController *)viewController {
    
    CYDWrapNavigationController *wrapNavController = [[CYDWrapNavigationController alloc] init];
    wrapNavController.viewControllers = @[viewController];
    
    CYDWrapViewController *wrapViewController = [[CYDWrapViewController alloc] init];
    [wrapViewController.view addSubview:wrapNavController.view];
    [wrapViewController addChildViewController:wrapNavController];
    
    return wrapViewController;
}

- (UITabBarItem *)tabBarItem {
    return [self rootViewController].tabBarItem;
}

- (NSString *)title {
    return [self rootViewController].title;
}

- (UIViewController *)childViewControllerForStatusBarStyle {
    return [self rootViewController];
}

- (UIViewController *)childViewControllerForStatusBarHidden {
    return [self rootViewController];
}

- (UIViewController *)rootViewController {
    CYDWrapNavigationController *wrapNavController = self.childViewControllers.firstObject;
    return wrapNavController.viewControllers.firstObject;
}

@end

#pragma mark - JTNavigationController

@interface CYDNavigationController ()

@end

@implementation CYDNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBarHidden:YES];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    if (self = [super init]) {
        self.viewControllers = @[[CYDWrapViewController wrapViewControllerWithViewController:rootViewController]];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.viewControllers = @[[CYDWrapViewController wrapViewControllerWithViewController:self.viewControllers.firstObject]];
    }
    return self;
}

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com