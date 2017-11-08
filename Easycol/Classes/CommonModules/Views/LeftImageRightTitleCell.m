//
//  LeftImageRightTitleCell.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "LeftImageRightTitleCell.h"

const CGFloat kMarginX = 8.0f;
const CGFloat kMarginY = 5.0f;
const CGFloat kImgwidth = 100.0f;
const CGFloat kImgHeight = 80.0f;
const CGFloat kPadding = 8.0f;
const CGFloat kBottomLabHeight = 20.0f;
const CGFloat kAuthorLabWidth = 80.0f;
const CGFloat kTimeLabWidth = 80.0f;

@implementation LeftImageRightTitleCell

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

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat selfWidth = self.contentView.frame.size.width;
    CGFloat selfHeight = self.contentView.frame.size.height;
    
    self.imgV.frame = CGRectMake(kMarginX, kMarginX, kImgwidth, kImgHeight);
    self.titleLab.frame = CGRectMake(kMarginX + kImgwidth + kPadding, kMarginY, selfWidth - (kMarginX + kImgwidth + kPadding * 3), 40);
    self.authorLab.frame = CGRectMake(selfWidth - kAuthorLabWidth - kPadding, selfHeight - kPadding - kBottomLabHeight, kAuthorLabWidth, kBottomLabHeight);
    self.timeLab.frame = CGRectMake(selfWidth - (kAuthorLabWidth + kPadding + kTimeLabWidth), selfHeight - kPadding - kBottomLabHeight, kAuthorLabWidth, kBottomLabHeight);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - public methods
- (void)setData:(id)data {
    
}

#pragma mark - gettings and settings
- (void)initUI {
    if (!_imgV) {
        _imgV = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgV];
    }
    
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.numberOfLines = 0;
        _titleLab.font = [UIFont systemFontOfSize:15];
        _titleLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:_titleLab];
    }
    
    if (!_authorLab) {
        _authorLab = [[UILabel alloc] init];
        _authorLab.textAlignment = NSTextAlignmentLeft;
        _authorLab.numberOfLines = 0;
        _authorLab.font = [UIFont systemFontOfSize:12];
        _authorLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:_authorLab];
    }
    
    if (!_timeLab) {
        _timeLab = [[UILabel alloc] init];
        _timeLab.textAlignment = NSTextAlignmentLeft;
        _timeLab.numberOfLines = 0;
        _timeLab.font = [UIFont systemFontOfSize:12];
        _timeLab.textColor = [UIColor blackColor];
        [self.contentView addSubview:_timeLab];
    }
}

@end
