//
//  RankingViewController.m
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "RankingViewController.h"

#import "AppDelegate.h"
#import "RankingTableViewCell.h"

@interface RankingViewController ()
{

@private

	AppDelegate *app;

	NSArray *array_Data;

	BOOL bool_Error;
	
}

@end

@implementation RankingViewController

- (void)viewDidLoad
{

	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

	app = [[UIApplication sharedApplication] delegate];

	//tableviewのデリゲート、データソースを自分自身にする
	self.tableView.delegate   = self;
	self.tableView.dataSource = self;
	
	app.bool_Ranking = YES;
	bool_Error = NO;
	
}

- (void)viewWillAppear: (BOOL)animated
{

	if ( app.bool_Ranking ) {
		
		//城の情報の配列を格納(配列の順番は、番号が大きくなるたびにランクが下がるようになっている)
		array_Data = [self serverdata: @"http://smartshinobu.miraiserver.com/shiro/shirorank.php"];

		[self.tableView reloadData];
	
		if ( bool_Error == YES ) {
			
			app.bool_Ranking = YES;
			
		} else {
			
			app.bool_Ranking = NO;

		}
		
	}
	
}

- (void)viewDidAppear: (BOOL)animated
{
	
}

- (void)viewWillDisappear: (BOOL)animated
{
	
}

- (void)viewDidDisappear: (BOOL)animated
{
	
}

- (void)didReceiveMemoryWarning
{

	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.

}

//テーブルのセルの数を返すためのメソッド
- (NSInteger)tableView: (UITableView *)tableView
 numberOfRowsInSection: (NSInteger)section
{

	return array_Data.count;

}

//テーブルのセクションの数を返すためのメソッド
- (NSInteger)numberOfSectionsInTableView: (UITableView *)tableView
{

	return 1;

}

//テーブルのセルの内容を返すメソッド
- (UITableViewCell *)tableView: (UITableView *)tableView
		 cellForRowAtIndexPath: (NSIndexPath *)indexPath
{

	//samplecellという印がついた再利用可能なセルを格納
	RankingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"Shiro_Ranking"];
	
	//セルが再利用できないかどうか
	if ( ! cell ) {

//		NSLog( @"新規作成" );
		cell = [[RankingTableViewCell alloc] initWithStyle: UITableViewCellStyleDefault
										   reuseIdentifier: @"Shiro_Ranking"];
	
	}
	
	//array_Dataの[indexpath.row]番目の要素((indexpath.row+1)位の城に関する情報)を格納
	NSDictionary *dic = array_Data[indexPath.row];
	
	//ranklabelを「(indexPath.row+1)位」表示するに設定
	cell.label_Rank.text = [NSString stringWithFormat: @"第%d位", (int)(indexPath.row + 1)];
	
	//shirolabelを城の名前を表示するように設定
	cell.label_Shiro.text = [dic objectForKey: @"shironame"];
	//タグの投稿数の文字列を格納
	
	NSString *tagcount = [dic objectForKey: @"tagcount"];
	//ブロックに関する文字列を格納
	NSString *block = [dic objectForKey: @"block"];
	
	//taglabelをブロックとタグの投稿数を表示するように設定
	cell.label_Comment.text = [NSString stringWithFormat: @"ブロック:%@ タグの投稿数:%@", block, tagcount];
	
	return cell;

}

- (CGFloat)   tableView: (UITableView *)tableView
heightForRowAtIndexPath: (NSIndexPath *)indexPath
{
	
	return 112;
	
}

//JSONのデータをarray型で返すメソッド
- (NSArray *)JSONArrayData: (NSString *)url
{

	//NSErrorの初期化
	NSError *err = nil;

	//url先にあるデータをNSDataとして格納
	NSData *data = [self webdata: url];
	//dataを元にJSONオブジェクトを生成
	
	NSArray *_array = [NSJSONSerialization JSONObjectWithData: data
													 options: NSJSONReadingMutableContainers
													   error: &err];
	
	if ( err ) {
		
//		NSLog( @"%@", err );
		
		[self setAlertTitle: @"エラー"
					message: @"サーバーにつながっていません！！"];
		
		bool_Error = YES;
		
	}
	
	//値を返す
	return _array;

}

