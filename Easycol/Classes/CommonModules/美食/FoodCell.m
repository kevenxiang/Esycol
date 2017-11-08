//
//  FoodCell.m
//  Easycol
//
//  Created by keven kenv on 2017/11/7.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "FoodCell.h"

@implementation FoodMultiImagesView

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = 1;
    }
    self = [super initWithFrame:frame];
    self.exclusiveTouch = YES;
    
    
    _titleLab = [YYLabel new];
    _titleLab.size = CGSizeMake(kFoodCellContentWidth, 40);
    _titleLab.left = kFoodCellPadding;
    _titleLab.numberOfLines = 0;
    _titleLab.displaysAsynchronously = YES;
    _titleLab.ignoreCommonProperties = YES;
    _titleLab.fadeOnHighlight = NO;
    _titleLab.fadeOnAsynchronouslyDisplay = NO;
    _titleLab.font = [UIFont systemFontOfSize:kFoodCellTitleFontSize];
    [self addSubview:_titleLab];
    
    _imgV_1 = [[UIImageView alloc] init];
    [self addSubview:_imgV_1];
    
    _imgV_2 = [[UIImageView alloc] init];
    [self addSubview:_imgV_2];
    
    _imgV_3 = [[UIImageView alloc] init];
    [self addSubview:_imgV_3];
    
    return self;
}

@end

@implementation FoodImageAndTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = 1;
    }
    self = [super initWithFrame:frame];
    self.exclusiveTouch = YES;
    
    _imgV = [[UIImageView alloc] init];
    [self addSubview:_imgV];
    
    _titleLab = [YYLabel new];
    _titleLab.size = CGSizeMake(kFoodCellContentWidth, self.height);
    _titleLab.left = kFoodCellPadding;
    _titleLab.numberOfLines = 0;
    _titleLab.displaysAsynchronously = YES;
    _titleLab.ignoreCommonProperties = YES;
    _titleLab.fadeOnHighlight = NO;
    _titleLab.fadeOnAsynchronouslyDisplay = NO;
    _titleLab.font = [UIFont systemFontOfSize:kFoodCellTitleFontSize];
    [self addSubview:_titleLab];
    
    return self;
}

@end

@implementation FoodTitleView

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = 1;
    }
    self = [super initWithFrame:frame];
    self.exclusiveTouch = YES;
    
    _titleLab = [YYLabel new];
    _titleLab.size = CGSizeMake(kFoodCellContentWidth, self.height);
    _titleLab.left = kFoodCellPadding;
    _titleLab.numberOfLines = 0;
    _titleLab.displaysAsynchronously = YES;
    _titleLab.ignoreCommonProperties = YES;
    _titleLab.fadeOnHighlight = NO;
    _titleLab.fadeOnAsynchronouslyDisplay = NO;
    _titleLab.font = [UIFont systemFontOfSize:kFoodCellTitleFontSize];
    [self addSubview:_titleLab];
    
    return self;
}

@end


@implementation FoodToolBarView

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = 1;
    }
    self = [super initWithFrame:frame];
    self.exclusiveTouch = YES;
    
    _authorLab = [[UILabel alloc] init];
    _authorLab.textAlignment = NSTextAlignmentLeft;
    _authorLab.numberOfLines = 0;
    _authorLab.font = [UIFont systemFontOfSize:12];
    _authorLab.textColor = [UIColor blackColor];
    [self addSubview:_authorLab];
    
    _timeLab = [[UILabel alloc] init];
    _timeLab.textAlignment = NSTextAlignmentLeft;
    _timeLab.numberOfLines = 0;
    _timeLab.font = [UIFont systemFontOfSize:12];
    _timeLab.textColor = [UIColor blackColor];
    [self addSubview:_timeLab];
    
    return self;
}

@end


@implementation FoodStatusView

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size.width = kScreenWidth;
        frame.size.height = 1;
    }
    self = [super initWithFrame:frame];
    self.exclusiveTouch = YES;
    
    _contentView = [UIView new];
    _contentView.width = kScreenWidth;
    _contentView.height = 1;
    _contentView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:_contentView];
    
    _mutileView = [FoodMultiImagesView new];
    _mutileView.hidden = YES;
    [_contentView addSubview:_mutileView];
    
    _titleImgView = [FoodImageAndTitleView new];
    _titleImgView.hidden = YES;
    [_contentView addSubview:_titleImgView];
    
    _titleView = [FoodTitleView new];
    _titleView.hidden = YES;
    [_contentView addSubview:_titleView];
    
    _toolBarView = [FoodToolBarView new];
    _toolBarView.hidden = YES;
    [_contentView addSubview:_toolBarView];
    
    return self;
}

