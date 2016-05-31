//
//  SortModel.h
//  OpenSkyEye
//
//  Created by lmy on 16/3/4.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConsumptionModel.h"
#import "CoverModel.h"
@interface SortModel : NSObject
@property (nonatomic,copy) NSString *category;
@property (nonatomic,strong) ConsumptionModel *consumptionModel;
@property (nonatomic,strong) CoverModel *coverModel;
@property (nonatomic,copy) NSString *sortDescription;
//@property (nonatomic,copy) NSString *duration;
@property (nonatomic,copy) NSString *sortID;
@property (nonatomic,copy) NSString *playUrl;
@property (nonatomic,copy) NSString *title;
@end
