//
//  TabBarController.m
//  Shiro100vs
//
//  Created by 寺内 信夫 on 2014/11/17.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "TabBarController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad
{

	[super viewDidLoad];
    // Do any additional setup after loading the view.

	self.delegate = self;
	
	self.audioPlayer = [[AudioPlayer alloc] init];
	
}

- (void)didReceiveMemoryWarning
{

	[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)tabBarController: (UITabBarController *)tabBarController
 didSelectViewController: (UIViewController *)viewController
{

	[self.audioPlayer koukaon];
	
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
