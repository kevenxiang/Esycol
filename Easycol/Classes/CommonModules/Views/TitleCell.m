//
//  TitleCell.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "TitleCell.h"

const CGFloat ktMarginX = 8.0f;
const CGFloat ktMarginY = 5.0f;
const CGFloat ktPadding = 8.0f;
const CGFloat ktBottomLabHeight = 20.0f;
const CGFloat ktAuthorLabWidth = 80.0f;
const CGFloat ktTimeLabWidth = 80.0f;

@implementation TitleCell

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
    
    self.titleLab.frame = CGRectMake(ktPadding, ktMarginY, selfWidth - (ktPadding * 2), 40);
    self.authorLab.frame = CGRectMake(selfWidth - ktAuthorLabWidth - ktPadding, ktMarginY + self.titleLab.frame.size.height + ktPadding, ktAuthorLabWidth, ktBottomLabHeight);
    self.timeLab.frame = CGRectMake(selfWidth - (ktAuthorLabWidth + ktPadding + ktTimeLabWidth), ktMarginY + self.titleLab.frame.size.height + ktPadding, ktAuthorLabWidth, ktBottomLabHeight);
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
