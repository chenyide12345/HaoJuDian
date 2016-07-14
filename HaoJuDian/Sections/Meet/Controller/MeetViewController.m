//
//  MeetViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MeetViewController.h"
#import "UIColor+FlatColors.h"
#import "CardView.h"
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>

@interface MeetViewController ()<ZLSwipeableViewDelegate, ZLSwipeableViewDataSource>

@property (nonatomic, strong) NSArray *colors;
@property (nonatomic) NSUInteger colorIndex;
@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) UIButton * loveBtn;
@property (nonatomic, strong) UIImageView * loveImg;
@property (nonatomic, strong) UIButton * nextBtn;
@property (nonatomic, strong) UIImageView * nextImg;

@end

@implementation MeetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.title = @"邂逅";
    [self setupNav];
    [self setupViews];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark -
#pragma mark - 加载导航栏

- (void)setupNav
{
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font = [UIFont systemFontOfSize:17];  //设置文本字体与大小
    titleLabel.textColor = ZITIWHITECOLOR;  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"邂逅";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *leftBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [leftBtn setImage:[UIImage imageNamed:@"dingwei"] forState:UIControlStateNormal];
    [leftBtn setImageEdgeInsets:UIEdgeInsetsMake(0, -10, 0, 10)];
    [leftBtn addTarget:self action:@selector(didLeftButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
    
    
    UIButton *rightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [rightBtn setImage:[UIImage imageNamed:@"xindong"] forState:UIControlStateNormal];
    [rightBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 10, 0, -10)];
    [rightBtn addTarget:self action:@selector(didRightButton:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    
//    self.navigationController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"backImage"] style:UIBarButtonItemStylePlain target:self action:@selector(didLeftButton:)];
//    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    
//    self.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(didRightButton:)];
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
}



#pragma mark - 加载Views

- (void)setupViews
{
    UIImageView * backImg = [[UIImageView alloc] initWithImage:[self blurryImage:[UIImage imageNamed:@"nvdatu"] withBlurLevel:1]];
    backImg.frame = self.view.bounds;
    [self.view addSubview:backImg];
    
    self.colorIndex = 0;
    self.colors = @[
                    @"Turquoise",
                    @"Green Sea",
                    @"Emerald",
                    @"Nephritis",
                    @"Peter River",
                    @"Belize Hole",
                    @"Amethyst",
                    @"Wisteria",
                    @"Wet Asphalt",
                    @"Midnight Blue",
                    @"Sun Flower",
                    @"Orange",
                    @"Carrot",
                    @"Pumpkin",
                    @"Alizarin",
                    @"Pomegranate",
                    @"Clouds",
                    @"Silver",
                    @"Concrete",
                    @"Asbestos"
                    ];
    self.titles = @[
                    @"Turquoise",
                    @"Green Sea",
                    @"Emerald",
                    @"Nephritis",
                    @"Peter River",
                    @"Belize Hole",
                    @"Amethyst",
                    @"Wisteria",
                    @"Wet Asphalt",
                    @"Midnight Blue",
                    @"Sun Flower",
                    @"Orange",
                    @"Carrot",
                    @"Pumpkin",
                    @"Alizarin",
                    @"Pomegranate",
                    @"Clouds",
                    @"Silver",
                    @"Concrete",
                    @"Asbestos"
                    ];
    
    
    [self.view addSubview:self.swipeableView];
    ZLSwipeableView *swipeableView = _swipeableView;
    // Required Data Source
    self.swipeableView.dataSource = self;
    
    // Optional Delegate
    self.swipeableView.delegate = self;
    self.swipeableView.allowedDirection = ZLSwipeableViewDirectionHorizontal;
    
    CGFloat scale1 = 0.14;
    CGFloat wid1 = WIDTH * scale1;
    CGFloat scale2 = 0.2;
    CGFloat wid2 = WIDTH * scale2;
    CGFloat jiange = 0.06*WIDTH;
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor clearColor];
    button1.layer.cornerRadius = wid1/2;
    [button1 setImage:[UIImage imageNamed:@"fenxiang"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"fenxianganxia"] forState:UIControlStateHighlighted];
    [button1 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [button1 addTarget:self action:@selector(shareBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];

    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor clearColor];
    button2.layer.cornerRadius = wid2/2;
    [button2 setImage:[UIImage imageNamed:@"liwu"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"liwuanxia"] forState:UIControlStateHighlighted];
    [button2 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [button2 addTarget:self action:@selector(liwuBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.backgroundColor = [UIColor clearColor];
    button3.layer.cornerRadius = wid2/2;
    [button3 setImage:[UIImage imageNamed:@"zhongzi"] forState:UIControlStateNormal];
    [button3 setImage:[UIImage imageNamed:@"zhongzianxia"] forState:UIControlStateHighlighted];
    [button3 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [button3 addTarget:self action:@selector(beanBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.backgroundColor = [UIColor clearColor];
    button4.layer.cornerRadius = wid1/2;
    [button4 setImage:[UIImage imageNamed:@"liaotian"] forState:UIControlStateNormal];
    [button4 setImage:[UIImage imageNamed:@"liaotiananxia"] forState:UIControlStateHighlighted];
    [button4 setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [button4 addTarget:self action:@selector(chatBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    
    
    [self.swipeableView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(self.view.mas_top).offset(12.5);
        make.left.equalTo(self.view.mas_left).offset(12);
        make.bottom.equalTo(button1.mas_top).offset(-13);
        make.right.equalTo(self.view.mas_right).offset(-12);
        
    }];
    
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.top.equalTo(self.swipeableView.mas_bottom).offset(13);
        make.left.equalTo(self.view.mas_left).offset(25);
        make.bottom.equalTo(self.view.mas_bottom).offset(-55);
//        make.right.equalTo(button2.mas_left).offset(-22.5);
        
        make.width.equalTo([NSNumber numberWithFloat:wid1]);
        make.height.equalTo([NSNumber numberWithFloat:wid1]);
        
        make.width.equalTo(button4.mas_width);
        make.height.equalTo(button4.mas_height);
        
        
    }];
    
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.top.equalTo(self.swipeableView.mas_bottom).offset(27.5);
        make.left.equalTo(button1.mas_right).offset(jiange);
        make.bottom.equalTo(self.view.mas_bottom).offset(-17.5);
//        make.right.equalTo(button3.mas_left).offset(-11);
        
        make.width.equalTo([NSNumber numberWithFloat:wid2]);
        make.height.equalTo([NSNumber numberWithFloat:wid2]);
        
        make.width.equalTo(button3.mas_width);
        make.height.equalTo(button3.mas_height);
        
    }];
    
    [button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.top.equalTo(self.swipeableView.mas_bottom).offset(27.5);
//        make.left.equalTo(button2.mas_right).offset(11);
        make.bottom.equalTo(self.view.mas_bottom).offset(-17.5);
        make.right.equalTo(button4.mas_left).offset(-jiange);
        
        make.width.equalTo(button2.mas_width);
        make.height.equalTo(button2.mas_height);
        
    }];
    
    [button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        
//        make.top.equalTo(self.swipeableView.mas_bottom).offset(13);
//        make.left.equalTo(button3.mas_right).offset(22.5);
        make.bottom.equalTo(self.view.mas_bottom).offset(-55);
        make.right.equalTo(self.view.mas_right).offset(-25);
        
        make.width.equalTo(button1.mas_width);
        make.height.equalTo(button1.mas_height);
        
    }];
    
    
    CGFloat btnY = 0.27*HEIGHT;
    CGFloat btnW = 0.286*WIDTH;
    CGFloat btnH = 0.082*HEIGHT;
    
    if (HEIGHT == 480) {
        btnY = 0.27*HEIGHT;
        btnH = 0.082*HEIGHT + 10;
    } else if (HEIGHT == 568){
        btnY = 0.35*HEIGHT;
        btnH = 0.082*HEIGHT + 5;
    } else if (HEIGHT == 667) {
        btnY = 0.4*HEIGHT;
    } else {
        btnY = 0.4*HEIGHT;
    }
    
    self.loveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loveBtn.backgroundColor = [UIColor clearColor];
    self.loveBtn.frame = CGRectMake(0, btnY, btnW, btnH);
    [self.loveBtn setBackgroundImage:[UIImage imageNamed:@"zuocebian"] forState:UIControlStateNormal];
    [self.loveBtn addTarget:self action:@selector(loveBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loveBtn];
    
    UILabel *loveLab = [[UILabel alloc] initWithFrame:CGRectMake(10, btnH/2-10, 30, 20)];
    loveLab.text = @"喜欢";
    loveLab.textColor = ZITIWHITECOLOR;
    loveLab.font = [UIFont systemFontOfSize:12];
    [self.loveBtn addSubview:loveLab];
    
    self.loveImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xihuan"]];
    self.loveImg.frame = CGRectMake(btnW - btnH, btnH/2-btnH/4, btnH/2+3, btnH/2);
    [self.loveBtn addSubview:self.loveImg];

    
    self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.nextBtn.backgroundColor = [UIColor clearColor];
    self.nextBtn.frame = CGRectMake(WIDTH - btnW, btnY, btnW, btnH);
    [self.nextBtn setBackgroundImage:[UIImage imageNamed:@"youcebian"] forState:UIControlStateNormal];
    [self.nextBtn addTarget:self action:@selector(nextBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.nextBtn];
    
    
    self.nextImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xiayiwei"]];
    self.nextImg.frame = CGRectMake(btnH/2-5, btnH/2-btnH/4, btnH/2, btnH/2);
    [self.nextBtn addSubview:self.nextImg];
    
    UILabel *nextLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.nextImg.frame) + 5, btnH/2-10, 40, 20)];
    nextLab.text = @"下一位";
    nextLab.textColor = ZITIWHITECOLOR;
    nextLab.font = [UIFont systemFontOfSize:12];
    [self.nextBtn addSubview:nextLab];
    
}



- (ZLSwipeableView *)swipeableView
{
    if (_swipeableView == nil) {
        _swipeableView = [[ZLSwipeableView alloc] initWithFrame:CGRectZero];
    }
    return _swipeableView;
}
- (void)viewDidLayoutSubviews {
    [self.swipeableView loadViewsIfNeeded];
}

#pragma mark - ZLSwipeableViewDelegate

- (void)swipeableView:(ZLSwipeableView *)swipeableView
         didSwipeView:(UIView *)view
          inDirection:(ZLSwipeableViewDirection)direction
{
    NSLog(@"did swipe in direction: %zd", direction);
    
    if (direction == ZLSwipeableViewDirectionLeft) {
        [self scaleLoveImgView];
    }
    
    if (direction == ZLSwipeableViewDirectionRight) {
        [self rotateNextImgView];
    }
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView didCancelSwipe:(UIView *)view
{
    NSLog(@"did cancel swipe");
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
  didStartSwipingView:(UIView *)view
           atLocation:(CGPoint)location
{
    NSLog(@"did start swiping at location: x %f, y %f", location.x, location.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
          swipingView:(UIView *)view
           atLocation:(CGPoint)location
          translation:(CGPoint)translation
{
    NSLog(@"swiping at location: x %f, y %f, translation: x %f, y %f", location.x, location.y,
          translation.x, translation.y);
}

- (void)swipeableView:(ZLSwipeableView *)swipeableView
    didEndSwipingView:(UIView *)view
           atLocation:(CGPoint)location
{
    NSLog(@"did end swiping at location: x %f, y %f", location.x, location.y);
}

#pragma mark - ZLSwipeableViewDataSource

- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView {
    if (self.colorIndex >= self.colors.count || self.colorIndex >= self.titles.count) {
        self.colorIndex = 0;
    }
    
    CardView *view = [[CardView alloc] initWithFrame:swipeableView.bounds];
    // colors
    view.backgroundColor = [self colorForName:self.colors[self.colorIndex]];
    view.backgroundColor = [UIColor whiteColor];
    // titles
    view.labelTitle.text = self.titles[self.colorIndex];
    view.imageView.image = [UIImage imageNamed:@"nvdatu"];
    // ++
    self.colorIndex++;
    return view;
}

#pragma mark - () - color

- (UIColor *)colorForName:(NSString *)name {
    NSString *sanitizedName = [name stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *selectorString = [NSString stringWithFormat:@"flat%@Color", sanitizedName];
    Class colorClass = [UIColor class];
    return [colorClass performSelector:NSSelectorFromString(selectorString)];
}

#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif



#pragma mark - 定位附近

- (void)didLeftButton:(UIButton *)sender
{
    
}


#pragma mark - 喜欢列表

- (void)didRightButton:(UIButton *)sender
{
    
}



#pragma mark - 喜欢方法

- (void)loveBtnMethod:(UIButton *)sender
{
    [self.swipeableView swipeTopViewToLeft];
    
    [self scaleLoveImgView];
    
//    //去掉所有动画
//    [self.loveImg.layer removeAllAnimations];
//    //去掉key动画
//    [self.loveImg.layer removeAnimationForKey:@"animationGroup"];
    
}


#pragma mark - 下一位方法

- (void)nextBtnMethod:(UIButton *)sender
{
    [self.swipeableView swipeTopViewToRight];
    [self rotateNextImgView];
}

#pragma mark - 分享

- (void)shareBtnMethod:(UIButton *)sender
{
    
}


#pragma mark - 送礼物

- (void)liwuBtnMethod:(UIButton *)sender
{
    
}


#pragma mark - 情豆

- (void)beanBtnMethod:(UIButton *)sender
{
    
}


#pragma mark - 聊天

- (void)chatBtnMethod:(UIButton *)sender
{
    
}


#pragma mark - 放大喜欢图片

- (void)scaleLoveImgView
{
    //放大动画
    CABasicAnimation *scaleAnimation1 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation1.fromValue = [NSNumber numberWithFloat:1.0];
    scaleAnimation1.toValue = [NSNumber numberWithFloat:2.0];
    scaleAnimation1.duration = 0.5f;
    scaleAnimation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    //透明度变化
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    opacityAnimation.toValue = [NSNumber numberWithFloat:0.1];
    
    //放大动画
    CABasicAnimation *scaleAnimation2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation2.fromValue = [NSNumber numberWithFloat:2.0];
    scaleAnimation2.toValue = [NSNumber numberWithFloat:5.0];
    scaleAnimation2.duration = 0.5f;
    scaleAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = 1.0f;
    animationGroup.autoreverses = NO;   //是否重播，原动画的倒播
    animationGroup.repeatCount = 1.0;//HUGE_VALF;
    animationGroup.removedOnCompletion = YES;
    //HUGE_VALF,源自math.h
    [animationGroup setAnimations:[NSArray arrayWithObjects:scaleAnimation1, opacityAnimation, scaleAnimation2, nil]];
    
    //将上述两个动画编组
    [self.loveImg.layer addAnimation:animationGroup forKey:@"animationGroup"];
}


#pragma mark - 旋转下一位图片

- (void)rotateNextImgView
{
    //旋转动画
    CABasicAnimation* rotationAnimation =
    [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
    rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 2];
    // 3 is the number of 360 degree rotations
    // Make the rotation animation duration slightly less than the other animations to give it the feel
    // that it pauses at its largest scale value
    rotationAnimation.duration = 1.0f;
    rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]; //缓入缓出
    
    [self.nextImg.layer addAnimation:rotationAnimation forKey:nil];
}


#pragma mark - 加模糊效果，image是图片，blur是模糊度

- (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur {
    //模糊度,
    if ((blur < 0.1f) || (blur > 2.0f)) {
        blur = 0.5f;
    }
    
    //boxSize必须大于0
    int boxSize = (int)(blur * 100);
    boxSize -= (boxSize % 2) + 1;
    NSLog(@"boxSize:%i",boxSize);
    //图像处理
    CGImageRef img = image.CGImage;
    //需要引入#import <Accelerate/Accelerate.h>
    /*
     This document describes the Accelerate Framework, which contains C APIs for vector and matrix math, digital signal processing, large number handling, and image processing.
     本文档介绍了Accelerate Framework，其中包含C语言应用程序接口（API）的向量和矩阵数学，数字信号处理，大量处理和图像处理。
     */
    
    //图像缓存,输入缓存，输出缓存
    vImage_Buffer inBuffer, outBuffer;
    vImage_Error error;
    //像素缓存
    void *pixelBuffer;
    
    //数据源提供者，Defines an opaque type that supplies Quartz with data.
    CGDataProviderRef inProvider = CGImageGetDataProvider(img);
    // provider’s data.
    CFDataRef inBitmapData = CGDataProviderCopyData(inProvider);
    
    //宽，高，字节/行，data
    inBuffer.width = CGImageGetWidth(img);
    inBuffer.height = CGImageGetHeight(img);
    inBuffer.rowBytes = CGImageGetBytesPerRow(img);
    inBuffer.data = (void*)CFDataGetBytePtr(inBitmapData);
    
    //像数缓存，字节行*图片高
    pixelBuffer = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    
    outBuffer.data = pixelBuffer;
    outBuffer.width = CGImageGetWidth(img);
    outBuffer.height = CGImageGetHeight(img);
    outBuffer.rowBytes = CGImageGetBytesPerRow(img);
    
    
    // 第三个中间的缓存区,抗锯齿的效果
    void *pixelBuffer2 = malloc(CGImageGetBytesPerRow(img) * CGImageGetHeight(img));
    vImage_Buffer outBuffer2;
    outBuffer2.data = pixelBuffer2;
    outBuffer2.width = CGImageGetWidth(img);
    outBuffer2.height = CGImageGetHeight(img);
    outBuffer2.rowBytes = CGImageGetBytesPerRow(img);
    
    //Convolves a region of interest within an ARGB8888 source image by an implicit M x N kernel that has the effect of a box filter.
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer2, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&outBuffer2, &inBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    error = vImageBoxConvolve_ARGB8888(&inBuffer, &outBuffer, NULL, 0, 0, boxSize, boxSize, NULL, kvImageEdgeExtend);
    
    
    if (error) {
        NSLog(@"error from convolution %ld", error);
    }
    
    //    NSLog(@"字节组成部分：%zu",CGImageGetBitsPerComponent(img));
    //颜色空间DeviceRGB
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    //用图片创建上下文,CGImageGetBitsPerComponent(img),7,8
    CGContextRef ctx = CGBitmapContextCreate(
                                             outBuffer.data,
                                             outBuffer.width,
                                             outBuffer.height,
                                             8,
                                             outBuffer.rowBytes,
                                             colorSpace,
                                             CGImageGetBitmapInfo(image.CGImage));
    
    //根据上下文，处理过的图片，重新组件
    CGImageRef imageRef = CGBitmapContextCreateImage (ctx);
    UIImage *returnImage = [UIImage imageWithCGImage:imageRef];
    
    //clean up
    CGContextRelease(ctx);
    CGColorSpaceRelease(colorSpace);
    
    free(pixelBuffer);
    free(pixelBuffer2);
    CFRelease(inBitmapData);
    CGImageRelease(imageRef);
    
    return returnImage;
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
