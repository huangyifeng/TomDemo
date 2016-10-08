//
//  VoicePlayer.m
//  TomDemo
//
//  Created by HuangYiFeng on 9/29/16.
//  Copyright © 2016 hyf. All rights reserved.
//

#import "VoicePlayer.h"

@interface VoicePlayer ()

@property(nonatomic, strong)AVAudioEngine       *audioEngine;
@property(nonatomic, strong)AVAudioPlayerNode   *playerNode;

- (void)initModelComponent;

@end

@implementation VoicePlayer

- (instancetype)initWithURL:(NSURL *)url
{
    if (self = [super init])
    {
        _url = url;
        [self initModelComponent];
    }
    return self;
}

- (void)initModelComponent
{
    self.audioEngine = [[AVAudioEngine alloc] init];
    
    self.playerNode = [[AVAudioPlayerNode alloc] init];
    
    AVAudioUnitTimePitch *pitchEffect = [[AVAudioUnitTimePitch alloc] init];
    pitchEffect.pitch = 1600;

    [_audioEngine attachNode:_playerNode];
    [_audioEngine attachNode:pitchEffect];
    
    [_audioEngine connect:_playerNode to:pitchEffect format:[_playerNode outputFormatForBus:0]];
    [_audioEngine connect:pitchEffect to:_audioEngine.outputNode format:[_playerNode outputFormatForBus:0]];
}

- (void)play
{
    NSError *error = nil;
    if ([_audioEngine startAndReturnError:&error])
    {
        NSError *error = nil;
        AVAudioFile *audioFile = [[AVAudioFile alloc] initForReading:_url error:&error];
        [_playerNode scheduleFile:audioFile atTime:nil completionHandler:nil];
        [_playerNode play];
    }
}

- (void)stop
{
    [_audioEngine stop];
    [_audioEngine reset];
    [_playerNode stop];
}


@end
