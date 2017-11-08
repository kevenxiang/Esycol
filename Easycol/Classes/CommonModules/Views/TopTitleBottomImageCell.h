//
//  TopTitleBottomImageCell.h
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopTitleBottomImageCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imgV_1;
@property (nonatomic, strong) UIImageView *imgV_2;
@property (nonatomic, strong) UIImageView *imgV_3;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *authorLab;
@property (nonatomic, strong) UILabel *timeLab;

- (void)setData:(id)data;

@end
