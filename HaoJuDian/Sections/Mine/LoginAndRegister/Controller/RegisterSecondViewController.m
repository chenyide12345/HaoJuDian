//
//  RegisterSecondViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/11.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#define PICKER_H 200
#define PICKER_Tit_H 40

#import "RegisterSecondViewController.h"

@interface RegisterSecondViewController ()<UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIPickerView * pickerView;
@property (nonatomic, strong) UIView * backView; //灰色背景
@property (nonatomic, strong) UIView * pickerTitView; //Picker Title View

@property (nonatomic, strong) NSArray * titAry;
@property (nonatomic, strong) UIButton * finishBtn;//完成btn

@property (nonatomic, assign) NSInteger selectTabRow; //选择的tab row
@property (nonatomic, assign) NSInteger selectPickRow; //选择的picker row

@property (nonatomic, strong) NSMutableArray * sexAry;
@property (nonatomic, strong) NSMutableArray * marryAry;
@property (nonatomic, strong) NSMutableArray * heightAry;

@property (nonatomic, strong) UILabel * pickerTitLab; //picker Tit Lab

@property (nonatomic, strong) UITapGestureRecognizer * disKeyTap; //隐藏键盘手势

@end

@implementation RegisterSecondViewController

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
    
    [self getMarryInfo];
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
    titleLabel.text = @"注册2/2";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = BACKGROUNDCOLOR;
}



#pragma mark - 加载Views

- (void)setupViews
{
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [UIView new];
    self.tableView.showsVerticalScrollIndicator = NO;
    //    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    self.tableView.backgroundColor = BACKGROUNDCOLOR;
    //    self.tableView.scrollEnabled = NO;
    [self.view addSubview:self.tableView];
    
    self.backView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.backView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.397];
    
    self.pickerTitView = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT, WIDTH, PICKER_Tit_H)];
    self.pickerTitView.backgroundColor = MAINCOLOR;
    
    
    UIButton * cacelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cacelBtn.frame = CGRectMake(10, 0, PICKER_Tit_H, PICKER_Tit_H);
    [cacelBtn setTitle:@"取消" forState:UIControlStateNormal];
    [cacelBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
    cacelBtn.titleLabel.font = JDFont(15);
    [cacelBtn addTarget:self action:@selector(dismissBackView) forControlEvents:UIControlEventTouchUpInside];
    [self.pickerTitView addSubview:cacelBtn];
    
    UIButton * sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(WIDTH - PICKER_Tit_H - 10, 0, PICKER_Tit_H, PICKER_Tit_H);
    [sureBtn setTitle:@"确定" forState:UIControlStateNormal];
    [sureBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
    sureBtn.titleLabel.font = JDFont(15);
    [sureBtn addTarget:self action:@selector(sureBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    [self.pickerTitView addSubview:sureBtn];
    
    self.pickerTitLab = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(cacelBtn.frame) + 10, 0, WIDTH - 20 - 20 - PICKER_Tit_H*2, PICKER_Tit_H)];
    self.pickerTitLab.text = @"";
    self.pickerTitLab.textColor = ZITIWHITECOLOR;
    self.pickerTitLab.textAlignment = NSTextAlignmentCenter;
    self.pickerTitLab.backgroundColor = [UIColor clearColor];
    self.pickerTitLab.font = [UIFont systemFontOfSize:15];
    [self.pickerTitView addSubview:self.pickerTitLab];
    
    self.pickerView = [[UIPickerView alloc] initWithFrame: CGRectMake(0, HEIGHT + PICKER_Tit_H, WIDTH, PICKER_H)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    self.pickerView.backgroundColor = BACKGROUNDCOLOR;
//    [self.pickerView selectRow: 0 inComponent: 0 animated: YES];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissBackView)];
    [self.backView addGestureRecognizer:tap];
    
    //全局返回键盘手势
    self.disKeyTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnceMethod:)];
    
    
//    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
//    datePicker.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//    datePicker.datePickerMode = UIDatePickerModeDate;
//    [self.view addSubview:datePicker];
    
}



