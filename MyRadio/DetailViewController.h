//
//  DetailViewController.h
//  MyRadio
//
//  Created by Cuong Pham on 5/17/14.
//  Copyright (c) 2014 SSS. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <AVFoundation/AVFoundation.h>

@interface DetailViewController : UIViewController <AVAudioPlayerDelegate, AVAudioRecorderDelegate>


@property (strong, nonatomic) NSString *channel_title;

@property (strong, nonatomic) NSString *channel_hour;

@property (strong, nonatomic) NSString *channel;

@property (strong, nonatomic) NSString *stream_url;

@property (weak, nonatomic) IBOutlet UIImageView *disc;

@property (strong, nonatomic) IBOutlet UILabel *lable_channel;

@property (strong, nonatomic) IBOutlet UILabel *lable_hour;

@property (strong, nonatomic) IBOutlet UILabel *lable_channel_title;

@property (strong, nonatomic) IBOutlet UIButton *playPause;

@property (strong, nonatomic) AVPlayer *audioPlayer;

@property (strong, nonatomic) AVAudioRecorder *audioRecorder;

-(IBAction)playPauseMusic:(id)sender;

-(IBAction)recordMusic:(id)sender;

@end
