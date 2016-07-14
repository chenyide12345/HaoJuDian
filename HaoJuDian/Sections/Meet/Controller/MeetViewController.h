//
//  MeetViewController.h
//  HaoJuDian
//
//  Created by 陈义德 on 16/7/5.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZLSwipeableView.h"

typedef NS_ENUM(NSInteger, HandleDirectionType) {
    HandleDirectionOn          = 0,
    HandleDirectionDown        = 1,
    HandleDirectionLeft        = 2,
    HandleDirectionRight       = 3,
};

@interface MeetViewController : UIViewController

@property (nonatomic, strong) ZLSwipeableView *swipeableView;
- (UIView *)nextViewForSwipeableView:(ZLSwipeableView *)swipeableView;

@end
