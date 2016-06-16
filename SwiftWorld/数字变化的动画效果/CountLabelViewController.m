//
//  CountLabelViewController.m
//  SwiftWorld
//
//  Created by Groupfly on 16/6/8.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

#import "CountLabelViewController.h"

#import "UICountingLabel.h"

#import "CircleProgressView.h"
#import <WebKit/WebKit.h>
#import <AVFoundation/AVFoundation.h>

@interface CountLabelViewController ()

@property (nonatomic,strong) CircleProgressView *circlePro;

@end

@implementation CountLabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self test];
    
    // 获取设备的UUID
    NSString *uuid = [UIDevice currentDevice].identifierForVendor.UUIDString;
    
//    WKWebView
//    UIWebView
}

- (void)test{
    
    // make one that counts up
    UICountingLabel* myLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
    myLabel.method = UILabelCountingMethodLinear;
    myLabel.format = @"%d";
    [self.view addSubview:myLabel];
    [myLabel countFrom:1 to:10 withDuration:3.0];
    
    // make one that counts up from 5% to 10%, using ease in out (the default)
    UICountingLabel* countPercentageLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 50, 200, 40)];
    [self.view addSubview:countPercentageLabel];
    countPercentageLabel.format = @"%.1f%%";
    [countPercentageLabel countFrom:5 to:10];
    
    
    
    // count up using a string that uses a number formatter
    UICountingLabel* scoreLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 90, 200, 40)];
    [self.view addSubview:scoreLabel];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = kCFNumberFormatterDecimalStyle;
    scoreLabel.formatBlock = ^NSString* (CGFloat value)
    {
        NSString* formatted = [formatter stringFromNumber:@((int)value)];
        return [NSString stringWithFormat:@"Score: %@",formatted];
    };
    scoreLabel.method = UILabelCountingMethodEaseOut;
    [scoreLabel countFrom:0 to:10000 withDuration:2.5];
    
    // count up with attributed string
    NSInteger toValue = 100;
    UICountingLabel* attributedLabel = [[UICountingLabel alloc] initWithFrame:CGRectMake(10, 130, 200, 40)];
    [self.view addSubview:attributedLabel];
    attributedLabel.attributedFormatBlock = ^NSAttributedString* (CGFloat value)
    {
        NSDictionary* normal = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue-UltraLight" size: 20] };
        NSDictionary* highlight = @{ NSFontAttributeName: [UIFont fontWithName: @"HelveticaNeue" size: 20] };
        
        NSString* prefix = [NSString stringWithFormat:@"%d", (int)value];
        NSString* postfix = [NSString stringWithFormat:@"/%d", (int)toValue];
        
        NSMutableAttributedString* prefixAttr = [[NSMutableAttributedString alloc] initWithString: prefix
                                                                                       attributes: highlight];
        NSAttributedString* postfixAttr = [[NSAttributedString alloc] initWithString: postfix
                                                                          attributes: normal];
        [prefixAttr appendAttributedString: postfixAttr];
        
        return prefixAttr;
    };
    [attributedLabel countFrom:0 to:toValue withDuration:2.5];
    
    //    self.label.method = UILabelCountingMethodEaseInOut;
    //    self.label.format = @"%d%%";
    //    __weak typeof(self)* blockSelf = self;
    //    self.label.completionBlock = ^{
    //        blockSelf.label.textColor = [UIColor colorWithRed:0 green:0.5 blue:0 alpha:1];
    //    };
    //    [self.label countFrom:0 to:100];
    
    CircleProgressView *circlePro = [[CircleProgressView alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    //    circlePro.frame = CGRectMake(0, 0, 100, 100);
    circlePro.center = CGPointMake(self.view.centerX, self.view.centerY);
    [circlePro updateProgressWithNumber:0];
    
    [circlePro setImageUrl:@"promoboard_icon_mall"];
    self.circlePro = circlePro;
    [self.view addSubview:circlePro];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.circlePro updateProgressWithNumber:56];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
