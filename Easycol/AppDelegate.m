//
//  AppDelegate.m
//  Easycol
//
//  Created by keven kenv on 2017/11/6.
//  Copyright © 2017年 keven kenv. All rights reserved.
//

#import "AppDelegate.h"

//控制器
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourViewController.h"
#import "FiveViewController.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setNavStyle];
//    [self initDbFile];
    
    
    [self showMainController];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - gettings and settings
- (void)setNavStyle {
    [[UINavigationBar appearance] setBarStyle:UIBarStyleDefault];
    [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor magentaColor],NSForegroundColorAttributeName, [UIFont systemFontOfSize:17], NSFontAttributeName, nil]];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)showMainController {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    FirstViewController *first = [[FirstViewController alloc] init];
    UINavigationController *firstNav = [[UINavigationController alloc] initWithRootViewController:first];
    
    SecondViewController *second = [[SecondViewController alloc] init];
    UINavigationController *secondNav = [[UINavigationController alloc] initWithRootViewController:second];
    
    ThirdViewController *third = [[ThirdViewController alloc] init];
    UINavigationController *thirdNav = [[UINavigationController alloc] initWithRootViewController:third];
    
    FourViewController *four = [[FourViewController alloc] init];
    UINavigationController *fourNav = [[UINavigationController alloc] initWithRootViewController:four];
    
    FiveViewController *five = [[FiveViewController alloc] init];
    UINavigationController *fiveNav = [[UINavigationController alloc] initWithRootViewController:five];
    
    _tabBarController = [[CYLTabBarController alloc] init];
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"first",
                            CYLTabBarItemSelectedImage : @"first-1"
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"男生",
                            CYLTabBarItemImage : @"second",
                            CYLTabBarItemSelectedImage : @"second-1"
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"女生",
                            CYLTabBarItemImage : @"third",
                            CYLTabBarItemSelectedImage : @"third-1"
                            };
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"他她圈",
                            CYLTabBarItemImage : @"four",
                            CYLTabBarItemSelectedImage : @"four-1"
                            };
    NSDictionary *dict5 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"five",
                            CYLTabBarItemSelectedImage : @"five-1"
                            };
    NSArray *tabBarItemsAttributes = @[
                                       dict1,
                                       dict2,
                                       dict3,
                                       dict4,
                                       dict5,
                                       ];
    _tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    _tabBarController.delegate = (id<UITabBarControllerDelegate>) self;
    _tabBarController.tabBar.tintColor = [UIColor magentaColor];
    
    [_tabBarController setViewControllers:@[
                                            firstNav,
                                            secondNav,
                                            thirdNav,
                                            fourNav,
                                            fiveNav,
                                            ]];
    self.window.rootViewController = _tabBarController;
    
    [self.window makeKeyAndVisible];
}

- (void)initDbFile {
    NSString *dbPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/DB"];
    NSString *dbFilePath = [NSString stringWithFormat:@"%@/db.db", dbPath];
    [DBService shareInstance].dbPath = dbFilePath;
    [DBService shareInstance].dbPathUpdate = YES;
    NSLog(@"用户数据库路径:%@", dbFilePath);
    
    BOOL isDir;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL exit = [fileManager fileExistsAtPath:dbPath isDirectory:&isDir];
    if (!exit || !isDir) {
        [fileManager createDirectoryAtPath:dbPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
 
}


@end
