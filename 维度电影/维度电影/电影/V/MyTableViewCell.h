//
//  MyTableViewCell.h
//  维度电影
//
//  Created by 王翔 on 2019/6/18.
//  Copyright © 2019年 Person. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MovieModel.h"
#import "ZModel.h"
#import "JModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *buttonImg;
@property (weak, nonatomic) IBOutlet UIImageView *Urlimg;
@property (weak, nonatomic) IBOutlet UILabel *urlName;
@property (weak, nonatomic) IBOutlet UILabel *reviewText;
@property (weak, nonatomic) IBOutlet UIButton *heart;
- (IBAction)heartBtn:(UIButton *)sender;
-(void)SetCellDataWithMd:(Res*)md;
-(void)SetCellDataWithM:(ReleaseRes*)md1;
-(void)SetCellDataWithd:(Comingre*)md2;
@end

NS_ASSUME_NONNULL_END
