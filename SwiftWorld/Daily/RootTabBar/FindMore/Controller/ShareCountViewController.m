//
//  ShareCountViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/3.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "ShareCountViewController.h"

@interface ShareCountViewController ()

@end

@implementation ShareCountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
}
-(void)setRankingurl
{
    self.url = [NSString stringWithFormat:CATEGORYPATH,self.encryption,@"shareCount"];
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
