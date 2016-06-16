//
//  EDCurveMainView.m
//  SwiftWorld
//
//  Created by Groupfly on 16/6/14.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

#import "EDCurveMainView.h"

#define kLineWidth 3

@interface EDCurveMainView ()

@property (nonatomic,strong) CAShapeLayer *outLayer;

@property (nonatomic,strong) CAShapeLayer *progressLayer;

@property (nonatomic,strong) UILabel *percentLabel;

@end

@implementation EDCurveMainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.outLayer = [CAShapeLayer layer];
        CGRect rect = {kLineWidth / 2, kLineWidth / 2, frame.size.width - kLineWidth, frame.size.height - kLineWidth};
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        self.outLayer.strokeColor = [UIColor whiteColor].CGColor;
        self.outLayer.lineWidth = kLineWidth;
        self.outLayer.fillColor =  [UIColor clearColor].CGColor;
        self.outLayer.lineCap = kCALineCapRound;
        self.outLayer.path = path.CGPath;
        [self.layer addSublayer:self.outLayer];
        
        
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.frame = self.bounds;
        self.progressLayer.fillColor = [UIColor clearColor].CGColor;
        self.progressLayer.strokeColor = [UIColor whiteColor].CGColor;
        self.progressLayer.lineWidth = kLineWidth;
        self.progressLayer.lineCap = kCALineCapRound;
        self.progressLayer.path = path.CGPath;
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        
        CAGradientLayer *gradientLayer1 =  [CAGradientLayer layer];
        gradientLayer1.frame = CGRectMake(0, 0, width / 2, height);
        CGColorRef red = [UIColor redColor].CGColor;
        CGColorRef purple = [UIColor purpleColor].CGColor;
        CGColorRef yellow = [UIColor yellowColor].CGColor;
        CGColorRef orange = [UIColor orangeColor].CGColor;
        [gradientLayer1 setColors:@[(__bridge id)red, (__bridge id)purple, (__bridge id)yellow, (__bridge id)orange]];
        [gradientLayer1 setLocations:@[@0.3, @0.6, @0.8, @1.0]];
        [gradientLayer1 setStartPoint:CGPointMake(0.5, 1)];
        [gradientLayer1 setEndPoint:CGPointMake(0.5, 0)];
        
        CAGradientLayer *gradientLayer2 =  [CAGradientLayer layer];
        gradientLayer2.frame = CGRectMake(width / 2, 0, width / 2, height);
        CGColorRef blue = [UIColor brownColor].CGColor;
        CGColorRef purple1 = [UIColor purpleColor].CGColor;
        CGColorRef r1 = [UIColor yellowColor].CGColor;
        CGColorRef o1 = [UIColor orangeColor].CGColor;
        [gradientLayer2 setColors:@[(__bridge id)blue, (__bridge id)purple1, (__bridge id)r1, (__bridge id)o1]];
        [gradientLayer2 setLocations:@[@0.3, @0.6, @0.8, @1.0]];
        [gradientLayer2 setStartPoint:CGPointMake(0.5, 0)];
        [gradientLayer2 setEndPoint:CGPointMake(0.5, 1)];
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = self.bounds;
        [gradientLayer addSublayer:gradientLayer1];
        [gradientLayer1 addSublayer:gradientLayer2];
        gradientLayer.mask = self.progressLayer;
        [self.layer addSublayer:gradientLayer];
    }
    return self;
}

- (void)updateProgressWithNumber:(NSUInteger)number {
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:0.5];
    self.progressLayer.strokeEnd =  number / 100.0;
    self.percentLabel.text = [NSString stringWithFormat:@"%@%%", @(number)];
    [CATransaction commit];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
