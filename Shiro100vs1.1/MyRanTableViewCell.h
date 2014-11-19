//
//  MyRanTableViewCell.h
//  Shiro100vs
//
//  Created by 寺内 信夫 on 2014/11/17.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyRanTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imageView_Shiro;
@property (weak, nonatomic) IBOutlet UIImageView *imageView_My_1;

@property (weak, nonatomic) IBOutlet UILabel *label_Gekokyu_1;

@property (weak, nonatomic) IBOutlet UILabel *label_Rank;
@property (weak, nonatomic) IBOutlet UILabel *label_Shiro;
@property (weak, nonatomic) IBOutlet UILabel *label_Comment;

@property (weak, nonatomic) IBOutlet UILabel *label_Ato;

@property (weak, nonatomic) IBOutlet UILabel *label_Gekokyu_2;

@property (weak, nonatomic) IBOutlet UIImageView *imageView_My_2;

@end
