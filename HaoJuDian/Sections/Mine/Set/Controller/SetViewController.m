//
//  SetViewController.m
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/8.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "SetViewController.h"
#import "ChangePasswordViewController.h"

@interface SetViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * tableView;

@property (nonatomic, strong) NSArray * titAry;
@property (nonatomic, strong) UIButton * logoutBtn;//退出登录btn

@end

@implementation SetViewController

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
    titleLabel.font = [UIFont boldSystemFontOfSize:20];  //设置文本字体与大小
    titleLabel.textColor = [UIColor whiteColor];  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"设置";  //设置标题
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
        self.titAry = [NSArray arrayWithObjects:@"显示设置", @"修改密码", @"设置支付密码", @"意见反馈", @"我要举报", @"帮助中心", @"关于我们", nil];
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
        
        UILabel *titLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 11, 100, 20)];
        titLab.text = [NSString stringWithFormat:@"%@", self.titAry[indexPath.row]];
        titLab.textColor = [UIColor colorWithWhite:0.298 alpha:1.000];
        titLab.font = [UIFont systemFontOfSize:15];
        [cell.contentView addSubview:titLab];
        
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 44, 0, 44, 44)];
        img.backgroundColor = MAINCOLOR;
        [cell.contentView addSubview:img];
        
//        UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 94, 11, 50, 20)];
//        contentLab.text = @"不限";
//        contentLab.textColor = [UIColor colorWithWhite:0.773 alpha:1.000];
//        contentLab.font = [UIFont systemFontOfSize:15];
//        contentLab.textAlignment = NSTextAlignmentRight;
//        [cell.contentView addSubview:contentLab];
        
        UILabel *lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 43.5, WIDTH, 0.5)];
        lineLab.backgroundColor = BACKGROUNDCOLOR;
        [cell.contentView addSubview:lineLab];
        
    } else {
        
        cell.backgroundColor = BACKGROUNDCOLOR;
        self.logoutBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.logoutBtn.frame = CGRectMake(10, 20, WIDTH - 20, 34);
        self.logoutBtn.backgroundColor = MAINCOLOR;
        self.logoutBtn.layer.cornerRadius = 6;
        [self.logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        self.logoutBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        [self.logoutBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.logoutBtn addTarget:self action:@selector(logoutBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [cell.contentView addSubview:self.logoutBtn];
        
    }
    
    
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < self.titAry.count) {
        return 44;
    } else {
        return 54;
    }
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        ChangePasswordViewController * changePasswordVC = [ChangePasswordViewController new];
        [self.navigationController pushViewController:changePasswordVC animated:YES];
    }
}



#pragma mark - 退出登录方法

- (void)logoutBtnMethod:(UIButton *)sender
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
