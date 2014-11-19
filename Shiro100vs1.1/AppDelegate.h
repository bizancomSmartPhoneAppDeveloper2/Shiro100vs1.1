//
//  AppDelegate.h
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property NSString *string_Shikan;

@property BOOL bool_Ranking;
@property BOOL bool_MyRank;

- (void)setShiroData;
- (void)setShiroBool;

@end

