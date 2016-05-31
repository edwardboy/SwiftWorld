//
//  HotViewController.h
//  OpenSkyEye
//
//  Created by lmy on 16/3/3.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "SortModel.h"
@interface HotViewController : UIViewController
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,copy) NSString *path;
@property (nonatomic,strong) SortModel *model;
@property (nonatomic,copy) void(^blockInterfaceJump) (SortModel *);
-(void)setHotUrl;
-(void)requestData;
@end
