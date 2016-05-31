//
//  BaseTableViewCell.h
//  OpenSkyEye
//
//  Created by lmy on 16/3/2.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *detailImageView;

@property (nonatomic,strong) UILabel *titleLable;

@property (nonatomic,strong) UILabel *durationLable;
@end
