//
//  ZModel.h
//  维度电影
//
//  Created by 王翔 on 2019/6/14.
//  Copyright © 2019年 Person. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MJExtension.h"
NS_ASSUME_NONNULL_BEGIN
@class ReleaseRes;

@interface ZModel : NSObject
@property(nonatomic,strong)NSString * status;
@property(nonatomic,strong)NSString*message;
@property(nonatomic,strong)NSArray<ReleaseRes*>*result;
@end
@interface  ReleaseRes:NSObject
@property(nonatomic,assign)BOOL followMovie;
@property(nonatomic,assign)int id;
@property(nonatomic,strong)NSString*imageUrl;
@property(nonatomic,strong)NSString*name;
@property(nonatomic,strong)NSString*summary;
@property(nonatomic,strong)NSString*releaseTimeShow;
@end
NS_ASSUME_NONNULL_END
