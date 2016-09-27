//
//  ViewController.m
//  TomDemo
//
//  Created by huang yifeng on 16/9/26.
//  Copyright © 2016年 hyf. All rights reserved.
//

#import "ViewController.h"
#import "VoiceListener.h"

@interface ViewController ()

//UI
@property(nonatomic, weak)IBOutlet UILabel *valueLabel;

//Model
@property(nonatomic, strong)VoiceListener *listener;

- (void)initModelComponent;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initModelComponent];
    
    [_listener startListener:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initModelComponent
{
    self.listener = [[VoiceListener alloc] init];
}

#pragma mark - VoiceListenerDelegate

- (void)voiceChanged:(VoiceListener *)listener voice:(CGFloat)voice
{
    dispatch_async(dispatch_get_main_queue(), ^{
        _valueLabel.text = [NSString stringWithFormat:@"ld", (NSInteger)voice];
    });
}

@end
