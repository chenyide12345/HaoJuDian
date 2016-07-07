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
    self.tabBar.tintColor = MAINCOLOR;
//    self.selectedIndex = 1;
    
    MeetViewController *meetVC = [[MeetViewController alloc] init];
    //    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    meetVC.tabBarItem.title = @"邂逅";
    meetVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_mainframe"];
    meetVC.tabBarItem.badgeValue = @"1";
    meetVC.tabBarItem.tag = 10001;
    
//    [meetVC.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:MAINCOLOR,NSForegroundColorAttributeName, nil] forState:UIControlStateSelected];
////    [meetVC.tabBarController.tabBar setTintColor:MAINCOLOR];
//    UIImage *image = [meetVC.tabBarItem.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    meetVC.tabBarItem.selectedImage = image;
    
    
    CYDNavigationController *firstNav = [[CYDNavigationController alloc] initWithRootViewController:meetVC];
    
    MessageViewController *messageVC = [[MessageViewController alloc] init];
    //    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    messageVC.tabBarItem.title = @"消息";
    messageVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_discover"];
    messageVC.tabBarItem.badgeValue = @"2";
    messageVC.tabBarItem.tag = 10002;
    CYDNavigationController *secondNav = [[CYDNavigationController alloc] initWithRootViewController:messageVC];
    
    NearbyViewController *nearbyVC = [[NearbyViewController alloc] init];
    //    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    nearbyVC.tabBarItem.title = @"附近";
    nearbyVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    nearbyVC.tabBarItem.badgeValue = @"2";
    nearbyVC.tabBarItem.tag = 10003;
    CYDNavigationController *thirdNav = [[CYDNavigationController alloc] initWithRootViewController:nearbyVC];
    
    FlowerViewController *flowerVC = [[FlowerViewController alloc] init];
    //    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    flowerVC.tabBarItem.title = @"情花";
    flowerVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_contacts"];
    flowerVC.tabBarItem.badgeValue = @"2";
    flowerVC.tabBarItem.tag = 10004;
    CYDNavigationController *fourthNav = [[CYDNavigationController alloc] initWithRootViewController:flowerVC];
    
    MineViewController *mineVC = [[MineViewController alloc] init];
    //    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    mineVC.tabBarItem.title = @"我的";
    mineVC.tabBarItem.image = [UIImage imageNamed:@"tabbar_me"];
    mineVC.tabBarItem.badgeValue = @"2";
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
