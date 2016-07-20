//
//  BranceRechargeController.m
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "BranceRechargeController.h"
#import "RechargeViewCell.h"

@interface BranceRechargeController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)NSMutableArray *dataArr;
@property (nonatomic,strong)NSArray *titleArr;

@property (nonatomic,strong)UIButton *confirmButton;

@end

@implementation BranceRechargeController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"充值";
    
    self.view.backgroundColor =kColor(245, 245, 245);
    
    [self creatTableView];

}
/*
  懒加载
 */
-(NSArray *)dataArr
{
    if (!_dataArr) {
        
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(void)creatTableView
{

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
    self.tableView.delegate  = self;
    self.tableView.dataSource = self;
    //self.tableView.tableFooterView = [[UIView alloc]init];
  //  self.tableView.showsHorizontalScrollIndicator = NO;
//    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = kColor(245, 245, 245);
    [self.view addSubview:self.tableView];
    
    _titleArr = [[NSArray alloc]initWithObjects:@"当前余额",@"充值金额",nil];
    [_dataArr addObject:_titleArr];
    

}
#pragma mark - tableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        
        return  2;
    }else
    {
        return 1;
    }
    
    return 0;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return 45;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellName = @"ID";
  //  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    RechargeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (cell == nil) {
        cell = [[RechargeViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellName];
        cell.selectionStyle = UITableViewCellAccessoryNone;
    }
    NSString *str = _dataArr[indexPath.section][indexPath.row];
    if (indexPath.section == 0) {
      
        if (indexPath.row ==0) {
            cell.textLabel.text= @"当前余额";
            cell.moneyLabel.text = [NSString stringWithFormat:@"¥ 1000.00"];
            cell.changeField.hidden= YES;
        }else
        {
            cell.textLabel.text= @"充值金额";
            cell.changeField.placeholder= @"请输入充值金额";
            cell.changeField.delegate = self;
            [cell.changeField addTarget:self action:@selector(textFieldWithText:) forControlEvents:UIControlEventEditingChanged];
        
        }
   

    }

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{


}

-(void)textFieldWithText:(UITextField *)textField
{


}





























@end
