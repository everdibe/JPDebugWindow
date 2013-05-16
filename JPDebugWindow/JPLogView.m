//
//  JPLogView.m
//
//  Created by everdibe on 2013/05/16.
//  Copyright (c) 2013年 everdibe. All rights reserved.
//

#import "JPLog.h"
#import "JPLogView.h"
@interface JPLogTextView : UITextView

@end

@implementation JPLogTextView

- (BOOL)canBecomeFirstResponder
{
    return NO;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(_didReceiveLog:) name:JP_LOG_TO_WINDOW_NOTIFICATION_KEY object:nil];
    }
    
    return self;
}

#pragma mark - handle log notification

- (void)_didReceiveLog:(NSNotification *)aNotification
{
    NSString *log = nil;
    if ([aNotification.object isKindOfClass:[NSString class]]) {
        log = [NSString stringWithFormat:@"[%@]: %@", [NSDate date], aNotification.object];
    }
    if (!log || !log.length)
    {
        return;
    }
    
    if (!self.text.length) {
        self.text = log;
    }else
    {
        self.text = [NSString stringWithFormat:@"%@\n%@", self.text, log];
    }
    [self scrollRangeToVisible:NSMakeRange(self.text.length - 1, 1)];
}

@end

@implementation JPLogView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.f alpha:.5f];
        JPLogTextView *logTextView = [[JPLogTextView alloc] initWithFrame:CGRectMake(0, 20.f, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds) - 20.f)];
        logTextView.backgroundColor = [UIColor clearColor];
        logTextView.textColor = [UIColor yellowColor];
        [self addSubview:logTextView];
    }
    return self;
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    self.center = self.superview.center;
}

@end

