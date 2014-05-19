//
//  DetailViewController.m
//  MyRadio
//
//  Created by Cuong Pham on 5/17/14.
//  Copyright (c) 2014 SSS. All rights reserved.
//

#import "DetailViewController.h"



@interface DetailViewController ()

@end

@implementation DetailViewController{
    NSString *status;
}

@synthesize disc;
@synthesize audioPlayer;
@synthesize playPause;
@synthesize stream_url;
@synthesize audioRecorder;

-(void) viewWillAppear:(BOOL)animated {
    
    self.navigationItem.title = [NSString stringWithFormat:@"My Radio - %@", self.channel];
    
    [self.navigationController.navigationBar
                            setBackgroundImage:[UIImage imageNamed:@"topHeader.png"]
                            forBarPosition:UIBarPositionAny
                            barMetrics:UIBarMetricsDefault];
    
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    self.lable_channel_title.text = self.channel_title;
    
    self.lable_channel.text = [NSString stringWithFormat:@"Đài phát thanh %@", self.channel];
    
    self.lable_hour.text = self.channel_hour;
    
    playPause.titleLabel.font = [UIFont systemFontOfSize: 12];
    
}

-(void) viewDidAppear:(BOOL)animated {

}

-(IBAction)playPauseMusic:(id) sender{
    if ([status  isEqual: @"play"]) {
        [audioPlayer pause];
        status = @"pause";
        [playPause setBackgroundImage:[UIImage imageNamed:@"pause.png"] forState:UIControlStateNormal];
    }else{
        [audioPlayer play];
        status = @"play";
        [playPause setBackgroundImage:[UIImage imageNamed:@"play.png"] forState:UIControlStateNormal];
    }

}

-(IBAction)recordMusic:(id)sender{
    if (!audioRecorder.recording) {
        AVAudioSession *session = [AVAudioSession sharedInstance];
        [session setActive:YES error:nil];
        
        // Start recording
        [audioRecorder record];
        
    } else {
        
        // Pause recording
        [audioRecorder pause];
        NSLog(@"End Recording");
    }

}

-(void) viewDidLoad{
    [super viewDidLoad];
    
    NSString *music = [NSString stringWithFormat:@"%@", stream_url];
    
    AVPlayerItem *aPlayerItem = [[AVPlayerItem alloc] initWithURL:[NSURL URLWithString:music]];
    
    //Set Audio Session
    
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    
    NSMutableDictionary *recordSetting = [[NSMutableDictionary alloc] init];
    
    [recordSetting setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
    [recordSetting setValue:[NSNumber numberWithFloat:44100.0] forKey:AVSampleRateKey];
    [recordSetting setValue:[NSNumber numberWithInt: 2] forKey:AVNumberOfChannelsKey];
    
    audioRecorder = [[AVAudioRecorder alloc] initWithURL:[NSURL URLWithString:music] settings:recordSetting error:NULL];
    audioRecorder.delegate = self;
    
    audioRecorder.meteringEnabled = YES;
    [audioRecorder prepareToRecord];
    
    audioPlayer = [[AVPlayer alloc] initWithPlayerItem:aPlayerItem];
    
    [audioPlayer play];
    
    status = @"play";
}

@end
