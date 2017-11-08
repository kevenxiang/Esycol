//
//  FriendImagesCell.h
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FriendImagesCell : UITableViewCell

@property (nonatomic, strong) UIImageView *headImgV;
@property (nonatomic, strong) UILabel *nickLab;
@property (nonatomic, strong) UILabel *contentLab;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UIButton *likeBtn;
@property (nonatomic, strong) UILabel *commentLab;

- (void)setImgsData:(NSArray *)imgsAry;

@end
