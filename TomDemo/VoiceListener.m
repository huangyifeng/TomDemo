//
//  VoiceListener.m
//  TomDemo
//
//  Created by huang yifeng on 16/9/27.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "VoiceListener.h"
#import <AVFoundation/AVFoundation.h>

@interface VoiceListener ()

@property(nonatomic, strong)AVAudioSession *audioSession;
@property(nonatomic, strong)AVAudioRecorder *recorder;


- (void)initModelComponent;

@end

@implementation VoiceListener

#pragma mark - init

- (instancetype)init
{
    if (self = [super init])
    {
        [self initModelComponent];
    }
    return self;
}

- (void)initModelComponent
{
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];
    
    NSError *error = nil;
    NSURL *url = [NSURL fileURLWithPath:@"/dev/null"];
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 44100.0], AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                              [NSNumber numberWithInt: 2], AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMax], AVEncoderAudioQualityKey,
                              nil];
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
}

#pragma mark - public

- (void)startListener:(void (^)())callback\
{
    if(_recorder)
    {
        dispatch_async(dispatch_get_main_queue(), ^{
            [_recorder prepareToRecord];
            _recorder.meteringEnabled = YES;
            [_recorder record];
            
            
            
        });
        
        
    }
    
    
}

@end
