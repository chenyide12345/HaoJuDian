//
//  MineViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#define PI 3.14159265358979323846
#import "MineViewController.h"
#import "CYDSlider.h"
#import "SetViewController.h"
#import "MyInfoViewController.h"
#import "OtherInfoViewController.h"
#import "BranceController.h" //余额


@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIImageView * iconImg;
@property (nonatomic, strong) UIButton * onlineBtn; //在线btn
@property (nonatomic, strong) UILabel * jingshenLab;
@property (nonatomic, strong) UILabel * wuzhiLab;

@property (nonatomic, strong) UILabel * yueNumLab;
@property (nonatomic, strong) UILabel * qingdouNumLab;
@property (nonatomic, strong) UILabel * flowerNumLab;

@property (nonatomic, strong) UIImageView * phoneRZImg; //手机认证
@property (nonatomic, strong) UIImageView * nameRZImg; //实名认证
@property (nonatomic, strong) UIImageView * emailRZImg; //邮箱认证

@end

@implementation MineViewController

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
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT- 49) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = BACKGROUNDCOLOR;
    //    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
    
    
    
}




#pragma mark - UITableViewDataSource And Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 1;
    } else if (section == 2) {
        return 2;
    } else if (section == 3) {
        return 2;
    } else {
        return 2;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0) {
        
        CGFloat backImgW = 150;
        
        UIImageView * backImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, backImgW)];
        backImgView.backgroundColor = [UIColor cyanColor];
        [cell.contentView addSubview:backImgView];
        
        CGFloat imgX;
        CGFloat imgY;
        
        if (HEIGHT == 480) {
            imgX = 15;
            imgY = 20;
        } else if (HEIGHT == 568) {
            imgX = 20;
            imgY = 20;
        } else {
            imgX = 30;
            imgY = 20;
        }
        
        self.iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, imgY, 73, 73)];
        self.iconImg.backgroundColor = MAINCOLOR;
        self.iconImg.layer.masksToBounds = YES;
        self.iconImg.layer.cornerRadius = 73/2;
        self.iconImg.layer.borderColor = BACKGROUNDCOLOR.CGColor;
        self.iconImg.layer.borderWidth = 3;
        [cell.contentView addSubview:self.iconImg];
        
        UILabel *nameLab = [[UILabel alloc] init];
        nameLab.text = @"好聚点";
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
        self.onlineBtn.frame = CGRectMake(CGRectGetMaxX(nameLab.frame) + 10, CGRectGetMidY(nameLab.frame) - 7, 40, 14);
        self.onlineBtn.backgroundColor = ZITIWHITECOLOR;
        self.onlineBtn.layer.masksToBounds = YES;
        self.onlineBtn.layer.cornerRadius = 7;
        [self.onlineBtn setTitle:@"√在线" forState:UIControlStateNormal];
        [self.onlineBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
        self.onlineBtn.titleLabel.font = [UIFont systemFontOfSize:10];
        [self.onlineBtn addTarget:self action:@selector(onlineBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:self.onlineBtn];
        
        
        UILabel *wanzhengduLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(nameLab.frame) + 10, 120, 20)];
        wanzhengduLab.text = @"资料完整度21%";
        wanzhengduLab.textColor = ZITIWHITECOLOR;
        wanzhengduLab.textAlignment = NSTextAlignmentLeft;
        wanzhengduLab.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:wanzhengduLab];
        
        
        UILabel *lianaiguanLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.iconImg.frame) + 10, CGRectGetMaxY(self.iconImg.frame) + 20, 50, 20)];
        lianaiguanLab.text = @"恋爱观";
        lianaiguanLab.textColor = [UIColor whiteColor];
        lianaiguanLab.textAlignment = NSTextAlignmentLeft;
        lianaiguanLab.font = [UIFont systemFontOfSize:14];
        [cell.contentView addSubview:lianaiguanLab];
        
        
        UIImageView * jingshenImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lianaiguanLab.frame) + 10, CGRectGetMaxY(self.iconImg.frame), 15, 15)];
        jingshenImg.backgroundColor = MAINCOLOR;
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
        
        [slider addTarget:self
                   action:@selector(sliderChange:)
         forControlEvents:UIControlEventValueChanged];
        [slider addTarget:self action:@selector(sliderFinish:) forControlEvents:UIControlEventTouchUpInside];
        //是否持续发送值的更新, 默认为YES
        slider.continuous = YES;
        slider.userInteractionEnabled = NO;
        [cell.contentView addSubview:slider];
        
        
        self.wuzhiLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(slider.frame) - 50, CGRectGetMinY(self.jingshenLab.frame), 50, 20)];
        self.wuzhiLab.text = @"物质50%";
        self.wuzhiLab.textColor = ZITIWHITECOLOR;
        self.wuzhiLab.font = [UIFont systemFontOfSize:10];
        [cell.contentView addSubview:self.wuzhiLab];
        

        UIImageView * wuzhiImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.wuzhiLab.frame) - 20, CGRectGetMinY(jingshenImg.frame), 15, 15)];
        wuzhiImg.backgroundColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
        [cell.contentView addSubview:wuzhiImg];
        
        
        UIButton * setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        setBtn.frame = CGRectMake(WIDTH - 50, 5, 50, 34);
        setBtn.backgroundColor = [UIColor clearColor];
        [setBtn setTitle:@"设置" forState:UIControlStateNormal];
        setBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [setBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
        [setBtn addTarget:self action:@selector(setBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:setBtn];
        
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 30, backImgW/2 - 15, 20, 30)];
        //        img.backgroundColor = MAINCOLOR;
        img.image = [UIImage imageNamed:@"youjiantou"];
        [cell.contentView addSubview:img];
        
        UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 60, backImgW/2 - 10, 30, 20)];
        contentLab.text = @"资料";
        contentLab.textColor = ZITIWHITECOLOR;
        contentLab.font = [UIFont systemFontOfSize:14];
        contentLab.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:contentLab];
        
    }
    
    
    
    if (indexPath.section == 1) {
        
        CGFloat imgW;
        CGFloat imgJG = 2.5;
        
        if (HEIGHT == 480) {
            imgW = 50;
        } else if (HEIGHT == 568) {
            imgW = 50;
        } else if (HEIGHT == 667) {
            imgW = 60;
        } else {
            imgW = 65;
        }
        
        for (int i = 0; i < 4; i++) {
            
            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(10 + (imgW+imgJG)*i, 7.5, imgW, imgW)];
            img.backgroundColor = MAINCOLOR;
            img.layer.masksToBounds = YES;
            img.layer.cornerRadius = 6;
            [cell.contentView addSubview:img];
            
        }
        
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 30, 10+imgW/2 - 15, 20, 30)];
//        img.backgroundColor = MAINCOLOR;
        img.image = [UIImage imageNamed:@"youjiantou"];
        [cell.contentView addSubview:img];
        
        UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 60, 10+imgW/2 - 10, 30, 20)];
        contentLab.text = @"相册";
        contentLab.textColor = ZITIGRAYCOLOR;
        contentLab.font = [UIFont systemFontOfSize:13];
        contentLab.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:contentLab];
        
    }
    
    
    
    
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            
            CGFloat imgW;
            
            if (HEIGHT == 480) {
                imgW = 25;
            } else if (HEIGHT == 568) {
                imgW = 25;
            } else if (HEIGHT == 667) {
                imgW = 25;
            } else {
                imgW = 25;
            }
            
            UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(17.5, 12, imgW, imgW)];
            imgV.backgroundColor = MAINCOLOR;
            [cell.contentView addSubview:imgV];
            
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 5, 14.5, 100, 20)];
            titLab.text = @"我的账户";
            titLab.textColor = ZITIBLACKCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.backgroundColor = [UIColor clearColor];
            titLab.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:titLab];
            
        }
        
        
        if (indexPath.row == 1) {
            
            CGFloat btnW = (WIDTH - 1)/3;
            CGFloat btnH = 60;
            
            UIButton * yueBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            yueBtn.frame = CGRectMake(0, 0, btnW, btnH);
            yueBtn.backgroundColor = [UIColor clearColor];
            [yueBtn addTarget:self action:@selector(yueBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:yueBtn];
            
            
            ///余额
            
            self.yueNumLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btnW, btnH/2)];
            self.yueNumLab.text = @"94.05";
            self.yueNumLab.textColor = MAINCOLOR;
            self.yueNumLab.font = [UIFont systemFontOfSize:15];
            self.yueNumLab.textAlignment = NSTextAlignmentCenter;
