//
//  SecondView.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/10.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "SecondView.h"

@implementation SecondView
- (void)drawRect:(CGRect)rect
{
    
    UIColor *color = COLOR(33, 250, 201, 0.8);
    self.backgroundColor = color;
    [color set];
    
    
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:CGPointMake(0, 3.0/7.0*HEIGHT)];
    [self.path addLineToPoint:CGPointMake(1.0/2.0*WIDTH, 0)];
    [self.path addLineToPoint:CGPointMake(WIDTH, 0)];
    [self.path addLineToPoint:CGPointMake(WIDTH, 3.0/14.0*HEIGHT)];
    [self.path closePath];
    [self.path fill];
    
    [self setMaskWithUIBezierPath:self.path];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(2.0/3.0*WIDTH/2, 3.0/7.0*HEIGHT/2, 80, 20)];
    title.text = @"奇趣";
    title.textColor = [UIColor whiteColor];
    title.font = [UIFont systemFontOfSize:20.0f];
    title.textAlignment = NSTextAlignmentCenter;
    [self addSubview:title];
    
    [UIView animateWithDuration:1.0
                     animations:^{
                         title.transform = CGAffineTransformRotate(CGAffineTransformScale(title.transform, 1.5, 1.5), -0.2*M_PI); //缩放+旋转
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
