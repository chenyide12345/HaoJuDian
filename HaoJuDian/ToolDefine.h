//
//  ToolDefine.h
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//
/*
 
     常用工具宏定义
 */
#ifndef ToolDefine_h
#define ToolDefine_h

#define IS_IOS7 (([[[UIDevice currentDevice] systemVersion] floatValue] > 6.9) ? YES : NO)
#define IOS9 [[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0
#define HEIGHT ((IS_IOS7)?([UIScreen mainScreen].bounds.size.height):([UIScreen mainScreen].bounds.size.height - 20))
#define WIDTH [UIScreen mainScreen].bounds.size.width
#define TOPHEIGHT ((IS_IOS7) ? 20 : 0) //状态栏高度
#define MAINCOLOR LRRGBColor(255, 128, 158) //主色调
#define BACKGROUNDCOLOR LRRGBColor(246, 246, 246)

#define ZITIBLACKCOLOR LRRGBColor(50, 50, 50)
#define ZITIGRAYCOLOR LRRGBColor(135, 135, 135)
#define ZITIWHITECOLOR LRRGBColor(255, 255, 255)
#define ANNIUGRAYCOLOR LRRGBColor(224, 224, 224)
#define XIANCOLOR LRRGBColor(234, 234, 234)

#define WINDOW [[UIApplication sharedApplication] keyWindow]
#define DEFAULTS [NSUserDefaults standardUserDefaults]

#define BaseURL @"http://m.hjd521.com"
//#ifdef DEBUG
//#define LRLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
//#else
//#define LRLog(...)
//#endif


//获取temp
#define kPathTemp NSTemporaryDirectory()
//获取沙盒 Document
#define kPathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//获取沙盒 Cache
#define kPathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



//判断是真机还是模拟器
#if TARGET_OS_IPHONE
//iPhone Device
#endif
#if TARGET_IPHONE_SIMULATOR
//iPhone Simulator
#endif


//判断是否为iPhone
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
//判断是否为iPad
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
//判断是否为ipod
#define IS_IPOD ([[[UIDevice currentDevice] model] isEqualToString:@"iPod touch"])
// 判断是否为 iPhone 5SE
#define iPhone5SE [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
// 判断是否为iPhone 6/6s
#define iPhone6_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
// 判断是否为iPhone 6Plus/6sPlus
#define iPhone6Plus_6sPlus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
//获取系统版本
#define IOS_SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
//判断 iOS 8 或更高的系统版本
#define IOS_VERSION_8_OR_LATER (([[[UIDevice currentDevice] systemVersion] floatValue] >=8.0)? (YES):(NO))


//此宏定义非常好用，但是小伙伴需要CocoaPods导入第三方框架：Toast
//使用方法如下：
//LRToast(@"网络加载失败");
#define LRToast(str)              CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle]; \
[kWindow  makeToast:str duration:0.6 position:CSToastPositionCenter style:style];\
kWindow.userInteractionEnabled = NO; \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{\
kWindow.userInteractionEnabled = YES;\
});\


//设置随机颜色
#define LRRandomColor [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1.0]

//设置RGB颜色/设置RGBA颜色
#define LRRGBColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LRRGBAColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(r)/255.0 blue:(r)/255.0 alpha:a]
// clear背景颜色
#define LRClearColor [UIColor clearColor]


//获取当前语言
#define LRCurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])


#endif /* ToolDefine_h */
