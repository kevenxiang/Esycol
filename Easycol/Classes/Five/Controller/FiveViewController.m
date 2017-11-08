//
//  FiveViewController.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "FiveViewController.h"

@interface FiveViewController ()

@end

@implementation FiveViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (int i = 0; i < 9; i++)
    {
        int a = i/4;   //取余
        int b = i%4;   //取整
//        UIButton *tagButton = [[UIButton alloc] initWithFrame:CGRectMake(20+(10+(kScreenWidth-6)/5)*b, 90+(70+10)*a, (kScreenWidth-6)/5, 70)];
         UIButton *tagButton = [[UIButton alloc] initWithFrame:CGRectMake(10+(5+70)*b, 90+(70+2)*a, 70, 66)];
        tagButton.layer.borderWidth = 1;
        tagButton.layer.cornerRadius = 5;
        tagButton.tag = i;
        tagButton.titleLabel.font = [UIFont systemFontOfSize:12];
        [tagButton setTitle:@"XX" forState:UIControlStateNormal];
        [tagButton addTarget:self action:@selector(tagButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tagButton];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
