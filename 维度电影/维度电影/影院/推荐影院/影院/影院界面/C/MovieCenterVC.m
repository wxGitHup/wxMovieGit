//
//  MovieCenterVC.m
//  维度电影
//
//  Created by 安离夕 on 2019/6/18.
//  Copyright © 2019年 Person. All rights reserved.
//

#import "MovieCenterVC.h"
#import "screenLayOut.h"
@interface MovieCenterVC ()
@property(nonatomic,strong)UIButton * returnBtn;
@property(nonatomic,strong)UIImageView * TopImage;
@end

@implementation MovieCenterVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.returnBtn];
    
    [self.view addSubview:self.TopImage];
    
}

-(UIButton *)returnBtn{
    if (_returnBtn == nil) {
        
        _returnBtn = [[UIButton alloc]initWithFrame:CGRectMake(20, SCR_H-100, 80, 80)];
        
        [_returnBtn setImage:[UIImage imageNamed:@"com_icon_return_default.png"] forState:UIControlStateNormal];
        
        [_returnBtn addTarget:self action:@selector(returnBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _returnBtn;
}

-(void)returnBtn:(UIButton *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(UIImageView *)TopImage{
    if (_TopImage == nil) {
        
        _TopImage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H-500)];
        
        _TopImage.image = [UIImage imageNamed:@"hdpimore.png"];
    }
    return _TopImage;
}

@end
