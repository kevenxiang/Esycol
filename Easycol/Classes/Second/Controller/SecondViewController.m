//
//  SecondViewController.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "SecondViewController.h"
#import "YYKit.h"
#import "FoodCell.h"

@interface SecondViewController () <UITableViewDelegate, UITableViewDataSource, FoodCellDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *layouts;

@end

@implementation SecondViewController

- (instancetype)init {
    self = [super init];
    _tableView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _layouts = [NSMutableArray new];
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.frame = self.view.bounds;
    _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    _tableView.scrollIndicatorInsets = _tableView.contentInset;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
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
    [_layouts addObjectsFromArray:_layouts];
    [_layouts addObjectsFromArray:_layouts];
    [_layouts addObjectsFromArray:_layouts];
    [_layouts addObjectsFromArray:_layouts];
    
    kAdjustsTableViewHasTabBar(_tableView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

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

#pragma mark - FoodCellDelegate
- (void)foodCellDidClick:(FoodCell *)cell {
    FoodModel *model = cell.model;
    NSLog(@"点击了标题:%@", model.title);
}

@end
