//
//  FoodStatusLayout.h
//  Easycol
//
//  Created by keven kenv on 2017/11/7.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "FilesHeader.h"
#import "FoodModel.h"
#import "YYKit.h"

#define kFoodCellPadding  12                                          //cell 内边距
#define kFoodCellContentWidth (kScreenWidth - 2 * kFoodCellPadding)   //cell 内容宽度
#define kFoodCellTopMargin  8                                         //cell 顶部留白
#define kFoodCellPaddingText 10                                       //cell 文本与其他元素间留白
#define kFoodCellToolBarHeight  30                                    //cell 下方展示栏高度
#define kFoodCellToolBarBottomMargin  2                               //cell 下方留白
#define kFoodCellTitleFontSize  16                                    //标题字体大小
#define kFoodCellImageWidth    100                                    //标题图片宽度
#define kFoodCellImgeHeight     80                                    //标题图片高度

#define kFoodCellBackgroundColor  UIColorHex(f2f2f2)    // Cell背景灰色
#define kFoodCellHighlightColor   UIColorHex(f0f0f0)     // Cell高亮时灰色

//风格
typedef NS_ENUM(NSUInteger, FoodLayoutStyle) {
    FoodLayoutStyleTitle,           //只有标题的样式
    FoodLayoutStyleTitleAndImage,   //带图片和标题的样式
    FoodLayoutStyleMultiImages,     //带多张图片和标题的样式
};

@interface FoodStatusLayout : NSObject

- (instancetype)initWithStatus:(FoodModel *)status style:(FoodLayoutStyle)style;
- (void)layout;    //计算布局

//数据
@property (nonatomic, strong) FoodModel *status;
@property (nonatomic, assign) FoodLayoutStyle style;

//布局结果
//顶部留白
@property (nonatomic, assign) CGFloat marginTop;
//内边距
@property (nonatomic, assign) CGFloat cellPaddingMargin;
//总宽度
@property (nonatomic, assign) CGFloat cellWidth;
//文本与其他元素之间的间距
@property (nonatomic, assign) CGFloat textPaddingMargin;

//标题
@property (nonatomic, assign) CGFloat titleHeight;

//图片
@property (nonatomic, assign) CGFloat picWidth;
@property (nonatomic, assign) CGFloat picHeight;

//展示栏
@property (nonatomic, assign) CGFloat toolbarHeight;

//下边留白
@property (nonatomic, assign) CGFloat marginBottom;

//总高度
@property (nonatomic, assign) CGFloat height;

@end