#pragma mark - 懒加载

- (NSArray *)titAry
{
    if (_titAry == nil) {
        self.titAry = [NSArray arrayWithObjects:@"昵称", @"性别", @"婚姻状态", @"身高", @"生日", nil];
    }
    return _titAry;
}

- (NSMutableArray *)sexAry
{
    if (_sexAry == nil) {
        self.sexAry = [NSMutableArray arrayWithObjects:@"男", @"女", nil];
    }
    return _sexAry;
}

- (NSMutableArray *)marryAry
{
    if (_marryAry == nil) {
        self.marryAry = [NSMutableArray array];
    }
    return _marryAry;
}

- (NSMutableArray *)heightAry
{
    if (_heightAry == nil) {
        self.heightAry = [NSMutableArray array];
        for (int i = 0; i < 62; i++) {
            NSInteger num1 = 150;
            NSInteger num2 = 210;
            NSString * str = [NSString string];
            
            if (i == 0) {
                str = [NSString stringWithFormat:@"%ldcm以下", (long)num1];
                [self.heightAry addObject:str];
            }
            
            if (i > 0 && i < 61) {
                num1 = num1 + i;
                str = [NSString stringWithFormat:@"%ldcm", (long)num1];
                [self.heightAry addObject:str];
            }
            
            if (i == 61) {
                str = [NSString stringWithFormat:@"%ldcm以上", (long)num2];
                [self.heightAry addObject:str];
            }
            
            
        }
    }
    
    return _heightAry;
}



#pragma mark - UITableViewDataSource And Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titAry.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row < self.titAry.count) {
        
        CGFloat H = 49;
        
        UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(10, H/2 - 10, 100, 20)];
        titLab.text = [NSString stringWithFormat:@"%@", self.titAry[indexPath.row]];
        titLab.textColor = ZITIBLACKCOLOR;
        titLab.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:titLab];
        
        if (indexPath.row == 0) {
            
            UITextField * textField = [[UITextField alloc] initWithFrame:CGRectMake(WIDTH - 100, 0, 90, H)];
            //        textField.backgroundColor = [UIColor redColor];
            textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入昵称" attributes:@{NSForegroundColorAttributeName:ZITIGRAYCOLOR, NSFontAttributeName: [UIFont systemFontOfSize:15]}];
            textField.textAlignment = NSTextAlignmentRight;
            textField.font = [UIFont systemFontOfSize:15];
            textField.textColor = ZITIBLACKCOLOR;
            textField.delegate = self;
            textField.tag = 10000 + indexPath.row;
            textField.clearButtonMode = UITextFieldViewModeWhileEditing;
//            [textField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
            [cell.contentView addSubview:textField];
            
        } else {
            UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 20, H/2 - 7, 8, 14)];
            img.backgroundColor = [UIColor clearColor];
            img.image = [UIImage imageNamed:@"youjiantou"];
            [cell.contentView addSubview:img];
            
            UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 132, H/2 - 10, 100, 20)];
            contentLab.text = @"不限";
            contentLab.textColor = ZITIGRAYCOLOR;
            contentLab.font = [UIFont systemFontOfSize:15];
            contentLab.textAlignment = NSTextAlignmentRight;
            contentLab.tag = 10000 + indexPath.row;
            [cell.contentView addSubview:contentLab];
        }
        
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, H - 0.5, WIDTH, 0.5)];
        lineLab.backgroundColor = XIANCOLOR;
        [cell.contentView addSubview:lineLab];
        
    } else {
        
        cell.backgroundColor = BACKGROUNDCOLOR;
        self.finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.finishBtn.frame = CGRectMake(10, 30, WIDTH - 20, 40);
        self.finishBtn.backgroundColor = MAINCOLOR;
        self.finishBtn.layer.cornerRadius = 3;
        [self.finishBtn setTitle:@"保存" forState:UIControlStateNormal];
        self.finishBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.finishBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
        [self.finishBtn addTarget:self action:@selector(finishBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:self.finishBtn];
        
    }
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row >0 && indexPath.row < self.titAry.count) {
        
        self.selectTabRow = indexPath.row;
        [self.pickerView selectRow:0 inComponent:0 animated:NO];
        
        [UIView animateWithDuration:0.3 animations:^{
            
            [WINDOW addSubview:self.backView];
            [WINDOW addSubview:self.pickerTitView];
            [WINDOW addSubview:self.pickerView];
            [self.pickerView reloadAllComponents];
            
            if (self.selectTabRow == 1) {
                self.pickerTitLab.text = @"性别";
            } else if (self.selectTabRow == 2) {
                self.pickerTitLab.text = @"婚姻状态";
            } else if (self.selectTabRow == 3) {
                self.pickerTitLab.text = @"身高";
            } else {
                self.pickerTitLab.text = @"生日";
            }
            
            self.pickerTitView.frame = CGRectMake(0, HEIGHT - PICKER_H - PICKER_Tit_H, WIDTH, PICKER_Tit_H);
            self.pickerView.frame = CGRectMake(0, HEIGHT - PICKER_H, WIDTH, PICKER_H);
            CGFloat alpha = 1-(HEIGHT - self.pickerTitView.frame.origin.y)/(PICKER_H+PICKER_Tit_H) + 0.5;
            self.backView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:alpha];
        } completion:^(BOOL finished) {
            
            
        }];
        
    }
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.titAry.count) {
        return 49;
    } else {
        return 80;
    }
    
}



