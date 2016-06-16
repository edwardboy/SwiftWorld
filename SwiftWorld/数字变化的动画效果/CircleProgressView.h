//
//  CircleProgressView.h
//  SwiftWorld
//
//  Created by Groupfly on 16/6/8.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CircleProgressView : UIView
// 设置图片
- (void)setImageUrl:(NSString *)url;
// 更新进度
- (void)updateProgressWithNumber:(NSInteger)number;

@end
