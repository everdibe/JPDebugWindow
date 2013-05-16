//
//  JPLogWindow.m
//
//  Created by everdibe on 2013/05/16.
//  Copyright (c) 2013年 everdibe. All rights reserved.
//

#import "JPLogWindow.h"
#import "JPLogView.h"

@interface JPLogWindow()

@property (nonatomic, readonly) UIView *logView;

@end

@implementation JPLogWindow

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.logView];
        self.logView.hidden = YES;
    }
    return self;
}

- (void)didAddSubview:(UIView *)subview
{
    [super didAddSubview:subview];
    
    [self bringSubviewToFront:self.logView];
}

#pragma mark - handle Shake Event

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self.nextResponder motionBegan:motion withEvent:event];
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    self.logView.hidden = !self.logView.hidden;
    [self.nextResponder motionEnded:motion withEvent:event];
}

- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self.nextResponder motionCancelled:motion withEvent:event];
}

#pragma mark - private getter

- (UIView *)logView
{
    static JPLogView *logView = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        logView = [[JPLogView alloc] initWithFrame:self.bounds];
    });
    return logView;
}

@end
