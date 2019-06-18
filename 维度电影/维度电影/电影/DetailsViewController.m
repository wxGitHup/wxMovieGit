//
//  DetailsViewController.m
//  维度电影
//
//  Created by 王翔 on 2019/6/18.
//  Copyright © 2019年 Person. All rights reserved.
//

#import "DetailsViewController.h"
@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UIButton *detail;
- (IBAction)detailBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *announced;
- (IBAction)announcedBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *still;
- (IBAction)stillBtn:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *film;
- (IBAction)filmBtn:(UIButton *)sender;
- (IBAction)return:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *buy;
- (IBAction)buyBtn:(UIButton *)sender;


@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)detailBtn:(UIButton *)sender {
}
- (IBAction)announcedBtn:(UIButton *)sender {
}
- (IBAction)stillBtn:(UIButton *)sender {
}
- (IBAction)filmBtn:(UIButton *)sender {
}

- (IBAction)return:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)buyBtn:(UIButton *)sender {
}
@end
