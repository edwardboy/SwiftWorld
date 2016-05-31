//
//  SortModel.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/4.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "SortModel.h"

@implementation SortModel
-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"description"])
    {
        self.sortDescription = value;
    }
    if ([key isEqualToString:@"id"])
    {
        self.sortID = value;
    }
}
-(id)valueForUndefinedKey:(NSString *)key
{
    return nil;
}
-(instancetype)init
{
    self = [super init];
    if (self)
    {
        self.consumptionModel = [[ConsumptionModel alloc]init];
        self.coverModel = [[CoverModel alloc]init];
    }
    return self;
}
@end
