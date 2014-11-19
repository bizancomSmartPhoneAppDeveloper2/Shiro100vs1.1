//
//  RankingViewController.h
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingViewController : UITableViewController < UINavigationControllerDelegate, UITableViewDelegate, UITableViewDataSource >

- (NSArray *)JSONArrayData: (NSString *)url;

//url先にあるデータを返すメソッド
- (NSData *)webdata: (NSString *)url;

//JSONのデータをNSDictionary型で返すメソッド
- (NSDictionary *)JSONDictinaryData: (NSString *)url;

//url先にある画像のデータを返すメソッド
- (UIImage *)WebImage: (NSString *)url;

//自分のサーバーにあるJSONデータを返すメソッド
- (NSArray *)serverdata: (NSString *)url;

- (void)setAlertTitle: (NSString *)title
			  message: (NSString *)message;

@end
