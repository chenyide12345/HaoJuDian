//
//  PhotoCollectionViewCell.m
//  HaoJuDian
//
//  Created by 陈义徳 on 16/7/21.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        [self addAllViews];
    }
    return self;
}


- (void)addAllViews
{
    self.backgroundColor = MAINCOLOR;
}



@end
