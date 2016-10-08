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
#import "RecorderState.h"

@interface ViewController ()

//UI
@property(nonatomic, weak)IBOutlet UILabel  *valueLabel;
@property(nonatomic, weak)IBOutlet UILabel  *stateLabel;
@property(nonatomic, weak)IBOutlet UIButton *playStopButton;

//Model
@property(nonatomic, assign)RecorderState   currentState;
@property(nonatomic, strong)VoiceListener   *listener;
@property(nonatomic, strong)VoiceRecorder   *recorder;
@property(nonatomic, strong)VoicePlayer     *player;

- (void)initModelComponent;
- (void)initViewComponent;
- (void)changeToState:(RecorderState)state;

- (IBAction)startRecordButtonHandler:(id)sender;
- (IBAction)playRecordButtonHandler:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initModelComponent];
    [self initViewComponent];
//    [_listener startListener:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initModelComponent
{
    
    _currentState = RecorderStateListening;

    self.listener = [[VoiceListener alloc] init];
    _listener.delegate = self;
    
    self.recorder = [[VoiceRecorder alloc] init];
    
    NSError *error = nil;
//    NSURL *url = 
//    self.player = [[VoicePlayer alloc]initWithContentsOfURL:_recorder.url error:&error];
    if (error)
    {
        NSLog(@"create player error occur: %@",error);
    }
}

- (void)initViewComponent
{
    [_playStopButton setTitle:@"Start Record" forState:UIControlStateNormal];
    [_playStopButton setTitle:@"Stop Record" forState:UIControlStateSelected];
}

#pragma mark - Private

- (void)changeToState:(RecorderState)state
{
//    if (condition) {
//        <#statements#>
//    }
}

#pragma mark - Action

- (void)startRecordButtonHandler:(id)sender
{
    if (_currentState == RecorderStateListening)
    {
        _currentState = RecorderStateRecording;
//        _playStopButton.titleLabel.text = @"Stop Record";
        _playStopButton.selected = YES;
        [_recorder record];
    }
    else if(_currentState == RecorderStateRecording)
    {
        _currentState = RecorderStateListening;
//        _playStopButton.titleLabel.text = @"Start Record";
        _playStopButton.selected = NO;
        [_recorder stop];
    }
}

- (void)playRecordButtonHandler:(id)sender
{
    if (_currentState == RecorderStateListening)
    {
//        self.player = [[VoicePlayer alloc]initWithContentsOfURL:_recorder.url error:nil];
//        [_player prepareToPlay];
//        [_player play];
        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSError *error = nil;
            
//            AVAudioFile *audioFile = [[AVAudioFile alloc] initForReading:_recorder.url error:&error];
//            AVAudioPlayerNode *playerNode = [[AVAudioPlayerNode alloc] init];
//            
//            AVAudioUnitTimePitch *pitchNode = [[AVAudioUnitTimePitch alloc] init];
//            pitchNode.pitch = 1200;
//            
//            AVAudioEngine *engine = [[AVAudioEngine alloc] init];
//            [engine attachNode:playerNode];
//            [engine attachNode:pitchNode];
//            
//            [engine connect:playerNode to:pitchNode format:nil];
//            [engine connect:pitchNode to:engine.outputNode format:nil];
//            
//            [playerNode scheduleFile:audioFile atTime:nil completionHandler:nil];
//            [engine startAndReturnError:&error];
//            [playerNode play];
            
//        AVAudioEngine *engine = [[AVAudioEngine alloc] init];
//        
//        AVAudioPlayerNode *playerNode = [[AVAudioPlayerNode alloc] init];
//        
//        [engine attachNode:playerNode];
//        
//        AVAudioFile *audioFile = [[AVAudioFile alloc] initForReading:_recorder.url error:&error];
//        
//        [engine connect:playerNode to:engine.outputNode format:nil];
//        
//        [engine prepare];
//        [engine startAndReturnError:&error];
//        [playerNode scheduleFile:audioFile atTime:nil completionHandler:nil];
//        [playerNode play];
//        });
        
        _player = [[VoicePlayer alloc] initWithURL:_recorder.url];
        [_player play];
    }
}

#pragma mark - VoiceListenerDelegate

//- (void)voiceChanged:(VoiceListener *)listener voice:(CGFloat)voice
//{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        _valueLabel.text = [NSString stringWithFormat:@"%ld", (long)voice];
//    });
//    if (40 < voice && !(_recorder.isRecording || _player.isPlaying))
//    {
//        [_recorder record];
//        _valueLabel.textColor = [UIColor greenColor];
//    }
//    else if(voice < 40 && (_recorder.isRecording || _player.isPlaying))
//    {
//        [_recorder stop];
//        [_player prepareToPlay];
//        [_player play];
//        _valueLabel.textColor = [UIColor redColor];
//    }
//}

@end
