//
//  OtherInfoViewController.m
//  HaoJuDian
//
//  Created by 陈义徳 on 16/7/15.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "OtherInfoViewController.h"
#import "CYDSlider.h"

@interface OtherInfoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIImageView * iconImg;
@property (nonatomic, strong) UIButton * onlineBtn; //在线button
@property (nonatomic, strong) UILabel * jingshenLab;
@property (nonatomic, strong) UILabel * wuzhiLab;

@property (nonatomic, strong) NSArray * baseInfoTitAry; //基本资料tit
@property (nonatomic, strong) NSArray * chooseTitAry; //择偶意向tit

@property (nonatomic, strong) UIImageView * loveImg;

@property (nonatomic, strong) UIButton * shareBtn;
@property (nonatomic, strong) UIButton * liwuBtn;
@property (nonatomic, strong) UIButton * beanBtn;
@property (nonatomic, strong) UIButton * chatBtn;

@end

@implementation OtherInfoViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNav];
    [self setupViews];
}



#pragma mark -
#pragma mark - 加载导航栏

- (void)setupNav
{
    //    self.view.backgroundColor = BACKGROUNDCOLOR;
    self.navigationController.navigationBar.hidden = YES;
    
    
}



#pragma mark - 加载Views

- (void)setupViews
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableHeaderView = [UIView new];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = BACKGROUNDCOLOR;
    //    self.tableView.scrollEnabled = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(-54, 0, 0, 0);
    [self.view addSubview:self.tableView];
    
    
    CGFloat scale1 = 0.14;
    CGFloat wid1 = WIDTH * scale1;
    CGFloat scale2 = 0.2;
    CGFloat wid2 = WIDTH * scale2;
    CGFloat jiange = 0.06*WIDTH;
    
    self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.shareBtn.backgroundColor = [UIColor clearColor];
    self.shareBtn.layer.cornerRadius = wid1/2;
    self.shareBtn.tag = 1001;
    [self.shareBtn setImage:[UIImage imageNamed:@"fenxianghui"] forState:UIControlStateNormal];
    [self.shareBtn addTarget:self action:@selector(shareBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.shareBtn];
    
    self.liwuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.liwuBtn.backgroundColor = [UIColor clearColor];
    self.liwuBtn.layer.cornerRadius = wid2/2;
    self.liwuBtn.tag = 1002;
    [self.liwuBtn setImage:[UIImage imageNamed:@"liwuhui"] forState:UIControlStateNormal];
    [self.liwuBtn addTarget:self action:@selector(liwuBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.liwuBtn];
    
    self.beanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.beanBtn.backgroundColor = [UIColor clearColor];
    self.beanBtn.layer.cornerRadius = wid2/2;
    self.beanBtn.tag = 1003;
    [self.beanBtn setImage:[UIImage imageNamed:@"qingdouhui"] forState:UIControlStateNormal];
    [self.beanBtn addTarget:self action:@selector(beanBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.beanBtn];
    
    self.chatBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.chatBtn.backgroundColor = [UIColor clearColor];
    self.chatBtn.layer.cornerRadius = wid1/2;
    self.chatBtn.tag = 1004;
    [self.chatBtn setImage:[UIImage imageNamed:@"liaotianhui"] forState:UIControlStateNormal];
    [self.chatBtn addTarget:self action:@selector(chatBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.chatBtn];
    
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.top.equalTo(self.swipeableView.mas_bottom).offset(13);
        make.left.equalTo(self.view.mas_left).offset(25);
        make.bottom.equalTo(self.view.mas_bottom).offset(-17.5);
        //        make.right.equalTo(button2.mas_left).offset(-22.5);
        
        make.width.equalTo([NSNumber numberWithFloat:wid1]);
        make.height.equalTo([NSNumber numberWithFloat:wid1]);
        
        make.width.equalTo(self.chatBtn.mas_width);
        make.height.equalTo(self.chatBtn.mas_height);
        
        
    }];
    
    [self.liwuBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.top.equalTo(self.swipeableView.mas_bottom).offset(27.5);
        make.left.equalTo(self.shareBtn.mas_right).offset(jiange);
        make.bottom.equalTo(self.view.mas_bottom).offset(-55);
        //        make.right.equalTo(button3.mas_left).offset(-11);
        
        make.width.equalTo([NSNumber numberWithFloat:wid2]);
        make.height.equalTo([NSNumber numberWithFloat:wid2]);
        
        make.width.equalTo(self.beanBtn.mas_width);
        make.height.equalTo(self.beanBtn.mas_height);
        
    }];
    
    [self.beanBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.top.equalTo(self.swipeableView.mas_bottom).offset(27.5);
        //        make.left.equalTo(button2.mas_right).offset(11);
        make.bottom.equalTo(self.view.mas_bottom).offset(-55);
        make.right.equalTo(self.chatBtn.mas_left).offset(-jiange);
        
        make.width.equalTo(self.liwuBtn.mas_width);
        make.height.equalTo(self.liwuBtn.mas_height);
        
    }];
    
    [self.chatBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //        make.top.equalTo(self.swipeableView.mas_bottom).offset(13);
        //        make.left.equalTo(button3.mas_right).offset(22.5);
        make.bottom.equalTo(self.view.mas_bottom).offset(-17.5);
        make.right.equalTo(self.view.mas_right).offset(-25);
        
        make.width.equalTo(self.shareBtn.mas_width);
        make.height.equalTo(self.shareBtn.mas_height);
        
    }];
    
}