//url先にあるデータを返すメソッド
- (NSData *)webdata: (NSString *)url
{

	//URLを生成
	NSURL *dataurl = [NSURL URLWithString: url];

	//リクエスト生成
	NSURLRequest *request = [NSURLRequest requestWithURL: dataurl
											 cachePolicy: NSURLRequestUseProtocolCachePolicy
										 timeoutInterval: 10];

	//レスポンスを生成
	NSHTTPURLResponse *response;
	//NSErrorの初期化
	NSError *err = nil;
	
	//requestによって返ってきたデータを生成
	NSData *data = [NSURLConnection sendSynchronousRequest: request
										 returningResponse: &response
													 error: &err];
	
	if ( err ) {
		
//		NSLog( @"%@", err );
		
		[self setAlertTitle: @"エラー"
					message: @"サーバーにつながっていません！！"];
		
		bool_Error = YES;
		
	}
	
	//値を返す
	return data;

}

//JSONのデータをNSDictionary型で返すメソッド
- (NSDictionary *)JSONDictinaryData: (NSString *)url
{

	//NSErrorの初期化
	NSError *err = nil;
	//url先にあるデータをNSDataとして格納
	NSData *data = [self webdata:url];
	
	//dataを元にJSONオブジェクトを生成
	NSDictionary *dic = [NSJSONSerialization JSONObjectWithData: data
														options: NSJSONReadingMutableContainers
														  error: &err];
	
	if ( err ) {
		
//		NSLog( @"%@", err );
		
		[self setAlertTitle: @"エラー"
					message: @"サーバーにつながっていません！！"];
		
		bool_Error = YES;
		
	}
	
	//値を返す
	return dic;
	
}

//url先にある画像のデータを返すメソッド
- (UIImage *)WebImage: (NSString *)url
{

	//url先にあるデータをNSDataとして格納
	NSData *data = [self webdata: url];

	//dataを元にUIImageを生成
	UIImage *img = [UIImage imageWithData: data];
	
	//値を返す
	return img;

}

- (NSArray *)serverdata: (NSString *)url
{
	
	//requestによって返ってきたデータを生成
	NSData *data = [self webdata: url];
	
	//データを元に文字列を生成
	NSString *str = [[NSString alloc] initWithData: data
										  encoding: NSUTF8StringEncoding];
	
	//余計な文字列を削除
	str = [str stringByReplacingOccurrencesOfString:
		   @"<!--/* Miraiserver \"NO ADD\" http://www.miraiserver.com */-->" withString: @""];
	str = [str stringByReplacingOccurrencesOfString:
		   @"<script type=\"text/javascript\" src=\"http://17787372.ranking.fc2.com/analyze.js\" charset=\"utf-8\"></script>" withString:@""];
	
	//NSErrorの初期化
	NSError *err = nil;
	//strをNSData型の変数に変換
	NSData *trimdata = [str dataUsingEncoding: NSUTF8StringEncoding];
	
	//dataを元にJSONオブジェクトを生成
	NSArray *_array = [NSJSONSerialization JSONObjectWithData: trimdata
													  options: NSJSONReadingMutableContainers
														error: &err];
	
	if ( err ) {
		
//		NSLog( @"%@", err );
		
		[self setAlertTitle: @"エラー"
					message: @"サーバーにつながっていません！！"];
		
		bool_Error = YES;
		
	}

	//値を返す
	return _array;

}

- (void)setAlertTitle: (NSString *)title
			  message: (NSString *)message
{
	
	Class class = NSClassFromString( @"UIAlertController" );
	
	if ( class ) {
		// iOS 8の時の処理
		// UIAlertControllerを使ってアラートを表示
		UIAlertController *alert = [UIAlertController alertControllerWithTitle: title
																	   message: message
																preferredStyle: UIAlertControllerStyleAlert];
		
		[alert addAction: [UIAlertAction actionWithTitle: @"OK"
												   style: UIAlertActionStyleDefault
												 handler: nil]];
		
		[self presentViewController: alert animated: YES completion: nil];
		
	} else {
		// iOS 7の時の処理
		// UIAlertViewを使ってアラートを表示
		UIAlertView *alert = [[UIAlertView alloc] initWithTitle: title
														message: message
													   delegate: nil
											  cancelButtonTitle: nil
											  otherButtonTitles: @"OK", nil];
		
		[alert show];
		
	}
	
}

@end
