//
//  ReviewViewController.m
//  维度电影
//
//  Created by 王翔 on 2019/6/13.
//  Copyright © 2019年 Person. All rights reserved.
//

#import "ReviewViewController.h"
#import "GYZChooseCityController.h"
@interface ReviewViewController ()<GYZChooseCityDelegate>{
    UIButton *chooseCityBtn;
}


@end

@implementation ReviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    chooseCityBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
//    chooseCityBtn.center = self.view.center;
    [chooseCityBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [chooseCityBtn setTitle:@"选择城市" forState:UIControlStateNormal];
    [chooseCityBtn addTarget:self action:@selector(onClickChooseCity:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chooseCityBtn];
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(30, self.view.frame.size.height-100, 50, 50)];
    [btn setImage:[UIImage imageNamed:@"com_icon_return_default.png"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(aaa) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray *array = [NSArray arrayWithObjects:@"热门电影",@"正在热映",@"即将上映", nil];
    //初始化UISegmentedControl
    UISegmentedControl *segment = [[UISegmentedControl alloc]initWithItems:array];
    //设置frame
    segment.frame = CGRectMake(10, 100, self.view.frame.size.width-20, 30);
    //添加到视图
    [self.view addSubview:segment];
     segment.apportionsSegmentWidthsByContent = YES;
       segment.tintColor = [UIColor blackColor];
//    segment.momentary = YES;
    [segment addTarget:self action:@selector(change:) forControlEvents:UIControlEventValueChanged];
}
-(void)change:(UISegmentedControl *)sender{
    NSLog(@"测试");
    if (sender.selectedSegmentIndex == 0) {
        NSLog(@"1");
    }else if (sender.selectedSegmentIndex == 1){
        NSLog(@"2");
    }else if (sender.selectedSegmentIndex == 2){
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
