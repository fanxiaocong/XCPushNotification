//
//  PushApplication.m
//  XCNotificationExample
//
//  Created by 樊小聪 on 2017/9/23.
//  Copyright © 2017年 樊小聪. All rights reserved.
//

#import "XCPushApplication.h"

#import "XCPushNotificationManager.h"


@implementation XCPushApplication

#pragma mark - 🔒 👀 Privite Method 👀

+ (id<XCPushNotificationProtocol>)pushNotification
{
    XCPushNotificationManager *mgr = [XCPushNotificationManager sharePushNotificationManager];
    
    id<XCPushNotificationFactoryProtocol> factory = mgr.pushFactory;
    
    return factory.pushNotification;
}

#pragma mark - 🔓 👀 Public Method 👀

/**
 *  程序启动
 */
+ (void)application:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([[self pushNotification] respondsToSelector:@selector(applicationDidFinishLaunching:)])
    {
        [[self pushNotification] application:app didFinishLaunchingWithOptions:launchOptions];
    }
}

/**
 *  注册远程推送
 */
+ (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    if ([[self pushNotification] respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)])
    {
        [[self pushNotification] application:app didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    }
}


/**
 *  收到远程推送
 */
+ (void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    if ([[self pushNotification] respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)])
    {
        [[self pushNotification] application:app didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
    }
}

+ (void)application:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if ([[self pushNotification] respondsToSelector:@selector(application:didReceiveRemoteNotification:)])
    {
        [[self pushNotification] application:app didReceiveRemoteNotification:userInfo];
    }
}


/**
 *  程序已经进入后台
 */
+ (void)applicationDidEnterBackground:(UIApplication *)application
{
    if ([[self pushNotification] respondsToSelector:@selector(applicationDidEnterBackground:)])
    {
        [[self pushNotification] applicationDidEnterBackground:application];
    }
}

/**
 *  程序即将进入前台
 */
+ (void)applicationWillEnterForeground:(UIApplication *)application
{
    if ([[self pushNotification] respondsToSelector:@selector(applicationWillEnterForeground:)])
    {
        [[self pushNotification] applicationWillEnterForeground:application];
    }
}


@end