#pragma mark - 懒加载

- (NSArray *)baseInfoTitAry
{
    if (_baseInfoTitAry == nil) {
        self.baseInfoTitAry = [NSArray arrayWithObjects:@"昵称", @"年龄", @"生日", @"QQ", @"微信", @"身高", @"体重", @"学历", @"星座", @"生肖", @"民族", @"血型", @"性格", @"月收入", @"婚姻状况", @"购房情况", @"购车情况", @"户籍地", @"居住地", nil];
    }
    return _baseInfoTitAry;
}


- (NSArray *)chooseTitAry
{
    if (_chooseTitAry == nil) {
        self.chooseTitAry = [NSArray arrayWithObjects:@"年龄", @"身高", @"体重", @"学历", @"民族", @"月收入", @"婚姻状况", @"购房情况", @"购车情况", @"居住地", nil];
    }
    return _chooseTitAry;
}


#pragma mark - UITableViewDataSource And Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    
    
    /********顶部********/
    
    CGFloat backImgW = 170;
    
    if (indexPath.row == 0) {
        
        UIImageView * backImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, backImgW)];
        backImgView.backgroundColor = [UIColor clearColor];
        backImgView.image = [self blurryImage:[UIImage imageNamed:@"nvdatu"] withBlurLevel:1];
        [cell.contentView addSubview:backImgView];
        
        CGFloat imgX;
        CGFloat imgY;
        
        if (HEIGHT == 480) {
            imgX = 15 + 20;
            imgY = 20 + 20;
        } else if (HEIGHT == 568) {
            imgX = 20 + 20;
            imgY = 20 + 20;
        } else {
            imgX = 30 + 20;
            imgY = 20 + 20;
        }
        
        
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(5, 20, 44, 44);
        backBtn.backgroundColor = [UIColor clearColor];
        [backBtn setImage:[UIImage imageNamed:@"gerenzhongxinfanhui"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(backBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:backBtn];
        
        
        self.iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, imgY, 73, 73)];
        self.iconImg.backgroundColor = [UIColor clearColor];
        self.iconImg.image = [UIImage imageNamed:@"nvdatu"];
        self.iconImg.layer.masksToBounds = YES;
        self.iconImg.layer.cornerRadius = 73/2;
        self.iconImg.layer.borderColor = BACKGROUNDCOLOR.CGColor;
        self.iconImg.layer.borderWidth = 3;
        [cell.contentView addSubview:self.iconImg];
        
        UILabel *nameLab = [[UILabel alloc] init];
        nameLab.text = @"好聚点(ID:23015264)";
        nameLab.textColor = ZITIWHITECOLOR;
        nameLab.textAlignment = NSTextAlignmentLeft;
        nameLab.font = [UIFont systemFontOfSize:18];
        nameLab.numberOfLines = 0;//根据最大行数需求来设置
        nameLab.lineBreakMode = NSLineBreakByTruncatingTail;
        CGSize maximumLabelSize = CGSizeMake(WIDTH/2, 20);//labelsize的最大值
        //关键语句
        CGSize expectSize = [nameLab sizeThatFits:maximumLabelSize];
        //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
        nameLab.frame = CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMinY(self.iconImg.frame) + 10, expectSize.width, expectSize.height);
        [cell.contentView addSubview:nameLab];
        
        
        
        self.onlineBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.onlineBtn.frame = CGRectMake(CGRectGetMidX(self.iconImg.frame) + 10, CGRectGetMidY(self.iconImg.frame) + 15, 30, 14);
        self.onlineBtn.backgroundColor = ZITIWHITECOLOR;
        self.onlineBtn.layer.masksToBounds = YES;
        self.onlineBtn.layer.cornerRadius = 7;
        [self.onlineBtn setTitle:@"在线" forState:UIControlStateNormal];
        [self.onlineBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
        self.onlineBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [cell.contentView addSubview:self.onlineBtn];
        
        
        
        UILabel *wanzhengduLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(nameLab.frame) + 5, 120, 20)];
        wanzhengduLab.text = @"资料完整度21%";
        wanzhengduLab.textColor = ZITIWHITECOLOR;
        wanzhengduLab.textAlignment = NSTextAlignmentLeft;
        wanzhengduLab.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:wanzhengduLab];
        
        
        UILabel *lianaiguanLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.iconImg.frame) + 10, CGRectGetMaxY(self.iconImg.frame) + 25, 50, 20)];
        lianaiguanLab.text = @"恋爱观";
        lianaiguanLab.textColor = [UIColor whiteColor];
        lianaiguanLab.textAlignment = NSTextAlignmentLeft;
        lianaiguanLab.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:lianaiguanLab];
        
        
        UIImageView * jingshenImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lianaiguanLab.frame) + 10, CGRectGetMaxY(self.iconImg.frame) + 5, 15, 15)];
        //    jingshenImg.backgroundColor = MAINCOLOR;
        jingshenImg.image = [UIImage imageNamed:@"jingshen"];
        [cell.contentView addSubview:jingshenImg];
        
        self.jingshenLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(jingshenImg.frame), CGRectGetMinY(jingshenImg.frame), 50, 20)];
        self.jingshenLab.text = @"精神50%";
        self.jingshenLab.textColor = ZITIWHITECOLOR;
        self.jingshenLab.font = [UIFont systemFontOfSize:10];
        [cell.contentView addSubview:self.jingshenLab];
        
        CGFloat sliderW = 193;
        CGFloat sliderH = 30;
        
        CYDSlider * slider = [[CYDSlider alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lianaiguanLab.frame) + 10, CGRectGetMaxY(self.jingshenLab.frame) - 5, sliderW, sliderH)];
        slider.backgroundColor = [UIColor clearColor];
        //裁剪
        slider.clipsToBounds = YES;
        //设置滑块左右两边导轨的颜色
        slider.minimumTrackTintColor = MAINCOLOR;
        slider.maximumTrackTintColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
        
        //注意这里要加UIControlStateHightlighted的状态，否则当拖动滑块时滑块将变成原生的控件
        [slider setThumbImage:[UIImage imageNamed:@"1"] forState:UIControlStateHighlighted];
        [slider setThumbImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        
        slider.minimumValue = 0;
        slider.maximumValue = 100;
        slider.value = 50;
        slider.userInteractionEnabled = NO;
        [cell.contentView addSubview:slider];
        
        
        self.wuzhiLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(slider.frame) - 50, CGRectGetMinY(self.jingshenLab.frame), 50, 20)];
        self.wuzhiLab.text = @"物质50%";
        self.wuzhiLab.textColor = ZITIWHITECOLOR;
        self.wuzhiLab.font = [UIFont systemFontOfSize:10];
        [cell.contentView addSubview:self.wuzhiLab];
        
        
        UIImageView * wuzhiImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.wuzhiLab.frame) - 20, CGRectGetMinY(jingshenImg.frame), 15, 15)];
        //    wuzhiImg.backgroundColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
        wuzhiImg.image = [UIImage imageNamed:@"wuzhi"];
        [cell.contentView addSubview:wuzhiImg];
        
        
        CGFloat btnW = 69;
        CGFloat btnH = 25;
        
        UIButton * loveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        loveBtn.frame = CGRectMake(WIDTH - 80, CGRectGetMinY(wanzhengduLab.frame), btnW, btnH);
        loveBtn.backgroundColor = [UIColor clearColor];
