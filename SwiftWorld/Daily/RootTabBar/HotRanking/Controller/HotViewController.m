//
//  HotViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/3/3.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "HotViewController.h"

@interface HotViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation HotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    [self createDataSource];
    [self setHotUrl];
    [self requestData];
}
-(void)requestData
{
    NSURL *url = [NSURL URLWithString:self.path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        NSArray *array = dic[@"itemList"];
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
-(void)setHotUrl
{
    
}
-(void)createDataSource
{
    self.dataSource = [[NSMutableArray alloc]init];
}
-(void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.frame = CGRectMake(0,104, WIDTH, HEIGHT - 104);
    self.table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT - 104) style:(UITableViewStylePlain)];
    self.table.dataSource = self;
    self.table.delegate = self;
    [self.table registerClass:[BaseTableViewCell class] forCellReuseIdentifier:@"FIND"];
    [self.view addSubview:self.table];
}
#pragma mark table的协议方法
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
