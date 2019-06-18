//
//  MyTableViewCell.m
//  维度电影
//
//  Created by 王翔 on 2019/6/18.
//  Copyright © 2019年 Person. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation MyTableViewCell
-(void)SetCellDataWithMd:(Res *)md
{
    [self.Urlimg sd_setImageWithURL:[NSURL URLWithString:md.imageUrl] placeholderImage:nil];
    self.urlName.text=md.name;
    self.reviewText.text=md.summary;
}
-(void)SetCellDataWithM:(ReleaseRes *)md1
{
    [self.Urlimg sd_setImageWithURL:[NSURL URLWithString:md1.imageUrl] placeholderImage:nil];
    self.urlName.text=md1.name;
    self.reviewText.text=md1.summary;
    
}
-(void)SetCellDataWithd:(Comingre *)md2
{
    [self.Urlimg sd_setImageWithURL:[NSURL URLWithString:md2.imageUrl] placeholderImage:nil];
    self.urlName.text=md2.name;
    self.reviewText.text=md2.summary;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)heartBtn:(UIButton *)sender {
    if (self.heart.selected==YES)
    {
        self.heart.selected=NO;
    }else
    {
        self.heart.selected=YES;
    }
    
}
@end
