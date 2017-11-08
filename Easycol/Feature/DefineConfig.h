//
//  DefineConfig.h
//  KouDaiDuoBao
//
//  Created by 向琼 on 16/3/30.
//  Copyright © 2016年 CitiesTechnology. All rights reserved.
//

#ifndef DefineConfig_h
#define DefineConfig_h

#define kAppName                    [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleNameKey]
#define kAppVersion                 [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAppBuildVersion            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]

#define kScreenBounds               [[UIScreen mainScreen] bounds]
#define kScreenWidth                kScreenBounds.size.width
#define kScreenHeight               kScreenBounds.size.height
#define kStatusBarHeight            ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define kNavHeight                  (([[UIApplication sharedApplication] statusBarFrame].size.height + self.navigationController.navigationBar.frame.size.height))
#define kTabBarAllHeight            ((kStatusBarHeight >= 44.0f) ? (83.0f) : (49.0f))
#define kHomeIndicatorHeight        ((kStatusBarHeight >= 44.0f) ? (34.0f) : (0.0f))

#define kAdjustsTableViewHasTabBar(mTableView) \
if (@available(iOS 11.0, *)) {  \
   mTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
   mTableView.contentInset = UIEdgeInsetsMake(kNavHeight, 0, kTabBarAllHeight, 0);\
   mTableView.scrollIndicatorInsets = mTableView.contentInset;   \
} else { \
   mTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - kTabBarAllHeight); \
}

#define kAdjustsTableViewNoTabBar(mTableView) \
if (@available(iOS 11.0, *)) {  \
    mTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
    mTableView.frame = CGRectMake(0, kNavHeight, self.view.frame.size.width, self.view.frame.size.height - kHomeIndicatorHeight - kNavHeight); \
} else { \
    mTableView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height); \
}

#define kAppDelegate                ((AppDelegate *)[[UIApplication sharedApplication] delegate])

#ifdef DEBUG
#define DLog(fmt, ...)              NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define DLog(...)
#endif

#define kSystemVersion              [[[UIDevice currentDevice] systemVersion] floatValue]
#define kIOS7OrLater                (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) ? YES : NO)
#define kIOS8OrLater                (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) ? YES : NO)
#define kIOS11OrLater     (([[[UIDevice currentDevice] systemVersion] floatValue] >= 11.0) ? YES : NO)

#ifndef kiOS9Later
#define kiOS9Later (kSystemVersion >= 9)
#endif

#define kUSER_DEFAULT               [NSUserDefaults standardUserDefaults]

#define kWEAKSELF                   __weak __typeof(self) weakSelf = self

#pragma mark - color functions

#define kRGBCOLOR(r,g,b)            [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define kRGBACOLOR(r,g,b,a)         [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]
#define kUIColorFromRGB(rgbValue)   [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)


#define kIPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//以下是Category的内置成员变量方法
#define CATEGORY_PROPERTY_GET(type, property) - (type) property { return objc_getAssociatedObject(self, @selector(property)); }
#define CATEGORY_PROPERTY_SET(type, property, setter) - (void) setter (type) property { objc_setAssociatedObject(self, @selector(property), property, OBJC_ASSOCIATION_RETAIN_NONATOMIC); }
#define CATEGORY_PROPERTY_GET_SET(type, property, setter) CATEGORY_PROPERTY_GET(type, property) CATEGORY_PROPERTY_SET(type, property, setter)

#define CATEGORY_PROPERTY_GET_NSNUMBER_PRIMITIVE(type, property, valueSelector) - (type) property { return [objc_getAssociatedObject(self, @selector(property)) valueSelector]; }
#define CATEGORY_PROPERTY_SET_NSNUMBER_PRIMITIVE(type, property, setter, numberSelector) - (void) setter (type) property { objc_setAssociatedObject(self, @selector(property), [NSNumber numberSelector: property], OBJC_ASSOCIATION_RETAIN_NONATOMIC); }

#define CATEGORY_PROPERTY_GET_UINT(property) CATEGORY_PROPERTY_GET_NSNUMBER_PRIMITIVE(unsigned int, property, unsignedIntValue)
#define CATEGORY_PROPERTY_SET_UINT(property, setter) CATEGORY_PROPERTY_SET_NSNUMBER_PRIMITIVE(unsigned int, property, setter, numberWithUnsignedInt)
#define CATEGORY_PROPERTY_GET_SET_UINT(property, setter) CATEGORY_PROPERTY_GET_UINT(property) CATEGORY_PROPERTY_SET_UINT(property, setter)

#define CATEGORY_PROPERTY_GET_INT(type, property) CATEGORY_PROPERTY_GET_NSNUMBER_PRIMITIVE(type, property, intValue)
#define CATEGORY_PROPERTY_SET_INT(type, property, setter) CATEGORY_PROPERTY_SET_NSNUMBER_PRIMITIVE(type, property, setter, numberWithInt)
#define CATEGORY_PROPERTY_GET_SET_INT(type, property, setter) CATEGORY_PROPERTY_GET_INT(type, property) CATEGORY_PROPERTY_SET_INT(type, property, setter)

#define CATEGORY_PROPERTY_GET_BOOL(type, property) CATEGORY_PROPERTY_GET_NSNUMBER_PRIMITIVE(type, property, boolValue)
#define CATEGORY_PROPERTY_SET_BOOL(type, property, setter) CATEGORY_PROPERTY_SET_NSNUMBER_PRIMITIVE(type, property, setter, numberWithBool)
#define CATEGORY_PROPERTY_GET_SET_BOOL(type, property, setter) CATEGORY_PROPERTY_GET_INT(type, property) CATEGORY_PROPERTY_SET_INT(type, property, setter)


//第一个安装APP的key
#define kFirstKey                                 @"kFirstKey"

#endif /* DefineConfig_h */
