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
/**
 *  用户银行卡列表
 */
#define bankCared  @"/api/AppUserInfo/GetSearchBankJson"


#define JDUpdateUserBaseInfo @"/api/AppUserInfo/UpdateUserBaseInfo"


/**
 *  Type的值列表：
 3 婚姻状况，4学历，5生肖，6星座，7子女状态，8血型，9工资范围，10房子状况，11车子情况，12民族，13性格14爱好（生活类）,15爱好（运动类）。60为银行卡
 
 3若type值为4.返回结果格式为：
 {"Status":"success","Data":[{"Id":10,"Text":"高中及以下"},{"Id":11,"Text":"大专"},{"Id":12,"Text":"本科"},{"Id":13,"Text":"研究生"},{"Id":14,"Text":"博士"},{"Id":15,"Text":"博士后"}],"Message":""}
 */
#define JDGetDownList(num) [NSString stringWithFormat:@"/api/AppSystem/GetDropDownList?Type=%d", num]


#endif /* URL_h */
