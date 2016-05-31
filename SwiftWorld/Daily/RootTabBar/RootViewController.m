//
//  RootViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/2/29.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "RootViewController.h"
#import "EveryDaySelectViewController.h"
#import "FindMoreViewController.h"
#import "HotRankingViewController.h"


@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self createUI];
    
    self.tabBar.tintColor = [UIColor blackColor];
    
}

-(void)createUI
{
    EveryDaySelectViewController *everyDaySelectVC = [[EveryDaySelectViewController alloc]init];
    
    everyDaySelectVC.view.backgroundColor = [UIColor whiteColor];
    UINavigationController *everyDaySelectNVC = [[UINavigationController alloc]initWithRootViewController:everyDaySelectVC];
    
    everyDaySelectNVC.tabBarItem.title = @"每日精选";
    everyDaySelectNVC.tabBarItem.image = [[UIImage imageNamed:@"icon110"] imageFlippedForRightToLeftLayoutDirection];
    everyDaySelectNVC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_110"];
    FindMoreViewController *findMoreVC = [[FindMoreViewController alloc]init];
    UINavigationController *findMoreNVC = [[UINavigationController alloc]initWithRootViewController:findMoreVC];
    
    findMoreNVC.tabBarItem.title = @"发现更多";
    findMoreNVC.tabBarItem.image = [UIImage imageNamed:@"icon226"];
    findMoreNVC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_226"];
    HotRankingViewController *hotRankingVC = [[HotRankingViewController alloc]init];
    
    UINavigationController *hotRankingNVC = [[UINavigationController alloc]initWithRootViewController:hotRankingVC];
    
    hotRankingNVC.tabBarItem.title = @"热门排行";
    hotRankingNVC.tabBarItem.image = [UIImage imageNamed:@"icon142"];
    hotRankingNVC.tabBarItem.selectedImage = [UIImage imageNamed:@"icon_142"];
    self.viewControllers = @[everyDaySelectNVC,findMoreNVC,hotRankingNVC];
    
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
