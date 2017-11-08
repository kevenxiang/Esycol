//
//  FriendStatusLayout.h
//  Easycol
//
//  Created by keven kenv on 2017/11/8.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FilesHeader.h"
#import "FriendModel.h"
#import "YYKit.h"

#define kFriendCellPadding  12                                          //cell 内边距
#define kFriendCellContentWidth (kScreenWidth - 2 * kFriendCellPadding)   //cell 内容宽度
#define kFriendCellTopMargin  8                                         //cell 顶部留白
#define kFriendCellToolBarHeight  30                                    //cell 下方展示栏高度
#define kFriendCellToolBarBottomMargin  2                               //cell 下方留白
#define kFriendCellTitleFontSize  16                                    //用户昵称字体大小
#define kFriendCellTextFontSize   15                                    //动态内容字体大小
#define kFriendCellImageWidth    66                                    //用户发布图片宽度
#define kFriendCellImgeHeight    70                                    //用户发布图片高度
#define kFriendCellHeadImageWidth  40                                  //用户头像宽度
#define kFriendCellHeadImageHeight 40                                  //用户头像高度
#define kFriendCellToolButtonWidth  30       //状态栏按钮的宽度
#define kFriendCellToolButtonHeight 30       //状态栏按钮的高度
#define kFriendCellPaddingImage   5          //动态内容图片之间的间距
#define kFriendCellPaddingWidget  10         //控件之间的间距
#define kFriendCommentInputHeight  32        //评论输入框高度


#define kFriendCellBackgroundColor  UIColorHex(f2f2f2)    // Cell背景灰色
#define kFriendCellHighlightColor   UIColorHex(f0f0f0)     // Cell高亮时灰色

//风格
typedef NS_ENUM(NSUInteger, FriendLayoutStyle) {
    FriendLayoutStyleMultiImages,   //多图的动态
    FriendLayoutStyleOnlyText,      //只有文本的动态
};

@interface FriendStatusLayout : NSObject

- (instancetype)initWithStatus:(FriendModel *)status style:(FriendLayoutStyle)style;
- (void)layout;  //计算布局

//数据
@property (nonatomic, strong) FriendModel *status;
@property (nonatomic, assign) FriendLayoutStyle style;

//布局结果
//顶部留白
@property (nonatomic, assign) CGFloat marginTop;
//内边距
@property (nonatomic, assign) CGFloat cellPaddingMargin;
//总宽度
@property (nonatomic, assign) CGFloat cellWidth;
//控件之间的间距
@property (nonatomic, assign) CGFloat widgetPaddingMargin;

//用户头像高度
@property (nonatomic, assign) CGFloat avatarHeight;
//文本高度
@property (nonatomic, assign) CGFloat textHeight;

//图片
@property (nonatomic, assign) CGFloat picWidth;
@property (nonatomic, assign) CGFloat picHeight;
//图片总高度 -- 最多可以发8张图
@property (nonatomic, assign) CGFloat allPicsHeight;
//动态内容图片之间的间距
@property (nonatomic, assign) CGFloat imagePaddingMargin;

//工具栏高度
@property (nonatomic, assign) CGFloat toolbarHeight;

//点赞区高度
@property (nonatomic, assign) CGFloat likeAreaHeight;
//评论区高度
@property (nonatomic, assign) CGFloat commentAreaHeight;
//评论输入框高度
@property (nonatomic, assign) CGFloat commentInputHeight;

//下边留白
@property (nonatomic, assign) CGFloat marginBottom;

//总高度
@property (nonatomic, assign) CGFloat height;

@end





















