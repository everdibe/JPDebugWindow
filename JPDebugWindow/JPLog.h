//
//  JPLog.h
//
//  Created by everdibe on 2013/05/16.
//  Copyright (c) 2013年 everdibe. All rights reserved.
//

#define JP_LOG_TO_WINDOW_NOTIFICATION_KEY @"JP_LOG_TO_WINDOW_NOTIFICATION_KEY"
#define JPLogToWindow(...) \
[[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:JP_LOG_TO_WINDOW_NOTIFICATION_KEY object:[NSString stringWithFormat:__VA_ARGS__]]];
