//
//  RecommendMD.h
//  维度电影
//
//  Created by 安离夕 on 2019/6/12.
//  Copyright © 2019年 Person. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RecommendMD : NSObject
@property(nonatomic,assign)int id;//影院ID
@property(nonatomic,strong)NSString * address;//影院地址
@property(nonatomic,assign)int followCinema;//是否关注
@property(nonatomic,strong)NSString * name;//影院名称
@property(nonatomic,strong)NSString * logo;//影院logo
@property(nonatomic,assign)int commentTotal;//影院评论数
@property(nonatomic,assign)int distance;//影院距离
@property(nonatomic,assign)int userId;//用户登录信息
@property(nonatomic,strong)NSString * sessionId;//登录凭证
@property(nonatomic,assign)int page;
@property(nonatomic,assign)int count;
@property(nonatomic,strong)NSString * status;//请求状态
@property(nonatomic,strong)NSString * message;//提示消息



@end

NS_ASSUME_NONNULL_END
