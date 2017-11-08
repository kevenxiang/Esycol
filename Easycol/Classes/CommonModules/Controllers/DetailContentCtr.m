//
//  DetailContentCtr.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "DetailContentCtr.h"
#import "ContentTitleCell.h"
#import "ContentTextCell.h"
#import "ContentImageCell.h"
#import "AdCell.h"

@interface DetailContentCtr () <UITableViewDelegate, UITableViewDataSource>
{
    UITableView *mTableView;
}

@end

@implementation DetailContentCtr

#pragma mark - life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self initUI];
    
    kAdjustsTableViewNoTabBar(mTableView);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    }
    return 10.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    UIView *tView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 10)];
    tView.backgroundColor = [UIColor clearColor];
    return tView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 72.0f;
        } else if (indexPath.row == 1) {
            return 40.0f;
        } else if (indexPath.row == 2) {
            return 200.0f;
        }
    }
    
    return 86.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        //标题
        if (indexPath.row == 0) {
            static NSString *ContentTitleCellID = @"ContentTitleCell";
            ContentTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:ContentTitleCellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ContentTitleCell" owner:nil options:nil] lastObject];
            }
            return cell;
            
        } else if (indexPath.row == 1) { //内容
            static NSString *ContentTextCellID = @"ContentTextCellID";
            ContentTextCell *cell = [tableView dequeueReusableCellWithIdentifier:ContentTextCellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ContentTextCell" owner:nil options:nil] lastObject];
            }
            return cell;
        } else if (indexPath.row == 2) { //图片
            static NSString *ContentImageCellID = @"ContentImageCellID";
            ContentImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ContentImageCellID];
            if (cell == nil) {
                cell = [[[NSBundle mainBundle] loadNibNamed:@"ContentImageCell" owner:nil options:nil] lastObject];
            }
            return cell;
        }
    }
    
    
    if (indexPath.section == 1) {
        static NSString *AdCellID = @"AdCellID";
        AdCell *cell = [tableView dequeueReusableCellWithIdentifier:AdCellID];
        if (cell == nil) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"AdCell" owner:nil options:nil] lastObject];
        }
        return cell;
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - gettings and settings
- (void)initUI {
    if (!mTableView) {
        mTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStylePlain];
        mTableView.backgroundColor = [UIColor clearColor];
        mTableView.backgroundView.backgroundColor = [UIColor clearColor];
        mTableView.delegate = self;
        mTableView.dataSource = self;
        mTableView.separatorColor = [UIColor clearColor];
        mTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:mTableView];
    }
}

@end
