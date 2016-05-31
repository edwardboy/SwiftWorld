//
//  DetailViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/4.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "DetailViewController.h"
#import "SSVideoPlayContainer.h"
#import "SSVideoPlayController.h"
@interface DetailViewController ()


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 130, 44)];
    
    lable.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
    lable.textColor = [UIColor blackColor];
    
    lable.textAlignment = NSTextAlignmentCenter;
    
    lable.text = @"MagicHorizon";
    
    self.navigationItem.titleView = lable;
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"<" style:(UIBarButtonItemStyleDone) target:self action:@selector(black:)];
    self.navigationItem.leftBarButtonItem = left;
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
    [self createUI];
}
-(void)black:(UIBarButtonItem *)left
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)createUI
{
    for (int i = 0; i < 2; i++)
    {
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64 + i * ((HEIGHT - 64) / 2), WIDTH, (HEIGHT - 64) / 2)];
        imgView.tag = i + 1;
        imgView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:arc4random()%255/255.0];
        [self.view addSubview:imgView];
    }
    UIImageView *imgView1 = [self.view viewWithTag:1];
    [imgView1 setImageWithURL:[NSURL URLWithString:self.model.coverModel.detail]];
    imgView1.contentMode = UIViewContentModeScaleAspectFill;
    imgView1.clipsToBounds = YES;
    imgView1.userInteractionEnabled = YES;
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"video_play_btn_bg@2x"]];
    imageView.center= CGPointMake(WIDTH / 2, (HEIGHT - 64) / 4);
    [imgView1 addSubview:imageView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick:)];
    [imgView1 addGestureRecognizer:tap];
    UIImageView *imgView2 = [self.view viewWithTag:2];
    [imgView2 setImageWithURL:[NSURL URLWithString:self.model.coverModel.blurred]];
    UILabel *titleLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 10, WIDTH / 1.2, 35)];
    titleLable.backgroundColor = [UIColor clearColor];
    titleLable.text = self.model.title;
    titleLable.font = [UIFont systemFontOfSize:20.0];
    titleLable.textColor = [UIColor whiteColor];
    [imgView2 addSubview:titleLable];
    UILabel *lable3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, WIDTH / 2, 25)];
    lable3.backgroundColor = [UIColor blueColor];
    //[imgView2 addSubview:lable3];
    UILabel *detailLable = [[UILabel alloc]initWithFrame:CGRectMake(10, 80, WIDTH - 20, 120)];
    detailLable.numberOfLines = 0;
    NSString *str = self.model.sortDescription;
    CGSize size = [str boundingRectWithSize:CGSizeMake(WIDTH - 40, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16.0]} context:nil].size;
    detailLable.frame = CGRectMake(20, 80, WIDTH - 40, size.height);
    detailLable.font = [UIFont systemFontOfSize:16];
    detailLable.text = self.model.sortDescription;
    detailLable.textColor = [UIColor whiteColor];
    detailLable.backgroundColor = [UIColor clearColor];
    [imgView2 addSubview:detailLable];
}
-(void)tapClick:(UITapGestureRecognizer *)tap
{
//    PlayerViewController *player = [[PlayerViewController alloc]init];
//    player.path = self.model.playUrl;
//    [self.navigationController pushViewController:player animated:YES];
    SSVideoModel *model = [[SSVideoModel alloc]init];
    model.path = self.model.playUrl;
    model.name = self.model.title;
    SSVideoPlayController *play = [[SSVideoPlayController alloc]initWithVideoList:@[model]];
    SSVideoPlayContainer *playContainer = [[SSVideoPlayContainer alloc]initWithRootViewController:play];
    [self presentViewController:playContainer animated:YES completion:nil];
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
