//
//  XCPushNotificationAppDelegate.m
//  Pods-XCPushNotification_Example
//
//  Created by 樊小聪 on 2017/12/11.
//



/*
 *  备注：处理与 AppDelegate 相关的配置 🐾
 */

#import "XCPushNotificationAppDelegate.h"
#import "XCPushNotificationManager.h"

@implementation XCPushNotificationAppDelegate


#pragma mark - 🔓 👀 Public Method 👀

/**
 *  程序启动
 */
+ (void)pushApplication:(UIApplication *)app didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([[self pushNotification] respondsToSelector:@selector(applicationDidFinishLaunching:)])
    {
        [[self pushNotification] application:app didFinishLaunchingWithOptions:launchOptions];
    }
}

/**
 *  注册远程推送
 */
+ (void)pushApplication:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    if ([[self pushNotification] respondsToSelector:@selector(application:didRegisterForRemoteNotificationsWithDeviceToken:)])
    {
        [[self pushNotification] application:app didRegisterForRemoteNotificationsWithDeviceToken:deviceToken];
    }
}


/**
 *  收到远程推送
 */
+ (void)pushApplication:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    if ([[self pushNotification] respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)])
    {
        [[self pushNotification] application:app didReceiveRemoteNotification:userInfo fetchCompletionHandler:completionHandler];
    }
}

+ (void)pushApplication:(UIApplication *)app didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    if ([[self pushNotification] respondsToSelector:@selector(application:didReceiveRemoteNotification:)])
    {
        [[self pushNotification] application:app didReceiveRemoteNotification:userInfo];
    }
}


/**
 *  程序已经进入后台
 */
+ (void)pushApplicationDidEnterBackground:(UIApplication *)application
{
    if ([[self pushNotification] respondsToSelector:@selector(applicationDidEnterBackground:)])
    {
        [[self pushNotification] applicationDidEnterBackground:application];
    }
}

/**
 *  程序即将进入前台
 */
+ (void)pushApplicationWillEnterForeground:(UIApplication *)application
{
    if ([[self pushNotification] respondsToSelector:@selector(applicationWillEnterForeground:)])
    {
        [[self pushNotification] applicationWillEnterForeground:application];
    }
}

#pragma mark - 🔒 👀 Privite Method 👀


+ (id<XCPushNotificationProtocol>)pushNotification
{
    XCPushNotificationManager *mgr = [XCPushNotificationManager sharePushNotificationManager];
    
    id<XCPushNotificationFactoryProtocol> factory = mgr.pushFactory;
    
    return factory.pushNotification;
}


@end
