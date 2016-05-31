//
//  SixthView.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/10.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "SixthView.h"

@implementation SixthView
- (void)drawRect:(CGRect)rect
{
    
    UIColor *color = COLOR(252, 88, 133, 0.8);
    self.backgroundColor = color;
    [color set];
    
    
    float x1 = 1.0/2.0*WIDTH+20;
    float y1 = -3.0/14.0*kQtRate*x1+6.0/7.0*HEIGHT;
    
    self.path = [UIBezierPath bezierPath];
    [self.path moveToPoint:CGPointMake(x1, y1)];
    [self.path addLineToPoint:CGPointMake(WIDTH, 9.0/14.0*HEIGHT)];
    [self.path addLineToPoint:CGPointMake(WIDTH, HEIGHT)];
    [self.path closePath];
    [self.path fill];
    
    [self setMaskWithUIBezierPath:self.path];
    
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 55, 20)];
    title.center = CGPointMake(x1+(WIDTH-x1)/2+20, y1 +20);
    title.text = @"时尚";
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