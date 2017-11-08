//
//  Http.m
//  GeYou
//
//  Created by 向琼 on 2017/10/12.
//  Copyright © 2017年 geyou. All rights reserved.
//

#import "Http.h"

@implementation Http

+ (Http *)instance {
    static Http *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

@end
