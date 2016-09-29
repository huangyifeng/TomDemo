//
//  ViewController.m
//  TomDemo
//
//  Created by huang yifeng on 16/9/26.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "ViewController.h"
#import "VoiceListener.h"
#import "VoiceRecorder.h"
#import "VoicePlayer.h"

@interface ViewController ()

//UI
@property(nonatomic, weak)IBOutlet UILabel *valueLabel;

//Model
@property(nonatomic, strong)VoiceListener   *listener;
@property(nonatomic, strong)VoiceRecorder   *recorder;
@property(nonatomic, strong)VoicePlayer     *player;

- (void)initModelComponent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initModelComponent];
    
    [_listener startListener:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initModelComponent
{
    self.listener = [[VoiceListener alloc] init];
    _listener.delegate = self;
    
    self.recorder = [[VoiceRecorder alloc] init];
    
    NSError *error = nil;
    self.player = [[VoicePlayer alloc] initWithContentsOfURL:_recorder.url fileTypeHint:nil error:&error];
}

#pragma mark - VoiceListenerDelegate

- (void)voiceChanged:(VoiceListener *)listener voice:(CGFloat)voice
{
    dispatch_async(dispatch_get_main_queue(), ^{
        _valueLabel.text = [NSString stringWithFormat:@"%ld", (long)voice];
    });
    if (40 < voice && !(_recorder.isRecording || _player.isPlaying))
    {
        [_recorder record];
        _valueLabel.textColor = [UIColor greenColor];
    }
    else if(voice < 40 && (_recorder.isRecording || _player.isPlaying))
    {
        [_recorder stop];
        [_player prepareToPlay];
        [_player play];
        _valueLabel.textColor = [UIColor redColor];
    }
}

@end
