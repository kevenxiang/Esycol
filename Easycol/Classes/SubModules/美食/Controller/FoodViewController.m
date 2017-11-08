//
//  FoodViewController.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "FoodViewController.h"
#import "LeftImageRightTitleCell.h"
#import "TopTitleBottomImageCell.h"
#import "TitleCell.h"

@interface FoodViewController () <UITableViewDelegate, UITableViewDataSource, FoodCellDelegate>
{
    
}

@property (nonatomic, strong) UITableView *mTableView;
@property (nonatomic, strong) NSMutableArray *layouts;

@end

@implementation FoodViewController

#pragma mark - life cycle
- (instancetype)init {
    self = [super init];
    _mTableView = [UITableView new];
    _mTableView.delegate = self;
    _mTableView.dataSource = self;
    _layouts = [NSMutableArray new];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self initMainUI];
    
    //适配table
    [self adjustTableView];
    
    
    _mTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [_mTableView.mj_header endRefreshing];
    }];
    
    _mTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [_mTableView.mj_footer endRefreshing];
    }];
    
    FoodModel *model = [[FoodModel alloc] init];
    model.title = @"沙特之困：油价低迷失业严重出兵也门月费7亿";
    model.time = @"2017-11-12";
    model.author = @"来源：互联网";
    model.imgs = @[@"testimg",@"testimg",@"testimg"];
    
    FoodModel *model1 = [[FoodModel alloc] init];
    model1.title = @"深入理解Java中的容器";
    model1.time = @"2017-11-12";
    model1.author = @"来源：互联网";
    model1.imgs = @[@"testimg",@"testimg",@"testimg"];
    
    FoodStatusLayout *layout1 = [[FoodStatusLayout alloc] initWithStatus:model style:FoodLayoutStyleTitle];
    [_layouts addObject:layout1];
    
    FoodStatusLayout *layout2 = [[FoodStatusLayout alloc] initWithStatus:model1 style:FoodLayoutStyleTitleAndImage];
    [_layouts addObject:layout2];
    
    FoodStatusLayout *layout3 = [[FoodStatusLayout alloc] initWithStatus:model style:FoodLayoutStyleMultiImages];
    [_layouts addObject:layout3];
    
    [_layouts addObjectsFromArray:_layouts];
    [_layouts addObjectsFromArray:_layouts];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _layouts.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ((FoodStatusLayout *)_layouts[indexPath.row]).height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cell";
    FoodCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[FoodCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.delegate = self;
    }
    [cell setLayout:_layouts[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - FoodCellDelegate
- (void)foodCellDidClick:(FoodCell *)cell {
    if (self.delegate && [self.delegate respondsToSelector:@selector(itemSelected:)]) {
        [self.delegate itemSelected:cell];
    }
}

#pragma mark - private methods
- (void)adjustTableView {
    if (@available(iOS 11.0, *)) {
        _mTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        if (kHomeIndicatorHeight == 34.0f) {
            _mTableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarAllHeight + 36 + 88, 0);
        } else {
            _mTableView.contentInset = UIEdgeInsetsMake(0, 0, kTabBarAllHeight + 36 + 64, 0);
        }
        _mTableView.scrollIndicatorInsets = _mTableView.contentInset;
    } else {
        _mTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kTabBarAllHeight - 36 - 64);
    }
}

#pragma mark - gettings and settings
- (void)initMainUI {
    _mTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _mTableView.backgroundColor = [UIColor clearColor];
    _mTableView.backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_mTableView];
}

@end
