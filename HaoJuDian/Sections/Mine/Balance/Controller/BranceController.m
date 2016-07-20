//
//  BranceController.m
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "BranceController.h"
#import "BranceRechargeController.h"
#import "BranceBundingController.h"

@interface BranceController ()
{
    BOOL _isSelected; //标记按钮默认选中

}

@property (nonatomic,strong)UIButton * rechargeButton;//充值按钮

@property (nonatomic,strong)UIButton *withdrawalsButton;//提现

@property (nonatomic,strong)UIButton * billButton;//账单

@property (nonatomic,strong)UIView *bankView;

@property (nonatomic,strong)UIView *lineView;//间隔线

@property (nonnull,strong)UILabel *moneyLabel;//余额钱数

@property (nonnull,strong)UILabel *caredNumber;// 卡数

@end

@implementation BranceController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"余额";
    self.view.backgroundColor = kColor(245, 245, 245);
    
    [self setupView];
    [self setupUI];
    
    [self setupButtonView];
}
//初始化背景视图
-(void)setupView
{
    _bankView = [[UIView alloc]init];
    _bankView.frame = CGRectMake(0, 1, ScreenWidth, 390/2*AUTO_IPHONE6_HEIGHT_667);
    _bankView.backgroundColor = [JDTools stringToColor:@"#ff809e"];
    [self.view addSubview:_bankView];
    
}

