//
//  LoginViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/11.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "LoginViewController.h"
#import "FindPasswordViewController.h"
#import "RegisterFirstViewController.h"
#import "AppDelegate.h"
#import "MainViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
//}

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
    CGFloat imgW = 108;
    CGFloat imgH = 141;
    CGFloat imgX = WIDTH/2 - imgW/2;
    CGFloat imgY = 40;
    
    UIImageView * logoImg = [[UIImageView alloc] initWithFrame:CGRectMake(imgX, imgY, imgW, imgH)];
//    logoImg.backgroundColor = MAINCOLOR;
    logoImg.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:logoImg];
    
    
    NSArray * titAry = [NSArray arrayWithObjects:@"手机号", @"密    码", nil];
    NSArray * placAry = [NSArray arrayWithObjects:@"请输入您的手机号码", @"请输入密码", nil];
    
    CGFloat viewH = 49;
    CGFloat jiange = 20;
    if (HEIGHT == 480) {
        jiange = 10;
    }
    for (int i = 0; i < 2; i++) {
        
        UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(logoImg.frame) + jiange + viewH*i, WIDTH, viewH)];
        view1.backgroundColor = [UIColor whiteColor];
        view1.tag = 1000 + i;
        [self.view addSubview:view1];
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, viewH/2 - 10, 60, 20)];
        label1.text = [titAry objectAtIndex:i];
        label1.textColor = ZITIBLACKCOLOR;
        label1.textAlignment = NSTextAlignmentLeft;
        label1.backgroundColor = [UIColor clearColor];
        label1.font = [UIFont systemFontOfSize:16];
        [view1 addSubview:label1];
        
        UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label1.frame) + 5, 0, view1.frame.size.width - label1.frame.origin.x - label1.frame.size.width - 5, 49)];
        //        textField.backgroundColor = [UIColor redColor];
//        textField.placeholder = [placAry objectAtIndex:i];
        textField.textAlignment = NSTextAlignmentLeft;
        textField.font = [UIFont systemFontOfSize:16];
        textField.textColor = ZITIGRAYCOLOR;
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[placAry objectAtIndex:i] attributes:@{NSForegroundColorAttributeName:ZITIGRAYCOLOR, NSFontAttributeName: [UIFont systemFontOfSize:16]}];
        textField.delegate = self;
        textField.tag = 10000 + i;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [view1 addSubview:textField];
        
        UILabel * lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, viewH - 0.5, WIDTH, 0.5)];
        lineLab.backgroundColor = XIANCOLOR;
        [view1 addSubview:lineLab];
        
        if (i == 1) {
            textField.secureTextEntry = YES;
        }
        
        
    }
    
    
    UIView * view1 = (UIView *)[self.view viewWithTag:1001];
    
    UIButton *forgetPWBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    forgetPWBtn.frame = CGRectMake(-10, CGRectGetMaxY(view1.frame), 100, 44);
    [forgetPWBtn setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [forgetPWBtn setTitleColor:ZITIGRAYCOLOR forState:UIControlStateNormal];
    //    forgetPWBtn.backgroundColor = [UIColor redColor];
    forgetPWBtn.titleLabel.font = [UIFont systemFontOfSize:13];
//    forgetPWBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [forgetPWBtn addTarget:self action:@selector(forgetPWBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetPWBtn];
    
    
    UIButton *registBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    registBtn.frame = CGRectMake(WIDTH-100, CGRectGetMaxY(view1.frame), 100, 44);
    [registBtn setTitle:@"立即注册>>" forState:UIControlStateNormal];
    [registBtn setTitleColor:ZITIGRAYCOLOR forState:UIControlStateNormal];
    //    forgetPWBtn.backgroundColor = [UIColor redColor];
    registBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [registBtn addTarget:self action:@selector(registBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registBtn];
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (HEIGHT == 480) {
        loginBtn.frame = CGRectMake(10, CGRectGetMaxY(forgetPWBtn.frame), WIDTH - 20, 40);
    } else {
        loginBtn.frame = CGRectMake(10, CGRectGetMaxY(forgetPWBtn.frame) + 55/2, WIDTH - 20, 40);
    }
    
    
    loginBtn.backgroundColor = MAINCOLOR;
    loginBtn.layer.cornerRadius = 3;
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [loginBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(loginBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    CGFloat btnH = 138;
    CGFloat btnW = WIDTH/3;
    CGFloat imgy = 40;
    
    if (HEIGHT == 480) {
        btnH = 89;
        imgy = 20;
    }
    
    NSArray * imgAry = [NSArray arrayWithObjects:@"weixin", @"weibo", @"qq", nil];
    
    for (int i = 0; i < 3; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(btnW * i, HEIGHT - btnH, btnW, btnH);
        btn.backgroundColor = [UIColor whiteColor];
        [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(btnW/2 - 24, imgy, 48, 48)];
//        img.backgroundColor = MAINCOLOR;
        img.image = [UIImage imageNamed:imgAry[i]];
        [btn addSubview:img];
        
        
    }
    
    
    UILabel * lineLab = [[UILabel alloc] initWithFrame:CGRectMake(10, HEIGHT - btnH, WIDTH - 20, 0.5)];
    lineLab.backgroundColor = XIANCOLOR;
    [self.view addSubview:lineLab];
    
    
    UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2 - 50, CGRectGetMidY(lineLab.frame) - 10, 100, 20)];
    label1.text = @"其他方式登录";
    label1.textColor = ZITIGRAYCOLOR;
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = [UIColor whiteColor];
    label1.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:label1];
    
    
    //全局返回键盘手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnceMethod:)];
    [self.view addGestureRecognizer:tap];
    
    
}



#pragma mark - 忘记密码方法

- (void)forgetPWBtnMethod:(UIButton *)sender
{
    FindPasswordViewController * findVC = [FindPasswordViewController new];
    [self.navigationController pushViewController:findVC animated:YES];
}


#pragma mark - 注册方法

- (void)registBtnMethod:(UIButton *)sender
{
    RegisterFirstViewController * registerVC = [RegisterFirstViewController new];
    [self.navigationController pushViewController:registerVC animated:YES];
}


#pragma mark - 登录方法

- (void)loginBtnMethod:(UIButton *)sender
{
    [MBProgressHUD showHUDAddedTo:WINDOW animated:YES];
    
    UITextField * tf1 = (UITextField *)[self.view viewWithTag:10000];
    UITextField * tf2 = (UITextField *)[self.view viewWithTag:10001];
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@", BaseURL, JDLogin];
    
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    [parameter setObject:[NSString stringWithFormat:@"%@", tf1.text] forKey:@"username"];
    [parameter setObject:[NSString stringWithFormat:@"%@", tf2.text] forKey:@"password"];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",nil];
    
    [manager POST:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"Status"] isEqualToString:@"success"]) {
            
            NSDictionary * dataDic = responseObject[@"Data"];
            [DEFAULTS setObject:dataDic[@"UserID"] forKey:@"UserID"];
            [DEFAULTS setObject:dataDic[@"HuanXinToken"] forKey:@"HuanXinToken"];
            [DEFAULTS setObject:dataDic[@"HuanXinPassword"] forKey:@"HuanXinPassword"];
            [DEFAULTS setObject:dataDic[@"HuanXinID"] forKey:@"HuanXinID"];
            
            WINDOW.rootViewController = [[CYDBaseNavigationController alloc] initWithRootViewController:[[MainViewController alloc] init]];
            
        }
        
        
        
        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
    }];
    
    
}


#pragma mark - 第三方登录方法

- (void)btnMethod:(UIButton *)sender
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
