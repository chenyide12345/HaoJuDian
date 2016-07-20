//
//  BranceBundingController.m
//  HaoJuDian
//
//  Created by ming on 16/7/20.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "BranceBundingController.h"
#import "BranceBankModel.h"
#import "BranceCaredCell.h"
#import "AddBankeNumberController.h"

@interface BranceBundingController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray *cardArr;
@property(nonatomic,strong)UITableView *tableView;

@property(nonatomic,strong)UIImageView *bgImageView;
@end

@implementation BranceBundingController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我的银行卡";
    self.view.backgroundColor = kColor(245, 245, 245);
    
    [self requestData];
   

}
/**
 *  懒加载
 */
-(NSMutableArray *)cardArr
{
    if (!_cardArr) {
        
        _cardArr = [NSMutableArray array];
    }
    return _cardArr;

}
-(UITableView *)tableView
{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight-NavHeight) style:UITableViewStylePlain];
        _tableView.backgroundColor =[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        _tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_tableView];
        
        _tableView.delegate =self;
        
        _tableView.dataSource = self;
    }
    [self.view addSubview:_tableView];
    
    return _tableView;

}
#pragma mark =============== tableView代理方法 ===============
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _cardArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *cellID = @"ID";
    
    BranceCaredCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        
        cell = [[BranceCaredCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.separatorInset =UIEdgeInsetsZero;
    }
    
    cell.model =self.cardArr[indexPath.row];
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;

}

#pragma mark =============== 请求数据 ===============
-(void)requestData
{
    [self showHudWithString:@"加载中..."];
    NSString *bankUrlStr = [NSString stringWithFormat:@"%@%@",BaseURL,bankCared];
    
    NSDictionary *userDict = @{@"userid":@"327"};
  
    WS(weakself);
    [[JDHttpManager shareManager]requestWithURL:bankUrlStr RequestType:RequestTypePost Parameters:userDict Success:^(id responseObject) {
        if ([responseObject[@"Status"]isEqualToString:@"success"]) {
            
//            NSDictionary *dataDict = responseObject[@"Data"];
//            NSArray *modelArr = dataDict[@"model"];
            
          // weakself.cardArr = [BranceBankModel mj_objectArrayWithKeyValuesArray:modelArr];
            
        }else
        {
        
            [[JDAlertView sharedAlert]createTip:responseObject[@"Message"]];
        }
        
        [weakself hidHud];
        
        [weakself.tableView reloadData];
        [weakself initUI];
        
        
    } Failure:^(NSError *error) {
         JDLog(@" %",error);
        [weakself hidHud];
        [[JDAlertView sharedAlert]createTip:@"数据异常，加载失败...."];
       
    }];

}
-(void)initUI{
    
    NSInteger number = self.cardArr.count;
    UIButton *addBtn= [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *addCaredImg =[UIImage imageNamed:@"addBankCared"];
    addBtn.frame= CGRectMake(10, 10, ScreenWidth-20, addCaredImg.size.height);
    
    [addBtn setBackgroundImage:addCaredImg forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBankCards) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *footer =[[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    
    footer.backgroundColor =[UIColor whiteColor];
    
    [footer addSubview:addBtn];
    [self.view addSubview:footer];
    
    self.tableView.tableFooterView =footer;
    

    if (number == 3) {
        
        self.tableView.tableFooterView.hidden =YES;
    }else if(number<3)
    {
        self.tableView.tableFooterView.hidden =NO;
    
    }

}
#pragma mark =============== 添加银行卡点击事件 ===============
- (void)addBankCards
{
    AddBankeNumberController *addVC=[[AddBankeNumberController alloc]init];
    
    
    [self.navigationController pushViewController:addVC animated:YES];
    
}

@end




























