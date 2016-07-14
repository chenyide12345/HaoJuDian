//
//  MainViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MainViewController.h"
#import "CYDNavigationController.h"
#import "MeetViewController.h"
#import "SearchViewController.h"
#import "MessageViewController.h"
#import "MineViewController.h"
#import "FlowerViewController.h"
#import "NearbyViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.translucent = NO;
    //配置标签栏当前选中标签的渲染颜色
//    self.tabBar.tintColor = MAINCOLOR;
//    self.selectedIndex = 1;
    
    MeetViewController *meetVC = [[MeetViewController alloc] init];
    //    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    meetVC.tabBarItem.title = @"邂逅";
    [meetVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MAINCOLOR} forState:UIControlStateSelected];
    meetVC.tabBarItem.image = [UIImage imageNamed:@"xiehouhui"];
    meetVC.tabBarItem.selectedImage = [UIImage imageNamed:@"xiehouhong"];
    UIImage *image = [meetVC.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    meetVC.tabBarItem.selectedImage = image;
//    meetVC.tabBarItem.badgeValue = @"1";
    meetVC.tabBarItem.tag = 10001;
    
    
    
    CYDNavigationController *firstNav = [[CYDNavigationController alloc] initWithRootViewController:meetVC];
    
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    //    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    messageVC.tabBarItem.title = @"消息";
    [messageVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MAINCOLOR} forState:UIControlStateSelected];
    messageVC.tabBarItem.image = [UIImage imageNamed:@"xiaoxihui"];
    messageVC.tabBarItem.selectedImage = [UIImage imageNamed:@"xiaoxihong"];
    UIImage *image1 = [messageVC.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    messageVC.tabBarItem.selectedImage = image1;
//    messageVC.tabBarItem.badgeValue = @"2";
    messageVC.tabBarItem.tag = 10002;
    CYDNavigationController *secondNav = [[CYDNavigationController alloc] initWithRootViewController:messageVC];
    
    NearbyViewController *nearbyVC = [[NearbyViewController alloc] init];
    //    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    nearbyVC.tabBarItem.title = @"附近";
    [nearbyVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MAINCOLOR} forState:UIControlStateSelected];
    nearbyVC.tabBarItem.image = [UIImage imageNamed:@"fujinhui"];
    nearbyVC.tabBarItem.selectedImage = [UIImage imageNamed:@"fujinhong"];
    UIImage *image2 = [nearbyVC.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nearbyVC.tabBarItem.selectedImage = image2;
//    nearbyVC.tabBarItem.badgeValue = @"2";
    nearbyVC.tabBarItem.tag = 10003;
    CYDNavigationController *thirdNav = [[CYDNavigationController alloc] initWithRootViewController:nearbyVC];
    
    FlowerViewController *flowerVC = [[FlowerViewController alloc] init];
    //    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    flowerVC.tabBarItem.title = @"情花";
    [flowerVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MAINCOLOR} forState:UIControlStateSelected];
    flowerVC.tabBarItem.image = [UIImage imageNamed:@"qinghuahui"];
    flowerVC.tabBarItem.selectedImage = [UIImage imageNamed:@"qinghuahong"];
    UIImage *image3 = [flowerVC.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    flowerVC.tabBarItem.selectedImage = image3;
//    flowerVC.tabBarItem.badgeValue = @"2";
    flowerVC.tabBarItem.tag = 10004;
    CYDNavigationController *fourthNav = [[CYDNavigationController alloc] initWithRootViewController:flowerVC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    //    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    mineVC.tabBarItem.title = @"我的";
    [mineVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:MAINCOLOR} forState:UIControlStateSelected];
    mineVC.tabBarItem.image = [UIImage imageNamed:@"wodehui"];
    mineVC.tabBarItem.selectedImage = [UIImage imageNamed:@"wodehong"];
    UIImage *image4 = [mineVC.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    mineVC.tabBarItem.selectedImage = image4;
//    mineVC.tabBarItem.badgeValue = @"2";
    mineVC.tabBarItem.tag = 10005;
    CYDNavigationController *fifthNav = [[CYDNavigationController alloc] initWithRootViewController:mineVC];
    
    self.viewControllers = @[firstNav, secondNav, thirdNav, fourthNav, fifthNav];
    self.selectedIndex = 4;
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
