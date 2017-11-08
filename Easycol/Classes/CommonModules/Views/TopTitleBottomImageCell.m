//
//  TopTitleBottomImageCell.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "TopTitleBottomImageCell.h"

const CGFloat kiMarginX = 8.0f;
const CGFloat kiMarginY = 5.0f;
const CGFloat kiImgHeight = 80.0f;
const CGFloat kiPadding = 8.0f;
const CGFloat kiImageSpace = 12.0f;
const CGFloat kiBottomLabHeight = 20.0f;
const CGFloat kiAuthorLabWidth = 80.0f;
const CGFloat kiTimeLabWidth = 80.0f;

@implementation TopTitleBottomImageCell

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
    
    self.titleLab.frame = CGRectMake(kiPadding, kiMarginY, selfWidth - (kiPadding * 2), 40);
    
    CGFloat imgWidth = (selfWidth - (2 * kiPadding) - (2 * kiImageSpace))/3.0f;
    self.imgV_1.frame = CGRectMake(kiMarginX, kiMarginY + self.titleLab.frame.size.height, imgWidth, kiImgHeight);
    self.imgV_2.frame = CGRectMake(kiMarginX + imgWidth + kiImageSpace, kiMarginY + self.titleLab.frame.size.height, imgWidth, kiImgHeight);
    self.imgV_3.frame = CGRectMake(kiMarginX + imgWidth * 2 + kiImageSpace * 2, kiMarginY + self.titleLab.frame.size.height, imgWidth, kiImgHeight);
    
    self.authorLab.frame = CGRectMake(selfWidth - kiAuthorLabWidth - kiPadding, kiMarginY + self.titleLab.frame.size.height + kiPadding + kiImgHeight + kiPadding, kiAuthorLabWidth, kiBottomLabHeight);
    self.timeLab.frame = CGRectMake(selfWidth - (kiAuthorLabWidth + kiPadding + kiTimeLabWidth), kiMarginY + self.titleLab.frame.size.height + kiPadding + kiImgHeight + kiPadding, kiAuthorLabWidth, kiBottomLabHeight);
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
    
    if (!_imgV_1) {
        _imgV_1 = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgV_1];
    }
    
    if (!_imgV_2) {
        _imgV_2 = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgV_2];
    }
    
    if (!_imgV_3) {
        _imgV_3 = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgV_3];
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
