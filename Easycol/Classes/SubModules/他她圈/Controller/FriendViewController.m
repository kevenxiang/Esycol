//
//  FriendViewController.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "FriendViewController.h"
#import "FriendImagesCell.h"
#import "TopTitleBottomImageCell.h"

@interface FriendViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row % 2 == 0) {
        return 300.0f;
    }
    
    return 166.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        
        static NSString *CellID = @"CellID";
        FriendImagesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
        if (cell == nil) {
            cell = [[FriendImagesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID];
        }
        
        cell.headImgV.image = [UIImage imageNamed:@"testimg"];
        cell.nickLab.text = @"上山打老虎";
        cell.contentLab.text = @"哈哈，发表了一个说说";
        [cell setImgsData:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7"]];
        
        return cell;
        
    } else {
        static NSString *ImageCellId = @"ImageCellId";
        TopTitleBottomImageCell *cell = [tableView dequeueReusableCellWithIdentifier:ImageCellId];
        if (cell == nil) {
            cell = [[TopTitleBottomImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ImageCellId];
        }
        
        cell.imgV_1.image = [UIImage imageNamed:@"testimg"];
        cell.imgV_2.image = [UIImage imageNamed:@"testimg"];
        cell.imgV_3.image = [UIImage imageNamed:@"testimg"];
        
        cell.titleLab.text = @"标题";
        cell.authorLab.text = @"来源：互联网";
        cell.timeLab.text = @"2017-11-12";
        
        return cell;
        
    }
    
    return nil;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
}


@end
