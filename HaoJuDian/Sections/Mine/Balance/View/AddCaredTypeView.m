//
//  AddCaredTypeView.m
//  HaoJuDian
//
//  Created by ming on 16/7/21.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "AddCaredTypeView.h"

#define ZShowViewWidh 100
#define ZShowViewBtnHeight 30

@interface AddCaredTypeView()<UITableViewDataSource,UITableViewDelegate>

//@property (nonatomic,copy)NSString *fromeType;
//@property (nonatomic,strong)UITableView *tableView;
//@property (nonatomic,strong)NSArray *typeArray;
//
//@property(nonatomic,assign)NSInteger indexPath;

@end

@implementation AddCaredTypeView

-(instancetype)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame ];
    if (self) {
        self.backgroundColor  =[UIColor colorWithWhite:0.8 alpha:0.2];
        [self creatUI];
    }
    return self;
}

-(void)reloadTableViewWith:(NSInteger)index and:(NSMutableArray *)arr
{
    self.typeArray =arr;
    self.indexPath =0;

    [self.tableView reloadData];
}

-(void)creatUI{
   
     // 头饰图标题
    UILabel *tittle = [[UILabel alloc]init];
    tittle.frame = CGRectMake(0, 0, self.width, 45*AUTO_IPHONE6_HEIGHT_667);
    tittle.backgroundColor = MAINCOLOR;
    tittle.textColor = [UIColor whiteColor];
    tittle.textAlignment = NSTextAlignmentCenter;
    tittle.text = @"银行卡类型";
    tittle.font =JDFont(16);
    [self addSubview:tittle];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, ViewBelow(tittle), self.width, self.height-ViewHeight(tittle)) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor redColor];
    _tableView.delegate =self;
    _tableView.dataSource = self;
    _tableView.scrollEnabled = NO;
    _tableView.tableFooterView = [[UIView alloc]init];
    [self addSubview:_tableView];
    
    self.typeArray = [NSArray arrayWithObjects:@"请选择",@"信用卡",@"借记卡", nil];
    
}
#pragma mark =============== tableView代理方法 ===============
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.typeArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *cellID = @"cell";
    UITableViewCell*cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell ==nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    NSString *typeStr = self.typeArray [indexPath.row];
   
    if (indexPath.row == 0) {
        
        cell.textLabel.text =typeStr;
     
        
    }else if (indexPath.row == 1)
    {
    cell.textLabel.text =typeStr;
        
    }else if (indexPath.row == 2)
    {
     cell.textLabel.text =typeStr;
 
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    JDLog(@"%ld",indexPath.row);
        if (indexPath.row ==0) {
            JDLog(@"1");
            self.myBlock(_typeArray[indexPath.row]);
            
        }else if (indexPath.row==1 )
        {
            JDLog(@"2");
            self.myBlock(_typeArray[indexPath.row]);
            
        }else if (indexPath.row==2)
        {
            JDLog(@"3");
            self.myBlock(_typeArray[indexPath.row]);
        }
    
}

@end














