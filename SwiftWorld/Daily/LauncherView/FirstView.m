//
//  FirstView.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/10.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "FirstView.h"

@implementation FirstView
-(void)drawRect:(CGRect)rect
{
    UIColor *color = COLOR(17, 199, 216, 0.8);
    self.backgroundColor = color;
    [color set];
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:CGPointMake(0, 0)];
    [self.path addLineToPoint:CGPointMake(1.0 / 2.0 * WIDTH, 0)];
    [self.path addLineToPoint:CGPointMake(0, 3.0 / 7.0 * HEIGHT)];
    [self.path closePath];
    [self.path fill];
    [self setMaskWithUIBezierPath:self.path];
    
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, 0 , 55, 20)];
    title.center = CGPointMake(40, 3.0/7.0*HEIGHT/2-40);
    title.text = @"新颖";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:20.0];
    title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:title];
    
    [UIView animateWithDuration:1.0 animations:^{
        title.transform = CGAffineTransformRotate(CGAffineTransformScale(title.transform, 1.5, 1.5), 0.2 * M_PI);//缩放+旋转
    } completion:^(BOOL finished) {
        
    }];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
