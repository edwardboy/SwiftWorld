//
//  BaseTableViewCell.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/2.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "BaseTableViewCell.h"

@implementation BaseTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
        _detailImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT / 3.5)];
        [self.contentView addSubview:_detailImageView];
        _detailImageView.backgroundColor = [UIColor grayColor];
        
        _titleLable = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH - 350) / 2,(HEIGHT / 7) - 20, 350, 40)];
        _titleLable.backgroundColor = [UIColor clearColor];
        
        _titleLable.font = [UIFont boldSystemFontOfSize:20];
        _titleLable.textColor = [UIColor whiteColor];
        _titleLable.textAlignment = NSTextAlignmentCenter;
        [_detailImageView addSubview:_titleLable];
        
        _durationLable = [[UILabel alloc]initWithFrame:CGRectMake((WIDTH - 120) / 2, (HEIGHT / 7) + 20, 120, 20)];
        _durationLable.font = [UIFont systemFontOfSize:15.0];
        _durationLable.textColor = [UIColor whiteColor];
        _durationLable.backgroundColor = [UIColor clearColor];
        _durationLable.textAlignment = NSTextAlignmentCenter;
        [_detailImageView addSubview:_durationLable];
        
        
        UIView  *prospectsView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT / 3.5)];
        prospectsView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.1];
        
        [self.contentView addSubview:prospectsView];
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