//        [loveBtn setBackgroundImage:[UIImage imageNamed:@"zuocebian"] forState:UIControlStateNormal];
        loveBtn.layer.borderWidth = 0.5;
        loveBtn.layer.borderColor = ZITIWHITECOLOR.CGColor;
        loveBtn.layer.cornerRadius = btnH/2;
        loveBtn.layer.masksToBounds = YES;
        [loveBtn addTarget:self action:@selector(loveBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:loveBtn];
        
        self.loveImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xihuan"]];
        self.loveImg.frame = CGRectMake(10, btnH/2-btnH/4, btnH/2+3, btnH/2);
        [loveBtn addSubview:self.loveImg];
        
        UILabel *loveLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.loveImg.frame) + 10, btnH/2-10, 30, 20)];
        loveLab.text = @"喜欢";
        loveLab.textColor = ZITIWHITECOLOR;
        loveLab.font = [UIFont systemFontOfSize:12];
        [loveBtn addSubview:loveLab];
        
        
        
        
        
        
    }
    
    
    CGFloat bigTitFont = 14;
    CGFloat smallTitFont = 13;
    
    /********相册********/
    if (indexPath.row == 1) {
        
        UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 40, 40)];
        //        imgV.backgroundColor = MAINCOLOR;
        imgV.image = [UIImage imageNamed:@"xiangce"];
        imgV.layer.cornerRadius = 20;
        imgV.layer.masksToBounds = YES;
        [cell.contentView addSubview:imgV];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(imgV.frame) -1, CGRectGetMaxY(imgV.frame) + 10, 2, WIDTH*0.504/1.35 - 60)];
        lineLab.backgroundColor = XIANCOLOR;
        [cell.contentView addSubview:lineLab];
        
        
        UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMidY(imgV.frame) - 10, 60, 20)];
        titLab.text = @"相册";
        titLab.textColor = ZITIBLACKCOLOR;
        titLab.textAlignment = NSTextAlignmentLeft;
        titLab.font = [UIFont systemFontOfSize:bigTitFont];
        [cell.contentView addSubview:titLab];
        
        CGFloat imgW = WIDTH*0.504;
        CGFloat imgH = imgW/1.35;
        
        
        for (int i = 0; i < 3; i++) {
            UIImageView * photoImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titLab.frame) + 10, 20, imgW, imgH)];
            photoImg.image = [UIImage imageNamed:@"shangchuanzhaopian"];
            [cell.contentView addSubview:photoImg];
            
            if (i == 0) {
                photoImg.transform = CGAffineTransformMakeRotation(5*M_PI/180);
            }
            
            if (i == 1) {
                photoImg.transform = CGAffineTransformMakeRotation(-5*M_PI/180);
            }
            
            if (i == 2) {
                UILabel *numLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(photoImg.frame) - 50, CGRectGetMidY(photoImg.frame) - 10, 100, 20)];
                numLab.text = @"16张照片";
                numLab.textColor = ZITIWHITECOLOR;
                numLab.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.603];
                numLab.textAlignment = NSTextAlignmentCenter;
                numLab.layer.cornerRadius = 10;
                numLab.layer.masksToBounds = YES;
                numLab.font = [UIFont systemFontOfSize:bigTitFont];
                [cell.contentView addSubview:numLab];
            }
        }
        
        
