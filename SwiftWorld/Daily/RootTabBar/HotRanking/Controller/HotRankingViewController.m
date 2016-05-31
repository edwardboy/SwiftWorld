//
//  HotRankingViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/2/29.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "HotRankingViewController.h"
#import "WeekViewController.h"
#import "MonthViewController.h"
#import "HistoricalViewController.h"
@interface HotRankingViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scroller;
    HistoricalViewController *history;
    MonthViewController *month;
    WeekViewController *week;
}
@end

@implementation HotRankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 130, 44)];
    
    lable.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
    lable.textColor = [UIColor blackColor];
    
    lable.textAlignment = NSTextAlignmentCenter;
    
    lable.text = @"MagicHorizon";
    
    self.navigationItem.titleView = lable;
    
    [self createUI];
}
-(void)createUI
{
    NSArray *array = @[@"周排行",@"月排行",@"总排行"];
    for (int i = 0; i < 3; i++)
    {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
        button.frame = CGRectMake(i * WIDTH / 3, 64, WIDTH / 3, 40);
        [button setTitle:array[i] forState:(UIControlStateNormal)];
        button.tag = i + 1;
        [button setTintColor:[UIColor grayColor]];
        [button setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
        [button setBackgroundColor:[UIColor whiteColor]];
        [button addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchDragInside)];
        [self.view addSubview:button];
    }
    UIButton *btn = [self.view viewWithTag:1];
    btn.selected = YES;
    scroller = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 104, WIDTH, HEIGHT - 104)];
    scroller.delegate = self;
    scroller.contentSize = CGSizeMake(WIDTH * 3, HEIGHT - 104);
    [self.view addSubview:scroller];
    
    __weak typeof(self)mySelf = self;
    history = [[HistoricalViewController alloc]init];
    history.blockInterfaceJump = ^(SortModel *model)
    {
        DetailViewController *detail = [[DetailViewController alloc]init];
        detail.model = model;
        [mySelf.navigationController pushViewController:detail animated:YES];
    };
    month = [[MonthViewController alloc]init];
    month.blockInterfaceJump = ^(SortModel *model)
    {
        DetailViewController *detail = [[DetailViewController alloc]init];
        detail.model = model;
        [mySelf.navigationController pushViewController:detail animated:YES];
    };
    week = [[WeekViewController alloc]init];
    week.blockInterfaceJump = ^(SortModel *model)
    {
        DetailViewController *detail = [[DetailViewController alloc]init];
        detail.model = model;
        detail.hidesBottomBarWhenPushed = YES;
        [mySelf.navigationController pushViewController:detail animated:YES];
    };
    NSArray *views = @[week.view,month.view,history.view];
    for (int i = 0; i < 3; i++)
    {
        UIView *view = views[i];
        view.frame = CGRectMake(i * WIDTH, 0, WIDTH, HEIGHT - 104);
        [scroller addSubview:view];
    }
    scroller.showsHorizontalScrollIndicator = NO;
    scroller.showsVerticalScrollIndicator = NO;
    scroller.pagingEnabled = YES;
    scroller.bounces = NO;
}



-(void)btnClick:(UIButton *)button
{
    if (button.tag == 1)
    {   UIButton *btn1 = [self.view viewWithTag:2];
        UIButton *btn2 = [self.view viewWithTag:3];
        btn1.selected = NO;
        btn2.selected = NO;
        [scroller setContentOffset:CGPointMake(0, 0) animated:YES];
        button.selected = YES;
    }
    else if (button.tag == 2)
    {
        UIButton *btn1 = [self.view viewWithTag:1];
        UIButton *btn2 = [self.view viewWithTag:3];
        btn1.selected = NO;
        btn2.selected = NO;
        [scroller setContentOffset:CGPointMake(WIDTH, 0) animated:YES];
        button.selected = YES;
    }
    else
    {
        UIButton *btn1 = [self.view viewWithTag:2];
        UIButton *btn2 = [self.view viewWithTag:1];
        btn1.selected = NO;
        btn2.selected = NO;
        [scroller setContentOffset:CGPointMake(WIDTH * 2,0) animated:YES];
        button.selected = YES;
    }
}

#pragma mark scrollview的协议方法
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.x < WIDTH)
    {
        UIButton *btn1 = [self.view viewWithTag:1];
        UIButton *btn2 = [self.view viewWithTag:2];
        UIButton *btn3 = [self.view viewWithTag:3];
        btn1.selected = YES;
        btn2.selected = NO;
        btn3.selected = NO;
    }
    else if (scrollView.contentOffset.x >= WIDTH &&scrollView.contentOffset.x < WIDTH * 2)
    {
        UIButton *btn1 = [self.view viewWithTag:1];
        UIButton *btn2 = [self.view viewWithTag:2];
        UIButton *btn3 = [self.view viewWithTag:3];
        btn1.selected = NO;
        btn2.selected = YES;
        btn3.selected = NO;
    }
    else
    {
        UIButton *btn1 = [self.view viewWithTag:1];
        UIButton *btn2 = [self.view viewWithTag:2];
        UIButton *btn3 = [self.view viewWithTag:3];
        btn1.selected = NO;
        btn2.selected = NO;
        btn3.selected = YES;
    }
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
