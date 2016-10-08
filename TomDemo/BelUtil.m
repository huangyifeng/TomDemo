//
//  BelUtil.m
//  TomDemo
//
//  Created by HuangYiFeng on 9/27/16.
//  Copyright © 2016 hyf. All rights reserved.
//

#import "BelUtil.h"
#include "SoundTouch.h"


@implementation BelUtil

+ (CGFloat)convertDecibelToPositive:(CGFloat)nagetive
{
    float   level;                // The linear 0.0 .. 1.0 value we need.
    float   minDecibels = -80.0f; // Or use -60dB, which I measured in a silent room.
    
    if (nagetive < minDecibels)
    {
        level = 0.0f;
    }
    else if (nagetive >= 0.0f)
    {
        level = 1.0f;
    }
    else
    {
        float   root            = 2.0f;
        float   minAmp          = powf(10.0f, 0.05f * minDecibels);
        float   inverseAmpRange = 1.0f / (1.0f - minAmp);
        float   amp             = powf(10.0f, 0.05f * nagetive);
        float   adjAmp          = (amp - minAmp) * inverseAmpRange;
        
        level = powf(adjAmp, 1.0f / root);
    }
    return level * 120;
//    CGFloat db = 20 * log10(nagetive);
//    db += 120;
//    db = db < 0 ? 0 : db;
//    return db;
}

//+ (NSData *)changeVoice:(NSData *)originalVoice
//{
//    soundtouch::SoundTouch mSoundTouch;
//    mSoundTouch.setSampleRate(12000); //采样率
//    mSoundTouch.setChannels(2);       //设置声音的声道
//    mSoundTouch.setTempoChange(0);    //这个就是传说中的变速不变调
//    mSoundTouch.setPitchSemiTones(8); //设置声音的pitch (集音高变化semi-tones相比原来的音调) //男: -8 女:8
//
//    
//}

@end
