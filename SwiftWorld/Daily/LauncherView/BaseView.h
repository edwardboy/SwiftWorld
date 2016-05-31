//
//  BaseView.h
//  OpenSkyEye
//
//  Created by lmy on 16/3/10.
//  Copyright © 2016年 xzh. All rights reserved.
//



#define kQtRate HEIGHT/WIDTH
#define COLOR(r,g,b,a) ([UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)])
#import <UIKit/UIKit.h>
typedef void (^myBlock)(id result);
@interface BaseView : UIView

@property (nonatomic,strong) UIBezierPath *path;
@property (nonatomic,copy) myBlock isClicked;
-(void)setMaskWithUIBezierPath:(UIBezierPath *)bezierPath;
@end
