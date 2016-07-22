//
//  MyPhotoViewController.m
//  HaoJuDian
//
//  Created by 陈义徳 on 16/7/21.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "MyPhotoViewController.h"
#import "PhotoCollectionViewCell.h"
#import "ZWCollectionViewFlowLayout.h"

@interface MyPhotoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource, ZWwaterFlowDelegate>

@property (nonatomic, strong) UICollectionView * collectionView;

@end

@implementation MyPhotoViewController

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
    self.navigationController.navigationBar.barTintColor = MAINCOLOR;
    self.view.backgroundColor = BACKGROUNDCOLOR;
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 100, 44)];
    titleLabel.backgroundColor = [UIColor clearColor];  //设置Label背景透明
    titleLabel.font = [UIFont systemFontOfSize:17];  //设置文本字体与大小
    titleLabel.textColor = ZITIWHITECOLOR;  //设置文本颜色
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = @"我的相册";  //设置标题
    self.navigationItem.titleView = titleLabel;
    
    UIButton * delegateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    delegateBtn.frame = CGRectMake(0, 0, 30, 20);
    delegateBtn.backgroundColor = [UIColor clearColor];
    [delegateBtn setTitle:@"删除" forState:UIControlStateNormal];
    [delegateBtn setTitleColor:ZITIWHITECOLOR forState:UIControlStateNormal];
    delegateBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [delegateBtn addTarget:self action:@selector(delegateBtnMethod:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * rightBar = [[UIBarButtonItem alloc] initWithCustomView:delegateBtn];
    self.navigationItem.rightBarButtonItem = rightBar;
    
    
}



#pragma mark - 加载Views

- (void)setupViews
{
    ZWCollectionViewFlowLayout * layOut = [[ZWCollectionViewFlowLayout alloc] init];
    layOut.degelate =self;
    layOut.colCount = 2;   //列数
    layOut.rowMagrin = 10; //行间距
    layOut.colMagrin = 10; //列间距
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layOut];
    self.collectionView.delegate =self;
    self.collectionView.dataSource =self;
    [self.collectionView registerClass:[PhotoCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [self.view addSubview:self.collectionView];
    
    
}




#pragma mark - CollectionView ---------------------------------------
//section 的个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//cell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
    [cell sizeToFit];
    if (!cell) {
        NSLog(@"-----------------");
    }
    
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%@",@(indexPath.row).description);
}

#pragma mark -- UICollectionViewDelegate

//代理方法
-(CGFloat)ZWwaterFlow:(ZWCollectionViewFlowLayout *)waterFlow heightForWidth:(CGFloat)width atIndexPath:(NSIndexPath *)indexPach
{
    //    shopModel * shop = self.shops[indexPach.item];
    //    return shop.h/shop.w*width;
    return 100;
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
