//
//  JDTools.h
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDTools : NSObject

#pragma mark - 颜色十六进制转换成UIColor
+(UIColor *) stringToColor:(NSString *)str;

#pragma mark - 把格式化的JSON格式的字符串转换成字典
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

#pragma mark - 把字典转换成JSON格式
+ (NSString *)wlDictionaryToJson:(NSDictionary *)dic;

#pragma mark - 把数组转换成JSON格式
+ (NSString *)wlArrayToJson:(NSArray *)arr;

#pragma mark - 创建label
+ (UILabel *)allocLabel:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor frame:(CGRect)frame textAlignment:(NSTextAlignment)textAlignment;

#pragma mark - 创建button
+ (UIButton *)allocButton:(NSString *)title textColor:(UIColor *)textColor nom_bg:(UIImage *)nom_bg hei_bg:(UIImage *)hei_bg frame:(CGRect)frame;

#pragma mark - 创建imageView
+ (UIImageView *)allocImageView:(CGRect)frame image:(UIImage *)image;
@end
