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

@end
