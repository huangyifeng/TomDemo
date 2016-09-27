//
//  VoiceListener.h
//  TomDemo
//
//  Created by huang yifeng on 16/9/27.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VoiceListener;

@protocol VoiceListenerDelegate <NSObject>

- (void)voiceChanged:(VoiceListener *)listener voice:(CGFloat)voice;

@end


@interface VoiceListener : NSObject

@property(nonatomic, assign)CGFloat minDecibel;
@property(nonatomic, weak)id<VoiceListenerDelegate> delegate;

- (void)startListener:(void(^)())callback;

- (void)resume;
- (void)pause;
- (void)stop;


@end
