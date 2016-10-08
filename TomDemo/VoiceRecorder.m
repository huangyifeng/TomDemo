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
@property(nonatomic, strong)NSURL *fileURL;

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
    self.fileURL = url;

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
//    AVAudioUnitTimePitch *pitchEffect = [[AVAudioUnitTimePitch alloc] init];
//    AVAudioMixerNode *mixerNode = [_engine mainMixerNode];
    
//    pitchEffect.pitch = 1600;
//    [_engine attachNode:pitchEffect];
    AVAudioFile *fileForWriting = [[AVAudioFile alloc] initForWriting:_fileURL settings:nil error:&error];
    
//    [_engine connect:inputNode to:mixerNode format:[inputNode outputFormatForBus:0]];
//    [_engine connect:pitchEffect to:mixerNode format:[inputNode outputFormatForBus:0]];
    [inputNode installTapOnBus:0
                      bufferSize:8192
                          format:[inputNode outputFormatForBus:0]
                           block:^(AVAudioPCMBuffer * _Nonnull buffer, AVAudioTime * _Nonnull when) {
                               NSLog(@"Tap recieve Buffer : %@ \n when: %@", buffer, when);
                               NSError *error = nil;
                               [fileForWriting writeFromBuffer:buffer error:&error];
                           }];
}

#pragma mark - public

- (void)record
{
    NSError *error = nil;
    if (![_engine startAndReturnError:&error])
    {
        NSLog(@"******** start engine error : %@", error);
    }
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
    return _engine.isRunning;
}

- (NSURL *)url
{
//    return _recorder.url;
    return _fileURL;
}

@end
