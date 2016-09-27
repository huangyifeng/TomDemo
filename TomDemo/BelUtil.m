//
//  BelUtil.m
//  TomDemo
//
//  Created by HuangYiFeng on 9/27/16.
//  Copyright © 2016 hyf. All rights reserved.
//

#import "BelUtil.h"

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

@end
