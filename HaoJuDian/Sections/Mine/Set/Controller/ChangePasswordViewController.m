//
//  ChangePasswordViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/8.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()<UITextInputDelegate, UITextFieldDelegate>

@end

@implementation ChangePasswordViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
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
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font = [UIFont boldSystemFontOfSize:20];  //设置文本字体与大小
    titleLabel.textColor = [UIColor whiteColor];  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"修改密码";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = BACKGROUNDCOLOR;
}



#pragma mark - 加载Views

- (void)setupViews
{
    NSArray * titAry = [NSArray arrayWithObjects:@"原密码:", @"新密码:", @"确认密码:", nil];
    NSArray * placAry = [NSArray arrayWithObjects:@"请输入您的原密码", @"请输入您的新密码", @"请再次输入您的新密码", nil];
    
    for (int i = 0; i < 3; i++) {
        
        UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT + 44 + 44*i, WIDTH, 44)];
        view1.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view1];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 12, 60, 20)];
        label1.text = [titAry objectAtIndex:i];
        label1.textColor = [UIColor blackColor];
        label1.textAlignment = NSTextAlignmentRight
        ;
        label1.backgroundColor = [UIColor clearColor];
        label1.layer.cornerRadius = 6;
        label1.layer.masksToBounds = YES;
        [label1 sizeToFit];
        [view1 addSubview:label1];
        
        UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label1.frame) + 5, 0, view1.frame.size.width - label1.frame.origin.x, 44)];
        //        textField.backgroundColor = [UIColor redColor];
        textField.placeholder = [placAry objectAtIndex:i];
        textField.textAlignment = NSTextAlignmentLeft;
        textField.font = [UIFont systemFontOfSize:15];
        textField.textColor = [UIColor lightGrayColor];
        textField.delegate = self;
        textField.tag = 1000 + i;
        [view1 addSubview:textField];
        
        
    }
    
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(10, TOPHEIGHT + 44 + 44*3 + 30, WIDTH - 20, 34);
    sureBtn.backgroundColor = [UIColor colorWithWhite:0.769 alpha:1.000];
    sureBtn.layer.cornerRadius = 6;
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [sureBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sureBtn];

    //全局返回键盘手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnceMethod:)];
    [self.view addGestureRecognizer:tap];
}



#pragma mark - 确认方法

- (void)sureBtnMethod:(UIButton *)sender
{
    
}



#pragma mark -
#pragma mark - 全局弹回键盘手势

- (void)tapOnceMethod:(UITapGestureRecognizer *)sender
{
    [self hideKeyBoard];
}



- (void)hideKeyBoard
{
    for (UIWindow* window in [UIApplication sharedApplication].windows)
    {
        for (UIView* view in window.subviews)
        {
            [self dismissAllKeyBoardInView:view];
        }
    }
}

- (BOOL)dismissAllKeyBoardInView:(UIView *)view
{
    if([view isFirstResponder])
    {
        [view resignFirstResponder];
        return YES;
    }
    for(UIView *subView in view.subviews)
    {
        if([self dismissAllKeyBoardInView:subView])
        {
            return YES;
        }
    }
    return NO;
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
