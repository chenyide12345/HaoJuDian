//
//  SearchViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSArray * titAry;
@property (nonatomic, strong) UIButton * saveBtn;//保存btn

@end

@implementation SearchViewController

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
    titleLabel.text = @"搜索条件";  //设置标题
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

- (NSArray *)titAry
{
    if (_titAry == nil) {
        self.titAry = [NSArray arrayWithObjects:@"恋爱观", @"年龄", @"身高", @"婚姻状况", @"居住地", @"月收入", @"购房状况", @"购车状况", nil];
    }
    return _titAry;
}


#pragma mark - UITableViewDataSource And Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titAry.count + 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellIdentifier = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
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
        self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.saveBtn.frame = CGRectMake(10, 30, WIDTH - 20, 40);
        self.saveBtn.backgroundColor = MAINCOLOR;
        self.saveBtn.layer.cornerRadius = 3;
        [self.saveBtn setTitle:@"保存" forState:UIControlStateNormal];
        self.saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.saveBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
        [self.saveBtn addTarget:self action:@selector(saveBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:self.saveBtn];

    }
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.titAry.count) {
        return 49;
    } else {
        return 80;
    }
    
}


#pragma mark - 保存方法

- (void)saveBtnMethod:(UIButton *)sender
{
    
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
