//
//  TitleCell.h
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TitleCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *authorLab;
@property (nonatomic, strong) UILabel *timeLab;

- (void)setData:(id)data;

@end
