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
    
}

#pragma mark - public

- (void)startListener:(void (^)())callback\
{
    
}

@end
