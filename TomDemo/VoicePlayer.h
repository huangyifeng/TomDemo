//
//  VoicePlayer.h
//  TomDemo
//
//  Created by HuangYiFeng on 9/29/16.
//  Copyright © 2016 hyf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface VoicePlayer : NSObject

- (instancetype)initWithURL:(NSURL *)url;
@property(nonatomic, strong, readonly)NSURL *url;

- (void)play;
- (void)stop;

@end
