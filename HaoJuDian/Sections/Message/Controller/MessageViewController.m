//
//  MessageViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MessageViewController.h"
#import "NoticeViewController.h"
#import "NewsViewController.h"

@interface MessageViewController ()

@property (nonatomic, strong) NoticeViewController * noticeVC;
@property (nonatomic, strong) NewsViewController * newsVC;

@property (nonatomic, strong) UIButton * tongZhiBtn;
@property (nonatomic, strong) UIButton * xiaoXiBtn;

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.noticeVC = [NoticeViewController new];
    self.newsVC = [NewsViewController new];
    
    [self addChildViewController:self.noticeVC];
    [self addChildViewController:self.newsVC];
    [self.view addSubview:self.noticeVC.view];
    
    
    [self setupNav];
    
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


#pragma mark - 通知方法

- (void)tongZhiBtnMethod:(UIButton *)sender
{
    [self.tongZhiBtn setBackgroundColor:[UIColor whiteColor]];
    [self.tongZhiBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    
    [self.xiaoXiBtn setBackgroundColor:MAINCOLOR];
    [self.xiaoXiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.view.subviews[0] removeFromSuperview];
    [self.view insertSubview:self.noticeVC.view atIndex:0];
    
}

#pragma mark - 消息方法

- (void)xiaoXiBtnMethod:(UIButton *)sender
{
    [self.tongZhiBtn setBackgroundColor:MAINCOLOR];
    [self.tongZhiBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self.xiaoXiBtn setBackgroundColor:[UIColor whiteColor]];
    [self.xiaoXiBtn setTitleColor:MAINCOLOR forState:UIControlStateNormal];
    
    [self.view.subviews[0] removeFromSuperview];
    [self.view insertSubview:self.newsVC.view atIndex:0];
    
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
