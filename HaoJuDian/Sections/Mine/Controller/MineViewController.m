//
//  MineViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MineViewController.h"
#import "CYDSlider.h"

@interface MineViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) UIImageView * iconImg;
@property (nonatomic, strong) UILabel * jingshenLab;
@property (nonatomic, strong) UILabel * wuzhiLab;

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
    self.view.backgroundColor = BACKGROUNDCOLOR;
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
        
        UIImageView * backImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
        backImgView.backgroundColor = [UIColor cyanColor];
        [cell.contentView addSubview:backImgView];
        
        self.iconImg = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, 80, 80)];
        self.iconImg.backgroundColor = MAINCOLOR;
        self.iconImg.layer.masksToBounds = YES;
        self.iconImg.layer.cornerRadius = 40;
        [cell.contentView addSubview:self.iconImg];
        
        UILabel *nameLab = [[UILabel alloc] init];
        nameLab.text = @"好聚点";
        nameLab.textColor = [UIColor whiteColor];
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

        
        UILabel *wanzhengduLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.iconImg.frame) + 10, CGRectGetMaxY(nameLab.frame) + 10, 120, 20)];
        wanzhengduLab.text = @"资料完整度21%";
        wanzhengduLab.textColor = [UIColor whiteColor];
        wanzhengduLab.textAlignment = NSTextAlignmentLeft;
        wanzhengduLab.font = [UIFont systemFontOfSize:16];
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
        
        self.jingshenLab = [[UILabel alloc] init];
        self.jingshenLab.text = @"精神50%";
        self.jingshenLab.textColor = [UIColor blackColor];
        self.jingshenLab.font = [UIFont systemFontOfSize:11];
        self.jingshenLab.numberOfLines = 0;//根据最大行数需求来设置
        self.jingshenLab.lineBreakMode = NSLineBreakByTruncatingTail;
        CGSize maximumLabelSize2 = CGSizeMake(9999, 20);//labelsize的最大值
        //关键语句
        CGSize expectSize2 = [self.jingshenLab sizeThatFits:maximumLabelSize2];
        //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
        self.jingshenLab.frame = CGRectMake(CGRectGetMaxX(jingshenImg.frame), CGRectGetMinY(jingshenImg.frame), expectSize2.width, expectSize2.height);
        [cell.contentView addSubview:self.jingshenLab];
        
        CGFloat sliderW = WIDTH/2;
        CGFloat sliderH = 30;
        
        CYDSlider * slider = [[CYDSlider alloc] initWithFrame:CGRectMake(CGRectGetMaxX(lianaiguanLab.frame) + 10, CGRectGetMaxY(self.jingshenLab.frame), sliderW, sliderH)];
        slider.backgroundColor = [UIColor clearColor];
        //裁剪
        slider.clipsToBounds = YES;
        //设置滑块左右两边导轨的颜色
        slider.minimumTrackTintColor = MAINCOLOR;
        slider.maximumTrackTintColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
        
        //注意这里要加UIControlStateHightlighted的状态，否则当拖动滑块时滑块将变成原生的控件
        [slider setThumbImage:[UIImage imageNamed:@"1"] forState:UIControlStateHighlighted];
        [slider setThumbImage:[UIImage imageNamed:@"1"] forState:UIControlStateNormal];
        
        slider.minimumValue = 1;
        slider.maximumValue = 100;
        slider.value = 50;
        
        [slider addTarget:self
                   action:@selector(sliderChange:)
         forControlEvents:UIControlEventValueChanged];
        [slider addTarget:self action:@selector(sliderFinish:) forControlEvents:UIControlEventTouchUpInside];
        //是否持续发送值的更新, 默认为YES
        slider.continuous = YES;
        [cell.contentView addSubview:slider];
        
        
        self.wuzhiLab = [[UILabel alloc] init];
        self.wuzhiLab.text = @"物质50%";
        self.wuzhiLab.textColor = [UIColor blackColor];
        self.wuzhiLab.font = [UIFont systemFontOfSize:11];
        self.wuzhiLab.numberOfLines = 0;//根据最大行数需求来设置
        self.wuzhiLab.lineBreakMode = NSLineBreakByTruncatingTail;
        CGSize maximumLabelSize3 = CGSizeMake(9999, 20);//labelsize的最大值
        //关键语句
        CGSize expectSize3 = [self.wuzhiLab sizeThatFits:maximumLabelSize3];
        //别忘了把frame给回label，如果用xib加了约束的话可以只改一个约束的值
        self.wuzhiLab.frame = CGRectMake(CGRectGetMaxX(slider.frame) - 50, CGRectGetMinY(self.jingshenLab.frame), expectSize3.width, expectSize3.height);
        [cell.contentView addSubview:self.wuzhiLab];
        
        
        UIImageView * wuzhiImg = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.wuzhiLab.frame) - 20, CGRectGetMinY(jingshenImg.frame), 15, 15)];
        wuzhiImg.backgroundColor = [UIColor colorWithRed:0.224 green:0.737 blue:0.616 alpha:1.000];
        [cell addSubview:wuzhiImg];
        
        
        UIButton * setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        setBtn.frame = CGRectMake(WIDTH - 50, 5, 50, 34);
        setBtn.backgroundColor = [UIColor clearColor];
        [setBtn setTitle:@"设置" forState:UIControlStateNormal];
        setBtn.titleLabel.font = [UIFont systemFontOfSize:16];
        [setBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [setBtn addTarget:self action:@selector(setBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:setBtn];
        
        
    }
    
    
    
    if (indexPath.section == 1) {
        
        CGFloat imgW;
        CGFloat imgJG = 5;
        
        if (HEIGHT == 480) {
            imgW = 50;
        } else if (HEIGHT == 568) {
            imgW = 50;
        } else if (HEIGHT == 667) {
            imgW = 60;
        } else {
            imgW = 70;
        }
        
        for (int i = 0; i < 4; i++) {
            
            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(10 + (imgW+imgJG)*i, 10, imgW, imgW)];
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
        contentLab.textColor = [UIColor colorWithWhite:0.298 alpha:1.000];
        contentLab.font = [UIFont systemFontOfSize:13];
        contentLab.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:contentLab];
        
    }
    
    
    
    
    return cell;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 150;
    } else if (indexPath.section == 1) {
        
        if (HEIGHT == 480) {
            return 70;
        } else if (HEIGHT == 568) {
            return 70;
        } else if (HEIGHT == 667) {
            return 80;
        } else {
            return 90;
        }
        
    } else if (indexPath.section == 2) {
        if (indexPath.row == 0) {
            return 44;
        } else {
            return 70;
        }
    } else if (indexPath.section == 3) {
        return 44;
    } else {
        return 44;
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
