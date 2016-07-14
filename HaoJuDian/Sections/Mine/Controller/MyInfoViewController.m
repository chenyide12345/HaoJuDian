//
//  MyInfoViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/13.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MyInfoViewController.h"
#import "CYDSlider.h"
#import "MyHobbyViewController.h"

@interface MyInfoViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIImageView * iconImg;
@property (nonatomic, strong) UIButton * onlineBtn; //在线button
@property (nonatomic, strong) UILabel * jingshenLab;
@property (nonatomic, strong) UILabel * wuzhiLab;

@property (nonatomic, strong) NSArray * baseInfoTitAry; //基本资料tit
@property (nonatomic, strong) NSArray * chooseTitAry; //择偶意向tit

@end

@implementation MyInfoViewController

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
        backImgView.backgroundColor = [UIColor cyanColor];
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
        
        [slider addTarget:self
                   action:@selector(sliderChange:)
         forControlEvents:UIControlEventValueChanged];
        [slider addTarget:self action:@selector(sliderFinish:) forControlEvents:UIControlEventTouchUpInside];
        //是否持续发送值的更新, 默认为YES
        slider.continuous = YES;
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
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(imgV.frame) -1, CGRectGetMaxY(imgV.frame) + 10, 2, 100)];
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
        
        UIImageView * photoImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(titLab.frame) + 10, 10, imgW, imgH)];
//        photoImg.backgroundColor = MAINCOLOR;
        photoImg.image = [UIImage imageNamed:@"shangchuanzhaopian"];
        [cell.contentView addSubview:photoImg];
        
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
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(WIDTH - 80, CGRectGetMinY(imgV.frame), 80, 40);
//        btn.backgroundColor = MAINCOLOR;
        btn.tag = 1000 + indexPath.row;
        [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(20, 13, 14, 14)];
//        img.backgroundColor = [UIColor blueColor];
        img.image = [UIImage imageNamed:@"bianji"];
        [btn addSubview:img];
        
        UILabel *editLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(img.frame), 10, 40, 20)];
        editLab.text = @"编辑";
        editLab.textColor = ZITIGRAYCOLOR;
        editLab.textAlignment = NSTextAlignmentLeft;
        editLab.font = [UIFont systemFontOfSize:bigTitFont];
        [btn addSubview:editLab];
        
        UILabel *contentLab = [[UILabel alloc] init];
        contentLab.text = @"您还没有填写自我介绍, 点击编辑完善资料, 让更多的有缘人认识你吧!";
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
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(WIDTH - 80, CGRectGetMinY(imgV.frame), 80, 40);
//        btn.backgroundColor = MAINCOLOR;
        btn.tag = 1000 + indexPath.row;
        [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(20, 13, 14, 14)];
//        img.backgroundColor = [UIColor blueColor];
        img.image = [UIImage imageNamed:@"bianji"];
        [btn addSubview:img];
        
        UILabel *editLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(img.frame), 10, 40, 20)];
        editLab.text = @"编辑";
        editLab.textColor = ZITIGRAYCOLOR;
        editLab.textAlignment = NSTextAlignmentLeft;
        editLab.font = [UIFont systemFontOfSize:bigTitFont];
        [btn addSubview:editLab];
        
        
        for (int i = 0; i < self.baseInfoTitAry.count; i++) {
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMaxY(imgV.frame) + 30*i, 60, 20)];
            titLab.text = self.baseInfoTitAry[i];
            titLab.textColor = ZITIGRAYCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.font = [UIFont systemFontOfSize:smallTitFont];
            [cell.contentView addSubview:titLab];
            
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(btn.frame) - 60, CGRectGetMaxY(imgV.frame) + 30*i, 60, 20)];
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
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(WIDTH - 80, CGRectGetMinY(imgV.frame), 80, 40);
        //        btn.backgroundColor = MAINCOLOR;
        btn.tag = 1000 + indexPath.row;
        [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(20, 13, 14, 14)];
        //        img.backgroundColor = [UIColor blueColor];
        img.image = [UIImage imageNamed:@"bianji"];
        [btn addSubview:img];
        
        UILabel *editLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(img.frame), 10, 40, 20)];
        editLab.text = @"编辑";
        editLab.textColor = ZITIGRAYCOLOR;
        editLab.textAlignment = NSTextAlignmentLeft;
        editLab.font = [UIFont systemFontOfSize:bigTitFont];
        [btn addSubview:editLab];
        
        
        for (int i = 0; i < self.chooseTitAry.count; i++) {
            
            UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(imgV.frame) + 10, CGRectGetMaxY(imgV.frame) + 30*i, 60, 20)];
            titLab.text = self.chooseTitAry[i];
            titLab.textColor = ZITIGRAYCOLOR;
            titLab.textAlignment = NSTextAlignmentLeft;
            titLab.font = [UIFont systemFontOfSize:smallTitFont];
            [cell.contentView addSubview:titLab];
            
            UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(btn.frame) - 60, CGRectGetMaxY(imgV.frame) + 30*i, 60, 20)];
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
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(WIDTH - 80, CGRectGetMinY(imgV.frame), 80, 40);
        //        btn.backgroundColor = MAINCOLOR;
        btn.tag = 1000 + indexPath.row;
        [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:btn];
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(20, 13, 14, 14)];
        //        img.backgroundColor = [UIColor blueColor];
        img.image = [UIImage imageNamed:@"bianji"];
        [btn addSubview:img];
        
        UILabel *editLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(img.frame), 10, 40, 20)];
        editLab.text = @"编辑";
        editLab.textColor = ZITIGRAYCOLOR;
        editLab.textAlignment = NSTextAlignmentLeft;
        editLab.font = [UIFont systemFontOfSize:bigTitFont];
        [btn addSubview:editLab];
        
        
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



#pragma mark - 编辑方法

- (void)btnMethod:(UIButton *)sender
{
    NSInteger num = sender.tag;
    
    switch (num) {
            //个人介绍
        case 1002:
        {
            
        }
            break;
            //基本资料
        case 1003:
        {
            
        }
            break;
            //择偶意向
        case 1004:
        {
            
        }
            break;
            //个人爱好
        case 1005:
        {
            MyHobbyViewController * myHobbyVC = [MyHobbyViewController new];
            [self.navigationController pushViewController:myHobbyVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}



#pragma mark - 返回方法

- (void)backBtnMethod:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
