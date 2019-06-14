//
//  MovieModel.h
//  维度电影
//
//  Created by 王翔 on 2019/6/14.
//  Copyright © 2019年 Person. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class Details;
@interface MovieModel : NSObject
@property(nonatomic,strong)NSString * status;
@property(nonatomic,strong)NSString*message;
@property(nonatomic,strong)NSArray<Details*>*result;

@end

@interface  Details:NSObject


@end

NS_ASSUME_NONNULL_END
