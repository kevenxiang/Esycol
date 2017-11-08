//
//  FriendStatusLayout.m
//  Easycol
//
//  Created by keven kenv on 2017/11/8.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "FriendStatusLayout.h"

@implementation FriendStatusLayout

- (instancetype)initWithStatus:(FriendModel *)status style:(FriendLayoutStyle)style {
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
    [self _layoutText];
    [self _layoutPic];
    [self _layoutLikeArea];
    [self _layoutCommentArea];
    
    _height = 0;
    _height += _marginTop;
    if (_textHeight > 0) {
        _height += _widgetPaddingMargin;
        _height += _textHeight;
    }
    
    if (_allPicsHeight > 0) {
        _height += _widgetPaddingMargin;
        _height += _allPicsHeight;
    }
    
    if (_toolbarHeight > 0) { //后续功能扩展，比如发布的动态仅自己可见
        _height += _widgetPaddingMargin;
        _height += _toolbarHeight;
    }
    
    //点赞区和评论区不需要留白
    _height += _likeAreaHeight;
    _height += _commentAreaHeight;
    
    _height += _marginBottom;
}

- (void)_layout {
    _marginTop = kFriendCellTopMargin;
    _cellPaddingMargin = kFriendCellPadding;
    _cellWidth = kScreenWidth;
    _widgetPaddingMargin = kFriendCellPaddingWidget;
    _avatarHeight = kFriendCellHeadImageHeight;
    _textHeight = 0;
    _picWidth = kFriendCellImageWidth;
    _picHeight = kFriendCellImgeHeight;
    _allPicsHeight = 0;
    _imagePaddingMargin = kFriendCellPaddingImage;
    _toolbarHeight = kFriendCellToolBarHeight;
    _likeAreaHeight = 0;
    _commentAreaHeight = 0;
    _marginBottom = kFriendCellToolBarBottomMargin;
    _commentInputHeight = kFriendCommentInputHeight;
    _height = 0;
}

- (void)_layoutText {
    _textHeight = 0;
    CGFloat fontWidth = 0;
    fontWidth = kFriendCellContentWidth;
    CGSize fontSize = [self suggestSizeForString:self.status.text width:fontWidth];
    _textHeight = fontSize.height <= 30 ? 30 : fontSize.height;
}

- (void)_layoutPic {
    //最多可以发8张图，一行4张
    NSInteger picCount = self.status.imgs.count;
    if (picCount == 0) {
        _allPicsHeight = 0;
        return;
    }
    switch (picCount) {
        case 1:
        case 2:
        case 3:
        case 4:
            _allPicsHeight = _picHeight;
            break;
        case 5:
        case 6:
        case 7:
        case 8:
            _allPicsHeight = _picHeight + _imagePaddingMargin;
            break;
        default:
            break;
    }
}

- (void)_layoutLikeArea {
    
}

- (void)_layoutCommentArea {
    
}

- (CGSize)suggestSizeForString:(NSString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [self suggestSizeForAttributedString:[[NSAttributedString alloc] initWithString:string attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:kFriendCellTextFontSize]}] width:width];
}

- (CGSize)suggestSizeForAttributedString:(NSAttributedString *)string width:(CGFloat)width {
    if (!string) {
        return CGSizeZero;
    }
    return [string boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
}


@end
























