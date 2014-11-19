//
//  JapanViewController.m
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/04.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "JapanViewController.h"

#import "AppDelegate.h"

@interface JapanViewController ()
{

@private

	AppDelegate *app;
	
	NSInteger integer_BlockNo;
	
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView_Japan;

@property (weak, nonatomic) IBOutlet UIButton *button_Shikan;

@property (weak, nonatomic) IBOutlet UILabel *label_Genzaino;

@property (weak, nonatomic) IBOutlet UILabel *label_Genzai;

@end

@implementation JapanViewController

//位なし
- (void)viewDidLoad
{

	[super viewDidLoad];
    // Do any additional setup after loading the view.

	app = [[UIApplication sharedApplication] delegate];

	[self setGenzai];

}

- (void)didReceiveMemoryWarning
{

	[super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (IBAction)button_Shikan_Action:(id)sender
{

	[self setBlockNo];
	
}

- (void)setBlockNo
{
	
	integer_BlockNo = 0;
	
	NSString *title = @"ブロックを決めて下さい。";
	NSArray *array = [NSArray arrayWithObjects:
					  @"北海道・東北ブロック", @"関東ブロック", @"東海・甲信越ブロック",
					  @"近畿ブロック", @"中国・四国ブッロク", @"九州・沖縄ブロック", nil];
	
	UIAlertController *ac = [UIAlertController alertControllerWithTitle: title
																message: @""
														 preferredStyle: UIAlertControllerStyleActionSheet];
	
	UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"Cancel"
													 style: UIAlertActionStyleCancel
												   handler: ^( UIAlertAction *action )
							 {
								 
							 }];
	
	[ac addAction: cancel];
	
	for ( int i = 0; i < [array count] ; i ++ ) {
		
		UIAlertAction *sub = [UIAlertAction actionWithTitle: array[i]
													  style: UIAlertActionStyleDefault
													handler: ^( UIAlertAction *action )
							  {
								  
								  NSString *string_blockname = action.title;
								  
								  int no = 0;
								  
								  for ( NSString *name in array ) {
									  
									  if ( [name isEqualToString: string_blockname] ) break;
									  
									  no ++;
									  
								  }
								  
								  if ( no > [array count] ) return;
								  
								  integer_BlockNo = no + 1;
								  
								  [self setShiroBlock: integer_BlockNo];
								  
							  }];
		
		[ac addAction: sub];
		
	}
	
	[self presentViewController: ac
					   animated: YES
					 completion: nil];
	
}

- (void)setShiroBlock: (NSInteger)no
{
	
	NSString *title;
	NSArray *array;
	
	switch ( no ) {
			
		case 1:
			
			title = @"北海道・東北ブロック";
			array = [NSArray arrayWithObjects:
					 @"根室半島チャシ跡群（北海道）", @"五稜郭（北海道）", @"松前城（北海道）", @"弘前城（青森県）", @"根城（青森県）",
					 @"盛岡城（岩手県）", @"多賀城（宮城県）", @"仙台城（宮城県）", @"久保田城（秋田城）", @"山形城（山形県）",
					 @"二本松城（福島県）", @"若松城（福島県）", @"白河小峰城（福島県）", nil];
			
			break;
			
		case 2:
			
			title = @"関東ブロック";
			array = [NSArray arrayWithObjects:
					 @"水戸城（茨城県）", @"足利氏館（栃木県）", @"箕輪城（群馬県）", @"金山城（群馬県）", @"鉢形城（埼玉県）",
					 @"川越城（埼玉県）", @"佐倉城（千葉県）", @"江戸城（東京都）", @"八王子城（東京都）", @"小田原城（神奈川県）", nil];
			
			break;
			
		case 3:
			
			title = @"東海・甲信越ブロック";
			array = [NSArray arrayWithObjects:
					 @"武田氏館（山梨県）", @"甲府城（山梨県）", @"松代城（長野県）", @"上田城（長野県）", @"小諸城（長野県）",
					 @"松本城（長野県）", @"高遠城（長野県）", @"新発田城（新潟県）", @"春日山城（新潟県）", @"高岡城（富山県）",
					 @"七尾城（石川県）", @"金沢城（石川県）", @"丸岡城（福井県）", @"一乗谷城（福井県）", @"岩村城（岐阜県）",
					 @"岐阜城（岐阜県）", @"山中城（静岡県）", @"駿府城（静岡県）", @"掛川城（静岡県）", @"犬山城（愛知県）",
					 @"名古屋城（愛知県）", @"岡崎城（愛知県）", @"長篠城（三重県）", @"伊賀上野城（三重県）", @"松坂城（三重県）", nil];
			
			break;
			
		case 4:
			
			title = @"近畿ブロック";
			array = [NSArray arrayWithObjects:
					 @"小谷城（滋賀県）", @"彦根城（滋賀県）", @"安土城（滋賀県）", @"観音寺城（滋賀県）", @"二条城（京都府）",
					 @"大阪城（大阪府）", @"千早城（大阪府）", @"竹田城（兵庫県）", @"篠山城（兵庫県）", @"明石城（兵庫県）",
					 @"姫路城（兵庫県）", @"赤穂城（兵庫県）", @"高取城（奈良県）", @"和歌山城（和歌山県）", nil];
			
			break;
			
		case 5:
			
			title = @"中国・四国ブッロク";
			array = [NSArray arrayWithObjects:
					 @"鳥取城（鳥取県）", @"松江城（島根県）", @"月山富田城（島根県）", @"津和野城（島根県）", @"津山城（岡山県）",
					 @"備中松山城（岡山県）", @"鬼ノ城（岡山県）", @"岡山城（岡山県）", @"福山城（広島県）", @"吉田郡山城（広島県）",
					 @"広島城（広島県）", @"岩国城（山口県）", @"萩城（山口県）", @"徳島城（徳島県）", @"高松城（香川県）",
					 @"丸亀城（香川県）", @"今治城（愛媛県）", @"湯築城（愛媛県）", @"松山城（愛媛県）", @"大洲城（愛媛県）",
					 @"宇和島城（愛媛県）", @"高知城（高知県）", nil];
			
			break;
			
		case 6:
			
			title = @"九州・沖縄ブロック";
			array = [NSArray arrayWithObjects:
					 @"福岡城（福岡県）", @"大野城（福岡県）", @"名護屋城（佐賀県）", @"吉野ヶ里遺跡（佐賀県）", @"佐賀城（佐賀県）",
					 @"平戸城（長崎県）", @"島原城（長崎県）", @"熊本城（熊本県）", @"人吉城（熊本県）", @"大分府内城（大分県）",
					 @"岡城（大分県）", @"飫肥城（宮崎県）", @"鹿児島城（鹿児島県）", @"今帰仁城（沖縄県）", @"中城城（沖縄県）",
					 @"首里城（沖縄県）", nil];
			
			break;
			
		default:
			
			break;
			
	}
	
	UIAlertController *ac = [UIAlertController alertControllerWithTitle: title
																message: @"城の名前を選択して下さい。"
														 preferredStyle: UIAlertControllerStyleActionSheet];
	
	UIAlertAction *cancel = [UIAlertAction actionWithTitle: @"Cancel"
													 style: UIAlertActionStyleCancel
												   handler: ^( UIAlertAction *action )
							 {
								 
							 }];
	
	[ac addAction: cancel];
	
	for ( int i = 0; i < [array count] ; i ++ ) {
		
		UIAlertAction *sub = [UIAlertAction actionWithTitle: array[i]
													  style: UIAlertActionStyleDefault
													handler: ^( UIAlertAction *action )
							  {
								  
								  NSString *shiro = action.title;
								  
								  int j;
								  
								  for ( j = 0; j < [title length]; j ++ ) {
									  
									  NSString *kanji = [shiro substringWithRange: NSMakeRange( j, 1 ) ];
									  
									  if ( [kanji isEqualToString: @"（"] ) break;
									  
								  }
								  
								  if ( j >= [shiro length] ) return;
								  
								  shiro = [shiro substringToIndex: j];

								  app.string_Shikan = shiro;

								  [app setString_Shikan: app.string_Shikan];
								  
								  [app setShiroData];
								  [app setShiroBool];
								  
								  [self setGenzai];
								  
							  }];
		
		[ac addAction: sub];
		
	}
	
	[self presentViewController: ac
					   animated: YES
					 completion: nil];
	
}

- (void)setGenzai
{
	
	self.label_Genzai.text = [NSString stringWithFormat:
							  @"現在の状況\n%@\nに仕官している。", app.string_Shikan];

}

@end
