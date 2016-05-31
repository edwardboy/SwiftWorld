//
//  FindMoreViewController.m
//  OpenSkyEye
//
//  Created by lmy on 16/2/29.
//  Copyright © 2016年 xzh. All rights reserved.
//

#import "FindMoreViewController.h"
#import "FindCollectionViewCell.h"

@interface FindMoreViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

{
    NSMutableArray *dataSource;
    
    NSMutableArray *datasource;
    
    NSURLRequest *request;
    
    NSURLSession *session;
    
    NSURLSessionDataTask *dataTask;
}

@end

@implementation FindMoreViewController

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
    [self createdataSource];
    [self requestData];
    
    
}
-(void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.findCollectionView.dataSource = self;
    
    self.findCollectionView.delegate = self;
    
    
    
    [self.findCollectionView registerNib:[UINib nibWithNibName:@"FindCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FIND"];
}

-(void)createdataSource
{
    dataSource = [NSMutableArray array];
    
    datasource = [NSMutableArray arrayWithObjects:@"%E5%88%9B%E6%84%8F",@"%E8%BF%90%E5%8A%A8",@"%E6%97%85%E8%A1%8C",@"%E5%89%A7%E6%83%85",@"%E5%8A%A8%E7%94%BB",@"%E5%B9%BF%E5%91%8A",@"%E9%9F%B3%E4%B9%90",@"%E5%BC%80%E8%83%83",@"%E9%A2%84%E5%91%8A",@"%E7%BB%BC%E5%90%88",@"%E8%AE%B0%E5%BD%95",@"%E6%97%B6%E5%B0%9A", nil];
}

-(void)requestData
{
    
    NSString *path = @"http://baobab.wandoujia.com/api/v2/categories?udid=b1619ac22b03489c94c233d5c815a225393cb958&vc=83&vn=1.12.1&deviceModel=vivo%20S7t&first_channel=eyepetizer_yingyongbao_market&last_channel=eyepetizer_yingyongbao_market";
    
    NSURL *url = [NSURL URLWithString:path];
    
    request = [NSURLRequest requestWithURL:url];
    
    session = [NSURLSession sharedSession];
    
    dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
       
        //解析数据
        NSArray  *array = [NSJSONSerialization JSONObjectWithData:data options:(NSJSONReadingMutableContainers) error:nil];
        
        
        [dataSource addObjectsFromArray:array];
        
        dispatch_async(dispatch_get_main_queue(), ^{
           
            [self.findCollectionView reloadData];
            
        });
        
    }];
    
    [dataTask resume];
   
}


#pragma mark UICollectionView的代理方法
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //return 10;
    return dataSource.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FindCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FIND" forIndexPath:indexPath];
    
    [cell.backImageView setImageWithURL:[NSURL URLWithString:dataSource[indexPath.row][@"bgPicture"]]];
    
    cell.categoryLable.text = dataSource[indexPath.row][@"name"];
    
    cell.encryption = datasource[indexPath.row];

    return cell;
}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
//{
//    return 10;
//}
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets edge = UIEdgeInsetsMake(0, 0, 0, 0);
    return edge;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((WIDTH-5) / 2, (WIDTH-10) / 2);
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SortViewController *sort = [[SortViewController alloc]init];
    
    FindCollectionViewCell *cell = (FindCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    sort.categoryName = cell.categoryLable.text;
    sort.encryption = cell.encryption;
    
    sort.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:sort animated:YES];
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
