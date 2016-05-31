//
//  RankingViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/3.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "RankingViewController.h"
#import "MJRefresh.h"
@interface RankingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation RankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.frame = CGRectMake(0, 104, WIDTH, HEIGHT - 104);
    
    [self createDataSource];
    [self createUI];
    [self setRankingurl];
    [self requestData];
}
-(void)createUI
{
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 104) style:(UITableViewStylePlain)];
    self.table.delegate = self;
    self.table.dataSource = self;
    
    [self.table registerClass:[BaseTableViewCell class] forCellReuseIdentifier:@"FIND"];
    [self.view addSubview:self.table];
    [self addFooterRefresh];
}
-(void)addFooterRefresh
{
    MJRefreshAutoGifFooter *footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        [self setMyUrl];
        
        [self requestData];
    }];
    NSArray *imageArray = @[[UIImage imageNamed:@"icon_079"],[UIImage imageNamed:@"icon_080"],[UIImage imageNamed:@"icon_081"],[UIImage imageNamed:@"icon_082"],[UIImage imageNamed:@"icon_083"],[UIImage imageNamed:@"icon_084"],[UIImage imageNamed:@"icon_085"],[UIImage imageNamed:@"icon_078"]];
    [footer setImages:imageArray forState:(MJRefreshStateRefreshing)];
    self.table.footer = footer;
}
-(void)createDataSource
{
    self.dataSource = [[NSMutableArray alloc]init];
    self.nextPageUrl = [[NSMutableArray alloc]init];
}

-(void)setRankingurl
{
    
}
-(void)setMyUrl
{
    self.url = [self.nextPageUrl lastObject];
}
-(void)requestData
{
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *array = dic[@"itemList"];
        [self.nextPageUrl addObject:dic[@"nextPageUrl"]];
        for (int i = 0; i < array.count; i++)
        {
            SortModel *model = [[SortModel alloc]init];
            model.category = array[i][@"data"][@"category"];
            model.consumptionModel.collectionCount = [NSString stringWithFormat:@"%@",array[i][@"data"][@"consumption"][@"collectionCount"]] ;
            model.consumptionModel.playCount = [NSString stringWithFormat:@"%@",array[i][@"data"][@"consumption"][@"playCount"]] ;
            model.consumptionModel.replyCount = [NSString stringWithFormat:@"%@",array[i][@"data"][@"consumption"][@"replyCount"]];
            model.consumptionModel.shareCount = [NSString stringWithFormat:@"%@",array[i][@"data"][@"consumption"][@"shareCount"]];
            model.coverModel.blurred = array[i][@"data"][@"cover"][@"blurred"];
            model.coverModel.detail = array[i][@"data"][@"cover"][@"detail"];
            model.coverModel.feed = array[i][@"data"][@"cover"][@"feed"];
            model.coverModel.sharing = array[i][@"data"][@"cover"][@"sharing"];
            model.sortDescription = array[i][@"data"][@"description"];
            model.playUrl = array[i][@"data"][@"playUrl"];
            model.sortID = [NSString stringWithFormat:@"%@",array[i][@"data"][@"id"]] ;
            model.title = array[i][@"data"][@"title"];
            [self.dataSource addObject:model];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.table reloadData];
        });
    }];
    [dataTask resume];
}

#pragma mark table协议的方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    BaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FIND" forIndexPath:indexPath];
    SortModel *model = self.dataSource[indexPath.row];
    //cell.titleLable.text = self.dataSource[indexPath.row][@"data"][@"title"];
    cell.titleLable.text = model.title;
   // [cell.detailImageView setImageWithURL:_dataSource[indexPath.row][@"data"][@"cover"][@"detail"]];
    [cell.detailImageView setImageWithURL:[NSURL URLWithString:model.coverModel.detail]];
    
    cell.backgroundColor = [UIColor redColor];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT / 3.5;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.blockInterfaceJump(self.dataSource[indexPath.row]);
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    
    if (scrollView.contentOffset.y > 1800)
    {
        [self addFooterRefresh];
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
