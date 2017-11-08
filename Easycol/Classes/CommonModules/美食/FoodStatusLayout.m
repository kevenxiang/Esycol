//
//  FoodStatusLayout.m
//  Easycol
//
//  Created by keven kenv on 2017/11/7.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "FoodStatusLayout.h"
#import "UILabel+SuggestSize.h"

@implementation FoodStatusLayout

- (instancetype)initWithStatus:(FoodModel *)status style:(FoodLayoutStyle)style {
    if (!status) {
        return nil;
    }
    self = [super init];
    _status = status;
    _style = style;
    [self layout];
    return self;
}

- (void)layout {
    [self _layout];
    
    [self _layoutPic];
    [self _layoutTitle];
    
    
    _height = 0;
    _height += _marginTop;
    if (_style == FoodLayoutStyleMultiImages) {
        _height += _titleHeight;
        _height += _picHeight;
        _height += kFoodCellTopMargin;
        _height += kFoodCellPaddingText * 2;
        
    } else if (_style == FoodLayoutStyleTitleAndImage) {
        _height += kFoodCellTopMargin;
        _height += _picHeight;
        _height += kFoodCellPaddingText;
    } else {
        _height += kFoodCellTopMargin;
        _height += _titleHeight;
        _height += kFoodCellPaddingText;
    }
    _height += kFoodCellToolBarHeight;
    
    _cellPaddingMargin = kFoodCellPadding;
    _cellWidth = kScreenWidth;
    _textPaddingMargin = kFoodCellPaddingText;
}

- (void)_layout {
    _marginTop = kFoodCellTopMargin;
    _titleHeight = 0;
    _picHeight = 0;
    _toolbarHeight = kFoodCellToolBarHeight;
    _marginBottom = kFoodCellToolBarBottomMargin;
}

- (void)_layoutTitle {
    _titleHeight = 0;
    
    CGFloat fontWidth = 0;
    if (_style == FoodLayoutStyleMultiImages) {
        fontWidth = kFoodCellContentWidth;
    } else if (_style == FoodLayoutStyleTitleAndImage) {
        fontWidth = kFoodCellContentWidth - _picWidth - kFoodCellPadding;
    } else {
        fontWidth = kFoodCellContentWidth;
    }
    CGSize fontSize = [self suggestSizeForString:self.status.title width:fontWidth];
    _titleHeight = fontSize.height <= 30 ? 30 : fontSize.height;
    
}

- (void)_layoutPic {
    if (self.status.imgs.count > 0) {
        _picHeight = kFoodCellImgeHeight;
        _picWidth = kFoodCellImageWidth;
    } else {
        _picHeight = 0;
    }
}

- (CGSize)suggestSizeForString:(NSString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [self suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kFoodCellTitleFontSize]}] width:width];
}

- (CGSize)suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}

@end