//        //旋转动画
//        CABasicAnimation* rotationAnimation =
//        [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];//"z"还可以是“x”“y”，表示沿z轴旋转
//        rotationAnimation.toValue = [NSNumber numberWithFloat:(2 * M_PI) * 2/360];
//        // 3 is the number of 360 degree rotations
//        // Make the rotation animation duration slightly less than the other animations to give it the feel
//        // that it pauses at its largest scale value
//        rotationAnimation.duration = 1.0f;
//        rotationAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]; //缓入缓出
//        rotationAnimation.autoreverses = NO;   //是否重播，原动画的倒播
//        rotationAnimation.repeatCount = 1.0;//HUGE_VALF;
//        rotationAnimation.removedOnCompletion = YES;
//        
//        [photoImg.layer addAnimation:rotationAnimation forKey:nil];
        
    }
    
    
    /********个人介绍********/
    if (indexPath.row == 2) {
        
        UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        //        imgV.backgroundColor = MAINCOLOR;
        imgV.image = [UIImage imageNamed:@"gerenjieshao"];
        imgV.layer.cornerRadius = 20;
        imgV.layer.masksToBounds = YES;
        [cell.contentView addSubview:imgV];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(imgV.frame) -1, CGRectGetMaxY(imgV.frame) + 10, 2, 60)];
        lineLab.backgroundColor = XIANCOLOR;
        [cell.contentView addSubview:lineLab];
        
        UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMidY(imgV.frame) - 10, 60, 20)];
        titLab.text = @"个人介绍";
        titLab.textColor = ZITIBLACKCOLOR;
        titLab.textAlignment = NSTextAlignmentLeft;
        titLab.font = [UIFont systemFontOfSize:bigTitFont];
        [cell.contentView addSubview:titLab];
        
        
        UILabel *contentLab = [[UILabel alloc] init];
        contentLab.text = @"我性格活泼开朗, 希望能找到一位坦诚相待, 相伴一生的伴侣. 在这里会碰到有缘的你!";
        contentLab.textColor = ZITIGRAYCOLOR;
        contentLab.textAlignment = NSTextAlignmentLeft;
        contentLab.numberOfLines = 0;
        contentLab.lineBreakMode = NSLineBreakByTruncatingTail;
        CGSize maximumLabelSize = CGSizeMake(WIDTH - titLab.frame.origin.x - 20, 9999);//labelsize的最大值
        //关键语句
        CGSize expectSize = [contentLab sizeThatFits:maximumLabelSize];
        //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
        contentLab.frame = CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMaxY(imgV.frame), expectSize.width, expectSize.height);
        contentLab.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:contentLab];
        
    }
    
    
    
    /********基本资料********/
    if (indexPath.row == 3) {
        
        UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        //        imgV.backgroundColor = MAINCOLOR;
        imgV.image = [UIImage imageNamed:@"jibenziliao"];
        imgV.layer.cornerRadius = 20;
        imgV.layer.masksToBounds = YES;
        [cell.contentView addSubview:imgV];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(imgV.frame) -1, CGRectGetMaxY(imgV.frame) + 10, 2, 30*self.baseInfoTitAry.count - 20)];
        lineLab.backgroundColor = XIANCOLOR;
        [cell.contentView addSubview:lineLab];
        
        UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMidY(imgV.frame) - 10, 60, 20)];
        titLab.text = @"基本资料";
        titLab.textColor = ZITIBLACKCOLOR;
        titLab.textAlignment = NSTextAlignmentLeft;
        titLab.font = [UIFont systemFontOfSize:bigTitFont];
        [cell.contentView addSubview:titLab];
        
        
        
        for (int i = 0; i < self.baseInfoTitAry.count; i++) {
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMaxY(imgV.frame) + 30*i, 60, 20)];
            titLab.text = self.baseInfoTitAry[i];
            titLab.textColor = ZITIGRAYCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.font = [UIFont systemFontOfSize:smallTitFont];
            [cell.contentView addSubview:titLab];
            
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-80 - 60, CGRectGetMaxY(imgV.frame) + 30*i, 100, 20)];
            lab.text = @"未选择";
            lab.textColor = ZITIBLACKCOLOR;
            lab.textAlignment = NSTextAlignmentLeft;
            lab.font = [UIFont systemFontOfSize:smallTitFont];
            [cell.contentView addSubview:lab];
            
        }
        
        
        
    }
    
    
    
    /********择偶意向********/
    if (indexPath.row == 4) {
        
        UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        //        imgV.backgroundColor = MAINCOLOR;
        imgV.image = [UIImage imageNamed:@"zeouyixiang"];
        imgV.layer.cornerRadius = 20;
        imgV.layer.masksToBounds = YES;
        [cell.contentView addSubview:imgV];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(imgV.frame) -1, CGRectGetMaxY(imgV.frame) + 10, 2, 30*self.chooseTitAry.count - 20)];
        lineLab.backgroundColor = XIANCOLOR;
        [cell.contentView addSubview:lineLab];
        
        UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMidY(imgV.frame) - 10, 60, 20)];
        titLab.text = @"择偶意向";
        titLab.textColor = ZITIBLACKCOLOR;
        titLab.textAlignment = NSTextAlignmentLeft;
        titLab.font = [UIFont systemFontOfSize:bigTitFont];
        [cell.contentView addSubview:titLab];
        
        
        
        for (int i = 0; i < self.chooseTitAry.count; i++) {
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMaxY(imgV.frame) + 30*i, 60, 20)];
            titLab.text = self.chooseTitAry[i];
            titLab.textColor = ZITIGRAYCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.font = [UIFont systemFontOfSize:smallTitFont];
            [cell.contentView addSubview:titLab];
            
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-80 - 60, CGRectGetMaxY(imgV.frame) + 30*i, 100, 20)];
            lab.text = @"未选择";
            lab.textColor = ZITIBLACKCOLOR;
            lab.textAlignment = NSTextAlignmentLeft;
            lab.font = [UIFont systemFontOfSize:smallTitFont];
            [cell.contentView addSubview:lab];
            
        }
        
        
        
    }
    
    
    
    
    /********个人爱好********/
    if (indexPath.row == 5) {
        
        UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(20, 10, 40, 40)];
        //        imgV.backgroundColor = MAINCOLOR;
        imgV.image = [UIImage imageNamed:@"gerenaihao"];
        imgV.layer.cornerRadius = 20;
        imgV.layer.masksToBounds = YES;
        [cell.contentView addSubview:imgV];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(imgV.frame) -1, CGRectGetMaxY(imgV.frame) + 10, 2, 50)];
        lineLab.backgroundColor = XIANCOLOR;
        [cell.contentView addSubview:lineLab];
        
        UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMidY(imgV.frame) - 10, 60, 20)];
        titLab.text = @"个人爱好";
        titLab.textColor = ZITIBLACKCOLOR;
        titLab.textAlignment = NSTextAlignmentLeft;
        titLab.font = [UIFont systemFontOfSize:bigTitFont];
        [cell.contentView addSubview:titLab];
        
        
        
        UILabel *contentLab = [[UILabel alloc] init];
        contentLab.text = @"添加个人爱好标签, 找到相同爱好的Ta";
        contentLab.textColor = ZITIGRAYCOLOR;
        contentLab.textAlignment = NSTextAlignmentLeft;
        contentLab.numberOfLines = 0;
        contentLab.lineBreakMode = NSLineBreakByTruncatingTail;
        CGSize maximumLabelSize = CGSizeMake(WIDTH - titLab.frame.origin.x - 20, 9999);//labelsize的最大值
        //关键语句
        CGSize expectSize = [contentLab sizeThatFits:maximumLabelSize];
        //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
        contentLab.frame = CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMaxY(imgV.frame), expectSize.width, expectSize.height);
        contentLab.font = [UIFont systemFontOfSize:13];
        [cell.contentView addSubview:contentLab];
        
        
        
    }
    
    
    
    
    cell.backgroundColor = BACKGROUNDCOLOR;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 170;
    } else if (indexPath.row == 1) {
        return WIDTH*0.504/1.35 + 20;
    } else if (indexPath.row == 2) {
        return 130;
    } else if (indexPath.row == 3) {
        return 50 + 30 * self.baseInfoTitAry.count + 10;
    } else if (indexPath.row == 4) {
        return 50 + 30 * self.chooseTitAry.count + 10;
    } else {
        return 100;
    }
    
}



- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
//    [self.shareBtn removeFromSuperview];
//    [self.liwuBtn removeFromSuperview];
//    [self.beanBtn removeFromSuperview];
//    [self.chatBtn removeFromSuperview];
    self.shareBtn.hidden = YES;
    self.liwuBtn.hidden = YES;
    self.beanBtn.hidden = YES;
    self.chatBtn.hidden = YES;
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
//    [WINDOW addSubview:self.shareBtn];
//    [WINDOW addSubview:self.liwuBtn];
//    [WINDOW addSubview:self.beanBtn];
//    [WINDOW addSubview:self.chatBtn];
    self.shareBtn.hidden = NO;
    self.liwuBtn.hidden = NO;
    self.beanBtn.hidden = NO;
    self.chatBtn.hidden = NO;
}




#pragma mark - 返回方法

- (void)backBtnMethod:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}



#pragma mark - 喜欢方法

- (void)loveBtnMethod:(UIButton *)sender
{
    
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
