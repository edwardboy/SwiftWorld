//
//  launcherViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/10.
//  Copyright © 2016年 xzh. All rights reserved.
//
#define SCREEN_WIDTH                [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT               [[UIScreen mainScreen] bounds].size.height


#import "launcherViewController.h"
#import "RootTabBar/RootViewController.h"
#import "FirstView.h"
#import "SecondView.h"
#import "ThirdView.h"
#import "ForthView.h"
#import "FifthView.h"
#import "SixthView.h"
#import "SeventhView.h"
@interface launcherViewController ()
{
    FirstView *firstView;
    SecondView *secondView;
    ThirdView *thirdView;
    ForthView *forthView;
    FifthView *fifthView;
    SixthView *sixthView;
    SeventhView *seventhView;
}
@end

@implementation launcherViewController

-(void)viewDidDisappear:(BOOL)animated
{
    firstView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    secondView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    thirdView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    forthView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    fifthView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    sixthView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    seventhView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    firstView = [[FirstView alloc]initWithFrame:self.view.bounds];
    secondView = [[SecondView alloc]initWithFrame:self.view.bounds];
    thirdView = [[ThirdView alloc]initWithFrame:self.view.bounds];
    forthView = [[ForthView alloc]initWithFrame:self.view.bounds];
    fifthView = [[FifthView alloc]initWithFrame:self.view.bounds];
    sixthView = [[SixthView alloc]initWithFrame:self.view.bounds];
    seventhView = [[SeventhView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:firstView];
    [self.view addSubview:secondView];
    [self.view addSubview:thirdView];
    [self.view addSubview:forthView];
    [self.view addSubview:fifthView];
    [self.view addSubview:sixthView];
    [self.view addSubview:seventhView];
    
    [self linearIn];
    
    __block launcherViewController *blockSelf = self;
    
    firstView.isClicked = ^(id result)
    {
        
    };
    secondView.isClicked = ^ (id result){
        [blockSelf linearOutIndex:2 withView:result];
    };
    
    thirdView.isClicked = ^(id result){
        [blockSelf linearOutIndex:3 withView:result];
    };
    
    forthView.isClicked = ^(id result){
        [blockSelf linearOutIndex:4 withView:result];
    };
    
    fifthView.isClicked = ^(id result){
        [blockSelf linearOutIndex:5 withView:result];
    };
    
    sixthView.isClicked = ^(id result){
        [blockSelf linearOutIndex:6 withView:result];
    };
    
    seventhView.isClicked = ^(id result){
        [blockSelf linearOutIndex:7 withView:result];
    };
    
}
-(void)linearIn
{
    firstView.frame = CGRectMake(-SCREEN_WIDTH, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    secondView.frame = CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    thirdView.frame = CGRectMake(-2*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    forthView.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    fifthView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    sixthView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    seventhView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
    
    [UIView animateWithDuration:3.0f
                     animations:^{
                         firstView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         secondView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         thirdView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         forthView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         fifthView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         sixthView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         seventhView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                     }];
}
- (void)linearOutIndex:(NSInteger)index withView:(UIView *)view
{
    self.view.backgroundColor = view.backgroundColor;
    
    [UIView animateWithDuration:1.0f
                     animations:^{
                         
                         if (index != 1) {
                             firstView.frame = CGRectMake(-SCREEN_WIDTH, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
                         }
                         
                         if (index != 2) {
                             secondView.frame = CGRectMake(0, -SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
                         }
                         
                         if (index != 3) {
                             thirdView.frame = CGRectMake(-2*SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         }
                         
                         if (index != 4) {
                             forthView.frame = CGRectMake(-SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         }
                         
                         if (index != 5) {
                             fifthView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         }
                         
                         if (index != 6) {
                             sixthView.frame = CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                         }
                         
                         if (index != 7) {
                             seventhView.frame = CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT);
                         }
                     }
                     completion:^(BOOL finished) {
                         
                         RootViewController *root = [[RootViewController alloc]init];
                         [self presentViewController:root animated:NO completion:nil];
//                         DetailViewController *detailVC = [[DetailViewController alloc] init];
//                         detailVC.backgroundColor = view.backgroundColor;
//                         detailVC.title = [NSString stringWithFormat:@"七巧板%ld",(long)index];
//                         [self.navigationController pushViewController:detailVC animated:YES];
                     }];
    
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
