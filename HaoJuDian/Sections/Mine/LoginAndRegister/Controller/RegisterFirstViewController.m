//
//  RegisterViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/11.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "RegisterFirstViewController.h"
#import "RegisterSecondViewController.h"

@interface RegisterFirstViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) JKCountDownButton * sendCode; //发送验证码

@property (nonatomic, copy) NSString * phoneStr; //手机号
@property (nonatomic, copy) NSString * securityStr; // 验证码
@property (nonatomic, copy) NSString * passStr; //密码

@property (nonatomic, strong) UIButton *sureBtn; //下一步btn

@end

@implementation RegisterFirstViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

//- (void)viewWillAppear:(BOOL)animated
//{
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = NO;
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
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font = [UIFont systemFontOfSize:17];  //设置文本字体与大小
    titleLabel.textColor = ZITIWHITECOLOR;  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"注册1/2";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    //    [CYDBaseNavigationController shareNavgationController].navigationBar.hidden = NO;
    //    self.navigationController.navigationBar.hidden = NO;
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = BACKGROUNDCOLOR;
}



#pragma mark - 加载Views

- (void)setupViews
{
    NSArray * titAry = [NSArray arrayWithObjects:@"手机号", @"验证码", @"密    码", nil];
    NSArray * placAry = [NSArray arrayWithObjects:@"请输入您的手机号码", @"请输入验证码", @"请输入密码", nil];
    
    CGFloat viewH = 49;
    
    for (int i = 0; i < 3; i++) {
        
        UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(0, TOPHEIGHT + 44 + viewH*i, WIDTH, viewH)];
        view1.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:view1];
        
        
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, viewH/2-10, 80, 20)];
        label1.text = [titAry objectAtIndex:i];
        label1.textColor = ZITIBLACKCOLOR;
        label1.backgroundColor = [UIColor clearColor];
        [view1 addSubview:label1];
        
        UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(label1.frame) + 5, 0, view1.frame.size.width - label1.frame.origin.x - label1.frame.size.width - 5, viewH)];
        //        textField.backgroundColor = [UIColor redColor];
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:[placAry objectAtIndex:i] attributes:@{NSForegroundColorAttributeName:ZITIGRAYCOLOR, NSFontAttributeName: [UIFont systemFontOfSize:16]}];
        textField.textAlignment = NSTextAlignmentLeft;
        textField.font = [UIFont systemFontOfSize:15];
        textField.textColor = ZITIGRAYCOLOR;
        textField.delegate = self;
        textField.tag = 1000 + i;
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        [textField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
//        [textField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingDidEnd];
        [view1 addSubview:textField];
        
        UILabel * lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, viewH-0.5, WIDTH, 0.5)];
        lineLab.backgroundColor = XIANCOLOR;
        [view1 addSubview:lineLab];
        
        
        if (i == 1) {
            
            //发送验证码
            self.sendCode = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
            self.sendCode.frame = CGRectMake(view1.frame.size.width - 99, 7, 89, 35);
            self.sendCode.backgroundColor = MAINCOLOR;
            [self.sendCode setTitle:@"获取验证码" forState:UIControlStateNormal];
            [self.sendCode setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
            self.sendCode.titleLabel.font = [UIFont systemFontOfSize:15];
            self.sendCode.layer.masksToBounds = YES;
            self.sendCode.layer.cornerRadius = 3;
            [view1 addSubview:self.sendCode];
            
            textField.frame = CGRectMake(CGRectGetMaxX(label1.frame) + 5, 0, view1.frame.size.width - label1.frame.origin.x - label1.frame.size.width - 10 - 100, viewH);
            
            __weak typeof(self) weakSelf = self;
            [self.sendCode addToucheHandler:^(JKCountDownButton*sender, NSInteger tag) {
                sender.enabled = NO;
                
                UITextField * tf = (UITextField *)[weakSelf.view viewWithTag:1000];
                NSLog(@"tf.text = %@", tf.text);
                BOOL isMN = [weakSelf isMobileNumber:tf.text];
                
                if (isMN) {
                    
                    [weakSelf sendSMS];
                    
                    
                    [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
                        [sender setBackgroundColor:ANNIUGRAYCOLOR];
                        [sender setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
                        NSString *title = [NSString stringWithFormat:@"%d秒",second];
                        return title;
                    }];
                    [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
                        countDownButton.enabled = YES;
                        sender.backgroundColor = MAINCOLOR;
                        [sender setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
                        return @"获取验证码";
                        
                    }];
                    
                } else {
                    
                    weakSelf.sendCode.enabled = YES;
                    UIAlertView * Alert = [[UIAlertView alloc]initWithTitle:@"温馨提示" message:@"请输入正确的手机号" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];
                    [Alert show];
                    
                }
                
            }];
            
        }
        
        
        if (i == 2) {
            
            textField.secureTextEntry = YES;
            textField.frame = CGRectMake(CGRectGetMaxX(label1.frame) + 5, 0, view1.frame.size.width - label1.frame.origin.x - label1.frame.size.width - 10 - 80, viewH);
            
            //添加一个btn控制明密文....
            
            UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            changeBtn.frame = CGRectMake(view1.frame.size.width - 60, 7, 50, 35);
            changeBtn.backgroundColor = [UIColor clearColor];
            changeBtn.layer.cornerRadius = 3;
            [changeBtn setImage:[UIImage imageNamed:@"mimaguan"] forState:UIControlStateNormal];
            [changeBtn addTarget:self action:@selector(changeBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
            [view1 addSubview:changeBtn];
        }
        
        
    }
    
    
    self.sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sureBtn.frame = CGRectMake(10, TOPHEIGHT + 44 + viewH*3 + 50, WIDTH - 20, 40);
    self.sureBtn.backgroundColor = ANNIUGRAYCOLOR;
    self.sureBtn.layer.cornerRadius = 3;
    [self.sureBtn setTitle:@"下一步" forState:UIControlStateNormal];
    self.sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.sureBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
    [self.sureBtn addTarget:self action:@selector(sureBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    self.sureBtn.enabled = NO;
    [self.view addSubview:self.sureBtn];
    
    //全局返回键盘手势
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnceMethod:)];
    [self.view addGestureRecognizer:tap];
}



#pragma mark - 下一步注册方法

- (void)sureBtnMethod:(UIButton *)sender
{
    UITextField * tf1 = [self.view viewWithTag:1000];
    UITextField * tf2 = [self.view viewWithTag:1001];
    UITextField * tf3 = [self.view viewWithTag:1002];
    
    if ([tf1.text isEqualToString:self.phoneStr] && [tf2.text isEqualToString:self.securityStr] && tf3.text.length > 5) {
        
        [MBProgressHUD showHUDAddedTo:WINDOW animated:YES];
        
        NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
        [parameter setObject:[NSString stringWithFormat:@"%@", tf1.text] forKey:@"username"];
        [parameter setObject:[NSString stringWithFormat:@"%@", tf2.text] forKey:@"checkcode"];
        [parameter setObject:[NSString stringWithFormat:@"%@", tf3.text] forKey:@"password"];
        
        
        NSString * urlStr = [NSString stringWithFormat:@"%@%@", BaseURL, JDRegister];
        
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",nil];
        
        [manager POST:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            if ([responseObject[@"Status"] isEqualToString:@"success"]) {
                
                NSDictionary * dataDic = responseObject[@"Data"];
                
//                [DEFAULTS setObject:dataDic[@"UserID"] forKey:@"UserID"];
//                [DEFAULTS setObject:dataDic[@"HuanXinID"] forKey:@"HuanXinID"];
//                [DEFAULTS setObject:dataDic[@"Password"] forKey:@"Password"];
//                [DEFAULTS setObject:dataDic[@"modelIsNull"] forKey:@"modelIsNull"];
                
                [MBProgressHUD hideHUDForView:WINDOW animated:YES];
                
            }
            
            
            
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            
            [MBProgressHUD hideHUDForView:WINDOW animated:YES];
        }];
        
    }
    
    
    
    
//    RegisterSecondViewController * registerSecondVC = [RegisterSecondViewController new];
//    [self.navigationController pushViewController:registerSecondVC animated:YES];

}


