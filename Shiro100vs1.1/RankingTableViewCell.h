//
//  RankingTableViewCell.h
//  Shiro_100vs
//
//  Created by 寺内 信夫 on 2014/11/13.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RankingTableViewCell : UITableViewCell

//ランキング何位かを表示するためのラベル
@property (weak, nonatomic) IBOutlet UILabel *label_Rank;
//城の名前を表示するためのラベル
@property (weak, nonatomic) IBOutlet UILabel *label_Shiro;
//タグの投稿数を表示するためのラベル
@property (weak, nonatomic) IBOutlet UILabel *label_Comment;

@end
