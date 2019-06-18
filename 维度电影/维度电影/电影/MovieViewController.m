//
//  MovieViewController.m
//  维度电影
//
//  Created by 王翔 on 2019/6/10.
//  Copyright © 2019年 Person. All rights reserved.
//

#import "MovieViewController.h"
#import "LQScrollView.h"
#import "ReviewViewController.h"
#import "AFNetworking.h"
#import "MJExtension.h"
//#import "MJRefresh.h"
#import "UIImageView+WebCache.h"
#import "CollectionViewCell.h"
#import "MovieModel.h"
#import "ZModel.h"
#import "JModel.h"
#import "GYZChooseCityController.h"
@interface MovieViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,GYZChooseCityDelegate>
{
    MovieModel * movieM;
    ZModel * ReleaseM;
    JModel * ComingM;
     UIButton *chooseCityBtn;
    
}
@property(nonatomic,strong)UITableView*tab;
@property(nonatomic,strong)UICollectionView *collectionViewone;
@property(nonatomic,strong)UICollectionView *collectionViewtwo;
@property(nonatomic,strong)UICollectionView *collectionViewthree;
@end

@implementation MovieViewController
-(UITableView *)tab
{
    if (!_tab)
    {
        _tab=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tab.delegate=self;
        _tab.dataSource=self;
        _tab.separatorStyle=UITableViewCellSeparatorStyleNone;
        _tab.backgroundColor=[UIColor clearColor];
    }
    return _tab;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *CellIdentifier = @"Cell";
    UITableViewCell*cell=[tableView cellForRowAtIndexPath:indexPath];
    if (!cell)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor=[UIColor clearColor];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if (indexPath.row==0)
    {
       
        UIImageView*img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        img.image=[UIImage imageNamed:@"hdpimore.png"];
        [cell addSubview:img];
        
      
    }else if (indexPath.row==1)
    {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 40)];
        [btn setTitle:@"热门电影" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell addSubview:btn];
        UIImageView*i=[[UIImageView alloc]initWithFrame:CGRectMake(22 , 50, 50, 10)];
        i.image=[UIImage imageNamed:@"choose_seat_soldout.png"];
        [cell addSubview:i];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.row==2)
    {
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findHotMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSLog(@"++++++++++++++++++++%@",responseObject);
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            self->movieM = [MovieModel mj_objectWithKeyValues:json];
            
            [self.collectionViewone reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        
        UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
        layout.itemSize=CGSizeMake(130, 180);
        // 横向滚动
        layout.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        // cell间的间距
        //设置最小行间距
        layout.minimumLineSpacing=30;

        _collectionViewone =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 190) collectionViewLayout:layout];
        _collectionViewone.dataSource=self;
        _collectionViewone.delegate=self;
        _collectionViewone.backgroundColor=[UIColor whiteColor];
        _collectionViewone.showsHorizontalScrollIndicator=NO;
        [_collectionViewone registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        [cell addSubview:self.collectionViewone];

    }else if (indexPath.row==3)
    {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 40)];
        [btn setTitle:@"正在上映" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell addSubview:btn];
        UIImageView*i=[[UIImageView alloc]initWithFrame:CGRectMake(22 , 50, 50, 10)];
        i.image=[UIImage imageNamed:@"choose_seat_soldout.png"];
        [cell addSubview:i];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }else if (indexPath.row==4)
    {
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findReleaseMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"____________________%@",responseObject);
            
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            self->ReleaseM = [ZModel mj_objectWithKeyValues:json];
            
            [self.collectionViewtwo reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        
        //创建流水布局
        UICollectionViewFlowLayout *layouttwo=[[UICollectionViewFlowLayout alloc]init];
        layouttwo.itemSize=CGSizeMake(130, 180);
        // 横向滚动
        layouttwo.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        // cell间的间距
        //设置最小行间距
        layouttwo.minimumLineSpacing=30;
        
        _collectionViewtwo =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 190) collectionViewLayout:layouttwo];
        _collectionViewtwo.dataSource=self;
        _collectionViewtwo.delegate=self;
        _collectionViewtwo.backgroundColor=[UIColor whiteColor];
        _collectionViewtwo.showsHorizontalScrollIndicator=NO;
        [_collectionViewtwo registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"celltwo"];
        [cell addSubview:self.collectionViewtwo];
        
    }else if (indexPath.row==5)
    {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(10, 10, 100, 40)];
        [btn setTitle:@"即将上映" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [cell addSubview:btn];
        UIImageView*i=[[UIImageView alloc]initWithFrame:CGRectMake(22 , 50, 50, 10)];
        i.image=[UIImage imageNamed:@"choose_seat_soldout.png"];
        [cell addSubview:i];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    }else
    {
        AFHTTPSessionManager *manager=[AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        [manager GET:@"http://172.17.8.100/movieApi/movie/v1/findComingSoonMovieList" parameters:@{@"userId":@(18),@"sessionId":@"15320748258726",@"page":@(1),@"count":@(10)} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            NSLog(@"====================%@",responseObject);
            
            NSDictionary * json = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            self->ComingM = [JModel mj_objectWithKeyValues:json];
            
            [self.collectionViewthree reloadData];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"电影界面滚动视图获取网络图片错误：%@",error);
            
        }];
        
        //创建流水布局
        UICollectionViewFlowLayout *layoutthree=[[UICollectionViewFlowLayout alloc]init];
        
        layoutthree.itemSize=CGSizeMake(130, 180);
        // 横向滚动
        layoutthree.scrollDirection= UICollectionViewScrollDirectionHorizontal;
        // cell间的间距
        //设置最小行间距
        layoutthree.minimumLineSpacing=30;
        
        _collectionViewthree =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 190) collectionViewLayout:layoutthree];
        _collectionViewthree.dataSource=self;
        _collectionViewthree.delegate=self;
        _collectionViewthree.backgroundColor=[UIColor whiteColor];
        _collectionViewthree.showsHorizontalScrollIndicator=NO;
        
        [_collectionViewthree registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellthree"];
        
        [cell addSubview:self.collectionViewthree];
    }
    return cell;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (collectionView==_collectionViewone) {
        return movieM.result.count;
    } else if(collectionView==_collectionViewtwo) {
        return ReleaseM.result.count;
    }else {
        return ComingM.result.count;
        
    }
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    //    cell.backgroundColor=[UIColor yellowColor];
    if (collectionView == _collectionViewone) {
        UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
        Res *MovieR=movieM.result[indexPath.row];
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 180)];
        img.layer.masksToBounds=YES;
        img.layer.cornerRadius=15;
        [img sd_setImageWithURL:[NSURL URLWithString:MovieR.imageUrl]];
        [cell addSubview:img];
        
        return cell;
    }else if (collectionView ==_collectionViewtwo){
        
        UICollectionViewCell *celltwo=[collectionView dequeueReusableCellWithReuseIdentifier:@"celltwo" forIndexPath:indexPath];
        
        ReleaseRes *ReleaseR=ReleaseM.result[indexPath.row];
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 180)];
        img.layer.masksToBounds=YES;
        img.layer.cornerRadius=15;
        [img sd_setImageWithURL:[NSURL URLWithString:ReleaseR.imageUrl]];
        [celltwo addSubview:img];
        
        return celltwo;
    }else{
        
        UICollectionViewCell *cellthree=[collectionView dequeueReusableCellWithReuseIdentifier:@"cellthree" forIndexPath:indexPath];
        
        Comingre *ComingR=ComingM.result[indexPath.row];
        UIImageView *img=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 180)];
        img.layer.masksToBounds=YES;
        img.layer.cornerRadius=15;
        [img sd_setImageWithURL:[NSURL URLWithString:ComingR.imageUrl]];
        [cellthree addSubview:img];
        
        return cellthree;
    }
    
    
    
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 30, 0, 30 );//（上、左、下、右）
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        return 500;
    }else if(indexPath.row==1)
    {
        return 60;
    }else if(indexPath.row==2)
    {
        return 200;
    }else if (indexPath.row==3)
    {
        return 60;
    }else if (indexPath.row==4)
    {
        return 200;
    }else if (indexPath.row==5)
    {
        return 60;
    }else
    {
        return 200;
    }
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==1)
    {
        NSLog(@"1");
        ReviewViewController*review=[ReviewViewController new];
        [self presentViewController:review animated:YES completion:nil];
    }else if (indexPath.row==3)
    {
        NSLog(@"3");
        ReviewViewController*review=[ReviewViewController new];
        [self presentViewController:review animated:YES completion:nil];
    }else if (indexPath.row==5)
    {
        NSLog(@"5");
        ReviewViewController*review=[ReviewViewController new];
        [self presentViewController:review animated:YES completion:nil];
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBarHidden=YES;
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    self.navigationController.navigationBar.barTintColor=[UIColor whiteColor];
    
    NSMutableArray * arr = [NSMutableArray arrayWithObjects:@"1111111.png",@"2222.png",@"343434.png",@"4444.png",@"5555.png", nil];
    LQScrollView * lq = [[LQScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300) imageArray:arr];
    [self.view addSubview:self.tab];
    chooseCityBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 150)];
    //    chooseCityBtn.center = self.view.center;
    [chooseCityBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [chooseCityBtn setTitle:@"选择城市" forState:UIControlStateNormal];
    [chooseCityBtn addTarget:self action:@selector(onClickChooseCity:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseCityBtn];
    
    [self.tab addSubview:lq];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)onClickChooseCity:(id)sender {
    
    GYZChooseCityController *cityPickerVC = [[GYZChooseCityController alloc] init];
    [cityPickerVC setDelegate:self];
    
    //    cityPickerVC.locationCityID = @"1400010000";
    //    cityPickerVC.commonCitys = [[NSMutableArray alloc] initWithArray: @[@"1400010000", @"100010000"]];        // 最近访问城市，如果不设置，将自动管理
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