#pragma mark- Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    NSInteger num = 0;
    /**性别**/
    if (self.selectTabRow == 1) {
        num = 1;
    }
    
    /**婚姻状态**/
    if (self.selectTabRow == 2) {
        num = 1;
    }
    
    /**身高**/
    if (self.selectTabRow == 3) {
        num = 1;
    }
    
    /**生日**/
    if (self.selectTabRow == 4) {
        num = 3;
    }
    
    return num;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger num = 0;
    /**性别**/
    if (self.selectTabRow == 1) {
        num = self.sexAry.count;
    }
    
    /**婚姻状态**/
    if (self.selectTabRow == 2) {
        num = self.marryAry.count;
    }
    
    /**身高**/
    if (self.selectTabRow == 3) {
        num = self.heightAry.count;
    }
    
    /**生日**/
    if (self.selectTabRow == 4) {
        num = 3;
    }
    
    return num;
}


#pragma mark - Picker Delegate Methods


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.selectPickRow = row;
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    NSInteger num = 0;
    /**性别**/
    if (self.selectTabRow == 1) {
        num = WIDTH;
    }
    
    /**婚姻状态**/
    if (self.selectTabRow == 2) {
        num = WIDTH;
    }
    
    /**身高**/
    if (self.selectTabRow == 3) {
        num = WIDTH;
    }
    
    /**生日**/
    if (self.selectTabRow == 4) {
        num = WIDTH/3;
    }
    
    return num;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    
    /**性别**/
    if (self.selectTabRow == 1) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [self.sexAry objectAtIndex:row];
        myView.font = JDFont(15);
        myView.backgroundColor = BACKGROUNDCOLOR;
        myView.textColor = ZITIBLACKCOLOR;
        
    }
    
    /**婚姻状态**/
    if (self.selectTabRow == 2) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [[self.marryAry objectAtIndex:row] objectForKey:@"Text"];
        myView.font = JDFont(15);
        myView.backgroundColor = BACKGROUNDCOLOR;
        myView.textColor = ZITIBLACKCOLOR;
        
        
    }
    
    /**身高**/
    if (self.selectTabRow == 3) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [self.heightAry objectAtIndex:row];
        myView.font = JDFont(15);
        myView.backgroundColor = BACKGROUNDCOLOR;
        myView.textColor = ZITIBLACKCOLOR;
        
        
    }
    
    /**生日**/
    if (self.selectTabRow == 4) {
        
    }
    
    return myView;
}



#pragma mark - 获取婚姻状态

