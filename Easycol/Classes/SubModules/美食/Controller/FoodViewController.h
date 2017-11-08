//
//  FoodViewController.h
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "BaseViewController.h"
#import "FoodCell.h"

@protocol FoodViewControllerDelegate <NSObject>

- (void)itemSelected:(FoodCell *)cell;

@end

@interface FoodViewController : BaseViewController

@property (nonatomic, assign) id <FoodViewControllerDelegate> delegate;

@end
