//
//  AppDelegate.m
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{

	// Override point for customization after application launch.

	[self shiroData];
	
	self.bool_Ranking = self.bool_MyRank = NO;

	return YES;

}

- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)shiroData
{

	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
	
	self.string_Shikan = [ud objectForKey: @"shiro100_shikan"];

//	NSLog( @"1 get %@", self.string_Shikan );
	
	if ( self.string_Shikan == nil ) {
		
		self.string_Shikan = @"徳島城";
		
	}

//	NSLog( @"2 get %@", self.string_Shikan );
	
}

- (void)setShiroData
{
	
	NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
	
	[ud setObject: self.string_Shikan forKey: @"shiro100_shikan"];
	
//	NSLog( @"put %@", self.string_Shikan );
	
}

- (void)setShiroBool
{

	self.bool_Ranking = self.bool_MyRank = YES;
	
}

@end
