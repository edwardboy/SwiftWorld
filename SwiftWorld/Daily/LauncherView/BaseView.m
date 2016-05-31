//
//  BaseView.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/10.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "BaseView.h"
@interface BaseView ()
{
    
}
@end

@implementation BaseView

-(void)setMaskWithUIBezierPath:(UIBezierPath *)bezierPath
{
    //蒙版
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [bezierPath CGPath];
    maskLayer.fillColor = [[UIColor redColor] CGColor];
    maskLayer.frame = self.bounds;
    self.layer.mask = maskLayer;
    
    //边框蒙版
    CAShapeLayer *maskBorderLayer = [CAShapeLayer layer];
    maskBorderLayer.path = [bezierPath CGPath];
    maskBorderLayer.fillColor = [[UIColor clearColor] CGColor];
    maskBorderLayer.strokeColor = [self.backgroundColor CGColor];//边框颜色
    maskBorderLayer.lineWidth = 1.0;//边框的宽度
    [self.layer addSublayer:maskBorderLayer];
}
-(BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    return [self.path containsPoint:point];
}



-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if (self.isClicked)
    {
        self.isClicked(self);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
