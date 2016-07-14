//
//  MyHobbyViewController.m
//  HaoJuDian
//
//  Created by 陈义徳 on 16/7/14.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MyHobbyViewController.h"

@interface MyHobbyViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSArray * liveAry;
@property (nonatomic, strong) NSArray * sportAry;

@end

@implementation MyHobbyViewController

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
    titleLabel.text = @"个人爱好";  //设置标题
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
    
    
    
}



#pragma mark - 懒加载

- (NSArray *)liveAry
{
    if (_liveAry == nil) {
        self.liveAry = [NSArray arrayWithObjects:@"汽车", @"朋友聚会", @"逛街", @"散步", @"睡懒觉", @"理财", @"养花", @"旅游", @"网购", @"收藏", @"电子产品", @"炒股", nil];
    }
    return _liveAry;
}


- (NSArray *)sportAry
{
    if (_sportAry == nil) {
        self.sportAry = [NSArray arrayWithObjects:@"游泳", @"瑜伽", @"跆拳道", @"跑步", @"健美操", @"健身器材", nil];
    }
    return _sportAry;
}



#pragma mark - UITableViewDataSource And Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.row == 0) {
        
        CGFloat H = 49;
        
        UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(10, H/2 - 10, 100, 20)];
        titLab.text = @"生活方式";
        titLab.textColor = ZITIBLACKCOLOR;
        titLab.font = [UIFont systemFontOfSize:17];
        [cell.contentView addSubview:titLab];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, H - 0.5, WIDTH, 0.5)];
        lineLab.backgroundColor = XIANCOLOR;
        [cell.contentView addSubview:lineLab];
        
        
        for (int i = 0; i < 12; i++) {
            
            CGFloat jiange = 20;
            CGFloat btnW = (WIDTH-5*jiange)/4;
            CGFloat btnH = 28;
            
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(jiange + (i%4)*(btnW+jiange), CGRectGetMaxY(lineLab.frame) + 10 + (i%3)*(10+btnH), btnW, btnH);
            btn.backgroundColor = [UIColor whiteColor];
            btn.layer.cornerRadius = 14;
            [btn setTitle:self.liveAry[i] forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            [btn setTitleColor:ZITIBLACKCOLOR forState:UIControlStateNormal];
            btn.layer.borderWidth = 1;
            btn.layer.borderColor = MAINCOLOR.CGColor;
            [cell.contentView addSubview:btn];
            
        }
        
        
    } else {
        
//        cell.backgroundColor = BACKGROUNDCOLOR;
//        self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        self.saveBtn.frame = CGRectMake(10, 30, WIDTH - 20, 40);
//        self.saveBtn.backgroundColor = MAINCOLOR;
//        self.saveBtn.layer.cornerRadius = 3;
//        [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
//        self.saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
//        [self.saveBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
//        [self.saveBtn addTarget:self action:@selector(saveBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
//        [cell.contentView addSubview:self.saveBtn];
        
    }
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return self.liveAry.count/4*(10+28)+10;
    } else {
        return 80;
    }
    
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
