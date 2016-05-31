//
//  EveryDaySelectViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/2/29.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "EveryDaySelectViewController.h"
#import "SortModel.h"
#import "GroupModel.h"
#import "DetailViewController.h"

@interface EveryDaySelectViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *table;
    NSMutableArray *dataSource;
    
    NSMutableArray *nextPageUrl;
    NSURL *url;
}

@end

@implementation EveryDaySelectViewController

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
    [self createDataSource];
    [self setMyUrl:EVERY_DAY_SELECT_PATH];
    [self requestData];
}
-(void)setMyUrl:(NSString *)path
{
    url = [NSURL URLWithString:path];
}
-(void)requestData
{
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *array = dic[@"issueList"];
        [nextPageUrl addObject:dic[@"nextPageUrl"]];
        for (int i = 0; i < array.count; i++)
        {
            NSMutableArray *groupDataSource = [[NSMutableArray alloc]init];
            NSArray *smallArray = array[i][@"itemList"];
            for (int i = 0; i < smallArray.count; i++)
            {
                if (i == 0)
                {
                    GroupModel *groupModel = [[GroupModel alloc]init];
                    groupModel.groupTitle = smallArray[0][@"data"][@"text"];
                    [groupDataSource addObject:groupModel];
                }
                else
                {
                    SortModel *model = [[SortModel alloc]init];
                    model.category = smallArray[i][@"data"][@"category"];
                    model.consumptionModel.collectionCount = [NSString stringWithFormat:@"%@",smallArray[i][@"data"][@"consumption"][@"collectionCount"]] ;
                    model.consumptionModel.playCount = [NSString stringWithFormat:@"%@",smallArray[i][@"data"][@"consumption"][@"playCount"]] ;
                    model.consumptionModel.replyCount = [NSString stringWithFormat:@"%@",smallArray[i][@"data"][@"consumption"][@"replyCount"]];
                    model.consumptionModel.shareCount = [NSString stringWithFormat:@"%@",smallArray[i][@"data"][@"consumption"][@"shareCount"]];
                    model.coverModel.blurred = smallArray[i][@"data"][@"cover"][@"blurred"];
                    model.coverModel.detail = smallArray[i][@"data"][@"cover"][@"detail"];
                    model.coverModel.feed = smallArray[i][@"data"][@"cover"][@"feed"];
                    model.coverModel.sharing = smallArray[i][@"data"][@"cover"][@"sharing"];
                    model.sortDescription = smallArray[i][@"data"][@"description"];
                    model.playUrl = smallArray[i][@"data"][@"playUrl"];
                    model.sortID = [NSString stringWithFormat:@"%@",smallArray[i][@"data"][@"id"]] ;
                    model.title = smallArray[i][@"data"][@"title"];
                    [groupDataSource addObject:model];
                }
                
            }
            [dataSource addObject:groupDataSource];
           
           
       }
        
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [table reloadData];
            
        });

    }];
    [dataTask resume];
    
    
}
-(void)createDataSource
{
    dataSource = [[NSMutableArray alloc]init];
    nextPageUrl = [[NSMutableArray alloc]init];
    
}
-(void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 24, WIDTH, HEIGHT - 64) style:(UITableViewStyleGrouped)];
    table.delegate = self;
    table.dataSource = self;
    [table registerClass:[BaseTableViewCell class] forCellReuseIdentifier:@"FIND"];
    [self.view addSubview:table];
    [self addFooterRefresh];
    
}

//上拉加载
-(void)addFooterRefresh
{
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        [self setMyUrl:[nextPageUrl lastObject]];
        
        [self requestData];
    }];
    NSArray *imageArray = @[[UIImage imageNamed:@"icon_079"],[UIImage imageNamed:@"icon_080"],[UIImage imageNamed:@"icon_081"],[UIImage imageNamed:@"icon_082"],[UIImage imageNamed:@"icon_083"],[UIImage imageNamed:@"icon_084"],[UIImage imageNamed:@"icon_085"],[UIImage imageNamed:@"icon_078"]];
    [footer setImages:imageArray forState:(MJRefreshStateRefreshing)];
    table.footer = footer;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataSource[section]count] - 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FIND" forIndexPath:indexPath];
    SortModel *model = dataSource[indexPath.section][indexPath.row + 1];
    cell.titleLable.text = model.title;
    // [cell.detailImageView setImageWithURL:_dataSource[indexPath.row][@"data"][@"cover"][@"detail"]];
    [cell.detailImageView setImageWithURL:[NSURL URLWithString:model.coverModel.detail]];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT / 3.5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SortModel *model = dataSource[indexPath.section][indexPath.row + 1];
    DetailViewController *detail = [[DetailViewController alloc]init];
//    detail.tabBarController.tabBar.hidden = YES;
    detail.model = model;
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if (scrollView.contentOffset.y > 1900)
    {
        [self addFooterRefresh];
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    GroupModel *model = [dataSource[section] firstObject];
    return model.groupTitle;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30.0;
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
