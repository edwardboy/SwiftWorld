//
//  SortViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/2.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "SortViewController.h"
#import "DateViewController.h"//黄色
#import "ShareCountViewController.h"//蓝色
#import "DetailViewController.h"
@interface SortViewController ()

{
    DateViewController *date;
    
    ShareCountViewController *shareCount;
}

//@property (nonatomic,strong) UITableView *table;

@property (nonatomic,strong) NSMutableArray *dataSource;


@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *lable = [[UILabel alloc]initWithFrame:CGRectMake(0,0, 130, 44)];
    
    lable.font = [UIFont fontWithName:@"Marker Felt" size:20.0];
    lable.textColor = [UIColor blackColor];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = @"MagicHorizon";
    self.navigationItem.titleView = lable;
    UIBarButtonItem *left = [[UIBarButtonItem alloc]initWithTitle:@"＜" style:(UIBarButtonItemStyleDone) target:self action:@selector(black:)];
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
    self.automaticallyAdjustsScrollViewInsets = NO;
    shareCount = [[ShareCountViewController alloc]init];
    shareCount.encryption = self.encryption;
    __weak typeof(self) myself = self;
    shareCount.blockInterfaceJump = ^(SortModel *model)
    {
        DetailViewController *detail = [[DetailViewController alloc]init];
        detail.model = model;
        [myself.navigationController pushViewController:detail animated:YES];
    };
    
    [self.view addSubview:shareCount.view];
    
    
    date = [[DateViewController alloc]init];
    date.encryption = self.encryption;
    date.blockInterfaceJump = ^(SortModel * model){
        DetailViewController *detail = [[DetailViewController alloc]init];
        detail.model = model;
        [myself.navigationController pushViewController:detail animated:YES];

    };
    [self.view addSubview:date.view];
    
    
    
    NSArray *rankingName = @[@"时间排行榜",@"分享排行榜"];
    for (int i = 0; i < 2; i++)
    {
        UIButton *button = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
        button.frame = CGRectMake(i * WIDTH / 2, 64, WIDTH / 2, 40);
        
        [button setTitle:rankingName[i] forState:(UIControlStateNormal)];
        [button setTitleColor:[UIColor grayColor] forState:(UIControlStateNormal)];
        [button setBackgroundColor:[UIColor whiteColor]];
        button.tag = i + 1;
        [button addTarget:self action:@selector(btnClick:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.view addSubview:button];
    }
    
}
-(void)btnClick:(UIButton *)btn
{
    if (btn.tag == 1)
    {
        [self.view bringSubviewToFront:date.view];
    }
    else
    {
        [self.view bringSubviewToFront:shareCount.view];
    }
}

#pragma mark TableView的代理协议方法
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//    return self.dataSource.count;
//}
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"xzh" forIndexPath:indexPath];
//    cell.titleLable.text = self.dataSource[indexPath.row][@"data"][@"title"];
//    
//    [cell.detailImageView setImageWithURL:_dataSource[indexPath.row][@"data"][@"cover"][@"detail"]];
//    //NSString *bb = [NSString stringWithFormat:<#(nonnull NSString *), ...#>]
//    
//    cell.durationLable.text = [NSString stringWithFormat:@"#%@   / ",self.categoryName];
//    return cell;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return HEIGHT / 3.5;
//}

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
