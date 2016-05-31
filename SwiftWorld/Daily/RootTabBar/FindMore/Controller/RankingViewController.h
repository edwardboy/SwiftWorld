//
//  RankingViewController.h
//  OpenSkyEye
//
//  Created by lmy on 16/3/3.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SortModel.h"
#import "DetailViewController.h"
@interface RankingViewController : UIViewController
@property (nonatomic,strong) UITableView *table;
@property (nonatomic,strong) NSMutableArray *dataSource;
@property (nonatomic,copy) NSString *encryption;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) void(^blockInterfaceJump) (SortModel *);
@property (nonatomic,strong) NSMutableArray *nextPageUrl;
-(void)setRankingurl;
-(void)setMyUrl;
-(void)requestData;
@end
