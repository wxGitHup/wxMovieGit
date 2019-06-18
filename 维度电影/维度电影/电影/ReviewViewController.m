//
//  ReviewViewController.m
//  维度电影
//
//  Created by 王翔 on 2019/6/13.
//  Copyright © 2019年 Person. All rights reserved.
//

#import "ReviewViewController.h"
#import "GYZChooseCityController.h"
#import "MyTableViewCell.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import "UIImageView+WebCache.h"
#import "MovieModel.h"
#import "ZModel.h"
#import "JModel.h"
#import "DetailsViewController.h"
@interface ReviewViewController ()<GYZChooseCityDelegate,UITableViewDelegate,UITableViewDataSource>{
    UIButton *chooseCityBtn;
    MovieModel * movieM;
    ZModel * ReleaseM;
    JModel * ComingM;
    UISegmentedControl *segment;
}
@property(nonatomic,strong)UITableView*tab;
@property(nonatomic,strong)NSMutableArray*movieArr;

@end

@implementation ReviewViewController
- (UITableView *)tab
{
    if (!_tab)
    {
        _tab=[[UITableView alloc]initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        _tab.delegate=self;
        _tab.dataSource=self;
        _tab.rowHeight=150;
    }
    return _tab;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   //   [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"tongzhi"object:nil];
    self.view.backgroundColor=[UIColor whiteColor];
    chooseCityBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    chooseCityBtn.center = self.view.center;
    [chooseCityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [chooseCityBtn setTitle:@"选择城市" forState:UIControlStateNormal];
    [chooseCityBtn addTarget:self action:@selector(onClickChooseCity:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseCityBtn];
   
    
    NSArray *array = [NSArray arrayWithObjects:@"热门电影",@"正在热映",@"即将上映", nil];
    //初始化UISegmentedControl
   segment = [[UISegmentedControl alloc]initWithItems:array];
    //设置frame
    segment.frame = CGRectMake(10, 100, self.view.frame.size.width-20, 30);
    //添加到视图
    [self.view addSubview:segment];
     segment.apportionsSegmentWidthsByContent = YES;
       segment.tintColor = [UIColor blackColor];
//    segment.momentary = YES;
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
    
    if (self.index==0) {
        segment.selectedSegmentIndex=0;
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findHotMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"++++++++++++++++++++%@",responseObject);
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            self->movieM = [MovieModel mj_objectWithKeyValues:json];
            
            [self.tab reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        NSLog(@"1");
    } else if(self.index==1) {
        segment.selectedSegmentIndex=1;
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findReleaseMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"____________________%@",responseObject);
            
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            self->ReleaseM = [ZModel mj_objectWithKeyValues:json];
            
            [self.tab reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        NSLog(@"2");
    }else{
         segment.selectedSegmentIndex=2;
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findComingSoonMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"====================%@",responseObject);
            
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            self->ComingM = [JModel mj_objectWithKeyValues:json];
            
            [self.tab reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        NSLog(@"3");
    }
    
    [self.view addSubview:self.tab];
    [self.tab registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"Moviecell"];
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(30, self.view.frame.size.height-100, 50, 50)];
    [btn setImage:[UIImage imageNamed:@"com_icon_return_default.png"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
}
- (void)tongzhi:(NSNotification *)text{
    
    NSLog(@"%@",text.userInfo[@"textOne"]);
    
    NSLog(@"－－－－－接收到通知------");
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (segment.selectedSegmentIndex==0) {
        return movieM.result.count;
    }else if (segment.selectedSegmentIndex==1)
    {
        return ReleaseM.result.count;
    }else
    {
        return ComingM.result.count;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (segment==0)
//    {
       MyTableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:@"Moviecell" forIndexPath:indexPath];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    if (0==segment.selectedSegmentIndex) {
        Res *MovieR=movieM.result[indexPath.row];
        [cell SetCellDataWithMd:MovieR];
    }else if (segment.selectedSegmentIndex==1)
    {
        ReleaseRes*mov=ReleaseM.result[indexPath.row];
        [cell SetCellDataWithM:mov];
    }else
    {
        Comingre*com=ComingM.result[indexPath.row];
        [cell SetCellDataWithd:com];
    }
    
        return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        DetailsViewController*details=[DetailsViewController new];
        [self presentViewController:details animated:YES completion:nil];
}
-(void)change:(UISegmentedControl *)sender{
    NSLog(@"测试");
    if (sender.selectedSegmentIndex == 0) {
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findHotMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"++++++++++++++++++++%@",responseObject);
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            self->movieM = [MovieModel mj_objectWithKeyValues:json];
            
            [self.tab reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        NSLog(@"1");
    }else if (sender.selectedSegmentIndex == 1){
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findReleaseMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"____________________%@",responseObject);
            
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            self->ReleaseM = [ZModel mj_objectWithKeyValues:json];
            
            [self.tab reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        NSLog(@"2");
    }else if (sender.selectedSegmentIndex == 2){
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findComingSoonMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"====================%@",responseObject);
            
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            self->ComingM = [JModel mj_objectWithKeyValues:json];
            
            [self.tab reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        NSLog(@"3");
    }
}
-(void)aaa
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)onClickChooseCity:(id)sender {
    
    GYZChooseCityController *cityPickerVC = [[GYZChooseCityController alloc] init];
    [cityPickerVC setDelegate:self];
    
    //    cityPickerVC.locationCityID = @"1400010000";
    // d‘   cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
    //    cityPickerVC.hotCitys = @[@"100010000", @"200010000", @"300210000", @"600010000", @"300110000"];
    
    [self presentViewController:[[UINavigationController alloc] initWithRootViewController:cityPickerVC] animated:YES completion:^{
        
    }];
}

#pragma mark - GYZCityPickerDelegate
- (void) cityPickerController:(GYZChooseCityController *)chooseCityController didSelectCity:(GYZCity *)city
{
    [chooseCityBtn setTitle:city.cityName forState:UIControlStateNormal];
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void) cityPickerControllerDidCancel:(GYZChooseCityController *)chooseCityController
{
    [chooseCityController dismissViewControllerAnimated:YES completion:^{
        
    }];
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
