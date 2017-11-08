//
//  FirstViewController.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "FirstViewController.h"

#import "NBLScrollTabController.h"

#import "FoodViewController.h"
#import "BeautymakeupCtr.h"
#import "WearViewController.h"
#import "SportViewController.h"
#import "FriendViewController.h"
#import "DetailContentCtr.h"

@interface FirstViewController () <NBLScrollTabControllerDelegate, FoodViewControllerDelegate>

@property (nonatomic, strong) NBLScrollTabController *scrollTabController;
@property (nonatomic, strong) NSArray *viewControllers;

@end

@implementation FirstViewController

#pragma mark - life cycle
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = @"大学生了没";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.scrollTabController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NBLScrollTabControllerDelegate
- (void)tabController:(NBLScrollTabController * __nonnull)tabController didSelectViewController:( UIViewController * __nonnull)viewController {
    //业务逻辑处理
}

#pragma mark - FoodViewControllerDelegate
- (void)itemSelected:(FoodCell *)cell {
    
    FoodModel *model = cell.model;
    NSLog(@"点击了标题:%@", model.title);
    
    DetailContentCtr *detail = [[DetailContentCtr alloc] init];
    detail.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:detail animated:YES];
}

#pragma mark - gettings and settings
- (NBLScrollTabController *)scrollTabController {
    if (!_scrollTabController) {
        _scrollTabController = [[NBLScrollTabController alloc] init];
        _scrollTabController.view.frame = self.view.bounds;
        _scrollTabController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _scrollTabController.delegate = self;
        _scrollTabController.viewControllers = self.viewControllers;
    }
    
    return _scrollTabController;
}


- (NSArray *)viewControllers {
    if (!_viewControllers) {
        FoodViewController *food = [[FoodViewController alloc] init];
        food.delegate = self;
        NBLScrollTabItem *foodItem = [[NBLScrollTabItem alloc] init];
        foodItem.title = @"美食";
        foodItem.hideBadge = YES;//每个title可以做个性化配置
        foodItem.textColor = [UIColor blackColor];
        foodItem.font = [UIFont systemFontOfSize:15];
        food.tabItem = foodItem;
        
        BeautymakeupCtr *beauty = [[BeautymakeupCtr alloc] init];
        NBLScrollTabItem *beautyItem = [[NBLScrollTabItem alloc] init];
        beautyItem.title = @"美妆";
        beautyItem.hideBadge = YES;//每个title可以做个性化配置
        beautyItem.textColor = [UIColor blackColor];
        beautyItem.font = [UIFont systemFontOfSize:15];
        beauty.tabItem = beautyItem;
        
        WearViewController *wear = [[WearViewController alloc] init];
        NBLScrollTabItem *wearItem = [[NBLScrollTabItem alloc] init];
        wearItem.title = @"穿搭";
        wearItem.hideBadge = YES;//每个title可以做个性化配置
        wearItem.textColor = [UIColor blackColor];
        wearItem.font = [UIFont systemFontOfSize:15];
        wear.tabItem = wearItem;
        
        SportViewController *sport = [[SportViewController alloc] init];
        NBLScrollTabItem *sportItem = [[NBLScrollTabItem alloc] init];
        sportItem.title = @"运动";
        sportItem.hideBadge = YES;//每个title可以做个性化配置
        sportItem.textColor = [UIColor blackColor];
        sportItem.font = [UIFont systemFontOfSize:15];
        sport.tabItem = sportItem;
        
        FriendViewController *friend = [[FriendViewController alloc] init];
        NBLScrollTabItem *friendItem = [[NBLScrollTabItem alloc] init];
        friendItem.title = @"他她圈";
        friendItem.hideBadge = YES;//每个title可以做个性化配置
        friendItem.textColor = [UIColor blackColor];
        friendItem.font = [UIFont systemFontOfSize:15];
        friend.tabItem = friendItem;
        
        _viewControllers = @[food, beauty, wear, sport, friend];
        
    }
    
    return _viewControllers;
}


@end
