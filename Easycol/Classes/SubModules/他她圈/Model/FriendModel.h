//
//  FriendModel.h
//  Easycol
//
//  Created by keven kenv on 2017/11/8.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FriendModel : NSObject

@property (nonatomic, copy) NSString *avatar;  //用户头像
@property (nonatomic, copy) NSString *nick;    //用户昵称
@property (nonatomic, copy) NSString *text;    //动态文本内容
@property (nonatomic, copy) NSArray *imgs;     //动态图片内容 - 最多可以发8张图
@property (nonatomic, copy) NSString *level;   //用户等级 - 根据用户发布的动态数来判断

@end
