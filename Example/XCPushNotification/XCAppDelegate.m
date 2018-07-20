//
//  XCAppDelegate.m
//  XCPushNotification
//
//  Created by fanxiaocong on 12/11/2017.
//  Copyright (c) 2017 fanxiaocong. All rights reserved.
//  

#import "XCAppDelegate.h"

#import <XCPushNotification/XCPushNotificationManager.h>


@implementation XCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /// 配置极光推送
    [XCPushNotificationManager configurePushNotificationPlatformType:XCPushNotificationPlatformTypeJPush appKey:@"XXXXXX" isProduction:NO];
    
    return YES;
}

@end
