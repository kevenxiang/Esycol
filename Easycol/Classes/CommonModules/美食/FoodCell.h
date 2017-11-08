//
//  FoodCell.h
//  Easycol
//
//  Created by keven kenv on 2017/11/7.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodStatusLayout.h"
#import "FoodModel.h"
#import "YYKit.h"
#import "FilesHeader.h"

@class FoodCell;

//多图加文本区
@interface FoodMultiImagesView : UIView

@property (nonatomic, strong) YYLabel *titleLab;
@property (nonatomic, strong) UIImageView *imgV_1;
@property (nonatomic, strong) UIImageView *imgV_2;
@property (nonatomic, strong) UIImageView *imgV_3;

@property (nonatomic, weak) FoodCell *cell;

@end

//单图加文本区
@interface FoodImageAndTitleView : UIView

@property (nonatomic, strong) YYLabel *titleLab;
@property (nonatomic, strong) UIImageView *imgV;

@property (nonatomic, weak) FoodCell *cell;

@end

//只有文本区
@interface FoodTitleView : UIView

@property (nonatomic, strong) YYLabel *titleLab;
@property (nonatomic, weak) FoodCell *cell;

@end

//工具栏
@interface FoodToolBarView : UIView

@property (nonatomic, strong) UILabel *authorLab;
@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, weak) FoodCell *cell;
@end

//总布局view
@interface FoodStatusView : UIView

@property (nonatomic, strong) UIView *contentView;              // 容器
@property (nonatomic, strong) FoodMultiImagesView *mutileView;   //多图标题
@property (nonatomic, strong) FoodImageAndTitleView *titleImgView;  //单图文标题
@property (nonatomic, strong) FoodTitleView *titleView;  //只含有文本的标题
@property (nonatomic, strong) FoodToolBarView *toolBarView;   //展示栏

@property (nonatomic, strong) FoodStatusLayout *layout;
@property (nonatomic, weak) FoodCell *cell;


@end

@protocol FoodCellDelegate;
@interface FoodCell : UITableViewCell
@property (nonatomic, assign) id <FoodCellDelegate> delegate;
@property (nonatomic, strong) FoodStatusView *statusView;
@property (nonatomic, strong) FoodModel *model;
- (void)setLayout:(FoodStatusLayout *)layout;

@end

@protocol FoodCellDelegate <NSObject>
@optional
//点击了cell
- (void)foodCellDidClick:(FoodCell *)cell;
@end
