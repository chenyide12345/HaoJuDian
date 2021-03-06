//
//  PayPasswordViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/8.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "PayPasswordViewController.h"


@interface PayPasswordViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) JKCountDownButton * sendCode; //发送验证码

@end

@implementation PayPasswordViewController

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
    titleLabel.font = [UIFont systemFontOfSize:17];  //设置文本字体与大小
    titleLabel.textColor = ZITIWHITECOLOR;  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"设置支付密码";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = BACKGROUNDCOLOR;
}



#pragma mark - 加载Views

- (void)setupViews
{
    NSArray * titAry = [NSArray arrayWithObjects:@"手机号", @"验证码", @"支付密码", nil];
    NSArray * placAry = [NSArray arrayWithObjects:@"请输入您的手机号码", @"请输入验证码", @"请输入您的支付密码", nil];
    
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
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setBackgroundColor:MAINCOLOR];
//        [button setFrame:CGRectMake(0.0f, 0.0f, 15.0f, 15.0f)]; // Required for iOS7
//        textField.rightView = button;
//        textField.rightViewMode = UITextFieldViewModeWhileEditing;
        [view1 addSubview:textField];
        
        UILabel * lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, viewH-0.5, WIDTH, 0.5)];
        lineLab.backgroundColor = XIANCOLOR;
        [view1 addSubview:lineLab];
        
        
        if (i == 1) {
            
            //发送验证码
            self.sendCode = [JKCountDownButton buttonWithType:UIButtonTypeCustom];
            self.sendCode.frame = CGRectMake(view1.frame.size.width - 99, 7, 89, 35);
            self.sendCode.backgroundColor = ANNIUGRAYCOLOR;
            [self.sendCode setTitle:@"获取验证码" forState:UIControlStateNormal];
            [self.sendCode setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
            self.sendCode.titleLabel.font = [UIFont systemFontOfSize:15];
            self.sendCode.layer.masksToBounds = YES;
            self.sendCode.layer.cornerRadius = 3;
            [view1 addSubview:self.sendCode];
            
            textField.frame = CGRectMake(CGRectGetMaxX(label1.frame) + 5, 0, view1.frame.size.width - label1.frame.origin.x - label1.frame.size.width - 10 - 80, viewH);
            
            __weak typeof(self) weakSelf = self;
            [self.sendCode addToucheHandler:^(JKCountDownButton*sender, NSInteger tag) {
                sender.enabled = NO;
                
                UITextField * tf = (UITextField *)[weakSelf.view viewWithTag:1000];
                NSLog(@"tf.text = %@", tf.text);
                BOOL isMN = [weakSelf isMobileNumber:tf.text];
                
                if (isMN) {
                    
//                    [weakSelf sendSMS];
                    [sender startWithSecond:120];
                    [sender setBackgroundColor:ANNIUGRAYCOLOR];
                    [sender setTitleColor:MAINCOLOR forState:UIControlStateNormal];
                    
                    [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
                        NSString *title = [NSString stringWithFormat:@"%d秒",second];
                        return title;
                    }];
                    [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
                        countDownButton.enabled = YES;
                        [sender setBackgroundColor:ANNIUGRAYCOLOR];
                        return @"点击重新获取";
                        
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
            
            UILabel *tishiLab = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(view1.frame) + 10, 60, 20)];
            tishiLab.text = @"密码由6-20位英文字母、数字或者符号组成";
            tishiLab.textColor = ZITIGRAYCOLOR;
            tishiLab.textAlignment = NSTextAlignmentLeft;
            tishiLab.backgroundColor = [UIColor clearColor];
            tishiLab.font = [UIFont systemFontOfSize:10];
            [tishiLab sizeToFit];
            [self.view addSubview:tishiLab];
            
        }

        
    }
    
    
    UIButton *sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(10, TOPHEIGHT + 44 + viewH*3 + 50, WIDTH - 20, 40);
    sureBtn.backgroundColor = ANNIUGRAYCOLOR;
    sureBtn.layer.cornerRadius = 3;
    [sureBtn setTitle:@"确认" forState:UIControlStateNormal];
    sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [sureBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
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
