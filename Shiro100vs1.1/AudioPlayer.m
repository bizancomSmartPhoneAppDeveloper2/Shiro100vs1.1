//
//  AudioPlayer.m
//  Shiro100vs
//
//  Created by 寺内 信夫 on 2014/11/17.
//  Copyright (c) 2014年 寺内 信夫. All rights reserved.
//

#import "AudioPlayer.h"

#import <AVFoundation/AVFoundation.h>

@interface AudioPlayer ()
{
	
@private
	
	AVAudioPlayer *audio,*kouka;
	
}

@end

@implementation AudioPlayer

- (void)koukaon
{

	NSString* kpath = [[NSBundle mainBundle]
					   pathForResource:@"Furinuki" ofType:@"mp3"];
	NSURL* kurl = [NSURL fileURLWithPath:kpath];
	kouka = [[AVAudioPlayer alloc]
			 initWithContentsOfURL:kurl error:nil];
	kouka.numberOfLoops = 0;
	[kouka play];

}

- (void)BGMStart1
{

	NSString* path = [[NSBundle mainBundle]
					  pathForResource:@"Kassen" ofType:@"mp3"];
	NSURL* url = [NSURL fileURLWithPath:path];
	audio = [[AVAudioPlayer alloc]
			 initWithContentsOfURL:url error:nil];
	audio.numberOfLoops = -1;
	[audio play];

}

- (void)BGMStart2
{
	
	NSString* path = [[NSBundle mainBundle]
					  pathForResource:@"Tuisou" ofType:@"mp3"];
	NSURL* url = [NSURL fileURLWithPath:path];
	audio = [[AVAudioPlayer alloc]
			 initWithContentsOfURL:url error:nil];
	audio.numberOfLoops = -1;
	[audio play];
	
}

- (void)BGMStart3
{
	
	NSString* path = [[NSBundle mainBundle]
					  pathForResource:@"Tenkaiti" ofType:@"mp3"];
	NSURL* url = [NSURL fileURLWithPath:path];
	audio = [[AVAudioPlayer alloc]
			 initWithContentsOfURL:url error:nil];
	audio.numberOfLoops = -1;
	[audio play];
	
}

- (void)BGMStop
{

	[audio stop];

}

@end