#pragma mark - 改变明密文方法

- (void)changeBtnMethod:(UIButton *)sender
{
    sender.selected = !sender.selected;
    UITextField * tf = [self.view viewWithTag:1002];
    
    if (sender.selected) {
        tf.secureTextEntry = NO;
        [sender setImage:[UIImage imageNamed:@"mimakai"] forState:UIControlStateNormal];
    } else {
        tf.secureTextEntry = YES;
        [sender setImage:[UIImage imageNamed:@"mimaguan"] forState:UIControlStateNormal];
    }
    
}



#pragma mark - 发短信方法

- (void)sendSMS
{
    [MBProgressHUD showHUDAddedTo:WINDOW animated:YES];
    
    UITextField * tf = (UITextField *)[self.view viewWithTag:1000];
    
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    [parameter setObject:[NSString stringWithFormat:@"%@", tf.text] forKey:@"username"];
    [parameter setObject:@"true" forKey:@"isregister"];
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@", BaseURL, JDSendCode];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",nil];

    [manager POST:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dataDic = responseObject[@"Data"];
        
        if ([[dataDic objectForKey:@"status"] intValue] == 0) {
            
//            [SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%@", dataDic[@"Message"]]];
        }
        
        if ([[dataDic objectForKey:@"status"] intValue] == 1) {
            
            
            [self.sendCode startWithSecond:60];
            UITextField * tf1 = (UITextField *)[self.view viewWithTag:1001];
            tf1.text = [NSString stringWithFormat:@"%@", dataDic[@"value"]];
            self.securityStr = [NSString stringWithFormat:@"%@", dataDic[@"value"]];
            self.phoneStr = [NSString stringWithFormat:@"%@", tf.text];
            
            [self textFieldChanged:nil];
            
        }
        
        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
    }];
    
}



#pragma mark - 监听输入内容改变

- (void)textFieldChanged:(UITextField *)textField
{
    UITextField * tf1 = [self.view viewWithTag:1000];
    UITextField * tf2 = [self.view viewWithTag:1001];
    UITextField * tf3 = [self.view viewWithTag:1002];
    
    if ([tf1.text isEqualToString:self.phoneStr] && [tf2.text isEqualToString:self.securityStr] && tf3.text.length > 5) {
        
        [self.sureBtn setBackgroundColor:MAINCOLOR];
        self.sureBtn.enabled = YES;
        
    }
    
    if (![tf1.text isEqualToString:self.phoneStr] || ![tf2.text isEqualToString:self.securityStr] || tf3.text.length < 6) {
        [self.sureBtn setBackgroundColor:ANNIUGRAYCOLOR];
        self.sureBtn.enabled = NO;
        
    }
}




#pragma mark -
#pragma mark - 正则表达式

// 正则判断手机号码地址格式
- (BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((77|33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
//        self.sendCode.backgroundColor = MAINCOLOR;
//        [self.sendCode setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
        return YES;
    }
    else
    {
        return NO;
    }
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