- (void)setLayout:(FoodStatusLayout *)layout {
    _layout = layout;
    
    self.height = layout.height;
    _contentView.top = 0;
    _contentView.height = layout.height;
    
    CGFloat top = 0;
    if (layout.style == FoodLayoutStyleTitle) { //只有文本标题
        
        //布局
        _titleView.hidden = NO;
        _titleView.frame = CGRectMake(layout.cellPaddingMargin, layout.marginTop, layout.cellWidth - layout.cellPaddingMargin * 2, layout.titleHeight);
        _titleView.titleLab.frame = CGRectMake(0, 0, _titleView.width, _titleView.height);
        top = _titleView.height + layout.textPaddingMargin + layout.marginTop;
        
        //赋值
        _titleView.titleLab.text = layout.status.title;
        
    } else {
        _titleView.hidden = YES;
    }
    
    if (layout.style == FoodLayoutStyleTitleAndImage) { //一张图片和文本标题
        
        //布局
        _titleImgView.hidden = NO;
        _titleImgView.frame = CGRectMake(layout.cellPaddingMargin, layout.marginTop, layout.cellWidth, layout.picHeight);
        
        _titleImgView.titleLab.frame = CGRectMake(layout.picWidth + layout.cellPaddingMargin, 0, _titleImgView.width - layout.cellPaddingMargin * 2 - layout.picWidth, layout.titleHeight);
       
        _titleImgView.imgV.frame = CGRectMake(0, 0, layout.picWidth, layout.picHeight);
        top = _titleImgView.height + layout.marginTop + layout.textPaddingMargin;
        
        //赋值
        _titleImgView.imgV.image = [UIImage imageNamed:layout.status.imgs[0]];
        _titleImgView.titleLab.text = layout.status.title;
        
        
    } else {
        _titleImgView.hidden = YES;
    }
    
    if (layout.style == FoodLayoutStyleMultiImages) { //多张图片的标题
        
        //布局
        _mutileView.hidden = NO;
        _mutileView.frame = CGRectMake(layout.cellPaddingMargin, layout.marginTop, layout.cellWidth - layout.cellPaddingMargin * 2, layout.titleHeight + layout.textPaddingMargin + layout.picHeight);
        _mutileView.titleLab.frame = CGRectMake(0, 0, _mutileView.width, layout.titleHeight);
        
        CGFloat imgWidth = (layout.cellWidth - (4 * layout.cellPaddingMargin))/3.0f;
        
        _mutileView.imgV_1.frame = CGRectMake(0, layout.textPaddingMargin + layout.titleHeight, imgWidth, layout.picHeight);
        _mutileView.imgV_2.frame = CGRectMake(layout.cellPaddingMargin + imgWidth, layout.titleHeight + layout.textPaddingMargin, imgWidth, layout.picHeight);
        _mutileView.imgV_3.frame = CGRectMake(layout.cellPaddingMargin * 2 + imgWidth * 2, layout.titleHeight + layout.textPaddingMargin, imgWidth, layout.picHeight);
        
        
        top = _mutileView.height + layout.marginTop + layout.textPaddingMargin;
        
        //赋值
        _mutileView.titleLab.text = layout.status.title;
        _mutileView.imgV_1.image = [UIImage imageNamed:layout.status.imgs[0]];
        _mutileView.imgV_2.image = [UIImage imageNamed:layout.status.imgs[1]];
        _mutileView.imgV_3.image = [UIImage imageNamed:layout.status.imgs[2]];
        
        
    } else {
        _mutileView.hidden = YES;
    }
    
    //布局
    _toolBarView.frame = CGRectMake(0, top, layout.cellWidth, layout.toolbarHeight);
    _toolBarView.timeLab.frame = CGRectMake(layout.cellWidth - 80 * 2 - layout.cellPaddingMargin * 2, 0, 80, layout.toolbarHeight);
    _toolBarView.authorLab.frame = CGRectMake(layout.cellWidth - 80 - layout.cellPaddingMargin, 0, 80, layout.toolbarHeight);
    _toolBarView.hidden = NO;
    
    //赋值
    _toolBarView.timeLab.text = layout.status.time;
    _toolBarView.authorLab.text = layout.status.author;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [(_contentView) performSelector:@selector(setBackgroundColor:) withObject:kFoodCellHighlightColor afterDelay:0.15];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self touchesRestoreBackgroundColor];
    if ([_cell.delegate respondsToSelector:@selector(foodCellDidClick:)]) {
        [_cell.delegate foodCellDidClick:_cell];
    }
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self touchesRestoreBackgroundColor];
}

- (void)touchesRestoreBackgroundColor {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.35 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [NSObject cancelPreviousPerformRequestsWithTarget:_contentView selector:@selector(setBackgroundColor:) object:kFoodCellHighlightColor];
        _contentView.backgroundColor = [UIColor whiteColor];
    });
}

@end

@implementation FoodCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    _statusView = [FoodStatusView new];
    _statusView.cell = self;
    _statusView.titleView.cell = self;
    _statusView.titleImgView.cell = self;
    _statusView.mutileView.cell = self;
    _statusView.toolBarView.cell = self;
    [self.contentView addSubview:_statusView];
    return self;
}

- (void)setLayout:(FoodStatusLayout *)layout {
    self.height = layout.height;
    self.contentView.height = layout.height;
    _statusView.layout = layout;
    self.model = layout.status;
}

@end
