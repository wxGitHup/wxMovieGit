//
//  CellModel.h
//  维度电影
//
//  Created by 王翔 on 2019/6/18.
//  Copyright © 2019年 Person. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
NS_ASSUME_NONNULL_BEGIN

@class Res;
@interface MovieModel : NSObject
@property(nonatomic,strong)NSString * status;
@property(nonatomic,strong)NSString*message;
@property(nonatomic,strong)NSArray<Res*>*result;
@end

@interface  Res:NSObject
@property(nonatomic,assign)BOOL followMovie;
@property(nonatomic,assign)int id;
@property(nonatomic,strong)NSString*imageUrl;
@property(nonatomic,strong)NSString*name;
@property(nonatomic,strong)NSString*summary;
@end

NS_ASSUME_NONNULL_END
