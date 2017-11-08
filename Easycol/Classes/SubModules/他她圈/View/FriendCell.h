//
//  FriendCell.h
//  Easycol
//
//  Created by keven kenv on 2017/11/8.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YYKit.h"

//头像区
@interface FriendHeadView : UIView

@property (nonatomic, strong) UIImageView *avatarImgV;
@property (nonatomic, strong) YYLabel *nickLab;
@property (nonatomic, strong) UIImageView *architecturalImgV; //右上角装饰区
@property (nonatomic, strong) UIButton *arrowBtn;

@end

//文本区
@interface FriendTextView : UIView
@end

//图片区
@interface FriendImagesView : UIView
@end

//工具栏
@interface FriendToolView : UIView
@end

//点赞区
@interface FriendLikeAreaView : UIView
@end

//评论区
@interface FriendCommentAreaView : UIView
@end

//评论输入区
@interface FriendCommentInputView : UIView
@end

@interface FriendCell : UITableViewCell

@end
