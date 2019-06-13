//
//  RecommendCell.h
//  维度电影
//
//  Created by 安离夕 on 2019/6/12.
//  Copyright © 2019年 Person. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RecommendMD.h"
NS_ASSUME_NONNULL_BEGIN
@class RecommendMD;
@interface RecommendCell : UITableViewCell
@property(nonatomic,strong)UIImageView * LogoImg;
@property(nonatomic,strong)UILabel * nameLabel;
@property(nonatomic,strong)UILabel * AddressLabel;
@property(nonatomic,strong)UILabel * GapLabel;
@property(nonatomic,strong)UIButton * LoveBtn;

-(void)SetCelldataWithModel:(RecommendMD *)md;

@end

NS_ASSUME_NONNULL_END
