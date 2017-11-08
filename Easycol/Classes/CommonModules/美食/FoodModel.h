//
//  FoodModel.h
//  Easycol
//
//  Created by keven kenv on 2017/11/7.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FoodPictureMetadata : NSObject
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, assign) NSInteger width;
@property (nonatomic, assign) NSInteger height;
@property (nonatomic, strong) NSString *type;  // "WEBP" "JPEG" "GIF"
@property (nonatomic, assign) NSInteger cutType;
@end

@interface FoodModel : NSObject
@property (nonatomic, copy) NSString *title;   //标题
@property (nonatomic, copy) NSString *time;    //发布日期
@property (nonatomic, copy) NSString *author;  //作者
@property (nonatomic, copy) NSString *text;    //正文内容
@property (nonatomic, copy) NSArray *imgs;     //图片
@property (nonatomic, assign) NSInteger hits;  //点击量

@end
