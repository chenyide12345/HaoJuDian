//
//  AppDelegate.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "AppDelegate.h"
#import "CYDBaseNavigationController.h"
#import "CYDNavigationController.h"
#import "MainViewController.h"
#import "LoginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    [CYDBaseNavigationController shareNavgationController].fullScreenPopGestureEnable = YES; //开启全屏返回手势
    
    [CYDBaseNavigationController shareNavgationController].backButtonImage = [UIImage imageNamed:@"backImage"]; //设置返回按钮图片
    
    self.window.rootViewController = [[CYDBaseNavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
    
    
//    self.loginNav = [[UINavigationController alloc] initWithRootViewController:[LoginViewController new]];
//    self.loginNav.navigationBar.barTintColor = MAINCOLOR;
//    self.loginNav.navigationBar.translucent = YES;
//    self.loginNav.navigationBar.tintColor = [UIColor whiteColor];
//    self.loginNav.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
//    CYDNavigationController *loginNav = [[CYDNavigationController alloc] initWithRootViewController:[LoginViewController new]];
//    self.loginRootNav = [[CYDBaseNavigationController alloc] initWithRootViewController:loginNav];
//    self.window.rootViewController = self.loginRootNav;

    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
