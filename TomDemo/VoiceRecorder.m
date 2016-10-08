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

//@property(nonatomic, strong)AVAudioRecorder *recorder;
@property(nonatomic, strong)AVAudioEngine *engine;

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
    NSURL *url = [NSURL fileURLWithPath:[tempDir stringByAppendingPathComponent:@"recordFile1"]];

    // =============================
//    NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
//                              [NSNumber numberWithFloat: 12000.0], AVSampleRateKey,
//                              [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
//                              [NSNumber numberWithInt: 2], AVNumberOfChannelsKey,
//                              [NSNumber numberWithInt: AVAudioQualityMax], AVEncoderAudioQualityKey,
//                              nil];
//    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:settings error:&error];
//    if (error)
//    {
//        NSLog(@"create record error: %@", error);
//    }
    // =============================

    self.engine = [[AVAudioEngine alloc] init];
    
    AVAudioInputNode *inputNode = [_engine inputNode];
    AVAudioUnitTimePitch *pitchEffect = [[AVAudioUnitTimePitch alloc] init];
    pitchEffect.pitch = 1600;
    [_engine attachNode:pitchEffect];
    
    [_engine connect:_engine.inputNode to:pitchEffect format:[_engine.inputNode inputFormatForBus:0]];
    [pitchEffect installTapOnBus:0
                      bufferSize:8192
                          format:[pitchEffect outputFormatForBus:0]
                           block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when) {
                               
                           }];
}

#pragma mark - public

- (void)record
{
    
    
    

}

- (void)stop
{
//    if (self.recorder)
//    {
//        [_recorder stop];
//    }
    
    [_engine stop];
    [_engine reset];
}

#pragma mark - Getter & Setter

- (BOOL)isRecording
{
//    return _recorder.isRecording;
}

- (NSURL *)url
{
//    return _recorder.url;
}

@end
