//
//  BranceBankModel.h
//  HaoJuDian
//
//  Created by ming on 16/7/20.
//  Copyright © 2016年 陈义德. All rights reserved.
//
//  我的银行卡-->银行卡列表cell
#import "JDBaseModel.h"

@interface BranceBankModel : JDBaseModel

@property (nonatomic,copy)NSString *UserID ; //用户id
@property (nonatomic,copy)NSString *CartID ; //卡id
@property (nonatomic,copy)NSString *CartUserName ;// 开户人姓名
@property (nonatomic,copy)NSString *CartUserPhone ; //开户人电话
@property (nonatomic,copy)NSString *BankName ;  //银行名称
@property (nonatomic,copy)NSString *BankType ;//银行卡类型
@property (nonatomic,copy)NSString *BankAddress;//开户行地址


@end
