//
//  TabBarController.h
//  Shiro100vs
//
//  Created by 寺内 信夫 on 2014/11/17.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AudioPlayer.h"

@interface TabBarController : UITabBarController < UITabBarControllerDelegate >

@property AudioPlayer *audioPlayer;

@end

