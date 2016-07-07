//
//  MessageViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MessageViewController.h"
#import "NoticeCell.h"
#import "NewsCell.h"

@interface MessageViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIButton * tongZhiBtn;
@property (nonatomic, strong) UIButton * xiaoXiBtn;

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, assign) int selectNum; //通知:1000 消息:1001

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectNum = 1000;
    
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
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = [UIColor whiteColor];
    //    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    
    CGFloat backViewWidth = WIDTH/3;
    
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, backViewWidth, 34)];
    backView.backgroundColor = [UIColor clearColor];
    backView.layer.masksToBounds = YES;
    backView.layer.cornerRadius = 17;
    backView.clipsToBounds = YES;
    backView.userInteractionEnabled = YES;
    backView.layer.borderColor = [UIColor whiteColor].CGColor;
    backView.layer.borderWidth = 1;
    
    self.tongZhiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.tongZhiBtn.frame = CGRectMake(0, 0, backViewWidth/2, 34);
    [self.tongZhiBtn setTitle:@"通知" forState:UIControlStateNormal];
    [self.tongZhiBtn setBackgroundColor:[UIColor whiteColor]];
    [self.tongZhiBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    //    tongZhiBtn.layer.borderWidth = 1;
    //    tongZhiBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.tongZhiBtn addTarget:self action:@selector(tongZhiBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:self.tongZhiBtn];
    
    self.xiaoXiBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.xiaoXiBtn.frame = CGRectMake(backViewWidth/2, 0, backViewWidth/2, 34);
    [self.xiaoXiBtn setTitle:@"消息" forState:UIControlStateNormal];
    [self.xiaoXiBtn setBackgroundColor:MAINCOLOR];
    [self.xiaoXiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    xiaoXiBtn.layer.borderWidth = 1;
    //    xiaoXiBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    //    [tongZhiBtn setAttributedTitle: forState:UIControlStateNormal];
    [self.xiaoXiBtn addTarget:self action:@selector(xiaoXiBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [backView addSubview:self.xiaoXiBtn];
    
    self.navigationItem.titleView = backView;
    self.navigationItem.titleView.userInteractionEnabled = YES;
}



#pragma mark - 加载Views

- (void)setupViews
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT- 49) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    //    self.tableView.backgroundColor = [UIColor orangeColor];
    //    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
    
    
    
}



#pragma mark - 通知方法

- (void)tongZhiBtnMethod:(UIButton *)sender
{
    self.selectNum = 1000;
    [self.tableView reloadData];
    
    [self.tongZhiBtn setBackgroundColor:[UIColor whiteColor]];
    [self.tongZhiBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    
    [self.xiaoXiBtn setBackgroundColor:MAINCOLOR];
    [self.xiaoXiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
//    [self.newsVC.view removeFromSuperview];
//    [self.newsVC removeFromParentViewController];
//    [self addChildViewController:self.noticeVC];
//    
//    [self.view addSubview:self.noticeVC.view];
    
}

#pragma mark - 消息方法

- (void)xiaoXiBtnMethod:(UIButton *)sender
{
    self.selectNum = 1001;
    [self.tableView reloadData];
    
    [self.tongZhiBtn setBackgroundColor:MAINCOLOR];
    [self.tongZhiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.xiaoXiBtn setBackgroundColor:[UIColor whiteColor]];
    [self.xiaoXiBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    
//    [self.noticeVC.view removeFromSuperview];
//    [self.noticeVC removeFromParentViewController];
//    [self addChildViewController:self.newsVC];
//    [self.view addSubview:self.newsVC.view];
    
}



#pragma mark - UITableViewDataSource And Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.selectNum == 1000) {
        return 10;
    } else {
       return 10;
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectNum == 1000) {
        
        static NSString * cellIdentifier = @"cell";
        NoticeCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[NoticeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    } else {
        
        static NSString * cellIdentifier = @"celll";
        NewsCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
        if (!cell) {
            cell = [[NewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        }
        
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }
    
    
    
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.selectNum == 1000) {
        return 70;
    } else {
        return 70;
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
