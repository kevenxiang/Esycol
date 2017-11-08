//
//  BaseViewController.h
//  KouDaiDuoBao
//
//  Created by 向琼 on 16/3/30.
//  Copyright © 2016年 CitiesTechnology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIButton+Block.h"

//头文件
#import "FilesHeader.h"

#define kNavBarHeight       44
#define kLeftMargin        (-5)
#define kRightMargin       (-10)
#define kIOS7OrLater       (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)

typedef void (^TouchedBlock)(NSInteger tag);

@interface BaseViewController : UIViewController

- (void)setLeftBarButtonWithTitle:(NSString *)title withBlock:(TouchedBlock)block;
- (void)setLeftBarButtonWithTitle:(NSString *)title titleColor:(UIColor *)color withBlock:(TouchedBlock)block;
- (void)setLeftBarButtonWithImage:(UIImage *)image withHighLightedImage:(UIImage *)highlightedImage;
- (void)setLeftBarButtonWithImage:(UIImage *)image withHighlightedImage:(UIImage *)highlightedImage withBlock:(TouchedBlock)block;

- (void)setRightBarButtonWithTitle:(NSString *)title withBlock:(TouchedBlock)block;
- (void)setRightBarButtonWithTitle:(NSString *)title titleColor:(UIColor *)color withBlock:(TouchedBlock)block;
- (void)setRightBarButtonWithImage:(UIImage *)image withHighlightedImage:(UIImage *)highlightedImage withBlock:(TouchedBlock)block;

- (void)backAction;
- (void)showTabBar;
- (void)hideTabBar;
- (void)rightSwipeGestureAction;
- (void)navigationBarAction;

@end
