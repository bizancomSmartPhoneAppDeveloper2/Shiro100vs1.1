//
//  CameraViewController.m
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "CameraViewController.h"

#import "AppDelegate.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface CameraViewController ()
{

@private
	
	AppDelegate *app;
	
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (retain, nonatomic) UIDocumentInteractionController *dic;

@end

@implementation CameraViewController

// カメラの初期化
- (void)viewDidLoad
{

	[super viewDidLoad];
    // Do any additional setup after loading the view.

	app = [[UIApplication sharedApplication] delegate];

	[self.imageView setAutoresizingMask: UIViewAutoresizingFlexibleHeight];
	[self.imageView      setContentMode: UIViewContentModeScaleAspectFit];
	
	[NSTimer scheduledTimerWithTimeInterval: 0.1f
									 target: self
								   selector: @selector( button_Camera_Action: )
								   userInfo: nil
									repeats: NO];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.

}

- (void)viewWillAppear:(BOOL)animated
{
	
}

- (void)viewDidAppear:(BOOL)animated
{

}

- (void)viewWillDisappear:(BOOL)animated
{
	
}

- (void)viewDidDisappear:(BOOL)animated
{
	
}

- (IBAction)button_Camera_Action:(id)sender
{
	
	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	
	picker.delegate = self;
	
	// カメラが行けるか調査
	if ( [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera] ) {
		
		picker.sourceType    = UIImagePickerControllerSourceTypeCamera;
		picker.allowsEditing = YES;
		
		[self presentViewController: picker animated: YES completion: nil];

	} else {
		
		[self setAlertTitle: @"エラー"
					message: @"カメラが使えません !!"];
		
	}
	
}

- (IBAction)button_Regist_Action:(id)sender
{

	UIImagePickerController *picker = [[UIImagePickerController alloc] init];
	
	picker.delegate = self;
	
	// 写真ライブラリが行けるか調査
	if ( [UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary] ) {
		
		picker.sourceType    = UIImagePickerControllerSourceTypePhotoLibrary;
		picker.allowsEditing = YES;
		
		[self presentViewController: picker animated: YES completion: nil];

	}
	
}

- (void)imagePickerController: (UIImagePickerController *)picker
didFinishPickingMediaWithInfo: (NSDictionary *)info
{
	
	self.imageView.image = [info objectForKey: UIImagePickerControllerEditedImage];

	if ( self.imageView.image == nil ) {
	
		self.imageView.image = [info objectForKey: UIImagePickerControllerOriginalImage];
	
	}

	if ( [picker sourceType] == UIImagePickerControllerSourceTypeCamera ) {
		
		// imageをLibraryに保存
		ALAssetsLibrary *lib = [[ALAssetsLibrary alloc] init];
		
		[lib writeImageToSavedPhotosAlbum: self.imageView.image.CGImage
								 metadata: nil
						  completionBlock: ^( NSURL* url, NSError* error ) {
							  
//							  NSLog( @"Saved: %@<%@>", url, error );
							  
						  }];

	}
	
	[picker dismissViewControllerAnimated: YES completion: nil];
	
	[self performSelector: @selector( shareInstagram ) withObject: self afterDelay: 1.0f];
	
}

- (void)imagePickerControllerDidCancel: (UIImagePickerController *)picker
{
	
	[picker dismissViewControllerAnimated: YES completion: nil];
	
}

- (void)shareInstagram
{
	
	UIImage *image = self.imageView.image;
	
	NSURL *instagramURL = [NSURL URLWithString: @"instagram://app"];
	
	if ( ! [[UIApplication sharedApplication] canOpenURL: instagramURL] ) {
		
		[self setAlertTitle: @"致命的なエラー"
					message: @"Instagram が\nインストールされていない !!"];
		
		return;
		
	}
	
	NSString *filePath = [NSHomeDirectory() stringByAppendingPathComponent: @"Documents/image.igo"];
	
	NSURL *fileURL = [NSURL fileURLWithPath: filePath];
	
	[UIImagePNGRepresentation(image) writeToFile: filePath atomically: YES];
	
	self.dic = [UIDocumentInteractionController interactionControllerWithURL: fileURL];

	NSString *caption  = [NSString stringWithFormat: @"#%@", app.string_Shikan];
	
	self.dic.annotation = [NSDictionary dictionaryWithObject: caption
													  forKey: @"InstagramCaption"];
	
	self.dic.delegate = self;
	
	BOOL present = [self.dic presentOpenInMenuFromRect: self.view.frame
												inView: self.view
											  animated: YES];
	
	if ( ! present ) {
		
		[self setAlertTitle: @"エラー"
					message: @"このファイルを開ける\nアプリが存在しない。"];

	}
	
}

- (UIDocumentInteractionController *)setupControllerWithURL: (NSURL *)fileURL
											  usingDelegate: (id < UIDocumentInteractionControllerDelegate >)interactionDelegate
{
	
	UIDocumentInteractionController *interactionController;
	
	interactionController = [UIDocumentInteractionController interactionControllerWithURL: fileURL];
	
	interactionController.delegate = interactionDelegate;
	
	return interactionController;
	
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
