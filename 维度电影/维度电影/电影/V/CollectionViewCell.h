//
//  CollectionViewCell.h
//  维度电影
//
//  Created by 王翔 on 2019/6/14.
//  Copyright © 2019年 Person. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *movieImg;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;

@end

NS_ASSUME_NONNULL_END
