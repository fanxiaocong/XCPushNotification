//
//  XCAppDelegate.m
//  XCPushNotification
//
//  Created by fanxiaocong on 12/11/2017.
//  Copyright (c) 2017 fanxiaocong. All rights reserved.
//

#import "XCAppDelegate.h"

#import <XCPushNotification/XCPushNotificationManager.h>
#import <XCPushNotification/XCPushNotificationAppDelegate.h>


@implementation XCAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    /// 配置极光推送
    [XCPushNotificationManager configurePushNotificationPlatformType:XCPushNotificationPlatformTypeJPush appKey:@"XXXXXX" isProduction:NO];
    [XCPushNotificationAppDelegate pushApplication:application didFinishLaunchingWithOptions:launchOptions];
    
    return YES;
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    /// 配置极光推送
    [XCPushNotificationAppDelegate pushApplication:application didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    /// 配置极光推送
    [XCPushNotificationAppDelegate pushApplication:application didReceiveRemoteNotification:userInfo];
}

- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
   fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    /// 配置极光推送
    [XCPushNotificationAppDelegate pushApplication:application didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
}

/**
 *  程序已经进入后台
 */
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /// 配置极光推送
    [XCPushNotificationAppDelegate pushApplicationDidEnterBackground:application];
}

/**
 *  程序即将进入前台
 */
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /// 配置极光推送
    [XCPushNotificationAppDelegate pushApplicationWillEnterForeground:application];
}

@end
