//
//  JDTools.m
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "JDTools.h"

@implementation JDTools
#pragma mark - 颜色十六进制转换成UIColor
/**
 *   颜色十六进制转换成UIColor
 *
 *  @param str 十六进制颜色值
 *
 *  @return 返回UIColor
 */
+(UIColor *) stringToColor:(NSString *)str
{
    if (!str || [str isEqualToString:@""])
    {
        return nil;
    }
    unsigned red,green,blue;
    NSRange range;
    range.length = 2;
    range.location = 1;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&red];
    range.location = 3;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&green];
    range.location = 5;
    [[NSScanner scannerWithString:[str substringWithRange:range]] scanHexInt:&blue];
    UIColor *color= [UIColor colorWithRed:red/255.0f green:green/255.0f blue:blue/255.0f alpha:1];
    return color;
}



#pragma mark - 把格式化的JSON格式的字符串转换成字典
/**
 *  把格式化的JSON格式的字符串转换成字典
 *
 *  @param jsonString
 *
 *  @return jsonString JSON格式的字符串
 */
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err) {
        JDLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
#pragma mark - 把字典转换成JSON格式

+ (NSString*)wlDictionaryToJson:(NSDictionary *)dic {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
#pragma mark - 把数组转换成JSON格式
+ (NSString*)wlArrayToJson:(NSArray *)arr {
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:arr
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


#pragma mark - 创建label
+ (UILabel *)allocLabel:(NSString *)text font:(UIFont *)font textColor:(UIColor *)textColor frame:(CGRect)frame textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = font;
    label.textColor = textColor;
    label.textAlignment = textAlignment;
    label.backgroundColor = [UIColor clearColor];
    label.numberOfLines = 0;
    return label;
}

#pragma mark - 创建button
+ (UIButton *)allocButton:(NSString *)title textColor:(UIColor *)textColor nom_bg:(UIImage *)nom_bg hei_bg:(UIImage *)hei_bg frame:(CGRect)frame
{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setBackgroundImage:nom_bg forState:UIControlStateNormal];
    [btn setBackgroundImage:hei_bg forState:UIControlStateHighlighted];
    [btn setTitleColor:textColor forState:UIControlStateNormal];
    return btn;
}

#pragma mark - 创建imageview
+ (UIImageView *)allocImageView:(CGRect)frame image:(UIImage *)image
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.image = image;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.backgroundColor = [UIColor clearColor];
    return imageView;
}

@end
