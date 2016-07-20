//
//  RegisterSecondViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/11.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#define PICKER_H 240
#import "RegisterSecondViewController.h"

@interface RegisterSecondViewController ()<UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, strong) UITableView * tableView;
@property (nonatomic, strong) UIPickerView * pickerView;
@property (nonatomic, strong) UIView * backView; //灰色背景

@property (nonatomic, strong) NSArray * titAry;
@property (nonatomic, strong) UIButton * finishBtn;//完成btn

@property (nonatomic, assign) NSInteger selectRow; //选择的tab row

@property (nonatomic, strong) NSMutableArray * heightAry;

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
    
    self.pickerView = [[UIPickerView alloc] initWithFrame: CGRectMake(0, HEIGHT, WIDTH, PICKER_H)];
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    self.pickerView.showsSelectionIndicator = YES;
    self.pickerView.backgroundColor = BACKGROUNDCOLOR;
//    [self.pickerView selectRow: 0 inComponent: 0 animated: YES];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissBackView:)];
    [self.backView addGestureRecognizer:tap];
    
}



#pragma mark - 懒加载

- (NSArray *)titAry
{
    if (_titAry == nil) {
        self.titAry = [NSArray arrayWithObjects:@"昵称", @"性别", @"婚姻状态", @"身高", @"生日", nil];
    }
    return _titAry;
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
        
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 20, H/2 - 7, 8, 14)];
        img.backgroundColor = MAINCOLOR;
        [cell.contentView addSubview:img];
        
        UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 82, H/2 - 10, 50, 20)];
        contentLab.text = @"不限";
        contentLab.textColor = ZITIGRAYCOLOR;
        contentLab.font = [UIFont systemFontOfSize:15];
        contentLab.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:contentLab];
        
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
    self.selectRow = indexPath.row;
    [UIView animateWithDuration:0.3 animations:^{
        
        [WINDOW addSubview:self.backView];
        [WINDOW addSubview:self.pickerView];
        
        self.pickerView.frame = CGRectMake(0, HEIGHT - PICKER_H, WIDTH, PICKER_H);
        CGFloat alpha = 1-(HEIGHT - self.pickerView.frame.origin.y)/PICKER_H + 0.5;
        self.backView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:alpha];
    } completion:^(BOOL finished) {
        
        
    }];
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
    if (self.selectRow == 1) {
        num = 1;
    }
    
    /**婚姻状态**/
    if (self.selectRow == 2) {
        num = 1;
    }
    
    /**身高**/
    if (self.selectRow == 3) {
        num = 1;
    }
    
    /**生日**/
    if (self.selectRow == 4) {
        num = 3;
    }
    
    return num;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSInteger num = 0;
    /**性别**/
    if (self.selectRow == 1) {
        num = 2;
    }
    
    /**婚姻状态**/
    if (self.selectRow == 2) {
        num = 3;
    }
    
    /**身高**/
    if (self.selectRow == 3) {
        num = self.heightAry.count;
    }
    
    /**生日**/
    if (self.selectRow == 4) {
        num = 3;
    }
    
    return num;
}


#pragma mark - Picker Delegate Methods


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
    
}


- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    NSInteger num = 0;
    /**性别**/
    if (self.selectRow == 1) {
        num = WIDTH;
    }
    
    /**婚姻状态**/
    if (self.selectRow == 2) {
        num = WIDTH;
    }
    
    /**身高**/
    if (self.selectRow == 3) {
        num = WIDTH;
    }
    
    /**生日**/
    if (self.selectRow == 4) {
        num = WIDTH/3;
    }
    
    return num;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *myView = nil;
    
    /**性别**/
    if (self.selectRow == 1) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
//        myView.text = [province objectAtIndex:row];
        myView.font = systemFont(15);
        myView.backgroundColor = BACKGROUNDCOLOR;
        myView.textColor = ZITIBLACKCOLOR;
        
        if (row == 0) {
            myView.text = @"男";
        } else {
            myView.text = @"女";
        }
        
    }
    
    /**婚姻状态**/
    if (self.selectRow == 2) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        //        myView.text = [province objectAtIndex:row];
        myView.font = systemFont(15);
        myView.backgroundColor = BACKGROUNDCOLOR;
        myView.textColor = ZITIBLACKCOLOR;
        
        if (row == 0) {
            myView.text = @"未婚";
        } else if (row == 1) {
            myView.text = @"离异";
        } else {
            myView.text = @"丧偶";
        }
        
    }
    
    /**身高**/
    if (self.selectRow == 3) {
        myView = [[UILabel alloc] initWithFrame:CGRectMake(0.0, 0.0, 78, 30)];
        myView.textAlignment = NSTextAlignmentCenter;
        myView.text = [self.heightAry objectAtIndex:row];
        myView.font = systemFont(15);
        myView.backgroundColor = BACKGROUNDCOLOR;
        myView.textColor = ZITIBLACKCOLOR;
        
        
    }
    
    /**生日**/
    if (self.selectRow == 4) {
        
    }
    
    return myView;
}




#pragma mark - 完成方法

- (void)finishBtnMethod:(UIButton *)sender
{
    
}



#pragma mark - 点击背景消失方法

- (void)dismissBackView:(UITapGestureRecognizer *)sender
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.pickerView.frame = CGRectMake(0, HEIGHT, WIDTH, PICKER_H);
        CGFloat alpha =(HEIGHT - self.pickerView.frame.origin.y)/PICKER_H-0.5;
        self.backView.backgroundColor = [UIColor colorWithWhite:0.000 alpha:alpha];
    } completion:^(BOOL finished) {
        
        [self.backView removeFromSuperview];
        [self.pickerView removeFromSuperview];
    }];
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