#pragma mark --- 创建UI
- (void)setupUI
{
 
    UIImage *leftImg = [UIImage imageNamed:@"brance"];
     UIImageView *leftImgView= [[UIImageView alloc]initWithFrame:CGRectMake(145/2*AUTO_IPHONE6_WIDTH_375, 105/2*AUTO_IPHONE6_HEIGHT_667, leftImg.size.width, leftImg.size.height)];
    leftImgView.image = leftImg;
    [_bankView addSubview:leftImgView];
    
    UILabel * leftLabel =[[UILabel alloc]init];
    NSString *leftStr = @"余额 ( 元 )";
    NSDictionary *leftDict = @{NSFontAttributeName:systemFont(12)};
    CGRect  leftRect = [leftStr  boundingRectWithSize:CGSizeMake(100*AUTO_IPHONE6_WIDTH_375, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:leftDict context:nil];
    leftLabel.textColor = [JDTools stringToColor:@"#ffffff"];
    leftLabel.font = systemFont(12);
    leftLabel.text = leftStr;
    leftLabel.frame = CGRectMake(60*AUTO_IPHONE6_WIDTH_375, ViewBelow(leftImgView)+15/2*AUTO_IPHONE6_HEIGHT_667, leftRect.size.width, leftRect.size.height);
    [_bankView addSubview:leftLabel];
    
    _moneyLabel = [[UILabel alloc]init];
    NSString *money = @"100.00";
    NSDictionary *moneyDict = @{NSFontAttributeName:systemFont(36)};
    CGRect  monsyRect = [money  boundingRectWithSize:CGSizeMake(1000, 40) options:NSStringDrawingUsesLineFragmentOrigin attributes:moneyDict context:nil];
    _moneyLabel.textColor = [JDTools stringToColor:@"#ffffff"];
    _moneyLabel.font = systemFont(36);
    _moneyLabel.frame = CGRectMake(55*AUTO_IPHONE6_WIDTH_375, ViewBelow(leftLabel)+15*AUTO_IPHONE6_HEIGHT_667, monsyRect.size.width, monsyRect.size.height);
    _moneyLabel.textAlignment = NSTextAlignmentLeft;
    _moneyLabel.text = @"0.00";
    [_bankView addSubview:_moneyLabel];
    
    _lineView = [[UIView alloc]init];
    _lineView.frame = CGRectMake(0, 0, 1, 35*AUTO_IPHONE6_HEIGHT_667);
    _lineView.center = _bankView.center;
    _lineView.backgroundColor = [JDTools stringToColor:@"#ffffff"];
    [_bankView addSubview:_lineView];
    
    
    UIButton *caredButton  =[UIButton buttonWithType:UIButtonTypeCustom];
     UIImage *rightImg = [UIImage imageNamed:@"bankCard"];
    caredButton.frame = CGRectMake(ViewRight(_lineView)+55*AUTO_IPHONE6_WIDTH_375, 105/2*AUTO_IPHONE6_HEIGHT_667, rightImg.size.width, rightImg.size.height);
    [caredButton setImage:rightImg forState:UIControlStateNormal];
    [caredButton addTarget:self action:@selector(caredClick:) forControlEvents:UIControlEventTouchUpInside];
    [_bankView addSubview:caredButton];

    
    UILabel *rithtLabel  =[[UILabel alloc]init];
    NSString *rithStr = @"银行卡(张)";
    NSDictionary *rightDict = @{NSFontAttributeName:systemFont(12)};
    CGRect  rigthRect =  [rithStr boundingRectWithSize:CGSizeMake(1000, 15) options:NSStringDrawingUsesLineFragmentOrigin attributes:rightDict context:nil];
    rithtLabel.frame = CGRectMake(ViewRight(_lineView)+55*AUTO_IPHONE6_WIDTH_375, ViewY(leftLabel), rigthRect.size.width, rigthRect.size.height);
    rithtLabel.text = rithStr;
    rithtLabel.textColor = [JDTools stringToColor:@"#ffffff"];
    rithtLabel.font = systemFont(12);
    [_bankView addSubview:rithtLabel];
    
    
    _caredNumber = [[UILabel alloc]init];
    _caredNumber.frame =CGRectMake(ViewRight(_lineView)+55*AUTO_IPHONE6_WIDTH_375, ViewBelow(rithtLabel)+15*AUTO_IPHONE6_HEIGHT_667, 150*AUTO_IPHONE6_WIDTH_375, 36*AUTO_IPHONE6_HEIGHT_667);
    _caredNumber.textColor=[JDTools stringToColor:@"#ffffff"];
    _caredNumber.font = systemFont(36);
    _caredNumber.text = @"100";
    [_bankView addSubview:_caredNumber];
    
}

#pragma mark - 充值按钮
-(void)setupButtonView
{
    _rechargeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    NSArray *titleArr = @[@"充值",@"提现",@"余额账单"];
    
    for (int i= 0 ; i<titleArr.count; i++) {
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        btn.frame = CGRectMake(37/2*AUTO_IPHONE6_WIDTH_375, ViewBelow(_bankView)+25*AUTO_IPHONE6_HEIGHT_667 +i*(44+10)*AUTO_IPHONE6_HEIGHT_667,  323*AUTO_IPHONE6_WIDTH_375, 44*AUTO_IPHONE6_HEIGHT_667);
        [btn setTitle: titleArr[i] forState:UIControlStateNormal];
        
        btn.titleLabel.font = systemFont(15);
        btn.tag = 101+i;
        btn.layer.cornerRadius = 44/2*AUTO_IPHONE6_HEIGHT_667;
        btn.layer.masksToBounds = YES;
        [btn addTarget:self action:@selector(branceClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
     
    }
     _rechargeButton = (UIButton *)[self.view viewWithTag:101];
     _withdrawalsButton = (UIButton *)[self.view viewWithTag:102];
     _billButton= (UIButton *)[self.view viewWithTag:103];
    
    _rechargeButton.backgroundColor = MAINCOLOR;
    [_rechargeButton setTitleColor:[JDTools stringToColor:@"#ffffff"] forState:UIControlStateNormal];

  
    _withdrawalsButton.backgroundColor = kColor(255, 255, 355);
    [_withdrawalsButton setTitleColor:[JDTools stringToColor:@"#323232"] forState:UIControlStateNormal];
     _withdrawalsButton.layer.borderColor = (__bridge CGColorRef _Nullable)(kColor(220, 220, 220));
    _withdrawalsButton.layer.borderWidth = 1;
    
    
    _billButton.backgroundColor = kColor(255, 255, 355);
    [_billButton setTitleColor:[JDTools stringToColor:@"#323232"] forState:UIControlStateNormal];
     _billButton.layer.borderColor =  (__bridge CGColorRef _Nullable)(kColor(220, 220, 220));
    _billButton.layer.borderWidth = 1;
    
}

#pragma mark =============== 绑定银行卡 ===============
-(void)caredClick:(UIButton *)button
{
        
    BranceBundingController *bundVc = [[BranceBundingController alloc]init];
    [self.navigationController pushViewController:bundVc animated:YES];
    
}
#pragma  mark  - 充值 提现 --点击事件
-(void)branceClick:(UIButton *)btn
{
    switch (btn.tag) {
        case 101:
        {
         
            BranceRechargeController *recharVc = [[BranceRechargeController alloc]init];
            [self.navigationController pushViewController:recharVc animated:YES];
        }
            break;
        case 102:
        {
            
        }
            break;
        case 103:
        {
            
        }
            break;
            
        default:
            break;
    }
    

}











- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
