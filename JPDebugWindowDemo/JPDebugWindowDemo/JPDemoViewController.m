//
//  JPDemoViewController.m
//  JPDebugWindowDemo
//
//  Created by everdibe on 2013/05/16.
//  Copyright (c) 2013年 everdibe. All rights reserved.
//

#import "JPLog.h"
#import "JPDemoViewController.h"

@interface JPDemoViewController ()

@end

@implementation JPDemoViewController
{
    NSTimer *_addLogTimer;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *addLogButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addLogButton.frame = CGRectMake(0, 0, 200.f, 44.f);
    addLogButton.center = CGPointMake(CGRectGetMidX(self.view.bounds), 100.f);
    [addLogButton setTitle:@"addLog" forState:UIControlStateNormal];
    [addLogButton addTarget:self action:@selector(_addLog:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addLogButton];
    
    UIButton *addLogTimerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    addLogTimerButton.frame = CGRectMake(CGRectGetMinX(addLogButton.frame), CGRectGetMaxY(addLogButton.frame) + 10.f, 200.f, 44.f);
    [addLogTimerButton setTitle:@"start add log timer" forState:UIControlStateNormal];
    [addLogTimerButton addTarget:self action:@selector(_startLogTimer:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addLogTimerButton];
    
    UIButton *stopTimerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    stopTimerButton.frame = CGRectMake(CGRectGetMinX(addLogTimerButton.frame), CGRectGetMaxY(addLogTimerButton.frame) + 10.f, 200.f, 44.f);
    [stopTimerButton setTitle:@"start add log timer" forState:UIControlStateNormal];
    [stopTimerButton addTarget:self action:@selector(_stopLogTimer:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:stopTimerButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_startLogTimer:(id)sender
{
    if (!_addLogTimer) {
        _addLogTimer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(_onTimer:) userInfo:nil repeats:YES];
    }
}

- (void)_onTimer:(NSTimer *)timer
{
    JPLogToWindow(@"log from timer!");
    JPLogToWindowAndConsole(@"log window and console from timer!");
}

- (void)_stopLogTimer:(id)sender
{
    [_addLogTimer invalidate];
    _addLogTimer = nil;
}

- (void)_addLog:(id)sender
{
    JPLogToWindow(@"log from button!");
    JPLogToWindowAndConsole(@"log window and console from button!");
}

@end
