//
//  VoiceRecorder.h
//  TomDemo
//
//  Created by HuangYiFeng on 9/29/16.
//  Copyright © 2016 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VoiceRecorder : NSObject

@property(nonatomic, readonly, assign, getter=isRecording)BOOL recording;
@property(nonatomic, readonly, strong) NSURL *url;
- (void)record;
- (void)stop;

@end
