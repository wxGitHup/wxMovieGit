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
@interface MovieViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView*tab;
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
        
    }
    return cell;
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
        ReviewViewController*review=[ReviewViewController new];
        [self presentViewController:review animated:YES completion:nil];
    }else if (indexPath.row==3)
    {
        ReviewViewController*review=[ReviewViewController new];
        [self presentViewController:review animated:YES completion:nil];
    }else if (indexPath.row==5)
    {
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
    [self.tab addSubview:lq];
    
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
