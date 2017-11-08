//
//  FriendImagesCell.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "FriendImagesCell.h"

@interface FriendImagesCell()

@property (nonatomic, strong) NSArray *imgsAry;

@end

@implementation FriendImagesCell

#pragma mark - life cycle
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initUI];
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initUI];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSLog(@"========initWithFrame==========");
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat leftMargin = 8.0f;
    CGFloat topMargin = 5.0f;
    CGFloat headImgWidth = 40.0f;
    CGFloat headImgHeight = 40.0f;
    CGFloat imgWidth = 66.0f;
    CGFloat imgHeight = 70.0f;
    CGFloat contentWidth = self.contentView.frame.size.width;
    CGFloat contentHeight = self.contentView.frame.size.height;
    
    self.headImgV.frame = CGRectMake(leftMargin, topMargin, headImgWidth, headImgHeight);
    self.nickLab.frame = CGRectMake(leftMargin * 2 + headImgWidth, topMargin, contentWidth - (leftMargin * 2 + headImgWidth), headImgHeight);
    self.contentLab.frame = CGRectMake(leftMargin, topMargin * 2 + headImgHeight, contentWidth - leftMargin * 2, 40);
    for (NSInteger i = 0; i < self.imgsAry.count; i++) {
        UIImageView *imgV = (UIImageView *)[self.contentView viewWithTag:i+100];
        NSInteger a = i/4;
        NSInteger b = i%4;
        imgV.frame = CGRectMake(10 + (5 + imgWidth) * b, (topMargin * 3 + imgHeight) + CGRectGetHeight(self.contentLab.frame) + (imgHeight+5) * a, imgWidth, imgHeight);
        
    }
    
    self.likeBtn.frame = CGRectMake(contentWidth - leftMargin - 30, contentHeight - topMargin - 30, 30, 30);
    self.commentBtn.frame = CGRectMake(contentWidth - leftMargin * 2 - 30 * 2, contentHeight - topMargin - 30, 30, 30);
    
    NSLog(@"======layoutSubviews====");
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - event responds
- (void)commentBtnAction {
    
}

- (void)likeBtnAction {
    
}

#pragma gettings and settings
- (void)initUI {
    if (!_headImgV) {
        _headImgV = [[UIImageView alloc] init];
        [self.contentView addSubview:_headImgV];
    }
    
    if (!_nickLab) {
        _nickLab = [[UILabel alloc] init];
        _nickLab.textAlignment = NSTextAlignmentLeft;
        _nickLab.numberOfLines = 0;
        _nickLab.font = [UIFont systemFontOfSize:16];
        _nickLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:_nickLab];
    }
    
    if (!_contentLab) {
        _contentLab = [[UILabel alloc] init];
        _contentLab.textAlignment = NSTextAlignmentLeft;
        _contentLab.numberOfLines = 0;
        _contentLab.font = [UIFont systemFontOfSize:15];
        _contentLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:_contentLab];
    }
    
    if (!_commentBtn) {
        _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_commentBtn addTarget:self action:@selector(commentBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_commentBtn setImage:[UIImage imageNamed:@"testimg"] forState:UIControlStateNormal];
        [self.contentView addSubview:_commentBtn];
    }
    
    if (!_likeBtn) {
        _likeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_likeBtn addTarget:self action:@selector(likeBtnAction) forControlEvents:UIControlEventTouchUpInside];
        [_likeBtn setImage:[UIImage imageNamed:@"testimg"] forState:UIControlStateNormal];
        [self.contentView addSubview:_likeBtn];
    }
}

- (void)setImgsData:(NSArray *)imgsAry {
    self.imgsAry = imgsAry;
    for (NSInteger i = 0; i < imgsAry.count; i++) {
        UIImageView *imgV = [[UIImageView alloc] init];
        imgV.image = [UIImage imageNamed:@"testimg"];
        imgV.tag = 100+i;
        [self.contentView addSubview:imgV];
    }
}

@end
