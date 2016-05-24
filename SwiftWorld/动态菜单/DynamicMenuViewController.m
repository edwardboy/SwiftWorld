//
//  DynamicMenuViewController.m
//  SwiftWorld
//
//  Created by Groupfly on 16/5/24.
//  Copyright © 2016年 Groupfly. All rights reserved.
//

#import "DynamicMenuViewController.h"
#import "CircleLHQView.h"
@interface DynamicMenuViewController ()

@end

@implementation DynamicMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self dynamicMenu];
}
/**
 *  动态菜单（防建行app）
 */
- (void)dynamicMenu{
    CircleLHQView *LHQView = [[CircleLHQView alloc] initWithFrame:CGRectMake(10, 100, 300, 300) andImage:nil];
    LHQView.center = self.view.center;
    
    NSArray *items = @[@"国际新闻",@"国内新闻",@"新闻快播",@"午夜新闻",@"早间新闻",@"新闻联播"];
    
    [LHQView addSubViewWithSubView:nil andTitle:items andSize:CGSizeMake(60, 60) andcenterImage:nil];
    [self.view addSubview:LHQView];
    LHQView.clickSomeOne=^(NSInteger tag){
        if (tag<106)
            NSLog(@"选择%@",items[tag - 100]);
        else
            NSLog(@"选择国际综合");
    };
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