//            self.yueNumLab.backgroundColor = [UIColor blackColor];
            [yueBtn addSubview:self.yueNumLab];
            
            UILabel * yueLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.yueNumLab.frame), btnW, btnH/2)];
            yueLab.text = @"余额";
            yueLab.textColor = ZITIBLACKCOLOR;
            yueLab.font = [UIFont systemFontOfSize:13];
            yueLab.textAlignment = NSTextAlignmentCenter;
//            yueLab.backgroundColor = [UIColor cyanColor];
            [yueBtn addSubview:yueLab];
            
            
            ///情豆
            
            UIButton * qingdouBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            qingdouBtn.frame = CGRectMake(btnW, 0, btnW, btnH);
            qingdouBtn.backgroundColor = [UIColor clearColor];
            [qingdouBtn addTarget:self action:@selector(qingdouBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:qingdouBtn];
            
            
            self.qingdouNumLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btnW, btnH/2)];
            self.qingdouNumLab.text = @"136";
            self.qingdouNumLab.textColor = MAINCOLOR;
            self.qingdouNumLab.font = [UIFont systemFontOfSize:15];
            self.qingdouNumLab.textAlignment = NSTextAlignmentCenter;
            [qingdouBtn addSubview:self.qingdouNumLab];
            
            UILabel * qingdouLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.qingdouNumLab.frame), btnW, btnH/2)];
            qingdouLab.text = @"情豆";
            qingdouLab.textColor = ZITIBLACKCOLOR;
            qingdouLab.font = [UIFont systemFontOfSize:13];
            qingdouLab.textAlignment = NSTextAlignmentCenter;
            [qingdouBtn addSubview:qingdouLab];
            
            UIImageView * lineImg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 0.5, btnH)];
            lineImg1.backgroundColor = MAINCOLOR;
            [qingdouBtn addSubview:lineImg1];
            
            UIImageView * lineImg2 = [[UIImageView alloc] initWithFrame:CGRectMake(btnW - 0.5, 0, 0.5, btnH)];
            lineImg2.backgroundColor = MAINCOLOR;
            [qingdouBtn addSubview:lineImg2];
            
            
            ///花
            
            UIButton * flowerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            flowerBtn.frame = CGRectMake(btnW*2, 0, btnW, btnH);
            flowerBtn.backgroundColor = [UIColor clearColor];
            [flowerBtn addTarget:self action:@selector(flowerBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:flowerBtn];
            
            
            self.flowerNumLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, btnW, btnH/2)];
            self.flowerNumLab.text = @"232";
            self.flowerNumLab.textColor = MAINCOLOR;
            self.flowerNumLab.font = [UIFont systemFontOfSize:15];
            self.flowerNumLab.textAlignment = NSTextAlignmentCenter;
            [flowerBtn addSubview:self.flowerNumLab];
            
            UILabel * flowLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.qingdouNumLab.frame), btnW, btnH/2)];
            flowLab.text = @"花";
            flowLab.textColor = ZITIBLACKCOLOR;
            flowLab.font = [UIFont systemFontOfSize:13];
            flowLab.textAlignment = NSTextAlignmentCenter;
            [flowerBtn addSubview:flowLab];
            
            
            
            
        }
        
        
    }
    
    
    
    if (indexPath.section == 3) {
        
        CGFloat imgW;
        
        if (HEIGHT == 480) {
            imgW = 25;
        } else if (HEIGHT == 568) {
            imgW = 25;
        } else if (HEIGHT == 667) {
            imgW = 25;
        } else {
            imgW = 25;
        }
        
        if (indexPath.row == 0) {
            
            UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(17.5, 12, imgW, imgW)];
            imgV.backgroundColor = MAINCOLOR;
            [cell.contentView addSubview:imgV];
            
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 5, 14.5, 100, 20)];
            titLab.text = @"我的认证";
            titLab.textColor = ZITIBLACKCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.backgroundColor = [UIColor clearColor];
            titLab.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:titLab];
            
            
            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 30, 7, 20, 30)];
            //        img.backgroundColor = MAINCOLOR;
            img.image = [UIImage imageNamed:@"youjiantou"];
            [cell.contentView addSubview:img];
            
            
            self.emailRZImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(img.frame) - 25, 9.5, 25, 25)];
            self.emailRZImg.backgroundColor = MAINCOLOR;
            [cell.contentView addSubview:self.emailRZImg];
            
            self.nameRZImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.emailRZImg.frame) - 30, 9.5, 25, 25)];
            self.nameRZImg.backgroundColor = MAINCOLOR;
            [cell.contentView addSubview:self.nameRZImg];
            
            self.phoneRZImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.nameRZImg.frame) - 30, 9.5, 25, 25)];
            self.phoneRZImg.backgroundColor = MAINCOLOR;
            [cell.contentView addSubview:self.phoneRZImg];
            
        }
        
        
        if (indexPath.row == 1) {
            
            UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(17.5, 12, imgW, imgW)];
            imgV.backgroundColor = MAINCOLOR;
            [cell.contentView addSubview:imgV];
            
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 5, 14.5, 100, 20)];
            titLab.text = @"我的喜欢";
            titLab.textColor = ZITIBLACKCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.backgroundColor = [UIColor clearColor];
            titLab.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:titLab];
            
            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 30, 7, 20, 30)];
            //        img.backgroundColor = MAINCOLOR;
            img.image = [UIImage imageNamed:@"youjiantou"];
            [cell.contentView addSubview:img];
            
        }
        
        
        
    }
    
    
    
    
    if (indexPath.section == 4) {
        
        CGFloat imgW;
        
        if (HEIGHT == 480) {
            imgW = 25;
        } else if (HEIGHT == 568) {
            imgW = 25;
        } else if (HEIGHT == 667) {
            imgW = 25;
        } else {
            imgW = 25;
        }
        
        if (indexPath.row == 0) {
            
            UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(17.5, 12, imgW, imgW)];
            imgV.backgroundColor = MAINCOLOR;
            [cell.contentView addSubview:imgV];
            
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 5, 14.5, 100, 20)];
            titLab.text = @"邀请好友";
            titLab.textColor = ZITIBLACKCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.backgroundColor = [UIColor clearColor];
            titLab.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:titLab];
            
            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 30, 7, 20, 30)];
            //        img.backgroundColor = MAINCOLOR;
            img.image = [UIImage imageNamed:@"youjiantou"];
            [cell.contentView addSubview:img];
            
            UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(img.frame) - 65, 12, 65, 20)];
            contentLab.text = @"邀请有奖啦!";
            contentLab.textColor = ZITIBLACKCOLOR;
            contentLab.font = [UIFont systemFontOfSize:10];
            contentLab.textAlignment = NSTextAlignmentRight;
            [cell.contentView addSubview:contentLab];
            
            UILabel *dian = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(contentLab.frame) - 6, 39/2, 6, 6)];
            dian.backgroundColor = [UIColor redColor];
            dian.layer.cornerRadius = 3;
            dian.layer.masksToBounds = YES;
            [cell.contentView addSubview:dian];
            
            
            
        }
        
        
        if (indexPath.row == 1) {
            
            UIImageView * imgV = [[UIImageView alloc] initWithFrame:CGRectMake(17.5, 12, imgW, imgW)];
            imgV.backgroundColor = MAINCOLOR;
            [cell.contentView addSubview:imgV];
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 5, 14.5, 100, 20)];
            titLab.text = @"推荐列表";
            titLab.textColor = ZITIBLACKCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.backgroundColor = [UIColor clearColor];
            titLab.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:titLab];
            
            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 30, 7, 20, 30)];
            //        img.backgroundColor = MAINCOLOR;
            img.image = [UIImage imageNamed:@"youjiantou"];
            [cell.contentView addSubview:img];
            
        }
        
        
        
    }
    
    
    
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 150;
    } else if (indexPath.section == 1) {
        
        if (HEIGHT == 480) {
            return 65;
        } else if (HEIGHT == 568) {
            return 65;
        } else if (HEIGHT == 667) {
            return 75;
        } else {
            return 80;
        }
        
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 49;
        } else {
            return 60;
        }
    } else if (indexPath.section == 3) {
        return 49;
    } else {
        return 49;
    }

}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.000001;
}


- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =  [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell =  [tableView cellForRowAtIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    
    if (indexPath.section == 0) {
        OtherInfoViewController * myInfoVC = [OtherInfoViewController new];
//        MyInfoViewController * myInfoVC = [MyInfoViewController new];
        [self.navigationController pushViewController:myInfoVC animated:YES];
    }
    
    
}

#pragma mark - slider值改变

- (void)sliderChange:(UISlider *)sender
{
    self.jingshenLab.text = [NSString stringWithFormat:@"精神%d%%", (int)sender.value];
    self.wuzhiLab.text = [NSString stringWithFormat:@"物质%d%%", 100 - (int)sender.value];
}


#pragma mark - slider滑动结束

- (void)sliderFinish:(UISlider *)sender
{
    NSLog(@"%d", (int)sender.value);
}



#pragma mark - 设置方法

- (void)setBtnMethod:(UIButton *)sender
{
    SetViewController * setVC = [SetViewController new];
    [self.navigationController pushViewController:setVC animated:YES];
}


#pragma mark - 余额方法

- (void)yueBtnMethod:(UIButton *)sender
{
    
    BranceController *bvc = [[BranceController alloc]init];
    
    [self.navigationController pushViewController:bvc animated:YES];
    
}


#pragma mark - 情豆方法

- (void)qingdouBtnMethod:(UIButton *)sender
{
    
}


#pragma makr - 花方法

- (void)flowerBtnMethod:(UIButton *)sender
{
    
}


#pragma mark - 在线方法

- (void)onlineBtnMethod:(UIButton *)sender
{
    
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
