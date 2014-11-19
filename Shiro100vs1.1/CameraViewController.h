//
//  CameraViewController.h
//  Shiro_100
//
//  Created by 寺内 信夫 on 2014/11/02.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController < UIImagePickerControllerDelegate, UIDocumentInteractionControllerDelegate >

- (void)setAlertTitle: (NSString *)title
			  message: (NSString *)message;

@end
