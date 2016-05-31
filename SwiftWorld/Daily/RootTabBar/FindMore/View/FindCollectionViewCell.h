//
//  FindCollectionViewCell.h
//  OpenSkyEye
//
//  Created by lmy on 16/2/29.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *backImageView;
@property (strong, nonatomic) IBOutlet UILabel *categoryLable;

@property (nonatomic,strong) NSString *encryption;

@end
