//
//  AddCaredTypeView.h
//  HaoJuDian
//
//  Created by ming on 16/7/21.
//  Copyright © 2016年 陈义德. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef   void(^didSelectCellBlock)(NSString * str);

@interface AddCaredTypeView : UIView

@property (nonatomic,copy)NSString *fromeType;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray *typeArray;
@property(nonatomic,assign)NSInteger indexPath;

@property (nonatomic,copy)didSelectCellBlock myBlock;

-(void)reloadTableViewWith:(NSInteger) index and :(NSMutableArray *)arr;

@end
