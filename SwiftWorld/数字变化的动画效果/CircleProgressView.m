//
//  CircleProgressView.m
//  SwiftWorld
//
//  Created by Groupfly on 16/6/8.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

#import "CircleProgressView.h"

#define kLineWidth 5


@interface CircleProgressView()

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) CAShapeLayer *progressLayer;

@property (nonatomic,strong) CAShapeLayer *outLayer;

@end

@implementation CircleProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.layer.cornerRadius = frame.size.width / 2;
        self.layer.masksToBounds = YES;
        
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        [self addSubview:self.imageView];
        
        // 添加灰色圆环
        self.outLayer = [CAShapeLayer layer];
        CGRect rect = {kLineWidth / 2, kLineWidth / 2,
            frame.size.width - kLineWidth, frame.size.height - kLineWidth};
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:rect];
        self.outLayer.strokeColor = [UIColor lightGrayColor].CGColor;
        self.outLayer.lineWidth = kLineWidth;
        self.outLayer.fillColor =  [UIColor clearColor].CGColor;
        self.outLayer.lineCap = kCALineCapRound;
        self.outLayer.path = path.CGPath;
        [self.layer addSublayer:self.outLayer];
        
        // 添加蓝色进度圆环
        self.progressLayer = [CAShapeLayer layer];
        self.progressLayer.fillColor = [UIColor clearColor].CGColor;
        self.progressLayer.strokeColor = [UIColor blueColor].CGColor;
        self.progressLayer.lineWidth = kLineWidth;
        self.progressLayer.lineCap = kCALineCapRound;
        self.progressLayer.path = path.CGPath;
        [self.layer addSublayer:self.progressLayer];
        
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
        self.transform = CGAffineTransformMakeRotation(-M_PI_2);
        
    }
    return self;
}

- (void)setImageUrl:(NSString *)url{
    self.imageView.image = [UIImage imageNamed:url];
}


- (void)updateProgressWithNumber:(NSInteger)number {
    [CATransaction begin];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:2];
    self.progressLayer.strokeEnd =  number / 100.0;
    [CATransaction commit];
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


@end
