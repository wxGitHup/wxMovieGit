//
//  RecommendVC.m
//  维度电影
//
//  Created by 安离夕 on 2019/6/12.
//  Copyright © 2019年 Person. All rights reserved.
//

#import "RecommendVC.h"
#import "screenLayOut.h"
#import "RecommendCell.h"
#import "RecommendMD.h"
#import "AFNetworking.h"
#import "MJExtension.h"
@interface RecommendVC ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView * tab;
@property(nonatomic,strong)NSMutableArray * Array;
@end

@implementation RecommendVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tab];
    
    self.Array = [NSMutableArray array];
    
}

-(UITableView *)tab{
    if (_tab == nil) {
        
        _tab = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        
        _tab.delegate = self;
        
        _tab.dataSource = self;
        
        _tab.rowHeight = 150;
        
        [_tab registerClass:[RecommendCell class] forCellReuseIdentifier:@"cell"];
    }
    return _tab;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.Array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RecommendCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    RecommendMD * md = self.Array[indexPath.row];
    
    [cell SetCelldataWithModel:md];
    
    cell.LoveBtn.tag = indexPath.row;
    
    return cell;
    
}

-(void)loadData{
    
    [self.Array removeAllObjects];
    
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    [manager GET:@"http://172.17.8.100/movieApi/cinema/v1/findRecommendCinemas" parameters:@{@"id":[NSNumber numberWithInt:0],@"logo":self.LogoImg,@"address":self.AddressLabel.text,@"followCinema":[NSNumber numberWithInt:2],@"name":self.nameLabel.text,@"distance":self.GapLabel.text} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSDictionary * dic = responseObject;
        NSDictionary * dic1 = dic[@"result"];
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}

@end
