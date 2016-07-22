//
//  AddBankeNumberController.m
//  HaoJuDian
//
//  Created by ming on 16/7/20.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "AddBankeNumberController.h"
#import "AddBankeNumberCell.h"

#import "AddCaredTypeView.h"

@interface AddBankeNumberController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>
{

    UILabel *_titleLabel;
}

@property (nonatomic,strong)UIView *banckView;//背景图
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *titleArr;
@property (nonatomic,strong) UIView *ahpaView;

@property (nonatomic,strong)AddCaredTypeView *addTypeView;//银行卡类型View

@property (nonatomic,copy)NSString *userName;
@property (nonatomic,copy)NSString *userBankCared;
@property (nonatomic,copy)NSString *userID;
@property (nonatomic,copy)NSString *userPhone;
@property (nonatomic,copy)NSString *bankAddress;

@property (nonatomic,copy)NSString *caredString;


@end

@implementation AddBankeNumberController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.title = @"添加银行卡";
    
     self.view.backgroundColor = kColor(246, 246, 246);
    
    [self creatFieldUserInfoView];
    
}
-(NSArray *)titleArr
{
    if (!_titleArr) {
        
        _titleArr = [NSArray array];
    }
    return _titleArr;
}
-(void)creatFieldUserInfoView
{
    
    _banckView = [[UIView alloc]initWithFrame:CGRectMake(0, 45, ScreenWidth, 45*AUTO_IPHONE6_HEIGHT_667)];
    _banckView.backgroundColor = kColor(246, 246, 246);
    [self.view addSubview:_banckView];
    
    UILabel *titleLabel =[[UILabel alloc]initWithFrame:CGRectMake(10*autoSizeScaleX, 0, 200*AUTO_IPHONE6_WIDTH_375, 40*AUTO_IPHONE6_HEIGHT_667)];
    titleLabel.textColor =kColor(135, 135, 135);
    titleLabel.font = JDFont(15);
    titleLabel.text = @"请绑定持卡人本人的银行卡";
    [_banckView addSubview:titleLabel];
    
    UIView *btomView = [[UIView alloc]init];
    btomView.frame = CGRectMake(0, 0, ScreenWidth, 45);
    btomView.backgroundColor = [UIColor clearColor];
    
 // 保存 用户持卡信息
    UIButton *saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    saveBtn.frame = CGRectMake(37/2*AUTO_IPHONE6_WIDTH_375, 0, ScreenWidth-37*AUTO_IPHONE6_WIDTH_375, 45);
    [saveBtn setBackgroundColor:MAINCOLOR];
    saveBtn.layer.masksToBounds = YES;
    saveBtn.layer.cornerRadius = 40/2*AUTO_IPHONE6_HEIGHT_667;
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    saveBtn.titleLabel.font = JDFont(15);
    [saveBtn addTarget:self action:@selector(savBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [btomView addSubview:saveBtn];
    
    NSArray *leftArr = [NSArray arrayWithObjects:@"姓名",@"银行卡",@"身份证号",@"持卡人电话",@"银行名称",@"银行卡类型",@"开户行地址", nil];
    _titleArr = leftArr;
    
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-NavHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = kColor(246, 246, 246);
    self.tableView.tableFooterView = [[UIView alloc]init];
    self.tableView.tableHeaderView = _banckView;
    self.tableView.tableFooterView = btomView;
    
    [self.view addSubview:self.tableView];
    
    
  
}
#pragma mark =============== 代理方法 ===============
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titleArr.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 49;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     static NSString *cellName = @"ID";
     NSInteger row = [indexPath row];
     AddBankeNumberCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
     if (cell == nil) {
        cell = [[AddBankeNumberCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    NSString *leftStr = _titleArr[indexPath.row];
    cell.userField.tag = row;
    cell.userField.delegate = self;
    [cell.userField addTarget:self action:@selector(textFieldWithText:) forControlEvents:UIControlEventEditingChanged];
    
    cell.rightButton.tag = indexPath.row;
    [cell.rightButton addTarget:self action:@selector(choesClick:) forControlEvents:UIControlEventTouchUpInside];
   
    switch (row) {
        case 0:
        {
            cell.leftLabel.text = [NSString stringWithFormat:@"%@",leftStr];
            cell.rightButton.hidden =YES;
            cell.rightLabel.hidden = YES;
            cell.userField.placeholder = @"请输入持卡人姓名";
        
        }
            break;
        case 1:
        {
            cell.leftLabel.text = [NSString stringWithFormat:@"%@",leftStr];
            cell.rightButton.hidden =YES;
            cell.rightLabel.hidden = YES;
            cell.userField.placeholder = @"请输入银行卡号";
            
        }
            break;
        case 2:
        {
            cell.leftLabel.text = [NSString stringWithFormat:@"%@",leftStr];
            cell.rightButton.hidden =YES;
            cell.rightLabel.hidden = YES;
            cell.userField.placeholder = @"请输入持卡人身份证号";
        }
            break;
        case 3:
        {
            cell.leftLabel.text = [NSString stringWithFormat:@"%@",leftStr];
            cell.rightButton.hidden =YES;
            cell.rightLabel.hidden = YES;
            cell.userField.placeholder = @"请输入持卡人电话";
            
            
        }
            break;
        case 4:
        {
            cell.leftLabel.text = [NSString stringWithFormat:@"%@",leftStr];
            cell.userField.hidden =YES;
            cell.rightButton.hidden =NO;
            cell.rightLabel.hidden = NO;
           ;
            
        }
            break;
        case 5:
        {
            cell.leftLabel.text = [NSString stringWithFormat:@"%@",leftStr];
            cell.userField.hidden =YES;
            cell.rightButton.hidden =NO;
            cell.rightLabel.hidden = NO;
            if (self.caredString ==nil) {
               
            }else
            {
             cell.rightLabel.text = self.caredString;
            }
           
            
            
        }
            break;
        case 6:
        {
            cell.leftLabel.text = [NSString stringWithFormat:@"%@",leftStr];
            cell.rightButton.hidden =YES;
            cell.rightLabel.hidden = YES;
            cell.userField.placeholder = @"请输入开户行地址";
            
        }
            break;
        default:
            break;
    }
    

    
    return cell;

}

#pragma mark =============== cell上的按钮弹出复选框 ===============
-(void)choesClick:(UIButton*)btn
{
    if (btn.tag ==4)
    {
        JDLog(@"点击4");
        
        
        
    }else if (btn.tag ==5)
    {
     JDLog(@"点击5");
        //弹出 银行卡类型选择框
        [self addCardView];
        
    }

}
/**
 *   银行卡类型选择框
 */
- (void)addCardView
{
    WS(weakself);
    
    weakself.ahpaView = [[UIView alloc]initWithFrame:self.tableView.bounds];
    weakself.ahpaView.backgroundColor = [UIColor colorWithRed:102/256 green:102/256 blue:102/256 alpha:0.5];
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeView)];
//    [_ahpaView addGestureRecognizer:tap];
    
    _ahpaView.userInteractionEnabled = YES;
    [self.tableView addSubview:_ahpaView];
    
    self.addTypeView = [[AddCaredTypeView alloc]initWithFrame:CGRectMake(0, 0, 200, 180*AUTO_IPHONE6_HEIGHT_667)];
    self.addTypeView.center =_ahpaView.center;
    self.addTypeView.backgroundColor =[UIColor whiteColor];
    self.addTypeView.userInteractionEnabled = YES;
    self.addTypeView.layer.masksToBounds = YES;
    self.addTypeView.layer.cornerRadius =10;
    
    [_ahpaView addSubview:self.addTypeView];
    
    
    weakself.addTypeView.myBlock = ^(NSString *caredStr){
        
         weakself.caredString = caredStr;
        
        [weakself.ahpaView removeFromSuperview];
        
        [weakself.tableView reloadData];
    };
 

}

#pragma mark =============== textFieldDelegate 代理方法 ===============
//通过代理 方法 获取 到 cell中 文本框输入的值1
-(void)textFieldWithText:(UITextField *)textField
{
    //调用输入框 中的输入内容
    switch (textField.tag) {
        case 0:
        {
            //用户名
            self.userName = textField.text;
        }
            break;
        case 1:
        {
            //银行卡号
            self.userBankCared = textField.text;
        
            
        }
            break;
        case 2:
        {
             //身份证号
            self.userID = textField.text;
            
        }
            break;
        case 3:
        {
            //用户电话
            self.userPhone = textField.text;
            
        }
            break;
        case 4:
        {
            //银行地址
            self.bankAddress = textField.text;
            
        }
            break;
            
        default:
            break;
    }


}
#pragma mark =============== 移除视图  ===============
-(void)removeView
{
  [_ahpaView removeFromSuperview];
    
    //_ahpaView.hidden = YES;
}
#pragma mark =============== 保存 发起 请求 ===============
-(void)savBtnClick
{

    JDLog(@"点击了");

}








@end
