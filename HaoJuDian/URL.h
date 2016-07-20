//
//  URL.h
//  HaoJuDian
//
//  Created by ming on 16/7/19.
//  Copyright © 2016年 陈义德. All rights reserved.
//
/**
 
  接口 
 
 */
#ifndef URL_h
#define URL_h


#define BaseURL @"http://m.hjd521.com"



//登录
#define JDLogin  @"/api/AppAccount/userLogin"

//注册
#define JDRegister  @"/api/appaccount/UserCreate"

//发送验证码
#define JDSendCode @"/api/AppAccount/GetCheckCode"

//用户银行卡
#define JDFindPassword  @"/api/AppAccount/RetrievePassword"


#endif /* URL_h */
