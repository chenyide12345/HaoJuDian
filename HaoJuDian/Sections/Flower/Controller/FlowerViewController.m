//
//  FlowerViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "FlowerViewController.h"
#import "NoticeCell.h"
#import "NewsCell.h"
#import "GiftCell.h"
#import "BeanCell.h"

@interface FlowerViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UIButton * qingdouBtn;
@property (nonatomic, strong) UIButton * liwuBtn;

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, assign) int selectNum; //我的情豆:10000 我的礼物:10001
@property (nonatomic, strong) UILabel * lineLab;
@property (nonatomic, assign) NSInteger num; //选择的btn

@end

@implementation FlowerViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectNum = 10000;
    [self setupNav];
    [self setupViews];
    
}


#pragma mark -
#pragma mark - 加载导航栏

- (void)setupNav
{
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = BACKGROUNDCOLOR;
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    
    CGFloat backViewWidth = WIDTH/2.5;
    
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, backViewWidth, 34)];
    backView.backgroundColor = [UIColor clearColor];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 17;
    backView.clipsToBounds = YES;
    backView.userInteractionEnabled = YES;
    backView.layer.borderColor = [UIColor whiteColor].CGColor;
    backView.layer.borderWidth = 1;
    
    self.qingdouBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.qingdouBtn.frame = CGRectMake(0, 0, backViewWidth/2, 34);
    [self.qingdouBtn setTitle:@"我的情豆" forState:UIControlStateNormal];
    [self.qingdouBtn setBackgroundColor:[UIColor whiteColor]];
    [self.qingdouBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    self.qingdouBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    //    tongZhiBtn.layer.borderWidth = 1;
    //    tongZhiBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.qingdouBtn addTarget:self action:@selector(qingdouBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:self.qingdouBtn];
    
    self.liwuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.liwuBtn.frame = CGRectMake(backViewWidth/2, 0, backViewWidth/2, 34);
    [self.liwuBtn setTitle:@"我的礼物" forState:UIControlStateNormal];
    [self.liwuBtn setBackgroundColor:MAINCOLOR];
    [self.liwuBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.liwuBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    //    xiaoXiBtn.layer.borderWidth = 1;
    //    xiaoXiBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    //    [tongZhiBtn setAttributedTitle: forState:UIControlStateNormal];
    [self.liwuBtn addTarget:self action:@selector(liwuBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:self.liwuBtn];
    
    self.navigationItem.titleView = backView;
    self.navigationItem.titleView.userInteractionEnabled = YES;
}



#pragma mark - 加载Views

- (void)setupViews
{
    NSArray * titAry = [NSArray arrayWithObjects:@"TA为我种的情豆(6)", @"我为TA种的情豆(6)", nil];
    for (int i = 0; i < 2; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(WIDTH/2 * i, TOPHEIGHT + 44, WIDTH/2, 42);
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:[titAry objectAtIndex:i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
//        [btn setTitleColor:[UIColor colorWithWhite:0.298 alpha:1.000] forState:UIControlStateNormal];
        if (i == 0) {
            [btn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
        } else {
            [btn setTitleColor:[UIColor colorWithWhite:0.298 alpha:1.000] forState:UIControlStateNormal];
        }
        
        [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1000 + i;
        [self.view addSubview:btn];
        
    }
    
    UIButton * btn = (UIButton *)[self.view viewWithTag:1000];
    self.num = btn.tag;
    
    self.lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btn.frame), WIDTH/2, 2)];
    self.lineLab.backgroundColor = MAINCOLOR;
    [self.view addSubview:self.lineLab];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.lineLab.frame), WIDTH, HEIGHT- 49 - 44 - 44) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    //    self.tableView.backgroundColor = [UIColor orangeColor];
    //    self.tableView.scrollEnabled = NO;
        [self.view addSubview:self.tableView];
    
    
    
    
}



#pragma mark - 我的情豆方法

- (void)qingdouBtnMethod:(UIButton *)sender
{
    self.selectNum = 10000;
    [self.tableView reloadData];
    
    [self.qingdouBtn setBackgroundColor:[UIColor whiteColor]];
    [self.qingdouBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    
    [self.liwuBtn setBackgroundColor:MAINCOLOR];
    [self.liwuBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    NSArray * titAry = [NSArray arrayWithObjects:@"TA为我种的情豆(6)", @"我为TA种的情豆(6)", nil];
    for (int i = 0; i < 2; i++) {
        
        UIButton * btn = (UIButton *)[self.view viewWithTag:1000 + i];
        [btn setTitle:titAry[i] forState:UIControlStateNormal];
    }
    
}

#pragma mark - 我的礼物方法

- (void)liwuBtnMethod:(UIButton *)sender
{
    self.selectNum = 10001;
    [self.tableView reloadData];
    
    [self.qingdouBtn setBackgroundColor:MAINCOLOR];
    [self.qingdouBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.liwuBtn setBackgroundColor:[UIColor whiteColor]];
    [self.liwuBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    
    NSArray * titAry = [NSArray arrayWithObjects:@"我收到的礼物(6)", @"我送出的礼物(6)", nil];
    for (int i = 0; i < 2; i++) {
        
        UIButton * btn = (UIButton *)[self.view viewWithTag:1000 + i];
        [btn setTitle:titAry[i] forState:UIControlStateNormal];
    }
}



#pragma mark - UITableViewDataSource And Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.selectNum == 10000) {
        return 10;
    } else {
        return 10;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectNum == 10000) {
        
        static NSString * cellIdentifier = @"cell";
        BeanCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[BeanCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    } else {
        
        static NSString * cellIdentifier = @"celll";
        GiftCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[GiftCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectNum == 10000) {
        return 100;
    } else {
        return 100;
    }
    
}




#pragma mark -
#pragma mark - btn方法

- (void)btnMethod:(UIButton *)sender
{
    if (sender.tag == 1001) {
        
        self.num = sender.tag;
        
        for (int i = 1000; i < 1002; i++) {
            UIButton * btn = (UIButton *)[self.view viewWithTag:i];
            [btn setTitleColor:[UIColor colorWithWhite:0.298 alpha:1.000] forState:UIControlStateNormal];
            
        }
        
        [sender setTitleColor:MAINCOLOR forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.lineLab.frame = CGRectMake(sender.frame.origin.x, CGRectGetMaxY(sender.frame), WIDTH/2, 2);
            
        } completion:^(BOOL finished) {
            
            //                [self.tableView headerBeginRefreshing];
            
        }];
        
    } else {
        
        self.num = sender.tag;
        
        for (int i = 1000; i < 1002; i++) {
            UIButton * btn = (UIButton *)[self.view viewWithTag:i];
            [btn setTitleColor:[UIColor colorWithWhite:0.298 alpha:1.000] forState:UIControlStateNormal];
            
        }
        
        [sender setTitleColor:MAINCOLOR forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.2 animations:^{
            
            self.lineLab.frame = CGRectMake(sender.frame.origin.x, CGRectGetMaxY(sender.frame), WIDTH/2, 2);
            
        } completion:^(BOOL finished) {
            
//            [self.tableView headerBeginRefreshing];
            
        }];
        
    }
    
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
