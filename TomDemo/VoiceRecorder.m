//
//  VoiceRecorder.m
//  TomDemo
//
//  Created by HuangYiFeng on 9/29/16.
//  Copyright © 2016 hyf. All rights reserved.
//

#import "VoiceRecorder.h"
#import <AVFoundation/AVFoundation.h>

@interface VoiceRecorder ()

@property(nonatomic, strong)AVAudioRecorder *recorder;

- (void)initModelComponent;

@end

@implementation VoiceRecorder

#pragma mark - init

- (instancetype)init
{
    if(self = [super init])
    {
        [self initModelComponent];
    }
    return self;
}

- (void)initModelComponent
{
    
    [[AVAudioSession sharedInstance] setCategory: AVAudioSessionCategoryPlayAndRecord error: nil];
    
    NSError *error = nil;
    NSString *tempDir = NSTemporaryDirectory();
    NSURL *url = [NSURL fileURLWithPath:[tempDir stringByAppendingPathComponent:@"recordFile"]];
    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithFloat: 12000.0], AVSampleRateKey,
                              [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
                              [NSNumber numberWithInt: 2], AVNumberOfChannelsKey,
                              [NSNumber numberWithInt: AVAudioQualityMax], AVEncoderAudioQualityKey,
                              nil];
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
}

#pragma mark - public

- (void)record
{
    if (self.recorder)
    {
        [_recorder prepareToRecord];
        
        [_recorder record];
    }
}

- (void)stop
{
    if (self.recorder)
    {
        [_recorder stop];
    }
}

#pragma mark - Getter & Setter

- (BOOL)isRecording
{
    return _recorder.isRecording;
}

- (NSURL *)url
{
    return _recorder.url;
}

@end