- (void)getMarryInfo
{
    [MBProgressHUD showHUDAddedTo:WINDOW animated:YES];
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@", BaseURL, JDGetDownList(3)];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",nil];
    
    [manager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        for (NSDictionary * dic in responseObject[@"Data"]) {
            [self.marryAry addObject:dic];
        }
        [self.pickerView reloadAllComponents];
        
        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
    }];
}


#pragma mark - 完成方法

- (void)finishBtnMethod:(UIButton *)sender
{
    [MBProgressHUD showHUDAddedTo:WINDOW animated:YES];
    
    UITextField * nickTF = [self.view viewWithTag:10000];
    UILabel * sexLab = [self.view viewWithTag:10001];
    UILabel * marryLab = [self.view viewWithTag:10002];
    UILabel * heightLab = [self.view viewWithTag:10003];
    UILabel * birthLab = [self.view viewWithTag:10004];
    
    NSString * urlStr = [NSString stringWithFormat:@"%@%@", BaseURL, JDUpdateUserBaseInfo];
    
    NSMutableDictionary * parameter = [NSMutableDictionary dictionary];
    [parameter setValue:@"370" forKey:@"UserID"];
    [parameter setValue:[nickTF.text stringByReplacingOccurrencesOfString:@"\r" withString:@""] forKey:@"NickName"];
    if ([sexLab.text isEqualToString:@"男"]) {
        //男
        [parameter setValue:@"true" forKey:@"Sex"];
    } else {
        //女
        [parameter setValue:@"false" forKey:@"Sex"];
    }
    
    if ([marryLab.text isEqualToString:@"未婚"]) {
        [parameter setValue:@"1" forKey:@"Marry"];
    } else if ([marryLab.text isEqualToString:@"离异"]) {
        [parameter setValue:@"2" forKey:@"Marry"];
    } else {
        [parameter setValue:@"3" forKey:@"Marry"];
    }
    
    [parameter setValue:[NSString stringWithFormat:@"%@", [heightLab.text substringToIndex:2]] forKey:@"Heigth"];
    [parameter setValue:nil forKey:@"BirthDay"];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/plain",nil];
    
    [manager POST:urlStr parameters:parameter progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if ([responseObject[@"Status"] isEqualToString:@"success"]) {
            JDAlert(responseObject[@"Data"]);
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
        
        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD hideHUDForView:WINDOW animated:YES];
    }];
    
}



#pragma mark - 确定方法

- (void)sureBtnMethod:(UIButton *)sender
{
    UILabel * contentLab = [self.view viewWithTag:10000 + self.selectTabRow];
    /**性别**/
    if (self.selectTabRow == 1) {
        contentLab.text = self.sexAry[self.selectPickRow];
    }
    
    /**婚姻状态**/
    if (self.selectTabRow == 2) {
        contentLab.text = [self.marryAry[self.selectPickRow] objectForKey:@"Text"];
    }
    
    /**身高**/
    if (self.selectTabRow == 3) {
        contentLab.text = self.heightAry[self.selectPickRow];
    }
    
    /**生日**/
    if (self.selectTabRow == 4) {
        
    }
    
    [self dismissBackView];

}


#pragma mark - 点击背景消失方法

- (void)dismissBackView
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.pickerTitView.frame = CGRectMake(0, HEIGHT, WIDTH, PICKER_Tit_H);
        self.pickerView.frame = CGRectMake(0, HEIGHT + PICKER_Tit_H, WIDTH, PICKER_H);
        CGFloat alpha =(HEIGHT - self.pickerTitView.frame.origin.y)/(PICKER_H+PICKER_Tit_H)-0.5;
        self.backView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:alpha];
    } completion:^(BOOL finished) {
        
        [self.backView removeFromSuperview];
        [self.pickerTitView removeFromSuperview];
        [self.pickerView removeFromSuperview];
    }];
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
            [self.view removeGestureRecognizer:self.disKeyTap];
            return YES;
        }
    }
    return NO;
}



- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self.view addGestureRecognizer:self.disKeyTap];
    return YES;
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
